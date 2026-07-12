import 'dart:math' as math;
import 'dart:ui' show Offset;

import 'package:google_mlkit_pose_detection/google_mlkit_pose_detection.dart';

/// 动作检测纯逻辑：FSM、滤波、姿态测量与举手/抬腿检测器。
/// 不依赖 Flutter Widget 层，供肢体动作训练页复用。

enum MotionFsmPhase { idle, raising, reached, lowering, cooldown }

enum MotionSide { left, right }

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

  /// 单一保守难度（2026-06-20 起取消双模式，避免阈值矩阵不稳定与用户困惑）。
  ///
  /// 参数取自原 `rehab` 与 `standard` 的中间值，优先减少误测：
  /// - 3 帧确认所有阶段（与原 standard 一致），抗骨架抖动；
  /// - 动作幅度门槛比 rehab 紧、比 standard 略友好；
  /// - `minElbowExtensionDeg/minKneeExtensionDeg` 取折中，仍要求动作有明显幅度。
  factory MotionDetectionConfig.defaultPreset() {
    const fsm = FsmConfig(
      raiseConfirmFrames: 3,
      reachedHoldFrames: 3,
      lowerConfirmFrames: 3,
      raisingTimeout: Duration(milliseconds: 1600),
      lostTrackingGrace: Duration(milliseconds: 500),
      cooldown: Duration(milliseconds: 700),
    );

    return const MotionDetectionConfig(
      arm: ArmDetectionConfig(
        emaAlpha: 0.25,
        baselineAlpha: 0.07,
        baselineUpdateGateDeg: 7.0,
        minRangeDeg: 30.0,
        enterNorm: 0.20,
        reachedNorm: 0.34,
        loweringNorm: 0.18,
        exitNorm: 0.11,
        enterDeltaDeg: 6.0,
        reachedDeltaDeg: 10.0,
        loweringDeltaDeg: 6.0,
        exitDeltaDeg: 3.5,
        minElbowExtensionDeg: 100.0,
        fsm: fsm,
      ),
      leg: LegDetectionConfig(
        emaAlpha: 0.24,
        baselineAlpha: 0.07,
        baselineUpdateGateDeg: 5.5,
        minRangeDeg: 22.0,
        enterNorm: 0.20,
        reachedNorm: 0.34,
        loweringNorm: 0.18,
        exitNorm: 0.11,
        enterDeltaDeg: 4.0,
        reachedDeltaDeg: 8.0,
        loweringDeltaDeg: 4.0,
        exitDeltaDeg: 2.0,
        minKneeExtensionDeg: 50.0,
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
  static const double minLikelihood = 0.5;
  static const Duration staleGap = Duration(milliseconds: 500);

  final double alpha;
  final Map<PoseLandmarkType, Offset> _cache = {};
  final Map<PoseLandmarkType, DateTime> _lastUpdate = {};

  _EmaLandmarkFilter(this.alpha);

  /// 低置信度关键点按缺失处理（交给 FSM 的丢失宽限），避免鬼点参与计数；
  /// 长时间未更新后直接采用新值，避免陈旧缓存拖拽首帧。
  Offset? smooth(PoseLandmarkType type, PoseLandmark? landmark, DateTime now) {
    if (landmark == null || landmark.likelihood < minLikelihood) {
      return null;
    }
    final raw = Offset(landmark.x, landmark.y);
    final prev = _cache[type];
    final last = _lastUpdate[type];
    _lastUpdate[type] = now;
    if (prev == null || last == null || now.difference(last) > staleGap) {
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

  void reset() {
    _cache.clear();
    _lastUpdate.clear();
  }
}

/// 显示层专用 One-Euro 滤波：静止时强力去抖，快速移动时自动降低平滑量避免拖影。
/// 与计数用 EMA 分离，互不影响已调好的 FSM 阈值。
class PoseDisplayFilter {
  final double minCutoff;
  final double beta;
  final double dCutoff;
  final double minLikelihood;
  final Duration staleGap;

  final Map<PoseLandmarkType, _OneEuroPoint> _points = {};
  final Map<PoseLandmarkType, DateTime> _lastSeen = {};
  DateTime? _lastFrameAt;

  PoseDisplayFilter({
    this.minCutoff = 1.15,
    this.beta = 0.008,
    this.dCutoff = 1.0,
    this.minLikelihood = 0.3,
    this.staleGap = const Duration(milliseconds: 400),
  });

  Map<PoseLandmarkType, Offset> filterPose(Pose pose, DateTime now) {
    final last = _lastFrameAt;
    final dt = last == null
        ? 0.0
        : now.difference(last).inMicroseconds /
            Duration.microsecondsPerSecond;
    _lastFrameAt = now;

    final result = <PoseLandmarkType, Offset>{};
    pose.landmarks.forEach((type, landmark) {
      if (landmark.likelihood < minLikelihood) return;
      final seen = _lastSeen[type];
      var point = _points[type];
      if (point == null || seen == null || now.difference(seen) > staleGap) {
        point = _OneEuroPoint(
          minCutoff: minCutoff,
          beta: beta,
          dCutoff: dCutoff,
        );
        _points[type] = point;
      }
      _lastSeen[type] = now;
      result[type] = point.filter(Offset(landmark.x, landmark.y), dt);
    });
    return result;
  }

  void reset() {
    _points.clear();
    _lastSeen.clear();
    _lastFrameAt = null;
  }
}

class _OneEuroPoint {
  final double minCutoff;
  final double beta;
  final double dCutoff;
  final _OneEuroAxis _x = _OneEuroAxis();
  final _OneEuroAxis _y = _OneEuroAxis();

  _OneEuroPoint({
    required this.minCutoff,
    required this.beta,
    required this.dCutoff,
  });

  Offset filter(Offset raw, double dt) => Offset(
        _x.filter(raw.dx, dt, minCutoff, beta, dCutoff),
        _y.filter(raw.dy, dt, minCutoff, beta, dCutoff),
      );
}

class _OneEuroAxis {
  double? _value;
  double _velocity = 0;

  double filter(
    double raw,
    double dt,
    double minCutoff,
    double beta,
    double dCutoff,
  ) {
    final prev = _value;
    // dt 异常（首帧 / 长时间卡顿）时直接采用原始值，避免滤波器发散。
    if (prev == null || dt <= 0 || dt > 0.5) {
      _value = raw;
      _velocity = 0;
      return raw;
    }
    final rawVelocity = (raw - prev) / dt;
    _velocity = _lerpByCutoff(_velocity, rawVelocity, dCutoff, dt);
    final cutoff = minCutoff + beta * _velocity.abs();
    _value = _lerpByCutoff(prev, raw, cutoff, dt);
    return _value!;
  }

  static double _lerpByCutoff(
    double prev,
    double next,
    double cutoff,
    double dt,
  ) {
    final tau = 1 / (2 * math.pi * cutoff);
    final alpha = 1 / (1 + tau / dt);
    return prev + alpha * (next - prev);
  }
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
        if (_raisingStartedAt != null &&
            now.difference(_raisingStartedAt!) > config.fsm.raisingTimeout) {
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

  MotionSide? _pickBestEnteringSide(
      Map<MotionSide, _MotionMeasurement> measurements) {
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
      (m.normScore <= config.loweringNorm ||
          m.deltaDeg <= config.loweringDeltaDeg);

  bool _isExited(_MotionMeasurement m) =>
      m.quality &&
      (m.normScore <= config.exitNorm || m.deltaDeg <= config.exitDeltaDeg);

  bool _handleTrackingLoss(bool quality, DateTime now) {
    if (quality) {
      _lostTrackingStartedAt = null;
      return true;
    }
    _lostTrackingStartedAt ??= now;
    if (now.difference(_lostTrackingStartedAt!) >
        config.fsm.lostTrackingGrace) {
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
    final shoulderType = side == MotionSide.left
        ? PoseLandmarkType.leftShoulder
        : PoseLandmarkType.rightShoulder;
    final hipType = side == MotionSide.left
        ? PoseLandmarkType.leftHip
        : PoseLandmarkType.rightHip;
    final elbowType = side == MotionSide.left
        ? PoseLandmarkType.leftElbow
        : PoseLandmarkType.rightElbow;
    final wristType = side == MotionSide.left
        ? PoseLandmarkType.leftWrist
        : PoseLandmarkType.rightWrist;

    final shoulder =
        _ema.smooth(shoulderType, pose.landmarks[shoulderType], now);
    final hip = _ema.smooth(hipType, pose.landmarks[hipType], now);
    final elbow = _ema.smooth(elbowType, pose.landmarks[elbowType], now);
    final wrist = _ema.smooth(wristType, pose.landmarks[wristType], now);

    if (shoulder == null || hip == null) {
      return const _MotionMeasurement(
          quality: false, normScore: 0, deltaDeg: 0, reachedGate: false);
    }
    final armEnd = elbow ?? wrist;
    if (armEnd == null) {
      return const _MotionMeasurement(
          quality: false, normScore: 0, deltaDeg: 0, reachedGate: false);
    }

    final shoulderAngle =
        _angleBetweenVectors(hip - shoulder, armEnd - shoulder);
    if (!shoulderAngle.isFinite) {
      return const _MotionMeasurement(
          quality: false, normScore: 0, deltaDeg: 0, reachedGate: false);
    }

    final tracker = _trackers[side]!;
    tracker.baselineDeg ??= shoulderAngle;
    var delta = shoulderAngle - tracker.baselineDeg!;
    if (delta < 0) delta = 0;

    if ((_phase == MotionFsmPhase.idle || _phase == MotionFsmPhase.cooldown) &&
        delta < config.baselineUpdateGateDeg) {
      tracker.baselineDeg = _emaScalar(
          tracker.baselineDeg!, shoulderAngle, config.baselineAlpha);
      delta = shoulderAngle - tracker.baselineDeg!;
      if (delta < 0) delta = 0;
    }

    tracker.rangeDeg = math.max(
        config.minRangeDeg, math.max(tracker.rangeDeg * 0.995, delta));
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

    final left = _measureSide(pose: pose, side: MotionSide.left, now: now);
    final right = _measureSide(pose: pose, side: MotionSide.right, now: now);
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
        if (_raisingStartedAt != null &&
            now.difference(_raisingStartedAt!) > config.fsm.raisingTimeout) {
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

  MotionSide? _pickBestEnteringSide(
      Map<MotionSide, _MotionMeasurement> measurements) {
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
      (m.normScore <= config.loweringNorm ||
          m.deltaDeg <= config.loweringDeltaDeg);

  bool _isExited(_MotionMeasurement m) =>
      m.quality &&
      (m.normScore <= config.exitNorm || m.deltaDeg <= config.exitDeltaDeg);

  bool _handleTrackingLoss(bool quality, DateTime now) {
    if (quality) {
      _lostTrackingStartedAt = null;
      return true;
    }
    _lostTrackingStartedAt ??= now;
    if (now.difference(_lostTrackingStartedAt!) >
        config.fsm.lostTrackingGrace) {
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
    final shoulderType = side == MotionSide.left
        ? PoseLandmarkType.leftShoulder
        : PoseLandmarkType.rightShoulder;
    final oppositeShoulderType = side == MotionSide.left
        ? PoseLandmarkType.rightShoulder
        : PoseLandmarkType.leftShoulder;
    final hipType = side == MotionSide.left
        ? PoseLandmarkType.leftHip
        : PoseLandmarkType.rightHip;
    final kneeType = side == MotionSide.left
        ? PoseLandmarkType.leftKnee
        : PoseLandmarkType.rightKnee;
    final ankleType = side == MotionSide.left
        ? PoseLandmarkType.leftAnkle
        : PoseLandmarkType.rightAnkle;

    final shoulderPrimary =
        _ema.smooth(shoulderType, pose.landmarks[shoulderType], now);
    final shoulderFallback = _ema.smooth(
        oppositeShoulderType, pose.landmarks[oppositeShoulderType], now);
    final shoulder = shoulderPrimary ?? shoulderFallback;
    final hip = _ema.smooth(hipType, pose.landmarks[hipType], now);
    final knee = _ema.smooth(kneeType, pose.landmarks[kneeType], now);
    final ankle = _ema.smooth(ankleType, pose.landmarks[ankleType], now);

    if (shoulder == null || hip == null) {
      return const _MotionMeasurement(
          quality: false, normScore: 0, deltaDeg: 0, reachedGate: false);
    }
    final thighPoint = knee ?? ankle;
    if (thighPoint == null) {
      return const _MotionMeasurement(
          quality: false, normScore: 0, deltaDeg: 0, reachedGate: false);
    }

    final hipAngle = _angleBetweenVectors(shoulder - hip, thighPoint - hip);
    if (!hipAngle.isFinite) {
      return const _MotionMeasurement(
          quality: false, normScore: 0, deltaDeg: 0, reachedGate: false);
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

    tracker.rangeDeg = math.max(
        config.minRangeDeg, math.max(tracker.rangeDeg * 0.995, delta));
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
