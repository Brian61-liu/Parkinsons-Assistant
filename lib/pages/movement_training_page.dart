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

  void _checkArmsRaised() {
    if (_currentPose == null) {
      _isArmsRaised = false;
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
      return;
    }

    // 计算肩膀中心点
    final shoulderCenterY = (leftShoulder.y + rightShoulder.y) / 2;

    // 检查双手是否举高（手腕高于肩膀中心，且肘部高于肩膀）
    final leftArmRaised = leftWrist.y < shoulderCenterY && 
                         leftElbow.y < shoulderCenterY &&
                         leftWrist.y < leftElbow.y; // 手腕高于肘部
    
    final rightArmRaised = rightWrist.y < shoulderCenterY && 
                          rightElbow.y < shoulderCenterY &&
                          rightWrist.y < rightElbow.y; // 手腕高于肘部

    final wasRaised = _isArmsRaised;
    _isArmsRaised = leftArmRaised && rightArmRaised;

    // 如果从非举高状态变为举高状态，增加成功计数
    if (_isArmsRaised && !wasRaised) {
      setState(() {
        _successCount++;
      });
      
      // 震动反馈
      HapticFeedback.mediumImpact();
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
                            _isArmsRaised
                                ? l10n.armsRaised
                                : l10n.raiseArms,
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
