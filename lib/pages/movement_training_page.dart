import 'dart:async';
import 'dart:typed_data';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:camera/camera.dart';
import 'package:google_mlkit_pose_detection/google_mlkit_pose_detection.dart';
import 'package:permission_handler/permission_handler.dart';
import '../l10n/app_localizations.dart';
import '../services/database_service.dart';
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
  PoseDetector? _poseDetector;
  bool _isDetecting = false;
  bool _hasPermission = false;
  bool _isInitialized = false;
  Pose? _currentPose;
  Size? _imageSize;
  bool _isFrontCamera = false; // 是否使用前置摄像头
  
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
  MotionSensitivity _sensitivity = MotionSensitivity.rehab;
  
  // 动作状态：0=初始/放下, 1=举高
  int _actionState = 0;
  
  // 计时功能
  Timer? _trainingTimer;
  int _trainingDuration = 0; // 训练时长（秒）
  DateTime? _trainingStartTime;
  
  // 数据库服务
  final DatabaseService _databaseService = DatabaseService();

  // 新动作检测引擎：可配置参数 + EMA + 角度特征 + FSM
  late MotionDetectionConfig _motionConfig;
  late ArmRaiseDetector _armDetector;
  late LegLiftDetector _legDetector;

  @override
  void initState() {
    super.initState();
    _applySensitivityPreset(_sensitivity);
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

    // 初始化摄像头控制器
    _cameraController = CameraController(
      frontCamera,
      ResolutionPreset.medium,
      enableAudio: false,
    );

    try {
      await _cameraController!.initialize();
      if (mounted) {
        setState(() {
          _hasPermission = true;
          _isInitialized = true;
          _isFrontCamera = frontCamera?.lensDirection == CameraLensDirection.front;
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
    if (_poseDetector == null) {
      _isDetecting = false;
      return;
    }

    final inputImage = _inputImageFromCameraImage(image);
    if (inputImage == null) {
      _isDetecting = false;
      return;
    }

    final poses = await _poseDetector!.processImage(inputImage);
    
    if (mounted) {
      setState(() {
        _imageSize = Size(image.width.toDouble(), image.height.toDouble());
        if (poses.isNotEmpty) {
          _currentPose = poses.first;
          _checkAction();
        } else {
          _currentPose = null;
          _isActionPerformed = false;
        }
        _isDetecting = false;
      });
    } else {
      _isDetecting = false;
    }
  }

  InputImage? _inputImageFromCameraImage(CameraImage image) {
    if (_cameraController == null) return null;

    final rotation = InputImageRotation.rotation0deg;
    final format = InputImageFormat.yuv420;

    // 对于YUV420格式，需要正确构建bytes
    final allBytes = BytesBuilder();
    for (final Plane plane in image.planes) {
      allBytes.add(plane.bytes);
    }

    return InputImage.fromBytes(
      bytes: allBytes.takeBytes(),
      metadata: InputImageMetadata(
        size: Size(image.width.toDouble(), image.height.toDouble()),
        rotation: rotation,
        format: format,
        bytesPerRow: image.planes[0].bytesPerRow,
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
    if (_successCount >= _targetCount) {
      _isGoalReached = true;
      _cameraController?.stopImageStream();
      _trainingTimer?.cancel();
      _saveTrainingRecord();
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

  void _applySensitivityPreset(MotionSensitivity mode) {
    _motionConfig = mode == MotionSensitivity.rehab
        ? MotionDetectionConfig.rehabPreset()
        : MotionDetectionConfig.standardPreset();
    _armDetector = ArmRaiseDetector(_motionConfig.arm);
    _legDetector = LegLiftDetector(_motionConfig.leg);
    _latestMotionResult = const MotionDetectionResult(
      phase: MotionFsmPhase.idle,
      activeSide: null,
      repCompleted: false,
    );
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
          child: const Icon(
            CupertinoIcons.arrow_left,
            color: Colors.white,
            size: 28,
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
            child: const Icon(
              CupertinoIcons.clock,
              color: Colors.white,
              size: 24,
            ),
          ),
          const SizedBox(width: 8),
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: _isGoalReached ? null : () => _showGoalSettingDialog(context),
            child: Icon(
              CupertinoIcons.flag_fill,
              color: _isGoalReached ? Colors.grey : Colors.white,
              size: 24,
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
        if (_currentPose != null && _imageSize != null)
          Positioned.fill(
            child: CustomPaint(
              painter: PosePainter(
                pose: _currentPose!,
                imageSize: _imageSize!,
                isActionPerformed: _isActionPerformed,
                isFrontCamera: _isFrontCamera,
                trainingType: _currentTrainingType,
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
                const SizedBox(height: 10),
                CupertinoSlidingSegmentedControl<MotionSensitivity>(
                  groupValue: _sensitivity,
                  backgroundColor: Colors.white.withValues(alpha: 0.18),
                  thumbColor: Colors.white.withValues(alpha: 0.32),
                  children: const {
                    MotionSensitivity.rehab: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      child: Text(
                        '康复增强',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    MotionSensitivity.standard: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      child: Text(
                        '标准',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  },
                  onValueChanged: (value) {
                    if (_isGoalReached) return;
                    if (value == null || value == _sensitivity) return;
                    setState(() {
                      _sensitivity = value;
                      _applySensitivityPreset(value);
                      _isActionPerformed = false;
                      _actionState = 0;
                    });
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

enum MotionFsmPhase { idle, raising, reached, lowering, cooldown }

enum MotionSide { left, right }

enum MotionSensitivity { rehab, standard }

class MotionDetectionResult {
  final MotionFsmPhase phase;
  final MotionSide? activeSide;
  final bool repCompleted;
  final double? normScore;
  final double? deltaDeg;

  const MotionDetectionResult({
    required this.phase,
    required this.activeSide,
    required this.repCompleted,
    this.normScore,
    this.deltaDeg,
  });

  bool get inActionCycle =>
      phase == MotionFsmPhase.raising ||
      phase == MotionFsmPhase.reached ||
      phase == MotionFsmPhase.lowering;
}

class MotionDetectionConfig {
  final ArmDetectionConfig arm;
  final LegDetectionConfig leg;

  const MotionDetectionConfig({
    required this.arm,
    required this.leg,
  });

  factory MotionDetectionConfig.rehabPreset() {
    const fsm = FsmConfig(
      raiseConfirmFrames: 2,
      reachedHoldFrames: 2,
      lowerConfirmFrames: 2,
      raisingTimeout: Duration(milliseconds: 1800),
      lostTrackingGrace: Duration(milliseconds: 550),
      cooldown: Duration(milliseconds: 650),
    );

    return const MotionDetectionConfig(
      arm: ArmDetectionConfig(
        emaAlpha: 0.28,
        baselineAlpha: 0.08,
        baselineUpdateGateDeg: 8.0,
        minRangeDeg: 26.0,
        enterNorm: 0.18,
        reachedNorm: 0.30,
        loweringNorm: 0.16,
        exitNorm: 0.10,
        enterDeltaDeg: 5.0,
        reachedDeltaDeg: 8.0,
        loweringDeltaDeg: 5.0,
        exitDeltaDeg: 3.0,
        minElbowExtensionDeg: 95.0,
        fsm: fsm,
      ),
      leg: LegDetectionConfig(
        emaAlpha: 0.26,
        baselineAlpha: 0.08,
        baselineUpdateGateDeg: 6.0,
        minRangeDeg: 18.0,
        enterNorm: 0.18,
        reachedNorm: 0.30,
        loweringNorm: 0.16,
        exitNorm: 0.10,
        enterDeltaDeg: 3.0,
        reachedDeltaDeg: 5.0,
        loweringDeltaDeg: 3.0,
        exitDeltaDeg: 1.8,
        minKneeExtensionDeg: 40.0,
        fsm: fsm,
      ),
    );
  }

  factory MotionDetectionConfig.standardPreset() {
    const fsm = FsmConfig(
      raiseConfirmFrames: 3,
      reachedHoldFrames: 3,
      lowerConfirmFrames: 3,
      raisingTimeout: Duration(milliseconds: 1500),
      lostTrackingGrace: Duration(milliseconds: 450),
      cooldown: Duration(milliseconds: 750),
    );

    return const MotionDetectionConfig(
      arm: ArmDetectionConfig(
        emaAlpha: 0.22,
        baselineAlpha: 0.06,
        baselineUpdateGateDeg: 6.0,
        minRangeDeg: 32.0,
        enterNorm: 0.22,
        reachedNorm: 0.36,
        loweringNorm: 0.18,
        exitNorm: 0.12,
        enterDeltaDeg: 7.0,
        reachedDeltaDeg: 11.0,
        loweringDeltaDeg: 7.0,
        exitDeltaDeg: 4.0,
        minElbowExtensionDeg: 105.0,
        fsm: fsm,
      ),
      leg: LegDetectionConfig(
        emaAlpha: 0.22,
        baselineAlpha: 0.06,
        baselineUpdateGateDeg: 5.0,
        minRangeDeg: 24.0,
        enterNorm: 0.22,
        reachedNorm: 0.36,
        loweringNorm: 0.18,
        exitNorm: 0.12,
        enterDeltaDeg: 4.0,
        reachedDeltaDeg: 7.0,
        loweringDeltaDeg: 4.0,
        exitDeltaDeg: 2.2,
        minKneeExtensionDeg: 55.0,
        fsm: fsm,
      ),
    );
  }
}

class FsmConfig {
  final int raiseConfirmFrames;
  final int reachedHoldFrames;
  final int lowerConfirmFrames;
  final Duration raisingTimeout;
  final Duration lostTrackingGrace;
  final Duration cooldown;

  const FsmConfig({
    required this.raiseConfirmFrames,
    required this.reachedHoldFrames,
    required this.lowerConfirmFrames,
    required this.raisingTimeout,
    required this.lostTrackingGrace,
    required this.cooldown,
  });
}

class ArmDetectionConfig {
  final double emaAlpha;
  final double baselineAlpha;
  final double baselineUpdateGateDeg;
  final double minRangeDeg;
  final double enterNorm;
  final double reachedNorm;
  final double loweringNorm;
  final double exitNorm;
  final double enterDeltaDeg;
  final double reachedDeltaDeg;
  final double loweringDeltaDeg;
  final double exitDeltaDeg;
  final double minElbowExtensionDeg;
  final FsmConfig fsm;

  const ArmDetectionConfig({
    required this.emaAlpha,
    required this.baselineAlpha,
    required this.baselineUpdateGateDeg,
    required this.minRangeDeg,
    required this.enterNorm,
    required this.reachedNorm,
    required this.loweringNorm,
    required this.exitNorm,
    required this.enterDeltaDeg,
    required this.reachedDeltaDeg,
    required this.loweringDeltaDeg,
    required this.exitDeltaDeg,
    required this.minElbowExtensionDeg,
    required this.fsm,
  });
}

class LegDetectionConfig {
  final double emaAlpha;
  final double baselineAlpha;
  final double baselineUpdateGateDeg;
  final double minRangeDeg;
  final double enterNorm;
  final double reachedNorm;
  final double loweringNorm;
  final double exitNorm;
  final double enterDeltaDeg;
  final double reachedDeltaDeg;
  final double loweringDeltaDeg;
  final double exitDeltaDeg;
  final double minKneeExtensionDeg;
  final FsmConfig fsm;

  const LegDetectionConfig({
    required this.emaAlpha,
    required this.baselineAlpha,
    required this.baselineUpdateGateDeg,
    required this.minRangeDeg,
    required this.enterNorm,
    required this.reachedNorm,
    required this.loweringNorm,
    required this.exitNorm,
    required this.enterDeltaDeg,
    required this.reachedDeltaDeg,
    required this.loweringDeltaDeg,
    required this.exitDeltaDeg,
    required this.minKneeExtensionDeg,
    required this.fsm,
  });
}

class _SideTracker {
  double? baselineDeg;
  double rangeDeg;

  _SideTracker(this.rangeDeg);
}

class _EmaLandmarkFilter {
  final double alpha;
  final Map<PoseLandmarkType, Offset> _cache = {};

  _EmaLandmarkFilter(this.alpha);

  Offset? smooth(PoseLandmarkType type, PoseLandmark? landmark) {
    if (landmark == null) return null;
    final raw = Offset(landmark.x, landmark.y);
    final prev = _cache[type];
    if (prev == null) {
      _cache[type] = raw;
      return raw;
    }
    final next = Offset(
      prev.dx * (1 - alpha) + raw.dx * alpha,
      prev.dy * (1 - alpha) + raw.dy * alpha,
    );
    _cache[type] = next;
    return next;
  }

  void reset() => _cache.clear();
}

class _MotionMeasurement {
  final bool quality;
  final double normScore;
  final double deltaDeg;
  final bool reachedGate;

  const _MotionMeasurement({
    required this.quality,
    required this.normScore,
    required this.deltaDeg,
    required this.reachedGate,
  });
}

class ArmRaiseDetector {
  final ArmDetectionConfig config;
  final _EmaLandmarkFilter _ema;
  final Map<MotionSide, _SideTracker> _trackers;

  MotionFsmPhase _phase = MotionFsmPhase.idle;
  MotionSide? _activeSide;
  MotionSide? _candidateSide;
  int _candidateFrames = 0;
  int _reachedFrames = 0;
  int _lowerFrames = 0;
  DateTime? _raisingStartedAt;
  DateTime? _lostTrackingStartedAt;
  DateTime? _cooldownUntil;

  ArmRaiseDetector(this.config)
      : _ema = _EmaLandmarkFilter(config.emaAlpha),
        _trackers = {
          MotionSide.left: _SideTracker(config.minRangeDeg),
          MotionSide.right: _SideTracker(config.minRangeDeg),
        };

  void reset() {
    _phase = MotionFsmPhase.idle;
    _activeSide = null;
    _candidateSide = null;
    _candidateFrames = 0;
    _reachedFrames = 0;
    _lowerFrames = 0;
    _raisingStartedAt = null;
    _lostTrackingStartedAt = null;
    _cooldownUntil = null;
    for (final tracker in _trackers.values) {
      tracker.baselineDeg = null;
      tracker.rangeDeg = config.minRangeDeg;
    }
    _ema.reset();
  }

  MotionDetectionResult update(Pose pose, DateTime now) {
    if (_phase == MotionFsmPhase.cooldown) {
      if (_cooldownUntil != null && now.isBefore(_cooldownUntil!)) {
        return MotionDetectionResult(
          phase: _phase,
          activeSide: _activeSide,
          repCompleted: false,
          normScore: null,
          deltaDeg: null,
        );
      }
      _enterIdle();
    }

    final left = _measureSide(
      pose: pose,
      side: MotionSide.left,
      now: now,
    );
    final right = _measureSide(
      pose: pose,
      side: MotionSide.right,
      now: now,
    );
    final measurements = {
      MotionSide.left: left,
      MotionSide.right: right,
    };

    bool repCompleted = false;

    switch (_phase) {
      case MotionFsmPhase.idle:
        final candidate = _pickBestEnteringSide(measurements);
        if (candidate != null) {
          if (_candidateSide == candidate) {
            _candidateFrames++;
          } else {
            _candidateSide = candidate;
            _candidateFrames = 1;
          }
          if (_candidateFrames >= config.fsm.raiseConfirmFrames) {
            _phase = MotionFsmPhase.raising;
            _activeSide = candidate;
            _raisingStartedAt = now;
            _reachedFrames = 0;
            _lowerFrames = 0;
            _lostTrackingStartedAt = null;
          }
        } else {
          _candidateSide = null;
          _candidateFrames = 0;
        }
        break;

      case MotionFsmPhase.raising:
        final m = measurements[_activeSide]!;
        if (!_handleTrackingLoss(m.quality, now)) {
          break;
        }
        if (_isReached(m)) {
          _reachedFrames++;
          if (_reachedFrames >= config.fsm.reachedHoldFrames) {
            _phase = MotionFsmPhase.reached;
            _lowerFrames = 0;
          }
        } else {
          _reachedFrames = 0;
        }
        if (_raisingStartedAt != null && now.difference(_raisingStartedAt!) > config.fsm.raisingTimeout) {
          _enterIdle();
        }
        break;

      case MotionFsmPhase.reached:
        final m = measurements[_activeSide]!;
        if (!_handleTrackingLoss(m.quality, now)) {
          break;
        }
        if (_isLowering(m)) {
          _lowerFrames++;
          if (_lowerFrames >= config.fsm.lowerConfirmFrames) {
            _phase = MotionFsmPhase.lowering;
          }
        } else {
          _lowerFrames = 0;
        }
        break;

      case MotionFsmPhase.lowering:
        final m = measurements[_activeSide]!;
        if (!_handleTrackingLoss(m.quality, now)) {
          break;
        }
        if (_isExited(m)) {
          repCompleted = true;
          _phase = MotionFsmPhase.cooldown;
          _cooldownUntil = now.add(config.fsm.cooldown);
          _candidateFrames = 0;
          _candidateSide = null;
        } else if (_isReached(m)) {
          // 回弹抖动：回到 reached 继续等待放下
          _phase = MotionFsmPhase.reached;
          _lowerFrames = 0;
        }
        break;

      case MotionFsmPhase.cooldown:
        break;
    }

    final activeMeasurement =
        _activeSide == null ? null : measurements[_activeSide!];

    return MotionDetectionResult(
      phase: _phase,
      activeSide: _activeSide,
      repCompleted: repCompleted,
      normScore: activeMeasurement?.normScore,
      deltaDeg: activeMeasurement?.deltaDeg,
    );
  }

  MotionSide? _pickBestEnteringSide(Map<MotionSide, _MotionMeasurement> measurements) {
    MotionSide? best;
    double bestScore = -1;
    for (final entry in measurements.entries) {
      final m = entry.value;
      if (!_isEntering(m)) continue;
      if (m.normScore > bestScore) {
        bestScore = m.normScore;
        best = entry.key;
      }
    }
    return best;
  }

  bool _isEntering(_MotionMeasurement m) =>
      m.quality &&
      m.normScore >= config.enterNorm &&
      m.deltaDeg >= config.enterDeltaDeg;

  bool _isReached(_MotionMeasurement m) =>
      m.quality &&
      m.reachedGate &&
      m.normScore >= config.reachedNorm &&
      m.deltaDeg >= config.reachedDeltaDeg;

  bool _isLowering(_MotionMeasurement m) =>
      m.quality &&
      (m.normScore <= config.loweringNorm || m.deltaDeg <= config.loweringDeltaDeg);

  bool _isExited(_MotionMeasurement m) =>
      m.quality &&
      (m.normScore <= config.exitNorm || m.deltaDeg <= config.exitDeltaDeg);

  bool _handleTrackingLoss(bool quality, DateTime now) {
    if (quality) {
      _lostTrackingStartedAt = null;
      return true;
    }
    _lostTrackingStartedAt ??= now;
    if (now.difference(_lostTrackingStartedAt!) > config.fsm.lostTrackingGrace) {
      _enterIdle();
      return false;
    }
    return true;
  }

  void _enterIdle() {
    _phase = MotionFsmPhase.idle;
    _activeSide = null;
    _candidateSide = null;
    _candidateFrames = 0;
    _reachedFrames = 0;
    _lowerFrames = 0;
    _raisingStartedAt = null;
    _lostTrackingStartedAt = null;
  }

  _MotionMeasurement _measureSide({
    required Pose pose,
    required MotionSide side,
    required DateTime now,
  }) {
    final shoulderType =
        side == MotionSide.left ? PoseLandmarkType.leftShoulder : PoseLandmarkType.rightShoulder;
    final hipType = side == MotionSide.left ? PoseLandmarkType.leftHip : PoseLandmarkType.rightHip;
    final elbowType = side == MotionSide.left ? PoseLandmarkType.leftElbow : PoseLandmarkType.rightElbow;
    final wristType = side == MotionSide.left ? PoseLandmarkType.leftWrist : PoseLandmarkType.rightWrist;

    final shoulder = _ema.smooth(shoulderType, pose.landmarks[shoulderType]);
    final hip = _ema.smooth(hipType, pose.landmarks[hipType]);
    final elbow = _ema.smooth(elbowType, pose.landmarks[elbowType]);
    final wrist = _ema.smooth(wristType, pose.landmarks[wristType]);

    if (shoulder == null || hip == null) {
      return const _MotionMeasurement(quality: false, normScore: 0, deltaDeg: 0, reachedGate: false);
    }
    final armEnd = elbow ?? wrist;
    if (armEnd == null) {
      return const _MotionMeasurement(quality: false, normScore: 0, deltaDeg: 0, reachedGate: false);
    }

    final shoulderAngle = _angleBetweenVectors(hip - shoulder, armEnd - shoulder);
    if (!shoulderAngle.isFinite) {
      return const _MotionMeasurement(quality: false, normScore: 0, deltaDeg: 0, reachedGate: false);
    }

    final tracker = _trackers[side]!;
    tracker.baselineDeg ??= shoulderAngle;
    var delta = shoulderAngle - tracker.baselineDeg!;
    if (delta < 0) delta = 0;

    if ((_phase == MotionFsmPhase.idle || _phase == MotionFsmPhase.cooldown) &&
        delta < config.baselineUpdateGateDeg) {
      tracker.baselineDeg =
          _emaScalar(tracker.baselineDeg!, shoulderAngle, config.baselineAlpha);
      delta = shoulderAngle - tracker.baselineDeg!;
      if (delta < 0) delta = 0;
    }

    tracker.rangeDeg = math.max(config.minRangeDeg, math.max(tracker.rangeDeg * 0.995, delta));
    final norm = (delta / tracker.rangeDeg).clamp(0.0, 2.0);

    double elbowAngle = 180;
    if (elbow != null && wrist != null) {
      elbowAngle = _angleAt(shoulder, elbow, wrist);
    }

    return _MotionMeasurement(
      quality: true,
      normScore: norm,
      deltaDeg: delta,
      reachedGate: elbowAngle >= config.minElbowExtensionDeg,
    );
  }
}

class LegLiftDetector {
  final LegDetectionConfig config;
  final _EmaLandmarkFilter _ema;
  final Map<MotionSide, _SideTracker> _trackers;

  MotionFsmPhase _phase = MotionFsmPhase.idle;
  MotionSide? _activeSide;
  MotionSide? _candidateSide;
  int _candidateFrames = 0;
  int _reachedFrames = 0;
  int _lowerFrames = 0;
  DateTime? _raisingStartedAt;
  DateTime? _lostTrackingStartedAt;
  DateTime? _cooldownUntil;

  LegLiftDetector(this.config)
      : _ema = _EmaLandmarkFilter(config.emaAlpha),
        _trackers = {
          MotionSide.left: _SideTracker(config.minRangeDeg),
          MotionSide.right: _SideTracker(config.minRangeDeg),
        };

  void reset() {
    _phase = MotionFsmPhase.idle;
    _activeSide = null;
    _candidateSide = null;
    _candidateFrames = 0;
    _reachedFrames = 0;
    _lowerFrames = 0;
    _raisingStartedAt = null;
    _lostTrackingStartedAt = null;
    _cooldownUntil = null;
    for (final tracker in _trackers.values) {
      tracker.baselineDeg = null;
      tracker.rangeDeg = config.minRangeDeg;
    }
    _ema.reset();
  }

  MotionDetectionResult update(Pose pose, DateTime now) {
    if (_phase == MotionFsmPhase.cooldown) {
      if (_cooldownUntil != null && now.isBefore(_cooldownUntil!)) {
        return MotionDetectionResult(
          phase: _phase,
          activeSide: _activeSide,
          repCompleted: false,
          normScore: null,
          deltaDeg: null,
        );
      }
      _enterIdle();
    }

    final left = _measureSide(pose: pose, side: MotionSide.left);
    final right = _measureSide(pose: pose, side: MotionSide.right);
    final measurements = {
      MotionSide.left: left,
      MotionSide.right: right,
    };

    bool repCompleted = false;

    switch (_phase) {
      case MotionFsmPhase.idle:
        final candidate = _pickBestEnteringSide(measurements);
        if (candidate != null) {
          if (_candidateSide == candidate) {
            _candidateFrames++;
          } else {
            _candidateSide = candidate;
            _candidateFrames = 1;
          }
          if (_candidateFrames >= config.fsm.raiseConfirmFrames) {
            _phase = MotionFsmPhase.raising;
            _activeSide = candidate;
            _raisingStartedAt = now;
            _reachedFrames = 0;
            _lowerFrames = 0;
            _lostTrackingStartedAt = null;
          }
        } else {
          _candidateSide = null;
          _candidateFrames = 0;
        }
        break;

      case MotionFsmPhase.raising:
        final m = measurements[_activeSide]!;
        if (!_handleTrackingLoss(m.quality, now)) {
          break;
        }
        if (_isReached(m)) {
          _reachedFrames++;
          if (_reachedFrames >= config.fsm.reachedHoldFrames) {
            _phase = MotionFsmPhase.reached;
            _lowerFrames = 0;
          }
        } else {
          _reachedFrames = 0;
        }
        if (_raisingStartedAt != null && now.difference(_raisingStartedAt!) > config.fsm.raisingTimeout) {
          _enterIdle();
        }
        break;

      case MotionFsmPhase.reached:
        final m = measurements[_activeSide]!;
        if (!_handleTrackingLoss(m.quality, now)) {
          break;
        }
        if (_isLowering(m)) {
          _lowerFrames++;
          if (_lowerFrames >= config.fsm.lowerConfirmFrames) {
            _phase = MotionFsmPhase.lowering;
          }
        } else {
          _lowerFrames = 0;
        }
        break;

      case MotionFsmPhase.lowering:
        final m = measurements[_activeSide]!;
        if (!_handleTrackingLoss(m.quality, now)) {
          break;
        }
        if (_isExited(m)) {
          repCompleted = true;
          _phase = MotionFsmPhase.cooldown;
          _cooldownUntil = now.add(config.fsm.cooldown);
          _candidateFrames = 0;
          _candidateSide = null;
        } else if (_isReached(m)) {
          _phase = MotionFsmPhase.reached;
          _lowerFrames = 0;
        }
        break;

      case MotionFsmPhase.cooldown:
        break;
    }

    final activeMeasurement =
        _activeSide == null ? null : measurements[_activeSide!];

    return MotionDetectionResult(
      phase: _phase,
      activeSide: _activeSide,
      repCompleted: repCompleted,
      normScore: activeMeasurement?.normScore,
      deltaDeg: activeMeasurement?.deltaDeg,
    );
  }

  MotionSide? _pickBestEnteringSide(Map<MotionSide, _MotionMeasurement> measurements) {
    MotionSide? best;
    double bestScore = -1;
    for (final entry in measurements.entries) {
      final m = entry.value;
      if (!_isEntering(m)) continue;
      if (m.normScore > bestScore) {
        bestScore = m.normScore;
        best = entry.key;
      }
    }
    return best;
  }

  bool _isEntering(_MotionMeasurement m) =>
      m.quality &&
      m.normScore >= config.enterNorm &&
      m.deltaDeg >= config.enterDeltaDeg;

  bool _isReached(_MotionMeasurement m) =>
      m.quality &&
      m.reachedGate &&
      m.normScore >= config.reachedNorm &&
      m.deltaDeg >= config.reachedDeltaDeg;

  bool _isLowering(_MotionMeasurement m) =>
      m.quality &&
      (m.normScore <= config.loweringNorm || m.deltaDeg <= config.loweringDeltaDeg);

  bool _isExited(_MotionMeasurement m) =>
      m.quality &&
      (m.normScore <= config.exitNorm || m.deltaDeg <= config.exitDeltaDeg);

  bool _handleTrackingLoss(bool quality, DateTime now) {
    if (quality) {
      _lostTrackingStartedAt = null;
      return true;
    }
    _lostTrackingStartedAt ??= now;
    if (now.difference(_lostTrackingStartedAt!) > config.fsm.lostTrackingGrace) {
      _enterIdle();
      return false;
    }
    return true;
  }

  void _enterIdle() {
    _phase = MotionFsmPhase.idle;
    _activeSide = null;
    _candidateSide = null;
    _candidateFrames = 0;
    _reachedFrames = 0;
    _lowerFrames = 0;
    _raisingStartedAt = null;
    _lostTrackingStartedAt = null;
  }

  _MotionMeasurement _measureSide({
    required Pose pose,
    required MotionSide side,
  }) {
    final shoulderType =
        side == MotionSide.left ? PoseLandmarkType.leftShoulder : PoseLandmarkType.rightShoulder;
    final oppositeShoulderType =
        side == MotionSide.left ? PoseLandmarkType.rightShoulder : PoseLandmarkType.leftShoulder;
    final hipType = side == MotionSide.left ? PoseLandmarkType.leftHip : PoseLandmarkType.rightHip;
    final kneeType = side == MotionSide.left ? PoseLandmarkType.leftKnee : PoseLandmarkType.rightKnee;
    final ankleType = side == MotionSide.left ? PoseLandmarkType.leftAnkle : PoseLandmarkType.rightAnkle;

    final shoulderPrimary = _ema.smooth(shoulderType, pose.landmarks[shoulderType]);
    final shoulderFallback =
        _ema.smooth(oppositeShoulderType, pose.landmarks[oppositeShoulderType]);
    final shoulder = shoulderPrimary ?? shoulderFallback;
    final hip = _ema.smooth(hipType, pose.landmarks[hipType]);
    final knee = _ema.smooth(kneeType, pose.landmarks[kneeType]);
    final ankle = _ema.smooth(ankleType, pose.landmarks[ankleType]);

    if (shoulder == null || hip == null) {
      return const _MotionMeasurement(quality: false, normScore: 0, deltaDeg: 0, reachedGate: false);
    }
    final thighPoint = knee ?? ankle;
    if (thighPoint == null) {
      return const _MotionMeasurement(quality: false, normScore: 0, deltaDeg: 0, reachedGate: false);
    }

    final hipAngle = _angleBetweenVectors(shoulder - hip, thighPoint - hip);
    if (!hipAngle.isFinite) {
      return const _MotionMeasurement(quality: false, normScore: 0, deltaDeg: 0, reachedGate: false);
    }

    final tracker = _trackers[side]!;
    tracker.baselineDeg ??= hipAngle;
    var delta = tracker.baselineDeg! - hipAngle;
    if (delta < 0) delta = 0;

    if ((_phase == MotionFsmPhase.idle || _phase == MotionFsmPhase.cooldown) &&
        delta < config.baselineUpdateGateDeg) {
      tracker.baselineDeg =
          _emaScalar(tracker.baselineDeg!, hipAngle, config.baselineAlpha);
      delta = tracker.baselineDeg! - hipAngle;
      if (delta < 0) delta = 0;
    }

    tracker.rangeDeg = math.max(config.minRangeDeg, math.max(tracker.rangeDeg * 0.995, delta));
    final norm = (delta / tracker.rangeDeg).clamp(0.0, 2.0);

    double kneeAngle = 180;
    if (knee != null && ankle != null) {
      kneeAngle = _angleAt(hip, knee, ankle);
    }

    return _MotionMeasurement(
      quality: true,
      normScore: norm,
      deltaDeg: delta,
      reachedGate: kneeAngle >= config.minKneeExtensionDeg,
    );
  }
}

double _emaScalar(double previous, double current, double alpha) {
  return previous * (1 - alpha) + current * alpha;
}

double _angleAt(Offset a, Offset b, Offset c) {
  return _angleBetweenVectors(a - b, c - b);
}

double _angleBetweenVectors(Offset v1, Offset v2) {
  final norm1 = v1.distance;
  final norm2 = v2.distance;
  if (norm1 < 1e-6 || norm2 < 1e-6) {
    return double.nan;
  }
  final cosValue = ((v1.dx * v2.dx) + (v1.dy * v2.dy)) / (norm1 * norm2);
  final clamped = cosValue.clamp(-1.0, 1.0);
  return math.acos(clamped) * 180 / math.pi;
}

// 姿态绘制器
class PosePainter extends CustomPainter {
  final Pose pose;
  final Size imageSize;
  final bool isActionPerformed;
  final bool isFrontCamera; // 是否使用前置摄像头（需要镜像翻转）
  final TrainingType trainingType; // 训练类型

  PosePainter({
    required this.pose,
    required this.imageSize,
    required this.isActionPerformed,
    required this.isFrontCamera,
    required this.trainingType,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // 计算缩放比例
    final scaleX = size.width / imageSize.width;
    final scaleY = size.height / imageSize.height;
    
    // 如果是前置摄像头，需要水平翻转坐标（镜像效果）
    // 翻转函数：flippedX = imageSize.width - originalX
    double flipX(double x) {
      return isFrontCamera ? imageSize.width - x : x;
    }

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

    // 绘制骨骼连线（白色）
    final linePaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 3.0
      ..style = PaintingStyle.stroke;

    for (final connection in connections) {
      final startPoint = pose.landmarks[connection[0]];
      final endPoint = pose.landmarks[connection[1]];
      
      if (startPoint != null && endPoint != null) {
        // 应用镜像翻转（如果是前置摄像头）
        final startX = flipX(startPoint.x) * scaleX;
        final startY = startPoint.y * scaleY;
        final endX = flipX(endPoint.x) * scaleX;
        final endY = endPoint.y * scaleY;
        
        canvas.drawLine(
          Offset(startX, startY),
          Offset(endX, endY),
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
        // 应用镜像翻转（如果是前置摄像头）
        final x = flipX(landmark.x) * scaleX;
        final y = landmark.y * scaleY;
        
        canvas.drawCircle(
          Offset(x, y),
          5.0, // 圆点半径
          pointPaint,
        );
      }
    }
  }


  @override
  bool shouldRepaint(PosePainter oldDelegate) {
    return oldDelegate.pose != pose || 
           oldDelegate.isActionPerformed != isActionPerformed ||
           oldDelegate.isFrontCamera != isFrontCamera ||
           oldDelegate.trainingType != trainingType;
  }
}
