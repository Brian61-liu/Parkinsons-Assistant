import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import '../services/audio_service.dart';
import '../services/database_service.dart';
import '../models/gait_record.dart';
import '../utils/constants.dart';

// 步态节律辅助页面
class GaitAssistPage extends StatefulWidget {
  const GaitAssistPage({super.key});

  @override
  State<GaitAssistPage> createState() => _GaitAssistPageState();
}

class _GaitAssistPageState extends State<GaitAssistPage> {
  late AudioService _audioService;
  final DatabaseService _databaseService = DatabaseService();

  bool _isPlaying = false;
  int _bpm = AppConstants.defaultBPM;
  int _elapsedSeconds = 0;
  Timer? _timer;
  bool _showTick = false;

  @override
  void initState() {
    super.initState();
    _audioService = AudioService(onTick: _onTick);
  }

  // 节拍回调
  void _onTick() {
    setState(() {
      _showTick = true;
    });
    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted) {
        setState(() {
          _showTick = false;
        });
      }
    });
  }

  // 开始训练
  void _startTraining() {
    if (_isPlaying) return;

    setState(() {
      _isPlaying = true;
      _elapsedSeconds = 0;
    });

    _audioService.start();
    _startTimer();
  }

  // 停止训练
  Future<void> _stopTraining() async {
    _timer?.cancel();
    _audioService.stop();

    if (_elapsedSeconds > 0) {
      // 保存训练记录
      final record = GaitRecord(
        timestamp: DateTime.now(),
        bpm: _bpm,
        duration: _elapsedSeconds,
      );
      await _databaseService.insertGaitRecord(record);
    }

    setState(() {
      _isPlaying = false;
      _elapsedSeconds = 0;
    });
  }

  // 开始计时器
  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted || !_isPlaying) {
        timer.cancel();
        return;
      }
      setState(() {
        _elapsedSeconds++;
      });
    });
  }

  // 调整BPM
  void _adjustBPM(int delta) {
    final newBPM = (_bpm + delta).clamp(
      AppConstants.minBPM,
      AppConstants.maxBPM,
    );
    setState(() {
      _bpm = newBPM;
    });
    _audioService.setBPM(_bpm);
  }

  // 格式化时间显示
  String _formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final secs = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _timer?.cancel();
    _audioService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 使用 iOS 风格的导航栏
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CupertinoNavigationBar(
          backgroundColor: Colors.green[50],
          border: null,
          middle: const Text(
            '步态节律辅助',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Colors.black87,
            ),
          ),
          leading: CupertinoNavigationBarBackButton(
            color: Colors.green.shade800,
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(24), // 增大内边距：20 -> 24
        child: Column(
          children: [
            // 说明文字
            Card(
              color: Colors.green[50],
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(20.0), // 增大内边距：16 -> 20
                child: const Text(
                  '跟随节拍器进行步态训练',
                  style: TextStyle(
                    fontSize: 22, // 增大字体：18 -> 22
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 40),

            // BPM显示和调节
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(28.0), // 增大内边距：24 -> 28
                child: Column(
                  children: [
                    const Text(
                      '节拍速度 (BPM)',
                      style: TextStyle(
                        fontSize: 22, // 增大字体：18 -> 22
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 20), // 增大间距：16 -> 20
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // 使用 Material Design 按钮，点击反馈明显
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: _isPlaying
                                ? null
                                : () => _adjustBPM(-AppConstants.bpmStep),
                            borderRadius: BorderRadius.circular(30),
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              child: Icon(
                                Icons.remove_circle_outline,
                                size: 56, // 增大图标：40 -> 56
                                color: _isPlaying
                                    ? Colors.grey
                                    : Colors.green.shade700,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 28), // 增大间距：20 -> 28
                        Text(
                          '$_bpm',
                          style: const TextStyle(
                            fontSize: 64, // 增大字体：48 -> 64
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                            letterSpacing: 2.0,
                          ),
                        ),
                        const SizedBox(width: 28),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: _isPlaying
                                ? null
                                : () => _adjustBPM(AppConstants.bpmStep),
                            borderRadius: BorderRadius.circular(30),
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              child: Icon(
                                Icons.add_circle_outline,
                                size: 56, // 增大图标：40 -> 56
                                color: _isPlaying
                                    ? Colors.grey
                                    : Colors.green.shade700,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 40),

            // 节拍视觉指示器（增大尺寸）
            AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              width: 180, // 增大尺寸：150 -> 180
              height: 180,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _showTick
                    ? Colors.green.withValues(alpha: 0.8)
                    : Colors.green.withValues(alpha: 0.2),
                border: Border.all(
                  color: Colors.green.shade700,
                  width: 5, // 增大边框：4 -> 5
                ),
              ),
              child: Center(
                child: Icon(
                  Icons.music_note,
                  size: 100, // 增大图标：80 -> 100
                  color: _showTick ? Colors.white : Colors.green[700],
                ),
              ),
            ),

            const SizedBox(height: 40),

            // 训练时长显示
            if (_isPlaying)
              Text(
                _formatTime(_elapsedSeconds),
                style: const TextStyle(
                  fontSize: 48, // 增大字体：36 -> 48
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                  letterSpacing: 2.0,
                ),
              )
            else
              const Text(
                '00:00',
                style: TextStyle(
                  fontSize: 48, // 增大字体：36 -> 48
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  letterSpacing: 2.0,
                ),
              ),

            const Spacer(),

            // 开始/停止按钮（使用 Material Design，点击反馈明显）
            SizedBox(
              width: double.infinity,
              height: 70, // 增大按钮高度：60 -> 70
              child: ElevatedButton(
                onPressed: _isPlaying ? _stopTraining : _startTraining,
                style: ElevatedButton.styleFrom(
                  backgroundColor: _isPlaying ? Colors.red : Colors.green,
                  foregroundColor: Colors.white,
                  elevation: 4, // Material Design 阴影效果
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text(
                  _isPlaying ? '停止训练' : '开始训练',
                  style: const TextStyle(
                    fontSize: 28, // 增大字体：24 -> 28
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
