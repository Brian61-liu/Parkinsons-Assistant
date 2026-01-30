import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:camera/camera.dart';
import 'package:google_mlkit_pose_detection/google_mlkit_pose_detection.dart';
import 'package:permission_handler/permission_handler.dart';
import '../l10n/app_localizations.dart';

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
  
  // 双手举高检测相关
  bool _isArmsRaised = false;
  int _successCount = 0;
  Timer? _detectionTimer;
  
  // 动作状态：0=初始/放下, 1=举高, 2=完成（需要检测到放下才算完成）
  int _actionState = 0;
  
  // 防抖机制：需要连续检测到相同状态才确认
  int _raiseConfirmCount = 0; // 举高确认计数
  int _lowerConfirmCount = 0; // 放下确认计数
  static const int _confirmThreshold = 3; // 需要连续3次检测到相同状态才确认
  
  // 状态锁定：防止快速重复计数
  DateTime? _lastActionTime;
  static const Duration _actionCooldown = Duration(milliseconds: 1500); // 1.5秒冷却时间

  @override
  void initState() {
    super.initState();
    _initializeCamera();
    _initializePoseDetector();
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

    _cameraController!.startImageStream((CameraImage image) {
      if (_isDetecting) return;
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
          _checkArmsRaised();
        } else {
          _currentPose = null;
          _isArmsRaised = false;
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

  String _getActionStatusText(AppLocalizations l10n) {
    if (_actionState == 1) {
      // 已经举高，提示放下
      return l10n.lowerArms;
    } else if (_isArmsRaised) {
      return l10n.armsRaised;
    } else {
      return l10n.raiseArms;
    }
  }

  void _checkArmsRaised() {
    if (_currentPose == null) {
      _isArmsRaised = false;
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
      _isArmsRaised = false;
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

    final wasRaised = _isArmsRaised;
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
    if (confirmedRaised && !_isArmsRaised) {
      _isArmsRaised = true;
    } else if (confirmedLowered && _isArmsRaised) {
      _isArmsRaised = false;
    }
    
    // 状态机：检测完整的举起-放下动作
    // _actionState: 0=初始/放下, 1=举高
    
    // 检查冷却时间，防止快速重复计数
    final now = DateTime.now();
    final canPerformAction = _lastActionTime == null || 
                            now.difference(_lastActionTime!) >= _actionCooldown;
    
    if (_isArmsRaised && !wasRaised && confirmedRaised) {
      // 从放下状态变为举高状态（已确认）
      if (_actionState == 0) {
        setState(() {
          _actionState = 1; // 进入举高状态
        });
      }
    } else if (!_isArmsRaised && wasRaised && confirmedLowered) {
      // 从举高状态变为放下状态（已确认）
      if (_actionState == 1 && canPerformAction) {
        // 完成一个完整的动作：举起 -> 放下
        setState(() {
          _successCount++;
          _actionState = 0; // 重置为初始状态，准备下一次动作
          _lastActionTime = now; // 记录动作时间
        });
        
        // 重置确认计数
        _raiseConfirmCount = 0;
        _lowerConfirmCount = 0;
        
        // 震动反馈
        HapticFeedback.mediumImpact();
      }
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
    _detectionTimer?.cancel();
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
                isArmsRaised: _isArmsRaised,
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
                  l10n.movementTrainingInstruction,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
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
                        color: _isArmsRaised
                            ? Colors.green.withValues(alpha: 0.8)
                            : Colors.orange.withValues(alpha: 0.8),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            _isArmsRaised
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
                      Text(
                        '${l10n.successCount}: $_successCount',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
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
  final bool isArmsRaised;

  PosePainter({
    required this.pose,
    required this.imageSize,
    required this.isArmsRaised,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // 计算缩放比例
    final scaleX = size.width / imageSize.width;
    final scaleY = size.height / imageSize.height;

    // 定义骨骼连接关系
    final connections = [
      // 头部
      [PoseLandmarkType.nose, PoseLandmarkType.leftEyeInner],
      [PoseLandmarkType.nose, PoseLandmarkType.rightEyeInner],
      [PoseLandmarkType.leftEyeInner, PoseLandmarkType.leftEye],
      [PoseLandmarkType.leftEye, PoseLandmarkType.leftEyeOuter],
      [PoseLandmarkType.rightEyeInner, PoseLandmarkType.rightEye],
      [PoseLandmarkType.rightEye, PoseLandmarkType.rightEyeOuter],
      [PoseLandmarkType.leftEyeInner, PoseLandmarkType.leftEar],
      [PoseLandmarkType.rightEyeInner, PoseLandmarkType.rightEar],
      
      // 躯干
      [PoseLandmarkType.leftShoulder, PoseLandmarkType.rightShoulder],
      [PoseLandmarkType.leftShoulder, PoseLandmarkType.leftElbow],
      [PoseLandmarkType.leftElbow, PoseLandmarkType.leftWrist],
      [PoseLandmarkType.rightShoulder, PoseLandmarkType.rightElbow],
      [PoseLandmarkType.rightElbow, PoseLandmarkType.rightWrist],
      [PoseLandmarkType.leftShoulder, PoseLandmarkType.leftHip],
      [PoseLandmarkType.rightShoulder, PoseLandmarkType.rightHip],
      [PoseLandmarkType.leftHip, PoseLandmarkType.rightHip],
      
      // 腿部
      [PoseLandmarkType.leftHip, PoseLandmarkType.leftKnee],
      [PoseLandmarkType.leftKnee, PoseLandmarkType.leftAnkle],
      [PoseLandmarkType.rightHip, PoseLandmarkType.rightKnee],
      [PoseLandmarkType.rightKnee, PoseLandmarkType.rightAnkle],
    ];

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
          Offset(startPoint.x * scaleX, startPoint.y * scaleY),
          Offset(endPoint.x * scaleX, endPoint.y * scaleY),
          linePaint,
        );
      }
    }

    // 绘制关键点（黄色小圆点）
    final pointPaint = Paint()
      ..color = Colors.yellow
      ..style = PaintingStyle.fill;

    for (final landmark in pose.landmarks.values) {
      canvas.drawCircle(
        Offset(landmark.x * scaleX, landmark.y * scaleY),
        5.0, // 圆点半径
        pointPaint,
      );
    }
  }

  @override
  bool shouldRepaint(PosePainter oldDelegate) {
    return oldDelegate.pose != pose || oldDelegate.isArmsRaised != isArmsRaised;
  }
}
