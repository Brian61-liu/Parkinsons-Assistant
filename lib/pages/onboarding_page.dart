import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/gentle_page_route.dart';
import 'assessment_page.dart';

/// 新手引导页面（4步 PageView）
class OnboardingPage extends StatefulWidget {
  final Function(Locale) onLanguageChange;
  final Function(bool)? onGuestModeChanged;

  const OnboardingPage({
    super.key,
    required this.onLanguageChange,
    this.onGuestModeChanged,
  });

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  static const int _totalPages = 4;

  final List<_OnboardingData> _pages = const [
    _OnboardingData(
      icon: Icons.favorite_rounded,
      iconColor: Color(0xFF14B8A6),
      title: '欢迎使用 Amplio',
      subtitle: '专为帕金森患者设计的\n康复训练辅助工具',
      body: 'Amplio 帮助您通过科学的手部稳定性训练、语音练习和肢体动作训练，系统地跟踪和改善运动功能。',
    ),
    _OnboardingData(
      icon: Icons.touch_app_rounded,
      iconColor: Color(0xFF6366F1),
      title: '简单易用',
      subtitle: '点击即可开始，随时随地训练',
      body: '所有操作均为大字体、大按钮设计。训练时只需按照屏幕提示操作，并可通过语音辅助完成练习。',
    ),
    _OnboardingData(
      icon: Icons.bar_chart_rounded,
      iconColor: Color(0xFFF59E0B),
      title: '个性化评估',
      subtitle: '了解您当前的能力基线',
      body: '首次使用前，我们将通过 3 项简短测试评估您的手部稳定性、语音清晰度和肢体动作能力，为您生成个人基准评分。',
    ),
    _OnboardingData(
      icon: Icons.rocket_launch_rounded,
      iconColor: Color(0xFF10B981),
      title: '准备好了吗？',
      subtitle: '开始初始评估，只需约 2 分钟',
      body: '评估完成后将自动保存结果，您可以随时在训练历史中查看进展。整个过程安全、简单，请放松进行。',
    ),
  ];

  void _nextPage() {
    if (_currentPage < _totalPages - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    }
  }

  Future<void> _startAssessment() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboarding_shown', true);

    if (!mounted) return;
    Navigator.of(context).pushReplacement(
      GentlePageRoute(
        pageBuilder: (context, animation, secondaryAnimation) =>
            AssessmentPage(
          onLanguageChange: widget.onLanguageChange,
          onGuestModeChanged: widget.onGuestModeChanged,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4FBFF),
      body: SafeArea(
        child: Column(
          children: [
            _buildSkipButton(),
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: _totalPages,
                onPageChanged: (index) =>
                    setState(() => _currentPage = index),
                itemBuilder: (context, index) =>
                    _OnboardingSlide(data: _pages[index]),
              ),
            ),
            _buildBottomArea(),
          ],
        ),
      ),
    );
  }

  Widget _buildSkipButton() {
    if (_currentPage == _totalPages - 1) return const SizedBox(height: 48);
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () => _controller.animateToPage(
          _totalPages - 1,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        ),
        child: const Text(
          '跳过',
          style: TextStyle(
            color: Color(0xFF64748B),
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget _buildBottomArea() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 12, 32, 32),
      child: Column(
        children: [
          _PageIndicator(current: _currentPage, total: _totalPages),
          const SizedBox(height: 28),
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed:
                  _currentPage == _totalPages - 1 ? _startAssessment : _nextPage,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF14B8A6),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 0,
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              child: Text(
                _currentPage == _totalPages - 1 ? '开始评估' : '下一步',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _OnboardingSlide extends StatelessWidget {
  final _OnboardingData data;

  const _OnboardingSlide({required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: data.iconColor.withValues(alpha: 0.12),
              shape: BoxShape.circle,
            ),
            child: Icon(data.icon, size: 60, color: data.iconColor),
          ),
          const SizedBox(height: 36),
          Text(
            data.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w700,
              color: Color(0xFF0F2942),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            data.subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500,
              color: Color(0xFF14B8A6),
              height: 1.5,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            data.body,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFF64748B),
              height: 1.7,
            ),
          ),
        ],
      ),
    );
  }
}

class _PageIndicator extends StatelessWidget {
  final int current;
  final int total;

  const _PageIndicator({required this.current, required this.total});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(total, (i) {
        final active = i == current;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: active ? 24 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: active
                ? const Color(0xFF14B8A6)
                : const Color(0xFFCBD5E1),
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }
}

class _OnboardingData {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final String body;

  const _OnboardingData({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.body,
  });
}
