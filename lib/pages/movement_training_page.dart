import 'dart:async';
import 'dart:typed_data';
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
  
  // 动作状态：0=初始/放下, 1=举高
  int _actionState = 0;
  
  // 防抖机制：需要连续检测到相同状态才确认
  int _raiseConfirmCount = 0; // 举高确认计数
  int _lowerConfirmCount = 0; // 放下确认计数
  static const int _confirmThreshold = 3; // 需要连续3次检测到相同状态才确认
  
  // 状态锁定：防止快速重复计数
  DateTime? _lastActionTime;
  static const Duration _actionCooldown = Duration(milliseconds: 1500); // 1.5秒冷却时间
  
  // 计时功能
  Timer? _trainingTimer;
  int _trainingDuration = 0; // 训练时长（秒）
  DateTime? _trainingStartTime;
  
  // 数据库服务
  final DatabaseService _databaseService = DatabaseService();
  
  // 抬腿运动历史记录（用于检测相对变化，适应帕金森患者轻微动作）
  List<double>? _leftAnkleToHipHistory;
  List<double>? _rightAnkleToHipHistory;
  static const int _legLiftHistorySize = 5; // 保留最近5帧的历史
  
  // 抬腿状态跟踪：0=无腿抬起，1=左腿抬起，2=右腿抬起
  int _currentLiftedLeg = 0;

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
        color = const Color(0xFF0EA5E9);
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
        color = const Color(0xFF0EA5E9);
    }
    
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        setState(() {
          _currentTrainingType = type;
        });
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
    if (_currentPose == null) {
      _isActionPerformed = false;
      // 如果检测不到姿态，重置状态
      if (_actionState == 1) {
        _actionState = 0;
      }
      return;
    }

    // 获取关键点
    final leftShoulder = _currentPose!.landmarks[PoseLandmarkType.leftShoulder];
    final rightShoulder = _currentPose!.landmarks[PoseLandmarkType.rightShoulder];
    final leftWrist = _currentPose!.landmarks[PoseLandmarkType.leftWrist];
    final rightWrist = _currentPose!.landmarks[PoseLandmarkType.rightWrist];
    final leftElbow = _currentPose!.landmarks[PoseLandmarkType.leftElbow];
    final rightElbow = _currentPose!.landmarks[PoseLandmarkType.rightElbow];

    // 检查关键点是否存在
    if (leftShoulder == null ||
        rightShoulder == null ||
        leftWrist == null ||
        rightWrist == null ||
        leftElbow == null ||
        rightElbow == null) {
      _isActionPerformed = false;
      // 如果检测不到关键点，重置状态
      if (_actionState == 1) {
        _actionState = 0;
      }
      return;
    }

    // 计算肩膀中心点
    final shoulderCenterY = (leftShoulder.y + rightShoulder.y) / 2;
    
    // 计算手腕到肩膀的距离（用于判断是否真正举高）
    final leftWristToShoulder = (leftWrist.y - shoulderCenterY).abs();
    final rightWristToShoulder = (rightWrist.y - shoulderCenterY).abs();
    
    // 更严格的判断条件：
    // 1. 手腕必须明显高于肩膀中心（至少20像素，避免边界抖动）
    // 2. 肘部也要高于肩膀
    // 3. 手腕必须高于肘部（确保手臂是伸直的）
    // 4. 手腕到肩膀的距离要足够大（确保动作幅度足够）
    final minRaiseDistance = 20.0; // 最小举起距离（像素）
    
    final leftArmRaised = leftWrist.y < (shoulderCenterY - minRaiseDistance) && 
                         leftElbow.y < shoulderCenterY &&
                         leftWrist.y < leftElbow.y &&
                         leftWristToShoulder > minRaiseDistance;
    
    final rightArmRaised = rightWrist.y < (shoulderCenterY - minRaiseDistance) && 
                          rightElbow.y < shoulderCenterY &&
                          rightWrist.y < rightElbow.y &&
                          rightWristToShoulder > minRaiseDistance;
    
    // 放下状态的判断：手腕回到肩膀中心附近或以下
    final leftArmLowered = leftWrist.y >= (shoulderCenterY - 10) || 
                          leftElbow.y >= shoulderCenterY;
    
    final rightArmLowered = rightWrist.y >= (shoulderCenterY - 10) || 
                           rightElbow.y >= shoulderCenterY;

    final wasRaised = _isActionPerformed;
    // 只有双手都满足条件才算举高/放下
    final currentRaised = leftArmRaised && rightArmRaised;
    final currentLowered = leftArmLowered && rightArmLowered;
    
    // 防抖机制：需要连续多次检测到相同状态才确认
    if (currentRaised) {
      _raiseConfirmCount++;
      _lowerConfirmCount = 0; // 重置放下计数
    } else if (currentLowered) {
      _lowerConfirmCount++;
      _raiseConfirmCount = 0; // 重置举高计数
    } else {
      // 中间状态（部分举起或部分放下），不增加计数，但也不重置
      // 这样可以避免在过渡状态时误判
    }
    
    // 只有连续检测到阈值次数的状态才更新
    bool confirmedRaised = false;
    bool confirmedLowered = false;
    
    if (_raiseConfirmCount >= _confirmThreshold) {
      confirmedRaised = true;
      _raiseConfirmCount = _confirmThreshold; // 防止溢出
    }
    
    if (_lowerConfirmCount >= _confirmThreshold) {
      confirmedLowered = true;
      _lowerConfirmCount = _confirmThreshold; // 防止溢出
    }
    
    // 更新状态（只有确认后才更新）
    if (confirmedRaised && !_isActionPerformed) {
      _isActionPerformed = true;
    } else if (confirmedLowered && _isActionPerformed) {
      _isActionPerformed = false;
    }
    
    // 状态机：检测完整的举起-放下动作
    // _actionState: 0=初始/放下, 1=举高
    
    // 检查冷却时间，防止快速重复计数
    final now = DateTime.now();
    final canPerformAction = _lastActionTime == null || 
                            now.difference(_lastActionTime!) >= _actionCooldown;
    
    if (_isActionPerformed && !wasRaised && confirmedRaised) {
      // 从放下状态变为举高状态（已确认）
      if (_actionState == 0) {
        setState(() {
          _actionState = 1; // 进入举高状态
        });
      }
    } else if (!_isActionPerformed && wasRaised && confirmedLowered) {
      // 从举高状态变为放下状态（已确认）
      if (_actionState == 1 && canPerformAction && !_isGoalReached) {
        // 完成一个完整的动作：举起 -> 放下
        setState(() {
          _successCount++;
          _actionState = 0; // 重置为初始状态，准备下一次动作
          _lastActionTime = now; // 记录动作时间
          
          // 检查是否达到目标
          if (_successCount >= _targetCount) {
            _isGoalReached = true;
            // 停止检测
            _cameraController?.stopImageStream();
          }
        });
        
        // 重置确认计数
        _raiseConfirmCount = 0;
        _lowerConfirmCount = 0;
        
        // 检查是否达到目标
        if (_successCount >= _targetCount) {
          // 停止计时器
          _trainingTimer?.cancel();
          
          // 保存训练记录
          _saveTrainingRecord();
          
          // 达到目标，显示成功对话框
          Future.delayed(const Duration(milliseconds: 300), () {
            if (mounted) {
              _showSuccessDialog(context);
            }
          });
          // 强烈的成功反馈
          HapticFeedback.heavyImpact();
        } else {
          // 普通震动反馈
          HapticFeedback.mediumImpact();
        }
      }
    }
  }

  // 初始化历史记录

  // 初始化抬腿运动历史记录
  void _initLegLiftHistory() {
    _leftAnkleToHipHistory = [];
    _rightAnkleToHipHistory = [];
    _currentLiftedLeg = 0; // 重置抬腿状态
  }
  
  // 更新抬腿运动历史记录
  void _updateLegLiftHistory(double? leftValue, double? rightValue) {
    if (leftValue != null) {
      _leftAnkleToHipHistory ??= [];
      _leftAnkleToHipHistory!.add(leftValue);
      if (_leftAnkleToHipHistory!.length > _legLiftHistorySize) {
        _leftAnkleToHipHistory!.removeAt(0);
      }
    }
    if (rightValue != null) {
      _rightAnkleToHipHistory ??= [];
      _rightAnkleToHipHistory!.add(rightValue);
      if (_rightAnkleToHipHistory!.length > _legLiftHistorySize) {
        _rightAnkleToHipHistory!.removeAt(0);
      }
    }
  }
  
  // 计算平均值（用于基准线）
  double _getLegLiftAverage(List<double> history) {
    if (history.isEmpty) return 0.0;
    return history.reduce((a, b) => a + b) / history.length;
  }

  // 原地抬腿运动检测（优化版：适应帕金森患者轻微动作，但防止误检测）
  // 使用相对变化检测，需要足够的稳定期和历史数据才能开始检测
  void _checkLegLift() {
    if (_currentPose == null) {
      _isActionPerformed = false;
      if (_actionState == 1) {
        _actionState = 0;
      }
      return;
    }

    // 获取关键点：髋部、膝盖、脚踝
    final leftHip = _currentPose!.landmarks[PoseLandmarkType.leftHip];
    final rightHip = _currentPose!.landmarks[PoseLandmarkType.rightHip];
    final leftKnee = _currentPose!.landmarks[PoseLandmarkType.leftKnee];
    final rightKnee = _currentPose!.landmarks[PoseLandmarkType.rightKnee];
    final leftAnkle = _currentPose!.landmarks[PoseLandmarkType.leftAnkle];
    final rightAnkle = _currentPose!.landmarks[PoseLandmarkType.rightAnkle];

    // 检查关键点是否存在（至少需要一条腿的关键点）
    if ((leftHip == null || leftKnee == null || leftAnkle == null) &&
        (rightHip == null || rightKnee == null || rightAnkle == null)) {
      _isActionPerformed = false;
      if (_actionState == 1) {
        _actionState = 0;
      }
      return;
    }

    // 计算髋部中心点（如果只有一条腿，使用该腿的髋部）
    final hipCenterY = (leftHip != null && rightHip != null)
        ? (leftHip.y + rightHip.y) / 2
        : (leftHip?.y ?? rightHip!.y);
    
    // 计算脚踝到髋部的垂直距离（归一化，相对于图像高度，0-1之间）
    // 正值表示脚踝在髋部上方，负值表示在下方
    double? leftAnkleToHipY;
    double? rightAnkleToHipY;
    
    if (leftAnkle != null && leftHip != null) {
      leftAnkleToHipY = (hipCenterY - leftAnkle.y); // 归一化值（0-1之间）
    }
    
    if (rightAnkle != null && rightHip != null) {
      rightAnkleToHipY = (hipCenterY - rightAnkle.y); // 归一化值（0-1之间）
    }
    
    // 更新历史记录
    _updateLegLiftHistory(leftAnkleToHipY, rightAnkleToHipY);
    
    // 需要至少3帧历史数据才能开始检测，避免初始阶段的误检测（降低要求以更快开始检测）
    final minHistoryFrames = 3;
    final hasEnoughHistory = (_leftAnkleToHipHistory != null && 
                              _leftAnkleToHipHistory!.length >= minHistoryFrames) ||
                             (_rightAnkleToHipHistory != null && 
                              _rightAnkleToHipHistory!.length >= minHistoryFrames);
    
    // 如果历史数据不足，不进行检测，避免误判
    if (!hasEnoughHistory) {
      return;
    }
    
    bool leftLegRaised = false;
    bool rightLegRaised = false;
    bool leftLegLowered = false;
    bool rightLegLowered = false;
    
    // 检测左腿（使用相对变化检测，降低阈值以适应帕金森患者）
    if (leftAnkleToHipY != null && 
        _leftAnkleToHipHistory != null && 
        _leftAnkleToHipHistory!.length >= minHistoryFrames) {
      final avgHeight = _getLegLiftAverage(_leftAnkleToHipHistory!);
      final change = leftAnkleToHipY - avgHeight;
      
      // 抬腿：降低阈值以适应轻微动作，但仍需防止误检测
      // 满足任一条件即可：1) 相对变化超过5%图像高度 或 2) 绝对高度超过7%图像高度
      leftLegRaised = change > 0.05 || // 向上移动5%图像高度（适应轻微动作）
                      leftAnkleToHipY > 0.07; // 或绝对高度超过7%图像高度
      
      // 放下：回到基准位置附近（更宽松的条件）
      leftLegLowered = change < -0.03 || // 向下移动3%图像高度
                      (leftAnkleToHipY < avgHeight + 0.03); // 或回到平均值附近（3%容差）
    }
    
    // 检测右腿（使用相对变化检测，降低阈值以适应帕金森患者）
    if (rightAnkleToHipY != null && 
        _rightAnkleToHipHistory != null && 
        _rightAnkleToHipHistory!.length >= minHistoryFrames) {
      final avgHeight = _getLegLiftAverage(_rightAnkleToHipHistory!);
      final change = rightAnkleToHipY - avgHeight;
      
      // 抬腿：降低阈值以适应轻微动作
      rightLegRaised = change > 0.05 || // 向上移动5%图像高度（适应轻微动作）
                       rightAnkleToHipY > 0.07; // 或绝对高度超过7%图像高度
      
      // 放下：回到基准位置附近（更宽松的条件）
      rightLegLowered = change < -0.03 || // 向下移动3%图像高度
                       (rightAnkleToHipY < avgHeight + 0.03); // 或回到平均值附近（3%容差）
    }

    // 两条腿轮流抬起：一次只能抬一条腿，完成一次动作需要：抬起 -> 放下
    // _currentLiftedLeg: 0=无腿抬起，1=左腿抬起，2=右腿抬起
    
    bool shouldDetectRaise = false;
    bool shouldDetectLower = false;
    int detectedLeg = 0; // 0=无，1=左腿，2=右腿
    
    if (_currentLiftedLeg == 0) {
      // 当前没有腿抬起，检测任意一条腿抬起
      if (leftLegRaised) {
        shouldDetectRaise = true;
        detectedLeg = 1; // 左腿
      } else if (rightLegRaised) {
        shouldDetectRaise = true;
        detectedLeg = 2; // 右腿
      }
    } else if (_currentLiftedLeg == 1) {
      // 当前左腿抬起，只检测左腿放下
      if (leftLegLowered) {
        shouldDetectLower = true;
        detectedLeg = 1; // 左腿
      }
    } else if (_currentLiftedLeg == 2) {
      // 当前右腿抬起，只检测右腿放下
      if (rightLegLowered) {
        shouldDetectLower = true;
        detectedLeg = 2; // 右腿
      }
    }

    // 防抖机制（平衡灵敏度和准确性）
    final legLiftConfirmThreshold = 2; // 需要连续2次确认（平衡灵敏度和防误检测）
    
    if (shouldDetectRaise) {
      _raiseConfirmCount++;
      _lowerConfirmCount = 0;
    } else if (shouldDetectLower) {
      _lowerConfirmCount++;
      _raiseConfirmCount = 0;
    } else {
      // 如果既不是抬腿也不是放下，重置计数（防止累积误判）
      _raiseConfirmCount = 0;
      _lowerConfirmCount = 0;
    }

    bool confirmedRaised = false;
    bool confirmedLowered = false;

    if (_raiseConfirmCount >= legLiftConfirmThreshold) {
      confirmedRaised = true;
      _raiseConfirmCount = legLiftConfirmThreshold;
    }

    if (_lowerConfirmCount >= legLiftConfirmThreshold) {
      confirmedLowered = true;
      _lowerConfirmCount = legLiftConfirmThreshold;
    }

    // 状态机处理：完成一次动作（抬起 -> 放下）后计数
    final now = DateTime.now();
    final legLiftCooldown = const Duration(milliseconds: 1500); // 抬腿运动冷却时间1.5秒
    final canPerformAction = _lastActionTime == null || 
                            now.difference(_lastActionTime!) >= legLiftCooldown;
    
    // 更新抬腿状态
    if (confirmedRaised && _currentLiftedLeg == 0) {
      // 确认抬起，记录是哪条腿
      setState(() {
        _currentLiftedLeg = detectedLeg;
        _actionState = 1; // 进入抬起状态
      });
    } else if (confirmedLowered && _currentLiftedLeg != 0) {
      // 确认放下，完成一次动作
      // 先检查是否可以计数（有冷却时间限制）
      if (canPerformAction && !_isGoalReached) {
        setState(() {
          _successCount++;
          _currentLiftedLeg = 0; // 重置状态，准备下一次抬腿
          _actionState = 0; // 回到初始状态
          _lastActionTime = now;
          
          if (_successCount >= _targetCount) {
            _isGoalReached = true;
            _cameraController?.stopImageStream();
          }
        });
        
        _raiseConfirmCount = 0;
        _lowerConfirmCount = 0;
        
        if (_successCount >= _targetCount) {
          _trainingTimer?.cancel();
          _saveTrainingRecord();
          Future.delayed(const Duration(milliseconds: 300), () {
            if (mounted) {
              _showSuccessDialog(context);
            }
          });
          HapticFeedback.heavyImpact();
        } else {
          HapticFeedback.mediumImpact();
        }
      } else {
        // 冷却时间未到，只重置状态，不计数
        setState(() {
          _currentLiftedLeg = 0;
          _actionState = 0;
        });
      }
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
      _raiseConfirmCount = 0;
      _lowerConfirmCount = 0;
      _lastActionTime = null;
      _trainingDuration = 0;
      _trainingStartTime = DateTime.now();
    });
    
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
