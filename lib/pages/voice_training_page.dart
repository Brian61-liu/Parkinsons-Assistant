import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:noise_meter/noise_meter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import '../l10n/app_localizations.dart';
import '../services/user_settings_service.dart';
import '../services/voice_assist_service.dart';
import '../services/training_score_service.dart';

/// 语音训练的四个阶段：
/// 准备 → 校准环境噪音（自动） → 练习中 → 完成总结
enum _Stage { preparation, calibrating, practicing, completed }

class VoiceTrainingPage extends StatefulWidget {
  const VoiceTrainingPage({super.key});

  @override
  State<VoiceTrainingPage> createState() => _VoiceTrainingPageState();
}

class _VoiceTrainingPageState extends State<VoiceTrainingPage>
    with WidgetsBindingObserver {
  NoiseReading? _latestReading;
  StreamSubscription<NoiseReading>? _noiseSubscription;
  bool _isListening = false;
  bool _hasPermission = false;

  _Stage _stage = _Stage.preparation;

  // 新的阈值设置（基于手机距离嘴巴 30-50cm）
  static const double _veryLowThreshold = 60.0; // < 60 dB：过低/橙色
  static const double _lowThreshold = 65.0; // 60-65 dB：过低/橙色
  static const double _normalThreshold = 75.0; // 65-75 dB：普通/黄色
  static const double _targetMin = 75.0; // 75-90 dB：目标/绿色（放宽上限以允许稍微超过85dB）
  static const double _targetMax = 90.0;

  // 目标参照圈的半径（固定大小，代表目标值）
  static const double _targetRingRadius = 120.0;

  // 推荐练习时长（仅用于展示进度，不会强制停止）
  static const int _recommendedDurationSeconds = 15;

  // 性能优化：节流更新，避免过于频繁的 UI 刷新
  Timer? _updateTimer;
  Timer? _secondTicker; // 每秒刷新一次已练习时长 / 倒计时展示
  double _displayedDb = 0.0; // 显示的平滑分贝值
  double _targetRadius = 80.0; // 目标半径
  double _minDb = double.infinity; // 记录检测到的最小分贝值（用于计算比例）
  double _maxDb = 0.0; // 记录检测到的最大分贝值
  bool _wasInTargetZone = false; // 上次是否在目标区（用于震动反馈）
  // 语音训练模块主色（与主页对应）：绿色
  static const Color _moduleColor = Color(0xFF10B981);
  static const Color _moduleColorSoft = Color(0xFF34D399);

  Color _lastColor = _moduleColorSoft; // 上次的颜色，用于检测颜色变化
  static const Duration _updateInterval = Duration(
    milliseconds: 200,
  ); // 更新间隔：200ms（提高响应速度）

  VoiceAssistService _voiceAssist() {
    final enabled = context.read<UserSettingsService>().voiceHints;
    return VoiceAssistService(enabled: enabled);
  }

  // 基线校准相关
  double _baselineDb = 0.0; // 环境噪音基线（校准值）
  bool _isCalibrating = false; // 是否正在校准
  final List<double> _calibrationSamples = []; // 校准样本
  static const int _calibrationSampleCount = 10; // 校准样本数量（约2秒，200ms * 10）
  static const double _minEffectiveVolumeDiff =
      8.0; // 最小有效音量差值（超过基线8dB才认为是有效声音）

  final List<double> _sessionRawSamples = [];
  DateTime? _sessionStartedAt;

  // 本次练习在目标区内累计的秒数（用于完成总结）
  double _targetZoneAccumSeconds = 0.0;
  bool _showDbDetail = false;

  // 上一次已完成练习的总结数据
  int? _lastSessionDurationSeconds;
  int? _lastSessionTargetSeconds;

  /// 进后台时暂停麦流；回前台后回到准备态，避免 audio_streamer 假死。
  bool _pausedByLifecycle = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _checkMicrophonePermission();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.inactive ||
        state == AppLifecycleState.paused ||
        state == AppLifecycleState.hidden) {
      _pauseMicForBackground();
    } else if (state == AppLifecycleState.resumed) {
      _resumeAfterBackground();
    }
  }

  void _pauseMicForBackground() {
    if (_noiseSubscription == null &&
        _updateTimer == null &&
        !_isListening &&
        !_isCalibrating) {
      return;
    }
    _pausedByLifecycle = true;
    _updateTimer?.cancel();
    _updateTimer = null;
    _secondTicker?.cancel();
    _secondTicker = null;
    _noiseSubscription?.cancel();
    _noiseSubscription = null;
    _latestReading = null;
  }

  void _resumeAfterBackground() {
    if (!_pausedByLifecycle) return;
    _pausedByLifecycle = false;
    if (!mounted) return;
    // 不自动重开麦流（插件线程问题 + iOS 音频会话）；请用户再点开始。
    if (_stage == _Stage.calibrating || _stage == _Stage.practicing) {
      setState(() {
        _isListening = false;
        _isCalibrating = false;
        _stage = _Stage.preparation;
        _baselineDb = 0.0;
        _calibrationSamples.clear();
        _sessionRawSamples.clear();
        _sessionStartedAt = null;
        _targetZoneAccumSeconds = 0.0;
        _displayedDb = 0.0;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('已从后台返回，请重新点击开始练习'),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    // 若用户在练习中直接返回，仍尝试保存本次记录（内部已做 mounted 保护）。
    _stopListening();
    super.dispose();
  }

  /// 检查麦克风权限
  Future<void> _checkMicrophonePermission() async {
    final status = await Permission.microphone.status;
    if (mounted) {
      setState(() => _hasPermission = status.isGranted);
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

  /// 用户点击「开始练习」：先切到校准阶段，再启动麦克风监听。
  Future<void> _beginPractice() async {
    if (!_hasPermission) {
      await _requestMicrophonePermission();
      if (!_hasPermission) return;
    }
    setState(() => _stage = _Stage.calibrating);
    _voiceAssist().speak('开始语音训练');
    await _startListening();
  }

  /// 开始监听（包含基线校准）
  Future<void> _startListening() async {
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
            _secondTicker?.cancel();
            setState(() {
              _isListening = false;
              _isCalibrating = false;
              _stage = _Stage.preparation;
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
              for (
                int i = start;
                i < end && i < _calibrationSamples.length;
                i++
              ) {
                sum += _calibrationSamples[i];
              }
              _baselineDb = sum / (end - start);

              // 校准完成，开始正常监听
              _sessionRawSamples.clear();
              _sessionStartedAt = DateTime.now();
              setState(() {
                _isCalibrating = false;
                _isListening = true;
                _displayedDb = 0.0;
                _targetRadius = 80.0;
                _minDb = double.infinity;
                _maxDb = 0.0;
                _wasInTargetZone = false;
                _targetZoneAccumSeconds = 0.0;
                _showDbDetail = false;
                _stage = _Stage.practicing;
              });

              _secondTicker?.cancel();
              _secondTicker = Timer.periodic(const Duration(seconds: 1), (_) {
                if (mounted) setState(() {});
              });
            } else {
              // 刷新校准倒计时显示
              setState(() {});
            }
            return; // 校准阶段不更新UI其余部分
          }

          // 正常监听阶段：计算有效音量（减去基线）
          if (_isListening) {
            _sessionRawSamples.add(rawDb);
            // 计算有效音量差值 = 原始音量 - 基线
            final effectiveDbDiff = rawDb - _baselineDb;

            // 显示总音量（原始音量），但只有超过最小有效音量差值才认为是有效声音
            // 如果有效音量差值太小，认为是环境噪音，显示为基线值（表示没有有效声音输入）
            final adjustedDb = effectiveDbDiff >= _minEffectiveVolumeDiff
                ? rawDb // 有有效声音时，显示原始总音量
                : _baselineDb; // 低于阈值时，显示为基线值（表示没有有效声音输入）

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
            final isInTargetZone =
                effectiveDbDiff >= _minEffectiveVolumeDiff &&
                rawDb >= _targetMin &&
                rawDb <= _targetMax;
            if (isInTargetZone) {
              _targetZoneAccumSeconds +=
                  _updateInterval.inMilliseconds / 1000.0;
            }
            if (isInTargetZone && !_wasInTargetZone) {
              // 刚进入目标区，触发震动反馈
              HapticFeedback.mediumImpact();
              _voiceAssist().speak('当前音量达标，请继续保持');
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
      _voiceAssist().speak('正在校准环境噪音，请稍候');
    } catch (e) {
      if (mounted) {
        final l10n = AppLocalizations.of(context)!;
        setState(() => _stage = _Stage.preparation);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${l10n.microphoneError}: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  /// 停止监听：保存记录（若有效），并切换到对应阶段。
  Future<void> _stopListening() async {
    final wasPracticing = _stage == _Stage.practicing;
    final baseline = _baselineDb;
    final samples = List<double>.from(_sessionRawSamples);
    final startedAt = _sessionStartedAt;
    final targetZoneSeconds = _targetZoneAccumSeconds;

    _updateTimer?.cancel();
    _updateTimer = null;
    _secondTicker?.cancel();
    _secondTicker = null;
    _noiseSubscription?.cancel();
    _noiseSubscription = null;

    final hadValidSession =
        baseline > 0 && samples.length >= 12 && startedAt != null;
    final sessionDuration = startedAt != null
        ? DateTime.now().difference(startedAt).inSeconds
        : 0;

    if (mounted) {
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
        _sessionRawSamples.clear();
        _sessionStartedAt = null;
        _targetZoneAccumSeconds = 0.0;
        _showDbDetail = false;

        if (hadValidSession) {
          _lastSessionDurationSeconds = sessionDuration > 0
              ? sessionDuration
              : 1;
          _lastSessionTargetSeconds = targetZoneSeconds.round();
          _stage = _Stage.completed;
        } else {
          _stage = _Stage.preparation;
        }
      });

      _voiceAssist().speak('语音训练已停止');

      if (!hadValidSession && wasPracticing) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)!.voiceSessionTooShort),
          ),
        );
      }
    }

    if (hadValidSession) {
      await TrainingScoreService().recordVoiceSession(
        baselineDb: baseline,
        rawDbSamples: samples,
        durationSeconds: sessionDuration > 0 ? sessionDuration : 1,
      );
    }
  }

  // ── 计算辅助 ─────────────────────────────────────────────

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
    if (!_isListening || _latestReading == null || _baselineDb == 0.0) {
      return false;
    }
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
      return '';
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

  /// 校准阶段剩余秒数（用于倒计时展示）
  int _calibrationRemainingSeconds() {
    final remainingSamples = (_calibrationSampleCount -
            _calibrationSamples.length)
        .clamp(0, _calibrationSampleCount);
    final ms = remainingSamples * _updateInterval.inMilliseconds;
    return (ms / 1000).ceil();
  }

  /// 本次练习已进行的秒数
  int _elapsedSeconds() {
    if (_sessionStartedAt == null) return 0;
    return DateTime.now().difference(_sessionStartedAt!).inSeconds;
  }

  String _formatSeconds(AppLocalizations l10n, int seconds) {
    if (seconds < 60) return l10n.durationSec(seconds);
    return l10n.durationMin(seconds ~/ 60);
  }

  // ── BUILD ─────────────────────────────────────────────────

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
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 250),
          child: switch (_stage) {
            _Stage.preparation => _buildPreparationStage(context, l10n),
            _Stage.calibrating => _buildCalibratingStage(context, l10n),
            _Stage.practicing => _buildPracticingStage(context, l10n),
            _Stage.completed => _buildCompletedStage(context, l10n),
          },
        ),
      ),
    );
  }

  // ── 阶段 1：准备 ─────────────────────────────────────────

  Widget _buildPreparationStage(BuildContext context, AppLocalizations l10n) {
    return Column(
      key: const ValueKey(_Stage.preparation),
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 16),
                Container(
                  width: 132,
                  height: 132,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _moduleColor.withValues(alpha: 0.12),
                  ),
                  child: const Icon(
                    CupertinoIcons.mic_fill,
                    size: 60,
                    color: _moduleColor,
                  ),
                ),
                const SizedBox(height: 28),
                Text(
                  l10n.voiceTrainingMainInstruction,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E3A5F),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                _buildHintRow(
                  icon: CupertinoIcons.person_crop_circle,
                  text: l10n.voicePrepHint,
                ),
                const SizedBox(height: 12),
                _buildHintRow(
                  icon: CupertinoIcons.timer,
                  text: l10n.voicePrepDurationHint(
                    _recommendedDurationSeconds,
                  ),
                ),
                const SizedBox(height: 12),
                _buildHintRow(
                  icon: CupertinoIcons.volume_off,
                  text: l10n.voicePrepEnvironmentHint,
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
        _buildPrimaryButton(
          label: l10n.startListening,
          color: _moduleColor,
          onPressed: _beginPractice,
          semanticsHint: '开始准备并校准环境噪音',
        ),
      ],
    );
  }

  Widget _buildHintRow({required IconData icon, required String text}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20, color: _moduleColor),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 15, color: Color(0xFF475569)),
          ),
        ),
      ],
    );
  }

  // ── 阶段 2：校准环境噪音 ──────────────────────────────────

  Widget _buildCalibratingStage(BuildContext context, AppLocalizations l10n) {
    final remaining = _calibrationRemainingSeconds();
    return Column(
      key: const ValueKey(_Stage.calibrating),
      children: [
        Expanded(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 120,
                  height: 120,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      const SizedBox(
                        width: 120,
                        height: 120,
                        child: CircularProgressIndicator(
                          strokeWidth: 4,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            _moduleColorSoft,
                          ),
                        ),
                      ),
                      Text(
                        '$remaining',
                        style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1E3A5F),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 28),
                Text(
                  l10n.voiceCalibratingCountdown(remaining),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF64748B),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: TextButton(
            onPressed: _stopListening,
            child: Text(l10n.cancel),
          ),
        ),
      ],
    );
  }

  // ── 阶段 3：练习中 ────────────────────────────────────────

  Widget _buildPracticingStage(BuildContext context, AppLocalizations l10n) {
    final elapsed = _elapsedSeconds();
    final targetReached = elapsed >= _recommendedDurationSeconds;

    return Column(
      key: const ValueKey(_Stage.practicing),
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 12, 24, 0),
          child: Row(
            children: [
              _buildChip(
                icon: CupertinoIcons.timer,
                label: l10n.voiceElapsedLabel(elapsed),
              ),
              const Spacer(),
              _buildChip(
                icon: targetReached
                    ? CupertinoIcons.checkmark_alt_circle_fill
                    : CupertinoIcons.flag_fill,
                label: l10n.voiceTargetDurationChip(
                  _recommendedDurationSeconds,
                ),
                highlighted: targetReached,
              ),
            ],
          ),
        ),
        Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RepaintBoundary(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: _targetRingRadius * 2,
                        height: _targetRingRadius * 2,
                        child: CustomPaint(painter: _DashedCirclePainter()),
                      ),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 150),
                        curve: Curves.easeOut,
                        width: _getCircleRadius() * 2,
                        height: _getCircleRadius() * 2,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _getCircleColor(),
                        ),
                        child: _isInTargetZone()
                            ? const Center(
                                child: Text(
                                  '👍',
                                  style: TextStyle(fontSize: 44),
                                ),
                              )
                            : null,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _legendDot(color: Colors.grey.shade400, outline: true),
                    Text(
                      l10n.voiceLegendTarget,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    const SizedBox(width: 20),
                    _legendDot(color: _getCircleColor()),
                    Text(
                      l10n.voiceLegendYours,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 28),
                RepaintBoundary(
                  child: _isCalibrating
                      ? const SizedBox.shrink()
                      : Column(
                          children: [
                            Text(
                              _getFeedbackMessage(),
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: _getFeedbackColor(),
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 6),
                            TextButton(
                              onPressed: () => setState(
                                () => _showDbDetail = !_showDbDetail,
                              ),
                              child: Text(
                                _showDbDetail
                                    ? l10n.voiceHideDetail
                                    : l10n.voiceShowDetail,
                                style: const TextStyle(fontSize: 13),
                              ),
                            ),
                            if (_showDbDetail)
                              Text(
                                '${_getCurrentDb().toStringAsFixed(1)} dB',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF94A3B8),
                                ),
                              ),
                          ],
                        ),
                ),
              ],
            ),
          ),
        ),
        _buildPrimaryButton(
          label: l10n.stopListening,
          color: Colors.red,
          onPressed: _stopListening,
          semanticsHint: '停止语音训练',
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 12),
          child: Text(
            l10n.voicePracticeFooterHint,
            style: const TextStyle(fontSize: 12, color: Color(0xFF94A3B8)),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget _buildChip({
    required IconData icon,
    required String label,
    bool highlighted = false,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: highlighted ? _moduleColor.withValues(alpha: 0.12) : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: highlighted ? _moduleColor : Colors.grey.shade300,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 15,
            color: highlighted ? _moduleColor : Colors.grey.shade600,
          ),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: highlighted ? _moduleColor : Colors.grey.shade700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _legendDot({required Color color, bool outline = false}) {
    return Container(
      width: 12,
      height: 12,
      margin: const EdgeInsets.only(right: 6),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: outline ? Colors.transparent : color,
        border: outline ? Border.all(color: color, width: 2) : null,
      ),
    );
  }

  // ── 阶段 4：完成总结 ──────────────────────────────────────

  Widget _buildCompletedStage(BuildContext context, AppLocalizations l10n) {
    final duration = _lastSessionDurationSeconds ?? 0;
    final targetSeconds = (_lastSessionTargetSeconds ?? 0).clamp(0, duration);
    final ratio = duration > 0 ? targetSeconds / duration : 0.0;
    final encourageGood = ratio >= 0.3;

    return Column(
      key: const ValueKey(_Stage.completed),
      children: [
        Expanded(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 96,
                  height: 96,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _moduleColor.withValues(alpha: 0.12),
                  ),
                  child: const Icon(
                    CupertinoIcons.checkmark_alt_circle_fill,
                    color: _moduleColor,
                    size: 52,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  l10n.voiceCompletedTitle,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E3A5F),
                  ),
                ),
                const SizedBox(height: 28),
                _buildSummaryRow(
                  label: l10n.voiceCompletedDurationLabel,
                  value: _formatSeconds(l10n, duration),
                ),
                const SizedBox(height: 14),
                _buildSummaryRow(
                  label: l10n.voiceCompletedTargetLabel,
                  value: _formatSeconds(l10n, targetSeconds),
                ),
                const SizedBox(height: 28),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Text(
                    encourageGood
                        ? l10n.voiceCompletedEncourageGood
                        : l10n.voiceCompletedEncourageTryMore,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      color: encourageGood
                          ? _moduleColor
                          : const Color(0xFFF59E0B),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 12),
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    side: const BorderSide(color: _moduleColor),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () =>
                      setState(() => _stage = _Stage.preparation),
                  child: Text(
                    l10n.voiceRetryButton,
                    style: const TextStyle(
                      color: _moduleColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: _moduleColor,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(
                    l10n.voiceFinishButton,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSummaryRow({required String label, required String value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 15, color: Color(0xFF64748B)),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1E3A5F),
            ),
          ),
        ],
      ),
    );
  }

  // ── 通用按钮 ─────────────────────────────────────────────

  Widget _buildPrimaryButton({
    required String label,
    required Color color,
    required VoidCallback onPressed,
    String? semanticsHint,
  }) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 16),
      child: SizedBox(
        width: double.infinity,
        height: 56,
        child: Semantics(
          button: true,
          label: label,
          hint: semanticsHint,
          child: CupertinoButton(
            color: color,
            borderRadius: BorderRadius.circular(16),
            onPressed: onPressed,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
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
