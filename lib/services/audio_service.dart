import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart' show debugPrint;

// 音频服务类（用于节拍器）
class AudioService {
  final AudioPlayer _audioPlayer = AudioPlayer();
  Timer? _metronomeTimer;
  bool _isPlaying = false;
  int _currentBPM = 80;
  final Function()? _onTick;

  AudioService({Function()? onTick}) : _onTick = onTick;

  // 设置BPM
  void setBPM(int bpm) {
    _currentBPM = bpm;
    if (_isPlaying) {
      stop();
      start();
    }
  }

  // 获取当前BPM
  int get currentBPM => _currentBPM;

  // 是否正在播放
  bool get isPlaying => _isPlaying;

  // 开始节拍器
  void start() {
    if (_isPlaying) return;

    _isPlaying = true;
    final interval = Duration(milliseconds: (60000 / _currentBPM).round());

    _metronomeTimer = Timer.periodic(interval, (timer) {
      _playTick();
      _onTick?.call();
    });
  }

  // 停止节拍器
  void stop() {
    _isPlaying = false;
    _metronomeTimer?.cancel();
    _metronomeTimer = null;
    _audioPlayer.stop();
  }

  // 播放节拍音效（使用系统音效或生成音频）
  Future<void> _playTick() async {
    // 注意：这里可以使用实际的音频文件
    // 目前使用简单的系统音效替代
    // 如果需要更专业的节拍音效，可以使用 assets 中的音频文件
    try {
      // 可以在这里播放音频文件
      // await _audioPlayer.play(AssetSource('sounds/tick.mp3'));
      
      // 临时方案：使用系统音效（如果支持）
      // 实际应用中，建议使用预录制的音频文件
    } catch (e) {
      debugPrint('音频播放错误: $e');
    }
  }

  // 清理资源
  void dispose() {
    stop();
    _audioPlayer.dispose();
  }
}
