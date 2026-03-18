import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:noise_meter/noise_meter.dart';
import 'package:permission_handler/permission_handler.dart';
import '../l10n/app_localizations.dart';

class VoiceTrainingPage extends StatefulWidget {
  const VoiceTrainingPage({super.key});

  @override
  State<VoiceTrainingPage> createState() => _VoiceTrainingPageState();
}

class _VoiceTrainingPageState extends State<VoiceTrainingPage> {
  NoiseReading? _latestReading;
  StreamSubscription<NoiseReading>? _noiseSubscription;
  bool _isListening = false;
  bool _hasPermission = false;
  
  // 新的阈值设置（基于手机距离嘴巴 30-50cm）
  static const double _veryLowThreshold = 60.0; // < 60 dB：过低/橙色
  static const double _lowThreshold = 65.0; // 60-65 dB：过低/橙色
  static const double _normalThreshold = 75.0; // 65-75 dB：普通/黄色
  static const double _targetMin = 75.0; // 75-90 dB：目标/绿色（放宽上限以允许稍微超过85dB）
  static const double _targetMax = 90.0;
  
  // 目标参照圈的半径（固定大小，代表目标值）
  static const double _targetRingRadius = 140.0; // 目标圆环半径
  
  // 性能优化：节流更新，避免过于频繁的 UI 刷新
  Timer? _updateTimer;
  double _displayedDb = 0.0; // 显示的平滑分贝值
  double _targetRadius = 80.0; // 目标半径
  double _minDb = double.infinity; // 记录检测到的最小分贝值（用于计算比例）
  double _maxDb = 0.0; // 记录检测到的最大分贝值
  bool _wasInTargetZone = false; // 上次是否在目标区（用于震动反馈）
  // 语音训练模块主色（与主页对应）：绿色
  static const Color _moduleColor = Color(0xFF10B981);
  static const Color _moduleColorSoft = Color(0xFF34D399);

  Color _lastColor = _moduleColorSoft; // 上次的颜色，用于检测颜色变化
  static const Duration _updateInterval = Duration(milliseconds: 200); // 更新间隔：200ms（提高响应速度）
  
  // 基线校准相关
  double _baselineDb = 0.0; // 环境噪音基线（校准值）
  bool _isCalibrating = false; // 是否正在校准
  final List<double> _calibrationSamples = []; // 校准样本
  static const int _calibrationSampleCount = 10; // 校准样本数量（约3秒，300ms * 10）
  static const double _minEffectiveVolumeDiff = 8.0; // 最小有效音量差值（超过基线8dB才认为是有效声音）

  @override
  void initState() {
    super.initState();
    _checkMicrophonePermission();
  }

  @override
  void dispose() {
    _updateTimer?.cancel();
    _stopListening();
    super.dispose();
  }

  /// 检查麦克风权限
  Future<void> _checkMicrophonePermission() async {
    final status = await Permission.microphone.status;
    if (status.isGranted) {
      setState(() {
        _hasPermission = true;
      });
    } else {
      setState(() {
        _hasPermission = false;
      });
    }
  }

  /// 请求麦克风权限
  Future<void> _requestMicrophonePermission() async {
    final status = await Permission.microphone.request();
    if (status.isGranted) {
      setState(() {
        _hasPermission = true;
      });
    } else if (status.isPermanentlyDenied) {
      // 权限被永久拒绝，引导用户去设置
      if (mounted) {
        final l10n = AppLocalizations.of(context)!;
        showCupertinoDialog(
          context: context,
          builder: (dialogContext) => CupertinoAlertDialog(
            title: Text(l10n.microphonePermissionRequired),
            content: Text(l10n.microphonePermissionDeniedMessage),
            actions: [
              CupertinoDialogAction(
                onPressed: () {
                  Navigator.of(dialogContext).pop();
                  openAppSettings();
                },
                child: Text(l10n.openSettings),
              ),
              CupertinoDialogAction(
                isDestructiveAction: true,
                onPressed: () => Navigator.of(dialogContext).pop(),
                child: Text(l10n.cancel),
              ),
            ],
          ),
        );
      }
    } else {
      // 权限被拒绝
      if (mounted) {
        final l10n = AppLocalizations.of(context)!;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n.microphonePermissionDenied),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  /// 开始监听（包含基线校准）
  Future<void> _startListening() async {
    if (!_hasPermission) {
      await _requestMicrophonePermission();
      if (!_hasPermission) {
        return;
      }
    }

    try {
      // 重置校准数据
      _calibrationSamples.clear();
      _baselineDb = 0.0;
      _isCalibrating = true;
      
      NoiseMeter noiseMeter = NoiseMeter();
      _noiseSubscription = noiseMeter.noise.listen(
        (NoiseReading reading) {
          // 只更新数据，不立即触发 UI 更新
          _latestReading = reading;
        },
        onError: (error) {
          if (mounted) {
            _updateTimer?.cancel();
            setState(() {
              _isListening = false;
              _isCalibrating = false;
            });
            final l10n = AppLocalizations.of(context)!;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('${l10n.microphoneError}: $error'),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
      );
      
      // 启动定时器，以固定频率更新 UI（节流）
      double lastDisplayedDb = 0.0;
      double lastRadius = 80.0;
      _lastColor = _moduleColorSoft;
      _updateTimer = Timer.periodic(_updateInterval, (timer) {
        if (mounted && _latestReading != null) {
          final rawDb = _latestReading!.meanDecibel;
          
          // 校准阶段：收集环境噪音样本
          if (_isCalibrating) {
            _calibrationSamples.add(rawDb);
            
            // 收集足够的样本后，计算基线
            if (_calibrationSamples.length >= _calibrationSampleCount) {
              // 计算平均值作为基线（排除异常值）
              _calibrationSamples.sort();
              // 取中位数和前后25%的值，计算平均值（更稳定）
              final start = (_calibrationSamples.length * 0.25).floor();
              final end = (_calibrationSamples.length * 0.75).ceil();
              double sum = 0.0;
              for (int i = start; i < end && i < _calibrationSamples.length; i++) {
                sum += _calibrationSamples[i];
              }
              _baselineDb = sum / (end - start);
              
              // 校准完成，开始正常监听
              setState(() {
                _isCalibrating = false;
                _isListening = true;
                _displayedDb = 0.0;
                _targetRadius = 80.0;
                _minDb = double.infinity;
                _maxDb = 0.0;
                _wasInTargetZone = false;
              });
            }
            return; // 校准阶段不更新UI
          }
          
          // 正常监听阶段：计算有效音量（减去基线）
          if (_isListening) {
            // 计算有效音量差值 = 原始音量 - 基线
            final effectiveDbDiff = rawDb - _baselineDb;
            
            // 显示总音量（原始音量），但只有超过最小有效音量差值才认为是有效声音
            // 如果有效音量差值太小，认为是环境噪音，显示为基线值（表示没有有效声音输入）
            final adjustedDb = effectiveDbDiff >= _minEffectiveVolumeDiff 
                ? rawDb  // 有有效声音时，显示原始总音量
                : _baselineDb;  // 低于阈值时，显示为基线值（表示没有有效声音输入）
            
            // 更新最小和最大分贝值（用于计算比例，使用调整后的值）
            if (adjustedDb < _minDb) {
              _minDb = adjustedDb;
            }
            if (adjustedDb > _maxDb) {
              _maxDb = adjustedDb;
            }
            
            // 平滑处理：使用线性插值，平衡响应和平滑度
            final newDisplayedDb = _displayedDb * 0.6 + adjustedDb * 0.4;
            final newRadius = _getCircleRadiusFromDb(newDisplayedDb);
            
            // 检查是否进入目标区（用于震动反馈）
            // 只有当有效音量差值足够大，且总音量在目标范围内时，才认为达标
            final isInTargetZone = effectiveDbDiff >= _minEffectiveVolumeDiff && 
                                   rawDb >= _targetMin && 
                                   rawDb <= _targetMax;
            if (isInTargetZone && !_wasInTargetZone) {
              // 刚进入目标区，触发震动反馈
              HapticFeedback.mediumImpact();
            }
            _wasInTargetZone = isInTargetZone;
            
            // 降低更新阈值，让动画更流畅（但保持合理性能）
            // 检查颜色是否变化，如果变化了也要更新
            final currentColor = _getCircleColor();
            final colorChanged = _lastColor != currentColor;
            
            if ((newDisplayedDb - lastDisplayedDb).abs() > 0.3 || 
                (newRadius - lastRadius).abs() > 1.5 ||
                colorChanged) {
              _displayedDb = newDisplayedDb;
              _targetRadius = newRadius;
              _lastColor = currentColor;
              lastDisplayedDb = newDisplayedDb;
              lastRadius = newRadius;
              setState(() {});
            }
          }
        }
      });
      
      setState(() {
        _isListening = false; // 先设为false，校准完成后才设为true
        _displayedDb = 0.0;
        _targetRadius = 80.0;
        _minDb = double.infinity;
        _maxDb = 0.0;
        _wasInTargetZone = false;
      });
    } catch (e) {
      if (mounted) {
        final l10n = AppLocalizations.of(context)!;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${l10n.microphoneError}: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  /// 停止监听
  void _stopListening() {
    _updateTimer?.cancel();
    _updateTimer = null;
    _noiseSubscription?.cancel();
    _noiseSubscription = null;
    setState(() {
      _isListening = false;
      _isCalibrating = false;
      _latestReading = null;
      _displayedDb = 0.0;
      _targetRadius = 80.0;
      _minDb = double.infinity;
      _maxDb = 0.0;
      _wasInTargetZone = false;
      _baselineDb = 0.0;
      _calibrationSamples.clear();
    });
  }

  /// 获取当前分贝值（使用平滑后的值）
  double _getCurrentDb() {
    if (!_isListening || _latestReading == null) return 0.0;
    return _displayedDb;
  }

  /// 获取音量等级
  /// 返回: 0 = 过低(<60), 1 = 较低(60-65), 2 = 普通(65-75), 3 = 目标(75-85), 4 = 过高(>85)
  int _getVolumeLevel() {
    if (!_isListening || _latestReading == null || _baselineDb == 0.0) {
      return 0; // 未开始或未校准
    }
    
    final rawDb = _latestReading!.meanDecibel;
    final effectiveDbDiff = rawDb - _baselineDb;
    
    // 如果有效音量差值太小，认为是环境噪音，返回最低等级
    if (effectiveDbDiff < _minEffectiveVolumeDiff) {
      return 0; // 过低（橙色）
    }
    
    // 优先检查是否达标（在目标区）
    if (_isInTargetZone()) {
      return 3; // 目标（绿色）
    }
    
    // 使用总音量（原始音量）来判断等级
    if (rawDb < _veryLowThreshold) {
      return 0; // 过低（橙色）
    } else if (rawDb < _lowThreshold) {
      return 1; // 较低（橙色）
    } else if (rawDb < _normalThreshold) {
      return 2; // 普通（黄色）
    } else if (rawDb <= _targetMax) {
      return 3; // 目标（绿色）
    } else {
      return 4; // 过高（绿色）
    }
  }

  /// 根据分贝值计算圆的半径（从实际检测的最小值开始）
  double _getCircleRadiusFromDb(double db) {
    // 如果还没有检测到有效范围，使用默认范围
    if (_minDb == double.infinity || _maxDb == 0.0) {
      // 使用 40-100 dB 作为初始范围（考虑麦克风底噪）
      final normalizedDb = db.clamp(40.0, 100.0);
      final radius = 40.0 + ((normalizedDb - 40.0) / 60.0) * 120.0; // 40-160 像素
      return radius;
    }
    
    // 使用实际检测到的范围计算比例
    final range = _maxDb - _minDb;
    if (range < 10.0) {
      // 如果范围太小，使用默认范围
      final normalizedDb = db.clamp(40.0, 100.0);
      final radius = 40.0 + ((normalizedDb - 40.0) / 60.0) * 120.0;
      return radius;
    }
    
    // 基于实际检测范围计算
    final normalizedDb = db.clamp(_minDb, _maxDb);
    final progress = (normalizedDb - _minDb) / range;
    final radius = 40.0 + progress * 120.0; // 40-160 像素
    return radius;
  }

  /// 获取当前圆的半径（使用平滑后的值）
  double _getCircleRadius() {
    if (!_isListening || _latestReading == null) {
      return 80.0; // 默认半径
    }
    return _targetRadius;
  }

  /// 获取圆的颜色
  Color _getCircleColor() {
    if (!_isListening || _latestReading == null) {
      return _moduleColorSoft; // 默认：主色浅色
    }
    
    // 优先检查是否达标，如果达标就显示绿色
    if (_isInTargetZone()) {
      return const Color(0xFF10B981); // 鲜绿色
    }
    
    final level = _getVolumeLevel();
    switch (level) {
      case 0: // < 60 dB：过低
      case 1: // 60-65 dB：较低
        return const Color(0xFFF97316); // 橙色
      case 2: // 65-75 dB：普通
        return const Color(0xFFF59E0B); // 黄色
      case 3: // 75-85 dB：目标
      case 4: // > 85 dB：过高
        return const Color(0xFF10B981); // 鲜绿色
      default:
        return _moduleColorSoft; // 默认：主色浅色
    }
  }
  
  /// 判断是否达标（在目标区）
  bool _isInTargetZone() {
    if (!_isListening || _latestReading == null || _baselineDb == 0.0) return false;
    final rawDb = _latestReading!.meanDecibel;
    final effectiveDbDiff = rawDb - _baselineDb;
    // 只有当有效音量差值足够大，且总音量在目标范围内时，才认为达标
    // 放宽上限到90dB，允许稍微超过85dB也算达标
    return effectiveDbDiff >= _minEffectiveVolumeDiff && 
           rawDb >= _targetMin && 
           rawDb <= _targetMax;
  }
  
  /// 获取提示语
  String _getFeedbackMessage() {
    if (!_isListening || _latestReading == null) {
      return ''; // 返回空字符串，由 build 方法处理
    }
    
    final level = _getVolumeLevel();
    final l10n = AppLocalizations.of(context)!;
    switch (level) {
      case 0: // < 60 dB：过低
      case 1: // 60-65 dB：较低
        return l10n.voiceTrainingTooQuiet;
      case 2: // 65-75 dB：普通
        return l10n.voiceTrainingKeepGoing;
      case 3: // 75-85 dB：目标
      case 4: // > 85 dB：过高
        return l10n.voiceTrainingExcellent;
      default:
        return l10n.voiceTrainingKeepGoing;
    }
  }
  
  /// 获取提示语颜色
  Color _getFeedbackColor() {
    if (!_isListening || _latestReading == null) {
      return const Color(0xFF64748B);
    }
    
    final level = _getVolumeLevel();
    switch (level) {
      case 0: // < 60 dB：过低
      case 1: // 60-65 dB：较低
        return const Color(0xFFF97316); // 橙色
      case 2: // 65-75 dB：普通
        return const Color(0xFFF59E0B); // 黄色
      case 3: // 75-85 dB：目标
      case 4: // > 85 dB：过高
        return const Color(0xFF10B981); // 绿色
      default:
        return const Color(0xFFF59E0B);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Scaffold(
      backgroundColor: const Color(0xFFF0F9FF),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: CupertinoNavigationBarBackButton(
          color: _moduleColor,
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          l10n.voiceTraining,
          style: const TextStyle(
            color: Color(0xFF1E3A5F),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // 主指令标题（醒目的大号标题）
            Padding(
              padding: const EdgeInsets.fromLTRB(24.0, 32.0, 24.0, 16.0),
              child: Text(
                l10n.voiceTrainingMainInstruction,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E3A5F),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            
            // 中央圆形可视化区域
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // 目标参照圈 + 动态圆形的组合
                    RepaintBoundary(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          // 目标参照圈（虚线圆环，固定大小）
                          SizedBox(
                            width: _targetRingRadius * 2,
                            height: _targetRingRadius * 2,
                            child: CustomPaint(
                              painter: _DashedCirclePainter(),
                            ),
                          ),
                          // 动态圆形（使用AnimatedContainer实现平滑动画）
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 150), // 缩短动画时长，减少卡顿
                            curve: Curves.easeOut,
                            width: _getCircleRadius() * 2,
                            height: _getCircleRadius() * 2,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _getCircleColor(),
                            ),
                            child: _isInTargetZone()
                                ? Center(
                                    child: Text(
                                      '👍',
                                      style: const TextStyle(
                                        fontSize: 48,
                                      ),
                                    ),
                                  )
                                : null,
                          ),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: 40),
                    
                    // 分贝值显示（使用 RepaintBoundary 隔离重绘）
                    RepaintBoundary(
                      child: _isCalibrating
                          ? Text(
                              l10n.voiceTrainingCalibrating,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF64748B),
                              ),
                            )
                          : _isListening && _latestReading != null
                              ? Column(
                                  children: [
                                    Text(
                                      '${_getCurrentDb().toStringAsFixed(1)} dB',
                                      style: const TextStyle(
                                        fontSize: 32,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF1E3A5F),
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      _getFeedbackMessage(),
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: _getFeedbackColor(),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    Text(
                                      l10n.voiceTrainingTargetRange('${_targetMin.toStringAsFixed(0)}-${_targetMax.toStringAsFixed(0)}'),
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Color(0xFF64748B),
                                      ),
                                    ),
                                  ],
                                )
                              : Text(
                                  l10n.voiceTrainingReady,
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF64748B),
                                  ),
                                ),
                    ),
                  ],
                ),
              ),
            ),
            
            // 控制按钮
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: CupertinoButton(
                  color: _isListening
                      ? Colors.red
                      : _moduleColor,
                  borderRadius: BorderRadius.circular(16),
                  onPressed: _isListening ? _stopListening : _startListening,
                  child: Text(
                    _isListening ? l10n.stopListening : l10n.startListening,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            
            // 原理说明（移到最底部，字体缩小，颜色变浅）
            Padding(
              padding: const EdgeInsets.fromLTRB(24.0, 8.0, 24.0, 16.0),
              child: Text(
                l10n.voiceTrainingInstruction,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF94A3B8),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// 虚线圆环绘制器
class _DashedCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey.withValues(alpha: 0.4)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 1;
    
    // 绘制虚线圆
    const dashWidth = 8.0;
    const dashSpace = 4.0;
    final totalLength = 2 * 3.14159 * radius;
    final dashCount = (totalLength / (dashWidth + dashSpace)).floor();
    
    for (int i = 0; i < dashCount; i++) {
      final startAngle = (i * (dashWidth + dashSpace) / radius);
      final endAngle = startAngle + (dashWidth / radius);
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        endAngle - startAngle,
        false,
        paint,
      );
    }
  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
