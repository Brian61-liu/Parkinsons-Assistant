import 'dart:async';
import 'dart:io';
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

class _MovementTrainingPageState extends State<MovementTrainingPage> {
  CameraController? _cameraController;
  CameraDescription? _camera; // 当前使用的摄像头描述（含 sensorOrientation/lensDirection）
  PoseDetector? _poseDetector;
  bool _isDetecting = false;
  bool _hasPermission = false;
  bool _isInitialized = false;
  Pose? _currentPose;
  Size? _imageSize;
  bool _personDetected = false; // 当前帧是否检测到人体
  InputImageRotation _imageRotation = InputImageRotation.rotation0deg;

  // Android 设备方向 -> 旋转补偿角度（ML Kit 输入旋转计算用）
  static const Map<DeviceOrientation, int> _deviceOrientationDegrees = {
    DeviceOrientation.portraitUp: 0,
    DeviceOrientation.landscapeLeft: 90,
    DeviceOrientation.portraitDown: 180,
    DeviceOrientation.landscapeRight: 270,
  };
  
  // 训练类型
  TrainingType _currentTrainingType = TrainingType.armsRaised; // 当前训练类型
  
  // 动作检测相关（通用）
  bool _isActionPerformed = false; // 是否完成动作（根据训练类型不同而不同）
  int _successCount = 0;
  int _targetCount = 10; // 目标次数
  bool _isGoalReached = false; // 是否达到目标
  MotionDetectionResult _latestMotionResult = const MotionDetectionResult(
    phase: MotionFsmPhase.idle,
    activeSide: null,
    repCompleted: false,
  );

  // 动作状态：0=初始/放下, 1=举高
  int _actionState = 0;

  // 计时功能
  Timer? _trainingTimer;
  int _trainingDuration = 0; // 训练时长（秒）
  DateTime? _trainingStartTime;

  // 数据库服务
  final DatabaseService _databaseService = DatabaseService();

  // 动作检测引擎：单一保守难度（2026-06-20 起取消双模式）。
  final MotionDetectionConfig _motionConfig =
      MotionDetectionConfig.defaultPreset();
  late final ArmRaiseDetector _armDetector = ArmRaiseDetector(_motionConfig.arm);
  late final LegLiftDetector _legDetector = LegLiftDetector(_motionConfig.leg);

  VoiceAssistService _voiceAssist(BuildContext context) {
    final enabled = context.read<UserSettingsService>().voiceHints;
    return VoiceAssistService(enabled: enabled);
  }

  @override
  void initState() {
    super.initState();
    _showTrainingTypeSelection();
  }
  
  // 启动训练计时器
  void _startTrainingTimer() {
    _trainingStartTime = DateTime.now();
    _trainingTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted && !_isGoalReached) {
        setState(() {
          _trainingDuration = DateTime.now().difference(_trainingStartTime!).inSeconds;
        });
      } else {
        timer.cancel();
      }
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
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('未找到可用摄像头')),
        );
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
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('未找到前置摄像头')),
        );
      }
      return;
    }

    _camera = frontCamera;

    // 初始化摄像头控制器。
    // ML Kit 要求平台特定的像素格式：iOS 用 bgra8888，Android 用 nv21（单平面）。
    _cameraController = CameraController(
      frontCamera,
      ResolutionPreset.medium,
      enableAudio: false,
      imageFormatGroup:
          Platform.isAndroid ? ImageFormatGroup.nv21 : ImageFormatGroup.bgra8888,
    );

    try {
      await _cameraController!.initialize();
      if (mounted) {
        setState(() {
          _hasPermission = true;
          _isInitialized = true;
        });
        _startImageStream();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('摄像头初始化失败: $e')),
        );
      }
    }
  }

  void _initializePoseDetector() {
    final options = PoseDetectorOptions(
      mode: PoseDetectionMode.stream,
      model: PoseDetectionModel.accurate,
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

    _cameraController!.startImageStream((CameraImage image) {
      if (_isDetecting || _isGoalReached) return;
      _isDetecting = true;

      _processImage(image);
    });
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

      setState(() {
        _imageSize = inputImage.metadata?.size;
        _imageRotation = inputImage.metadata?.rotation ?? _imageRotation;
        if (poses.isNotEmpty) {
          _currentPose = poses.first;
          _personDetected = true;
          _checkAction();
        } else {
          _currentPose = null;
          _personDetected = false;
          _isActionPerformed = false;
        }
      });
    } catch (e) {
      // ML Kit / 相机帧异常不能让检测永久卡死：记录后由 finally 释放节流标志。
      debugPrint('姿态检测处理失败: $e');
    } finally {
      _isDetecting = false;
    }
  }

  /// 将相机帧转换为 ML Kit 可识别的 [InputImage]。
  ///
  /// 关键点（旧实现固定 rotation0deg + yuv420，导致 iOS 真机完全检测不到人体）：
  /// - 旋转角度根据摄像头 sensorOrientation 与设备方向计算；
  /// - 图像格式从相机帧实际格式推导，并校验平台支持的格式；
  /// - iOS(bgra8888)/Android(nv21) 均为单平面，直接取首平面字节。
  InputImage? _inputImageFromCameraImage(CameraImage image) {
    final controller = _cameraController;
    final camera = _camera;
    if (controller == null || camera == null) return null;

    final sensorOrientation = camera.sensorOrientation;
    InputImageRotation? rotation;
    if (Platform.isIOS) {
      rotation = InputImageRotationValue.fromRawValue(sensorOrientation);
    } else if (Platform.isAndroid) {
      var rotationCompensation =
          _deviceOrientationDegrees[controller.value.deviceOrientation];
      if (rotationCompensation == null) return null;
      if (camera.lensDirection == CameraLensDirection.front) {
        rotationCompensation = (sensorOrientation + rotationCompensation) % 360;
      } else {
        rotationCompensation =
            (sensorOrientation - rotationCompensation + 360) % 360;
      }
      rotation = InputImageRotationValue.fromRawValue(rotationCompensation);
    }
    if (rotation == null) return null;

    final format = InputImageFormatValue.fromRawValue(image.format.raw);
    if (format == null ||
        (Platform.isAndroid && format != InputImageFormat.nv21) ||
        (Platform.isIOS && format != InputImageFormat.bgra8888)) {
      return null;
    }

    if (image.planes.length != 1) return null;
    final plane = image.planes.first;

    return InputImage.fromBytes(
      bytes: plane.bytes,
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
  Widget _buildTrainingDemoDialog(BuildContext context, AppLocalizations l10n, TrainingType type) {
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
                  Icon(
                    icon,
                    color: color,
                    size: 24,
                  ),
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
                        child: Image.asset(
                          gifPath,
                          fit: BoxFit.contain,
                        ),
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
                    _initializeCamera();
                    _initializePoseDetector();
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

  Widget _buildTrainingTypeOption(BuildContext context, TrainingType type, AppLocalizations l10n) {
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
        _actionState = 0;
        _isActionPerformed = false;
        _initArmDetectionState();
        _initLegLiftHistory();
        Navigator.pop(context);
        // 显示演示页面（两种训练类型都有演示）
        _showTrainingDemo(context, type);
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

  String _getActionStatusText(AppLocalizations l10n) {
    if (_actionState == 1) {
      // 已经完成动作，提示恢复
      switch (_currentTrainingType) {
        case TrainingType.armsRaised:
          return l10n.lowerArms;
        case TrainingType.legLift:
          return l10n.lowerLegs;
      }
    } else if (_isActionPerformed) {
      // 动作已完成
      switch (_currentTrainingType) {
        case TrainingType.armsRaised:
          return l10n.armsRaised;
        case TrainingType.legLift:
          return l10n.legsRaised;
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
  void _checkAction() {
    switch (_currentTrainingType) {
      case TrainingType.armsRaised:
        _checkArmsRaised();
        break;
      case TrainingType.legLift:
        _checkLegLift();
        break;
    }
  }

  // 举手运动检测
  void _checkArmsRaised() {
    final pose = _currentPose;
    if (pose == null) {
      _isActionPerformed = false;
      _actionState = 0;
      return;
    }

    final result = _armDetector.update(pose, DateTime.now());
    _applyMotionResult(result);
  }

  // 初始化历史记录

  // 初始化抬腿运动历史记录
  void _initLegLiftHistory() {
    _legDetector.reset();
  }

  void _initArmDetectionState() {
    _armDetector.reset();
  }

  // 原地抬腿运动检测（FSM）
  void _checkLegLift() {
    final pose = _currentPose;
    if (pose == null) {
      _isActionPerformed = false;
      _actionState = 0;
      return;
    }

    final result = _legDetector.update(pose, DateTime.now());
    _applyMotionResult(result);
  }

  void _applyMotionResult(MotionDetectionResult result) {
    _latestMotionResult = result;
    _isActionPerformed = result.inActionCycle;
    _actionState = result.inActionCycle ? 1 : 0;

    if (!result.repCompleted || _isGoalReached) return;

    _successCount++;
    _voiceAssist(context).speak('已完成 $_successCount 次，共 $_targetCount 次');
    if (_successCount >= _targetCount) {
      _isGoalReached = true;
      _cameraController?.stopImageStream();
      _trainingTimer?.cancel();
      _saveTrainingRecord();
      _voiceAssist(context).announceConfirm('已完成目标训练次数');
      Future.delayed(const Duration(milliseconds: 300), () {
        if (mounted) {
          _showSuccessDialog(context);
        }
      });
      HapticFeedback.heavyImpact();
      return;
    }

    HapticFeedback.mediumImpact();
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

  Widget _buildGoalOption(BuildContext context, int count, AppLocalizations l10n) {
    final isSelected = _targetCount == count;
    
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        setState(() {
          _targetCount = count;
          // 如果当前计数超过新目标，重置
          if (_successCount >= _targetCount) {
            _isGoalReached = true;
            _cameraController?.stopImageStream();
          } else {
            _isGoalReached = false;
            // 如果之前停止了，重新启动
            if (_cameraController != null && 
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
              border: Border.all(
                color: Colors.green,
                width: 2,
              ),
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
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                // 显示训练统计信息
                Text(
                  '${l10n.successCount}: $_successCount / $_targetCount | ${l10n.duration}: ${_formatDuration(_trainingDuration)}',
                  style: TextStyle(
                    color: Colors.white60,
                    fontSize: 14,
                  ),
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
        duration: _trainingDuration,
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
        durationSeconds: _trainingDuration,
      );
    } catch (e) {
      debugPrint('保存训练记录失败: $e');
    }
  }

  void _resetTraining() {
    setState(() {
      _successCount = 0;
      _isGoalReached = false;
      _actionState = 0;
      _trainingDuration = 0;
      _trainingStartTime = DateTime.now();
      _isActionPerformed = false;
    });

    _initArmDetectionState();
    _initLegLiftHistory();
    
    // 重新启动计时器
    _startTrainingTimer();
    
    // 重新启动图像流
    if (_cameraController != null && 
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
    _trainingTimer?.cancel();
    _cameraController?.stopImageStream();
    _cameraController?.dispose();
    _poseDetector?.close();
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
            onPressed: _isGoalReached ? null : () => _showGoalSettingDialog(context),
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
          : _buildPermissionView(l10n),
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
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),
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
        // 摄像头预览
        Positioned.fill(
          child: CameraPreview(_cameraController!),
        ),
        // 姿态检测覆盖层
        if (_currentPose != null && _imageSize != null && _camera != null)
          Positioned.fill(
            child: CustomPaint(
              painter: PosePainter(
                pose: _currentPose!,
                imageSize: _imageSize!,
                rotation: _imageRotation,
                cameraLensDirection: _camera!.lensDirection,
                isActionPerformed: _isActionPerformed,
                trainingType: _currentTrainingType,
              ),
            ),
          ),
        // 未检测到人体时的引导提示
        if (!_personDetected && !_isGoalReached)
          Positioned(
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
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(
                      CupertinoIcons.person_crop_circle_badge_exclam,
                      color: Colors.orangeAccent,
                      size: 22,
                    ),
                    SizedBox(width: 10),
                    Flexible(
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
                // 显示训练时长
                Text(
                  _formatDuration(_trainingDuration),
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: _isActionPerformed
                            ? Colors.green.withValues(alpha: 0.8)
                            : Colors.orange.withValues(alpha: 0.8),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            _isActionPerformed
                                ? CupertinoIcons.check_mark_circled_solid
                                : CupertinoIcons.exclamationmark_circle,
                            color: Colors.white,
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            _getActionStatusText(l10n),
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
            child: Column(
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
                                  ? (_successCount / _targetCount).clamp(0.0, 1.0)
                                  : 0.0,
                              strokeWidth: 4,
                              backgroundColor: Colors.white.withValues(alpha: 0.3),
                              valueColor: AlwaysStoppedAnimation<Color>(
                                _isGoalReached ? Colors.green : Colors.white,
                              ),
                            ),
                          ),
                          Text(
                            '$_successCount / $_targetCount',
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
                  'FSM: ${_phaseLabel(_latestMotionResult.phase)}  '
                  'Side: ${_sideLabel(_latestMotionResult.activeSide)}  '
                  'Score: ${(_latestMotionResult.normScore ?? 0).toStringAsFixed(2)}  '
                  'Δ: ${(_latestMotionResult.deltaDeg ?? 0).toStringAsFixed(1)}°',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.85),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}


// 姿态绘制器
class PosePainter extends CustomPainter {
  final Pose pose;
  final Size imageSize; // ML Kit 输入帧的原始尺寸（未旋转）
  final InputImageRotation rotation; // 传给 ML Kit 的旋转角度
  final CameraLensDirection cameraLensDirection; // 摄像头朝向（前置需镜像）
  final bool isActionPerformed;
  final TrainingType trainingType; // 训练类型

  PosePainter({
    required this.pose,
    required this.imageSize,
    required this.rotation,
    required this.cameraLensDirection,
    required this.isActionPerformed,
    required this.trainingType,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // 根据训练类型定义不同的骨骼连接关系
    List<List<PoseLandmarkType>> connections = [];
    List<PoseLandmarkType> relevantLandmarks = [];

    switch (trainingType) {
      case TrainingType.armsRaised:
        // 举手运动：显示手臂
        connections = [
          [PoseLandmarkType.leftShoulder, PoseLandmarkType.rightShoulder],
          [PoseLandmarkType.leftShoulder, PoseLandmarkType.leftElbow],
          [PoseLandmarkType.leftElbow, PoseLandmarkType.leftWrist],
          [PoseLandmarkType.rightShoulder, PoseLandmarkType.rightElbow],
          [PoseLandmarkType.rightElbow, PoseLandmarkType.rightWrist],
        ];
        relevantLandmarks = [
          PoseLandmarkType.leftShoulder,
          PoseLandmarkType.rightShoulder,
          PoseLandmarkType.leftElbow,
          PoseLandmarkType.rightElbow,
          PoseLandmarkType.leftWrist,
          PoseLandmarkType.rightWrist,
        ];
        break;
      case TrainingType.legLift:
        // 抬腿运动：显示腿部
        connections = [
          [PoseLandmarkType.leftHip, PoseLandmarkType.rightHip],
          [PoseLandmarkType.leftHip, PoseLandmarkType.leftKnee],
          [PoseLandmarkType.leftKnee, PoseLandmarkType.leftAnkle],
          [PoseLandmarkType.rightHip, PoseLandmarkType.rightKnee],
          [PoseLandmarkType.rightKnee, PoseLandmarkType.rightAnkle],
        ];
        relevantLandmarks = [
          PoseLandmarkType.leftHip,
          PoseLandmarkType.rightHip,
          PoseLandmarkType.leftKnee,
          PoseLandmarkType.rightKnee,
          PoseLandmarkType.leftAnkle,
          PoseLandmarkType.rightAnkle,
        ];
        break;
    }

    Offset toCanvas(PoseLandmark landmark) {
      return Offset(
        _translateX(landmark.x, size, imageSize, rotation, cameraLensDirection),
        _translateY(landmark.y, size, imageSize, rotation, cameraLensDirection),
      );
    }

    // 绘制骨骼连线（白色）
    final linePaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 3.0
      ..style = PaintingStyle.stroke;

    for (final connection in connections) {
      final startPoint = pose.landmarks[connection[0]];
      final endPoint = pose.landmarks[connection[1]];

      if (startPoint != null && endPoint != null) {
        canvas.drawLine(
          toCanvas(startPoint),
          toCanvas(endPoint),
          linePaint,
        );
      }
    }

    // 只绘制与训练相关的关键点（黄色小圆点）
    final pointPaint = Paint()
      ..color = Colors.yellow
      ..style = PaintingStyle.fill;

    for (final landmarkType in relevantLandmarks) {
      final landmark = pose.landmarks[landmarkType];
      if (landmark != null) {
        canvas.drawCircle(toCanvas(landmark), 5.0, pointPaint);
      }
    }
  }

  @override
  bool shouldRepaint(PosePainter oldDelegate) {
    return oldDelegate.pose != pose ||
        oldDelegate.isActionPerformed != isActionPerformed ||
        oldDelegate.rotation != rotation ||
        oldDelegate.cameraLensDirection != cameraLensDirection ||
        oldDelegate.trainingType != trainingType;
  }
}

/// 将 ML Kit 返回的横坐标映射到画布坐标（考虑旋转与前置镜像）。
/// 移植自 google_mlkit 官方示例的坐标转换逻辑。
double _translateX(
  double x,
  Size canvasSize,
  Size imageSize,
  InputImageRotation rotation,
  CameraLensDirection cameraLensDirection,
) {
  switch (rotation) {
    case InputImageRotation.rotation90deg:
      return x *
          canvasSize.width /
          (Platform.isIOS ? imageSize.width : imageSize.height);
    case InputImageRotation.rotation270deg:
      return canvasSize.width -
          x *
              canvasSize.width /
              (Platform.isIOS ? imageSize.width : imageSize.height);
    case InputImageRotation.rotation0deg:
    case InputImageRotation.rotation180deg:
      switch (cameraLensDirection) {
        case CameraLensDirection.back:
          return x * canvasSize.width / imageSize.width;
        default:
          return canvasSize.width - x * canvasSize.width / imageSize.width;
      }
  }
}

/// 将 ML Kit 返回的纵坐标映射到画布坐标（考虑旋转）。
double _translateY(
  double y,
  Size canvasSize,
  Size imageSize,
  InputImageRotation rotation,
  CameraLensDirection cameraLensDirection,
) {
  switch (rotation) {
    case InputImageRotation.rotation90deg:
    case InputImageRotation.rotation270deg:
      return y *
          canvasSize.height /
          (Platform.isIOS ? imageSize.height : imageSize.width);
    case InputImageRotation.rotation0deg:
    case InputImageRotation.rotation180deg:
      return y * canvasSize.height / imageSize.height;
  }
}
