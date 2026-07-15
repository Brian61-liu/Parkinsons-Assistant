import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:camera/camera.dart';
import 'package:google_mlkit_pose_detection/google_mlkit_pose_detection.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import '../l10n/app_localizations.dart';
import '../services/database_service.dart';
import '../services/training_score_service.dart';
import '../services/motion_detection_service.dart';
import '../services/user_settings_service.dart';
import '../services/voice_assist_service.dart';
import '../models/movement_training_record.dart';
import '../utils/gentle_page_route.dart';
import 'movement_training_history_page.dart';

class MovementTrainingPage extends StatefulWidget {
  const MovementTrainingPage({super.key});

  @override
  State<MovementTrainingPage> createState() => _MovementTrainingPageState();
}

class _MovementTrainingPageState extends State<MovementTrainingPage>
    with WidgetsBindingObserver {
  CameraController? _cameraController;
  CameraDescription? _camera; // 当前使用的摄像头描述（含 sensorOrientation/lensDirection）
  PoseDetector? _poseDetector;
  bool _isDetecting = false;
  bool _hasPermission = false;
  bool _isInitialized = false;
  InputImageRotation _imageRotation = InputImageRotation.rotation0deg;

  // 训练类型
  TrainingType _currentTrainingType = TrainingType.armsRaised; // 当前训练类型

  // 骨架叠加层与状态条走 ValueNotifier 局部重绘，避免每帧整页 setState 造成卡顿。
  final ValueNotifier<PoseOverlayData?> _poseOverlay = ValueNotifier(null);
  final ValueNotifier<MotionUiStatus> _motionStatus = ValueNotifier(
    const MotionUiStatus.initial(),
  );

  // 显示层专用平滑（与计数用 EMA 分离）。
  final PoseDisplayFilter _displayFilter = PoseDisplayFilter();

  // 人体丢失宽限：单帧漏检不立刻清空骨架/弹提示，避免闪烁。
  static const Duration _poseLostGrace = Duration(milliseconds: 400);
  DateTime? _lastPersonSeenAt;

  // iPhone X 上对活动 image stream 帧调用 ML Kit 会导致 CameraPreview 黑屏；
  // takePicture 连续取样又会触发白屏闪烁。
  // 因此采用“短暂开流抓一帧 -> 立刻停流 -> 离线送 ML Kit”的折中方案。
  static const bool _useSampledStreamDetection = true;
  static const Duration _sampledFrameInterval = Duration(milliseconds: 900);

  // 保留 image-stream 相关字段，方便后续在新机型上重新评估流式检测。
  static const Duration _minProcessInterval = Duration(milliseconds: 700);
  DateTime? _lastProcessStartedAt;
  DateTime? _imageStreamStartedAt;
  Timer? _snapshotDetectionTimer;
  bool _isCapturingSampleFrame = false;

  // 用户点过演示「确定」后才真正请求相机；此前不展示「权限被拒」占位，避免误导。
  bool _didRequestCamera = false;

  /// 前后台切换：进后台时暂停预览/检测，回前台再恢复，避免 iOS 回收会话后界面假死。
  bool _lifecyclePaused = false;

  // 临时隔离开关：真机已确认纯 CameraPreview + image stream 不黑屏。
  // 现在恢复 ML Kit，但延迟初始化并低频处理。
  static const bool _imageStreamProbeMode = false;

  // 动作检测相关（通用）
  int _successCount = 0;
  int _targetCount = 10; // 目标次数
  bool _isGoalReached = false; // 是否达到目标

  // 计时：用 ValueNotifier，禁止每秒 setState 整页（会重建 CameraPreview → iOS 预览变黑）。
  Timer? _trainingTimer;
  final ValueNotifier<int> _trainingDuration = ValueNotifier(0);
  DateTime? _trainingStartTime;

  // 数据库服务
  final DatabaseService _databaseService = DatabaseService();

  // 动作检测引擎：单一保守难度（2026-06-20 起取消双模式）。
  final MotionDetectionConfig _motionConfig =
      MotionDetectionConfig.defaultPreset();
  late final ArmRaiseDetector _armDetector = ArmRaiseDetector(
    _motionConfig.arm,
  );
  late final LegLiftDetector _legDetector = LegLiftDetector(_motionConfig.leg);

  VoiceAssistService _voiceAssist(BuildContext context) {
    final enabled = context.read<UserSettingsService>().voiceHints;
    return VoiceAssistService(enabled: enabled);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _showTrainingTypeSelection();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.inactive ||
        state == AppLifecycleState.paused ||
        state == AppLifecycleState.hidden) {
      unawaited(_pauseForBackground());
    } else if (state == AppLifecycleState.resumed) {
      unawaited(_resumeFromBackground());
    }
  }

  Future<void> _pauseForBackground() async {
    if (_lifecyclePaused) return;
    if (_cameraController == null && _snapshotDetectionTimer == null) return;
    _lifecyclePaused = true;
    _snapshotDetectionTimer?.cancel();
    _snapshotDetectionTimer = null;
    _trainingTimer?.cancel();
    _stopImageStreamSafely();
    try {
      final c = _cameraController;
      if (c != null && c.value.isInitialized && c.value.isPreviewPaused != true) {
        await c.pausePreview();
      }
    } catch (e) {
      debugPrint('MovementTraining: pausePreview failed: $e');
    }
  }

  Future<void> _resumeFromBackground() async {
    if (!_lifecyclePaused) return;
    _lifecyclePaused = false;
    if (!mounted || _isGoalReached) return;

    final c = _cameraController;
    if (c == null) return;

    try {
      if (!c.value.isInitialized) {
        await _initializeCamera();
        return;
      }
      if (c.value.isPreviewPaused) {
        await c.resumePreview();
      }
      if (_useSampledStreamDetection) {
        _startSnapshotDetection();
      } else if (!c.value.isStreamingImages) {
        _startImageStream();
      }
      if (_trainingStartTime != null && !_isGoalReached) {
        _startTrainingTimer();
      }
    } catch (e) {
      debugPrint('MovementTraining: resume failed, re-init camera: $e');
      try {
        await _initializeCamera();
      } catch (e2) {
        debugPrint('MovementTraining: re-init camera failed: $e2');
      }
    }
  }

  // 启动训练计时器
  void _startTrainingTimer() {
    _trainingTimer?.cancel();
    _trainingStartTime = DateTime.now();
    _trainingDuration.value = 0;
    _trainingTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted || _isGoalReached) {
        timer.cancel();
        return;
      }
      // 只更新时长 notifier，绝不 setState 整页（否则 CameraPreview 被拆掉重建会黑屏）。
      _trainingDuration.value =
          DateTime.now().difference(_trainingStartTime!).inSeconds;
    });
  }

  Future<void> _initializeCamera() async {
    // 检查权限
    final status = await Permission.camera.request();
    if (status != PermissionStatus.granted) {
      if (mounted) {
        setState(() {
          _hasPermission = false;
        });
        _voiceAssist(context).speak('相机权限未开启，无法开始训练');
        _showPermissionDialog();
      }
      return;
    }

    // 获取前置摄像头
    final cameras = await availableCameras();
    if (cameras.isEmpty) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('未找到可用摄像头')));
      }
      return;
    }

    // 查找前置摄像头
    CameraDescription? frontCamera;
    for (var camera in cameras) {
      if (camera.lensDirection == CameraLensDirection.front) {
        frontCamera = camera;
        break;
      }
    }

    if (frontCamera == null) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('未找到前置摄像头')));
      }
      return;
    }

    _camera = frontCamera;

    // 初始化 iPhone 摄像头控制器。ML Kit 在 iOS 上要求 bgra8888 单平面格式。
    // 使用 low 分辨率降低 BGRA 帧大小，避免 iPhone X 上预览 + 检测抢资源导致黑屏。
    _cameraController = CameraController(
      frontCamera,
      ResolutionPreset.low,
      enableAudio: false,
      imageFormatGroup: ImageFormatGroup.bgra8888,
    );

    try {
      await _cameraController!.initialize();
      if (mounted) {
        setState(() {
          _hasPermission = true;
          _isInitialized = true;
        });
        // 先让 CameraPreview 的 Texture 稳定挂载，再延迟初始化 ML Kit。
        Future.delayed(const Duration(milliseconds: 1500), () {
          if (!mounted || _isGoalReached) return;
          _initializePoseDetector();
          if (_useSampledStreamDetection) {
            _startSnapshotDetection();
          } else {
            _startImageStream();
          }
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('摄像头初始化失败: $e')));
      }
    }
  }

  void _initializePoseDetector() {
    if (_poseDetector != null) return;
    final options = PoseDetectorOptions(
      mode: PoseDetectionMode.stream,
      // base 模型延迟更低、资源占用更小；当前目标是训练动作计数与稳定预览。
      model: PoseDetectionModel.base,
    );
    _poseDetector = PoseDetector(options: options);
  }

  void _startImageStream() {
    if (_cameraController == null || !_cameraController!.value.isInitialized) {
      return;
    }

    // 如果已达到目标，不启动流
    if (_isGoalReached) {
      return;
    }

    _imageStreamStartedAt = DateTime.now();
    _cameraController!.startImageStream((CameraImage image) {
      if (_isDetecting || _isGoalReached) return;
      // 限制检测频率：降低 CPU/发热，先验证 ML Kit 不再触发预览黑屏。
      final now = DateTime.now();
      final streamStartedAt = _imageStreamStartedAt;
      if (streamStartedAt != null &&
          now.difference(streamStartedAt) < const Duration(milliseconds: 800)) {
        return;
      }
      final last = _lastProcessStartedAt;
      if (last != null && now.difference(last) < _minProcessInterval) {
        return;
      }
      _lastProcessStartedAt = now;
      _isDetecting = true;

      if (_imageStreamProbeMode) {
        // 隔离验证：只确认 startImageStream 是否会导致预览变黑，不运行 ML Kit。
        _isDetecting = false;
        return;
      }

      _processImage(image);
    });
  }

  void _startSnapshotDetection() {
    final controller = _cameraController;
    if (controller == null || !controller.value.isInitialized || _isGoalReached) {
      return;
    }

    _snapshotDetectionTimer?.cancel();
    _snapshotDetectionTimer = Timer.periodic(_sampledFrameInterval, (_) {
      if (!mounted || _isGoalReached) return;
      _captureSampleFrame();
    });
    // 立即跑一次，避免用户等待第一轮 timer。
    _captureSampleFrame();
  }

  Future<void> _captureSampleFrame() async {
    final controller = _cameraController;
    if (controller == null ||
        !controller.value.isInitialized ||
        controller.value.isStreamingImages ||
        _isCapturingSampleFrame ||
        _isGoalReached) {
      return;
    }

    _isCapturingSampleFrame = true;
    try {
      await controller.startImageStream((CameraImage image) {
        if (!_isCapturingSampleFrame) return;
        final inputImage = _inputImageFromCameraImage(image, copyBytes: true);
        if (inputImage == null) {
          return;
        }
        unawaited(_processSampledStreamFrame(inputImage));
      });
    } catch (e) {
      _isCapturingSampleFrame = false;
      debugPrint('姿态取样流启动失败: $e');
    }
  }

  Future<void> _processSampledStreamFrame(InputImage inputImage) async {
    final detector = _poseDetector;
    final controller = _cameraController;
    try {
      // 关键：先停掉 image stream，再运行 ML Kit，避免“活动流 + ML Kit”触发预览黑屏。
      if (controller != null &&
          controller.value.isInitialized &&
          controller.value.isStreamingImages) {
        await controller.stopImageStream();
      }
      if (!mounted || detector == null || _isGoalReached) return;

      final poses = await detector.processImage(inputImage);
      if (!mounted) return;

      final now = DateTime.now();
      final imageSize = inputImage.metadata?.size;
      _imageRotation = inputImage.metadata?.rotation ?? _imageRotation;

      if (poses.isNotEmpty && imageSize != null && _camera != null) {
        _lastPersonSeenAt = now;
        final pose = poses.first;
        _poseOverlay.value = PoseOverlayData(
          points: _displayFilter.filterPose(pose, now),
          imageSize: imageSize,
          rotation: _imageRotation,
          lensDirection: _camera!.lensDirection,
          trainingType: _currentTrainingType,
        );
        _checkAction(pose, now);
      } else {
        _handlePoseNotFound(now);
      }
    } catch (e) {
      debugPrint('姿态取样检测失败: $e');
    } finally {
      _isCapturingSampleFrame = false;
    }
  }

  Future<void> _processImage(CameraImage image) async {
    final detector = _poseDetector;
    if (detector == null) {
      _isDetecting = false;
      return;
    }

    try {
      final inputImage = _inputImageFromCameraImage(image);
      if (inputImage == null) {
        return;
      }

      final poses = await detector.processImage(inputImage);
      if (!mounted) return;

      final now = DateTime.now();
      final imageSize = inputImage.metadata?.size;
      _imageRotation = inputImage.metadata?.rotation ?? _imageRotation;

      if (poses.isNotEmpty && imageSize != null && _camera != null) {
        _lastPersonSeenAt = now;
        final pose = poses.first;
        // 显示层单独平滑（One-Euro），与计数层 EMA 解耦。
        _poseOverlay.value = PoseOverlayData(
          points: _displayFilter.filterPose(pose, now),
          imageSize: imageSize,
          rotation: _imageRotation,
          lensDirection: _camera!.lensDirection,
          trainingType: _currentTrainingType,
        );
        _checkAction(pose, now);
      } else {
        _handlePoseNotFound(now);
      }
    } catch (e) {
      // ML Kit / 相机帧异常不能让检测永久卡死：记录后由 finally 释放节流标志。
      debugPrint('姿态检测处理失败: $e');
    } finally {
      _isDetecting = false;
    }
  }

  void _handlePoseNotFound(DateTime now) {
    // 单帧漏检不立即清骨架/弹提示，超过宽限期才算真正丢失，避免闪烁。
    final lastSeen = _lastPersonSeenAt;
    final lostConfirmed =
        lastSeen == null || now.difference(lastSeen) > _poseLostGrace;
    if (lostConfirmed && _motionStatus.value.personDetected) {
      _displayFilter.reset();
      _poseOverlay.value = null;
      _motionStatus.value = _motionStatus.value.copyWith(
        personDetected: false,
        isActionPerformed: false,
        actionState: 0,
      );
    }
  }

  /// 将 iPhone 相机帧转换为 ML Kit 可识别的 [InputImage]。
  ///
  /// 关键点（旧实现固定 rotation0deg + yuv420，导致 iOS 真机完全检测不到人体）：
  /// - 旋转角度根据摄像头 sensorOrientation 与设备方向计算；
  /// - 图像格式从相机帧实际格式推导，并校验为 iOS 支持的 bgra8888；
  /// - bgra8888 为单平面，直接取首平面字节。
  InputImage? _inputImageFromCameraImage(
    CameraImage image, {
    bool copyBytes = false,
  }) {
    final camera = _camera;
    if (camera == null) return null;

    final sensorOrientation = camera.sensorOrientation;
    final rotation = InputImageRotationValue.fromRawValue(sensorOrientation);
    if (rotation == null) return null;

    final format = InputImageFormatValue.fromRawValue(image.format.raw);
    if (format == null || format != InputImageFormat.bgra8888) {
      return null;
    }

    if (image.planes.length != 1) return null;
    final plane = image.planes.first;

    return InputImage.fromBytes(
      bytes: copyBytes ? Uint8List.fromList(plane.bytes) : plane.bytes,
      metadata: InputImageMetadata(
        size: Size(image.width.toDouble(), image.height.toDouble()),
        rotation: rotation,
        format: format,
        bytesPerRow: plane.bytesPerRow,
      ),
    );
  }

  // 显示训练类型选择对话框
  void _showTrainingTypeSelection() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        showCupertinoDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => _buildTrainingTypeSelectionDialog(context),
        );
      }
    });
  }

  // 显示训练演示页面
  void _showTrainingDemo(BuildContext context, TrainingType type) {
    final l10n = AppLocalizations.of(context)!;
    showCupertinoDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => _buildTrainingDemoDialog(context, l10n, type),
    );
  }

  // 构建训练演示对话框
  Widget _buildTrainingDemoDialog(
    BuildContext context,
    AppLocalizations l10n,
    TrainingType type,
  ) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    // 根据训练类型设置不同的属性
    String title;
    IconData icon;
    Color color;
    String gifPath;
    String instruction;

    switch (type) {
      case TrainingType.armsRaised:
        title = l10n.armsRaisedTraining;
        icon = CupertinoIcons.hand_raised_fill;
        color = const Color(0xFF8B5CF6);
        gifPath = 'assets/images/举手运动.gif';
        instruction = l10n.movementTrainingInstruction;
        break;
      case TrainingType.legLift:
        title = l10n.legLiftTraining;
        icon = CupertinoIcons.arrow_up_circle_fill;
        color = const Color(0xFF8B5CF6);
        gifPath = 'assets/images/原地抬腿运动.gif';
        instruction = l10n.legLiftInstruction;
        break;
    }

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Container(
        constraints: BoxConstraints(
          maxHeight: screenHeight * 0.8,
          maxWidth: screenWidth * 0.9,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 标题栏
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Row(
                children: [
                  Icon(icon, color: color, size: 24),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1E3A5F),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // 内容区域
            Flexible(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // GIF 演示
                    Container(
                      constraints: BoxConstraints(
                        maxHeight: screenHeight * 0.4,
                        maxWidth: double.infinity,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.05),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(gifPath, fit: BoxFit.contain),
                      ),
                    ),
                    const SizedBox(height: 24),
                    // 说明文字
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF0F9FF),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        instruction,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Color(0xFF1E3A5F),
                          height: 1.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // 确定按钮
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: SizedBox(
                width: double.infinity,
                child: CupertinoButton.filled(
                  borderRadius: BorderRadius.circular(12),
                  color: color,
                  onPressed: () {
                    Navigator.pop(context);
                    // 如果是抬腿运动，初始化历史记录
                    if (type == TrainingType.legLift) {
                      _initLegLiftHistory();
                    }
                    // 初始化并开始训练
                    setState(() {
                      _didRequestCamera = true;
                    });
                    _initializeCamera();
                    _startTrainingTimer();
                  },
                  child: Text(
                    l10n.confirm,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTrainingTypeSelectionDialog(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return CupertinoAlertDialog(
      title: Text(l10n.selectTrainingType),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 16),
          _buildTrainingTypeOption(context, TrainingType.armsRaised, l10n),
          const SizedBox(height: 12),
          _buildTrainingTypeOption(context, TrainingType.legLift, l10n),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildTrainingTypeOption(
    BuildContext context,
    TrainingType type,
    AppLocalizations l10n,
  ) {
    String title;
    IconData icon;
    Color color;

    switch (type) {
      case TrainingType.armsRaised:
        title = l10n.armsRaisedTraining;
        icon = CupertinoIcons.hand_raised_fill;
        color = const Color(0xFF8B5CF6);
      case TrainingType.legLift:
        title = l10n.legLiftTraining;
        icon = CupertinoIcons.arrow_up_circle_fill;
        color = const Color(0xFF8B5CF6);
    }

    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        setState(() {
          _currentTrainingType = type;
        });
        _motionStatus.value = const MotionUiStatus.initial();
        _displayFilter.reset();
        _initArmDetectionState();
        _initLegLiftHistory();
        Navigator.pop(context);
        // 对话框 context 在 pop 后已卸载；必须用 State 的 context，并延后到下一帧再弹演示，
        // 否则 showCupertinoDialog 会静默失败，页面停在「相机权限」占位（现象 B）。
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!mounted) return;
          _showTrainingDemo(this.context, type);
        });
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withValues(alpha: 0.3)),
        ),
        child: Row(
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: color,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 格式化时长显示
  String _formatDuration(int seconds) {
    final minutes = seconds ~/ 60;
    final secs = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }

  String _getTrainingInstruction(AppLocalizations l10n) {
    switch (_currentTrainingType) {
      case TrainingType.armsRaised:
        return l10n.movementTrainingInstruction;
      case TrainingType.legLift:
        return l10n.legLiftInstruction;
    }
  }

  String _getActionStatusText(AppLocalizations l10n, MotionUiStatus status) {
    if (status.actionState == 1) {
      // 动作进行中，提示恢复
      switch (_currentTrainingType) {
        case TrainingType.armsRaised:
          return l10n.lowerArms;
        case TrainingType.legLift:
          return l10n.lowerLegs;
      }
    } else {
      // 提示开始动作
      switch (_currentTrainingType) {
        case TrainingType.armsRaised:
          return l10n.raiseArms;
        case TrainingType.legLift:
          return l10n.raiseLegs;
      }
    }
  }

  // 通用动作检测方法（根据训练类型调用不同的检测逻辑）
  void _checkAction(Pose pose, DateTime now) {
    final MotionDetectionResult result;
    switch (_currentTrainingType) {
      case TrainingType.armsRaised:
        result = _armDetector.update(pose, now);
        break;
      case TrainingType.legLift:
        result = _legDetector.update(pose, now);
        break;
    }
    _applyMotionResult(result);
  }

  // 初始化抬腿运动历史记录
  void _initLegLiftHistory() {
    _legDetector.reset();
  }

  void _initArmDetectionState() {
    _armDetector.reset();
  }

  void _applyMotionResult(MotionDetectionResult result) {
    _motionStatus.value = _motionStatus.value.copyWith(
      personDetected: true,
      isActionPerformed: result.inActionCycle,
      actionState: result.inActionCycle ? 1 : 0,
      latestResult: result,
    );

    if (!result.repCompleted || _isGoalReached) return;

    _successCount++;
    _motionStatus.value = _motionStatus.value.copyWith(
      successCount: _successCount,
    );
    _voiceAssist(context).speak('已完成 $_successCount 次，共 $_targetCount 次');
    if (_successCount >= _targetCount) {
      _isGoalReached = true;
      _stopImageStreamSafely();
      _trainingTimer?.cancel();
      _saveTrainingRecord();
      _voiceAssist(context).announceConfirm('已完成目标训练次数');
      Future.delayed(const Duration(milliseconds: 300), () {
        if (mounted) {
          setState(() {}); // 目标达成：同步整页状态（历史/目标按钮态等）
          _showSuccessDialog(context);
        }
      });
      HapticFeedback.heavyImpact();
      return;
    }

    HapticFeedback.mediumImpact();
  }

  void _stopImageStreamSafely() {
    _snapshotDetectionTimer?.cancel();
    _snapshotDetectionTimer = null;
    final controller = _cameraController;
    if (controller != null &&
        controller.value.isInitialized &&
        controller.value.isStreamingImages) {
      controller.stopImageStream();
    }
  }

  String _phaseLabel(MotionFsmPhase phase) {
    switch (phase) {
      case MotionFsmPhase.idle:
        return 'Idle';
      case MotionFsmPhase.raising:
        return 'Raising';
      case MotionFsmPhase.reached:
        return 'Reached';
      case MotionFsmPhase.lowering:
        return 'Lowering';
      case MotionFsmPhase.cooldown:
        return 'Cooldown';
    }
  }

  String _sideLabel(MotionSide? side) {
    switch (side) {
      case MotionSide.left:
        return 'L';
      case MotionSide.right:
        return 'R';
      case null:
        return '-';
    }
  }

  void _showGoalSettingDialog(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(l10n.setGoal),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 16),
            _buildGoalOption(context, 5, l10n),
            const SizedBox(height: 12),
            _buildGoalOption(context, 10, l10n),
            const SizedBox(height: 12),
            _buildGoalOption(context, 20, l10n),
            const SizedBox(height: 16),
          ],
        ),
        actions: [
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.cancel),
          ),
        ],
      ),
    );
  }

  Widget _buildGoalOption(
    BuildContext context,
    int count,
    AppLocalizations l10n,
  ) {
    final isSelected = _targetCount == count;

    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        setState(() {
          _targetCount = count;
          _motionStatus.value = _motionStatus.value.copyWith(
            targetCount: count,
          );
          // 如果当前计数超过新目标，重置
          if (_successCount >= _targetCount) {
            _isGoalReached = true;
            _stopImageStreamSafely();
          } else {
            _isGoalReached = false;
            // 如果之前停止了，重新启动
            if (_cameraController != null &&
                _cameraController!.value.isInitialized &&
                _useSampledStreamDetection) {
              _startSnapshotDetection();
            } else if (_cameraController != null &&
                _cameraController!.value.isInitialized &&
                !_cameraController!.value.isStreamingImages) {
              _startImageStream();
            }
          }
        });
        Navigator.pop(context);
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.blue.withValues(alpha: 0.2)
              : Colors.grey.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.transparent,
            width: 2,
          ),
        ),
        child: Text(
          '$count ${l10n.reps}',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            color: isSelected ? Colors.blue : Colors.white,
          ),
        ),
      ),
    );
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        // 使用对话框的 context 获取本地化
        final l10n = AppLocalizations.of(dialogContext)!;

        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.9),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: Colors.green, width: 2),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  CupertinoIcons.check_mark_circled_solid,
                  color: Colors.green,
                  size: 80,
                ),
                const SizedBox(height: 24),
                Text(
                  l10n.greatJob,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  l10n.goalCompleted,
                  style: TextStyle(color: Colors.white70, fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                // 显示训练统计信息
                Text(
                  '${l10n.successCount}: $_successCount / $_targetCount | ${l10n.duration}: ${_formatDuration(_trainingDuration.value)}',
                  style: TextStyle(color: Colors.white60, fontSize: 14),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                CupertinoButton.filled(
                  onPressed: () {
                    Navigator.pop(dialogContext);
                    _resetTraining();
                  },
                  child: Text(l10n.playAgain),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showTrainingHistory(BuildContext context) {
    pushGentle(context, const MovementTrainingHistoryPage());
  }

  // 保存训练记录
  Future<void> _saveTrainingRecord() async {
    try {
      final record = MovementTrainingRecord(
        timestamp: _trainingStartTime ?? DateTime.now(),
        duration: _trainingDuration.value,
        successCount: _successCount,
        targetCount: _targetCount,
        goalReached: _isGoalReached,
        trainingType: _currentTrainingType,
      );
      await _databaseService.insertMovementTrainingRecord(record);
      await TrainingScoreService().recordMotion(
        successCount: _successCount,
        targetCount: _targetCount,
        goalReached: _isGoalReached,
        durationSeconds: _trainingDuration.value,
      );
    } catch (e) {
      debugPrint('保存训练记录失败: $e');
    }
  }

  void _resetTraining() {
    setState(() {
      _successCount = 0;
      _isGoalReached = false;
      _trainingStartTime = DateTime.now();
    });
    _trainingDuration.value = 0;
    _motionStatus.value = MotionUiStatus.initial().copyWith(
      targetCount: _targetCount,
    );
    _displayFilter.reset();
    _poseOverlay.value = null;

    _initArmDetectionState();
    _initLegLiftHistory();

    // 重新启动计时器
    _startTrainingTimer();

    // 重新启动图像流
    if (_cameraController != null &&
        _cameraController!.value.isInitialized &&
        _useSampledStreamDetection) {
      _startSnapshotDetection();
    } else if (_cameraController != null &&
        _cameraController!.value.isInitialized &&
        !_cameraController!.value.isStreamingImages) {
      _startImageStream();
    }
  }

  void _showPermissionDialog() {
    final l10n = AppLocalizations.of(context)!;
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(l10n.cameraPermissionRequired),
        content: Text(l10n.cameraPermissionDeniedMessage),
        actions: [
          CupertinoDialogAction(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.cancel),
          ),
          CupertinoDialogAction(
            onPressed: () {
              Navigator.pop(context);
              openAppSettings();
            },
            child: Text(l10n.openSettings),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _trainingTimer?.cancel();
    _stopImageStreamSafely();
    _cameraController?.dispose();
    _poseDetector?.close();
    _poseOverlay.dispose();
    _motionStatus.dispose();
    _trainingDuration.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () => Navigator.pop(context),
          child: Tooltip(
            message: '返回',
            child: Semantics(
              button: true,
              label: '返回',
              hint: '返回上一页',
              child: Icon(
                CupertinoIcons.arrow_left,
                color: Colors.white,
                size: 28,
              ),
            ),
          ),
        ),
        title: Text(
          l10n.movementTraining,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () => _showTrainingHistory(context),
            child: Tooltip(
              message: l10n.testHistory,
              child: Semantics(
                button: true,
                label: l10n.testHistory,
                hint: '打开训练历史',
                child: const Icon(
                  CupertinoIcons.clock,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: _isGoalReached
                ? null
                : () => _showGoalSettingDialog(context),
            child: Tooltip(
              message: l10n.setGoal,
              child: Semantics(
                button: true,
                label: l10n.setGoal,
                hint: '设置目标训练次数',
                child: Icon(
                  CupertinoIcons.flag_fill,
                  color: _isGoalReached ? Colors.grey : Colors.white,
                  size: 24,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: _hasPermission && _isInitialized
          ? _buildCameraView(l10n)
          : _didRequestCamera
              ? _buildPermissionView(l10n)
              : const Center(
                  child: CircularProgressIndicator(color: Colors.white),
                ),
    );
  }

  Widget _buildPermissionView(AppLocalizations l10n) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              CupertinoIcons.camera_fill,
              size: 80,
              color: Colors.white70,
            ),
            const SizedBox(height: 24),
            Text(
              l10n.cameraPermissionRequired,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              l10n.cameraPermissionDeniedMessage,
              style: const TextStyle(color: Colors.white70, fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            CupertinoButton.filled(
              onPressed: () {
                _initializeCamera();
              },
              child: Text(l10n.openSettings),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCameraView(AppLocalizations l10n) {
    if (_cameraController == null || !_cameraController!.value.isInitialized) {
      return const Center(
        child: CircularProgressIndicator(color: Colors.white),
      );
    }

    return Stack(
      children: [
        // 摄像头预览：独立层 + 稳定 Key，避免上层 UI 刷新时拆掉 Texture。
        Positioned.fill(
          child: RepaintBoundary(
            child: CameraPreview(
              _cameraController!,
              key: const ValueKey('movement_camera_preview'),
            ),
          ),
        ),
        // 姿态检测覆盖层：仅骨架层随检测帧重绘，不触发整页 rebuild。
        Positioned.fill(
          child: ValueListenableBuilder<PoseOverlayData?>(
            valueListenable: _poseOverlay,
            builder: (context, overlay, _) {
              if (overlay == null) return const SizedBox.shrink();
              return CustomPaint(painter: PosePainter(overlay));
            },
          ),
        ),
        // 未检测到人体时的引导提示
        ValueListenableBuilder<MotionUiStatus>(
          valueListenable: _motionStatus,
          builder: (context, status, _) {
            if (status.personDetected || _isGoalReached) {
              return const SizedBox.shrink();
            }
            return Positioned(
              left: 24,
              right: 24,
              bottom: 200,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 14,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.6),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Row(
                    children: [
                      Icon(
                        CupertinoIcons.person_crop_circle_badge_exclam,
                        color: Colors.orangeAccent,
                        size: 22,
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          '未检测到人体\n请让上半身完整进入画面，保持光线充足',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            height: 1.4,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        // 顶部信息栏
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withValues(alpha: 0.7),
                  Colors.transparent,
                ],
              ),
            ),
            child: Column(
              children: [
                Text(
                  _getTrainingInstruction(l10n),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                // 显示训练时长（局部刷新，不重建相机）
                ValueListenableBuilder<int>(
                  valueListenable: _trainingDuration,
                  builder: (context, seconds, _) {
                    return Text(
                      _formatDuration(seconds),
                      style: const TextStyle(color: Colors.white70, fontSize: 14),
                      textAlign: TextAlign.center,
                    );
                  },
                ),
                const SizedBox(height: 12),
                ValueListenableBuilder<MotionUiStatus>(
                  valueListenable: _motionStatus,
                  builder: (context, status, _) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: status.isActionPerformed
                                ? Colors.green.withValues(alpha: 0.8)
                                : Colors.orange.withValues(alpha: 0.8),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                status.isActionPerformed
                                    ? CupertinoIcons.check_mark_circled_solid
                                    : CupertinoIcons.exclamationmark_circle,
                                color: Colors.white,
                                size: 20,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                _getActionStatusText(l10n, status),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        // 底部统计信息
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black.withValues(alpha: 0.8),
                  Colors.transparent,
                ],
              ),
            ),
            child: ValueListenableBuilder<MotionUiStatus>(
              valueListenable: _motionStatus,
              builder: (context, status, _) {
                final result = status.latestResult;
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 16,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.3),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            CupertinoIcons.hand_raised_fill,
                            color: Colors.white,
                            size: 24,
                          ),
                          const SizedBox(width: 12),
                          // 进度指示器和计数器
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox(
                                width: 60,
                                height: 60,
                                child: CircularProgressIndicator(
                                  value: _targetCount > 0
                                      ? (status.successCount / _targetCount)
                                          .clamp(0.0, 1.0)
                                      : 0.0,
                                  strokeWidth: 4,
                                  backgroundColor: Colors.white.withValues(
                                    alpha: 0.3,
                                  ),
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    _isGoalReached
                                        ? Colors.green
                                        : Colors.white,
                                  ),
                                ),
                              ),
                              Text(
                                '${status.successCount} / $_targetCount',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'FSM: ${_phaseLabel(result.phase)}  '
                      'Side: ${_sideLabel(result.activeSide)}  '
                      'Score: ${(result.normScore ?? 0).toStringAsFixed(2)}  '
                      'Δ: ${(result.deltaDeg ?? 0).toStringAsFixed(1)}°',
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.85),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

/// 骨架叠加层单帧数据（已用显示滤波平滑后的关键点）。
class PoseOverlayData {
  final Map<PoseLandmarkType, Offset> points;
  final Size imageSize; // ML Kit 输入帧的原始尺寸（未旋转）
  final InputImageRotation rotation; // 传给 ML Kit 的旋转角度
  final CameraLensDirection lensDirection; // 前置需镜像
  final TrainingType trainingType;

  const PoseOverlayData({
    required this.points,
    required this.imageSize,
    required this.rotation,
    required this.lensDirection,
    required this.trainingType,
  });
}

/// 顶部状态条 / 底部计数条的 UI 状态（走 ValueNotifier 局部刷新）。
class MotionUiStatus {
  final bool personDetected;
  final bool isActionPerformed;
  final int actionState;
  final int successCount;
  final int targetCount;
  final MotionDetectionResult latestResult;

  const MotionUiStatus({
    required this.personDetected,
    required this.isActionPerformed,
    required this.actionState,
    required this.successCount,
    required this.targetCount,
    required this.latestResult,
  });

  const MotionUiStatus.initial()
      : personDetected = false,
        isActionPerformed = false,
        actionState = 0,
        successCount = 0,
        targetCount = 10,
        latestResult = const MotionDetectionResult(
          phase: MotionFsmPhase.idle,
          activeSide: null,
          repCompleted: false,
        );

  MotionUiStatus copyWith({
    bool? personDetected,
    bool? isActionPerformed,
    int? actionState,
    int? successCount,
    int? targetCount,
    MotionDetectionResult? latestResult,
  }) {
    return MotionUiStatus(
      personDetected: personDetected ?? this.personDetected,
      isActionPerformed: isActionPerformed ?? this.isActionPerformed,
      actionState: actionState ?? this.actionState,
      successCount: successCount ?? this.successCount,
      targetCount: targetCount ?? this.targetCount,
      latestResult: latestResult ?? this.latestResult,
    );
  }
}

// 姿态绘制器：绘制显示层平滑后的关键点；坐标映射采用等比 cover（与相机预览一致），
// 避免旧 stretch 映射在非等比屏幕上的骨架错位。
class PosePainter extends CustomPainter {
  final PoseOverlayData data;

  PosePainter(this.data);

  static const _armConnections = [
    [PoseLandmarkType.leftShoulder, PoseLandmarkType.rightShoulder],
    [PoseLandmarkType.leftShoulder, PoseLandmarkType.leftElbow],
    [PoseLandmarkType.leftElbow, PoseLandmarkType.leftWrist],
    [PoseLandmarkType.rightShoulder, PoseLandmarkType.rightElbow],
    [PoseLandmarkType.rightElbow, PoseLandmarkType.rightWrist],
  ];
  static const _armLandmarks = [
    PoseLandmarkType.leftShoulder,
    PoseLandmarkType.rightShoulder,
    PoseLandmarkType.leftElbow,
    PoseLandmarkType.rightElbow,
    PoseLandmarkType.leftWrist,
    PoseLandmarkType.rightWrist,
  ];
  static const _legConnections = [
    [PoseLandmarkType.leftHip, PoseLandmarkType.rightHip],
    [PoseLandmarkType.leftHip, PoseLandmarkType.leftKnee],
    [PoseLandmarkType.leftKnee, PoseLandmarkType.leftAnkle],
    [PoseLandmarkType.rightHip, PoseLandmarkType.rightKnee],
    [PoseLandmarkType.rightKnee, PoseLandmarkType.rightAnkle],
  ];
  static const _legLandmarks = [
    PoseLandmarkType.leftHip,
    PoseLandmarkType.rightHip,
    PoseLandmarkType.leftKnee,
    PoseLandmarkType.rightKnee,
    PoseLandmarkType.leftAnkle,
    PoseLandmarkType.rightAnkle,
  ];

  @override
  void paint(Canvas canvas, Size size) {
    final connections = data.trainingType == TrainingType.armsRaised
        ? _armConnections
        : _legConnections;
    final relevantLandmarks = data.trainingType == TrainingType.armsRaised
        ? _armLandmarks
        : _legLandmarks;

    // 坐标映射保持与旧版（官方示例移植、iOS 真机已验证）一致的 stretch 语义：
    // 预览层是 Positioned.fill 拉伸显示，骨架必须用同样的拉伸才能对齐。
    final scaleX = size.width / data.imageSize.width;
    final scaleY = size.height / data.imageSize.height;

    // 镜像规则与旧版一致：iOS 真机已验证前置方向正确。
    final bool mirrorX;
    switch (data.rotation) {
      case InputImageRotation.rotation90deg:
        mirrorX = false;
        break;
      case InputImageRotation.rotation270deg:
        mirrorX = true;
        break;
      case InputImageRotation.rotation0deg:
      case InputImageRotation.rotation180deg:
        mirrorX = data.lensDirection != CameraLensDirection.back;
        break;
    }

    Offset toCanvas(Offset p) {
      final fx = mirrorX ? data.imageSize.width - p.dx : p.dx;
      return Offset(fx * scaleX, p.dy * scaleY);
    }

    // 绘制骨骼连线（白色）
    final linePaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 3.0
      ..style = PaintingStyle.stroke;

    for (final connection in connections) {
      final startPoint = data.points[connection[0]];
      final endPoint = data.points[connection[1]];

      if (startPoint != null && endPoint != null) {
        canvas.drawLine(toCanvas(startPoint), toCanvas(endPoint), linePaint);
      }
    }

    // 只绘制与训练相关的关键点（黄色小圆点）
    final pointPaint = Paint()
      ..color = Colors.yellow
      ..style = PaintingStyle.fill;

    for (final landmarkType in relevantLandmarks) {
      final point = data.points[landmarkType];
      if (point != null) {
        canvas.drawCircle(toCanvas(point), 5.0, pointPaint);
      }
    }
  }

  @override
  bool shouldRepaint(PosePainter oldDelegate) => oldDelegate.data != data;
}
