import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../services/auth_service.dart';
import '../l10n/app_localizations.dart';
import '../utils/gentle_page_route.dart';
import 'privacy_policy_page.dart';

class LoginPage extends StatefulWidget {
  final Function(Locale) onLanguageChange;
  final VoidCallback? onGuestLogin;

  const LoginPage({
    super.key,
    required this.onLanguageChange,
    this.onGuestLogin,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
  final AuthService _authService = AuthService();
  bool _isLoading = false;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _signInWithGoogle() async {
    setState(() => _isLoading = true);

    try {
      final result = await _authService.signInWithGoogle().timeout(
        const Duration(seconds: 60),
        onTimeout: () {
          throw Exception('timeout');
        },
      );
      if (result != null && mounted) {
        // 登录成功，Firebase 会自动跳转
      } else if (mounted) {
        // 用户取消了登录
        setState(() => _isLoading = false);
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isLoading = false);
        String errorMessage = e.toString().toLowerCase();
        
        // 用户取消登录，不显示错误
        if (errorMessage.contains('cancel') || errorMessage.contains('取消') ||
            errorMessage.contains('sign_in_canceled') || errorMessage.contains('aborted')) {
          return;
        }
        
        // 网络/超时问题
        if (errorMessage.contains('timeout') || errorMessage.contains('network') ||
            errorMessage.contains('connection') || errorMessage.contains('unreachable') ||
            errorMessage.contains('failed host lookup')) {
          _showErrorDialog('无法连接到 Google 服务\n\n请确保：\n• 网络连接正常\n• 可以访问 Google（可能需要 VPN）');
        } else {
          _showErrorDialog('登录失败，请重试');
        }
      }
    }
  }

  void _showErrorDialog(String message) {
    final l10n = AppLocalizations.of(context)!;
    showCupertinoDialog(
      context: context,
      builder: (ctx) => CupertinoAlertDialog(
        title: Text(l10n.loginError),
        content: Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Text(
            message, 
            style: const TextStyle(fontSize: 14, height: 1.5),
            textAlign: TextAlign.left,
          ),
        ),
        actions: [
          CupertinoDialogAction(
            child: Text(l10n.confirm),
            onPressed: () => Navigator.pop(ctx),
          ),
        ],
      ),
    );
  }

  void _onLanguageButtonPressed() {
    final l10n = AppLocalizations.of(context)!;
    
    final languages = [
      {'locale': const Locale('ar'), 'name': 'العربية'},
      {'locale': const Locale('zh'), 'name': '中文简体'},
      {'locale': const Locale('zh', 'TW'), 'name': '中文繁體'},
      {'locale': const Locale('en'), 'name': 'English'},
      {'locale': const Locale('fr'), 'name': 'Français'},
      {'locale': const Locale('de'), 'name': 'Deutsch'},
      {'locale': const Locale('it'), 'name': 'Italiano'},
      {'locale': const Locale('ja'), 'name': '日本語'},
      {'locale': const Locale('ko'), 'name': '한국어'},
      {'locale': const Locale('pt'), 'name': 'Português'},
      {'locale': const Locale('ru'), 'name': 'Русский'},
      {'locale': const Locale('es'), 'name': 'Español'},
    ];

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 16),
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              l10n.selectLanguage,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1E3A5F),
              ),
            ),
            const SizedBox(height: 8),
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: languages.length,
                itemBuilder: (context, index) {
                  final lang = languages[index];
                  return ListTile(
                    title: Text(
                      lang['name'] as String,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 17),
                    ),
                    onTap: () {
                      Navigator.pop(ctx);
                      widget.onLanguageChange(lang['locale'] as Locale);
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: Text(
                l10n.cancel,
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 17,
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: const Color(0xFFF0F9FF),
      body: SafeArea(
        child: Column(
          children: [
            // 顶部语言按钮
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Material(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    elevation: 2,
                    shadowColor: const Color(0xFF0EA5E9).withValues(alpha: 0.3),
                    child: InkWell(
                      onTap: _onLanguageButtonPressed,
                      borderRadius: BorderRadius.circular(12),
                      child: const SizedBox(
                        width: 48,
                        height: 48,
                        child: Icon(
                          CupertinoIcons.globe,
                          color: Color(0xFF0EA5E9),
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            // 主内容
            Expanded(
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    const designWidth = 402.0;
                    const designHeight = 919.0; // y:10 + 402 + 3*(43+126)

                    return Column(
                      children: [
                        Expanded(
                          child: Center(
                            child: FittedBox(
                              fit: BoxFit.contain,
                              child: SizedBox(
                                width: designWidth,
                                height: designHeight,
                                child: Column(
                                  children: [
                                    const SizedBox(height: 10),
                                    SizedBox(
                                      width: 402,
                                      height: 402,
                                      child: ClipOval(
                                        child: Image.asset(
                                          'assets/icon/app_icon.png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 43),
                                    SizedBox(
                                      width: 376,
                                      height: 126,
                                      child: ElevatedButton(
                                        onPressed: _isLoading ? null : _signInWithGoogle,
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.white,
                                          foregroundColor: const Color(0xFF334155),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(60),
                                            side: BorderSide(
                                              color: const Color(0xFF0EA5E9).withValues(alpha: 0.3),
                                              width: 1.5,
                                            ),
                                          ),
                                          elevation: 2,
                                          shadowColor: const Color(0xFF0EA5E9).withValues(alpha: 0.3),
                                        ),
                                        child: _isLoading
                                            ? Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  SizedBox(
                                                    width: 20,
                                                    height: 20,
                                                    child: CircularProgressIndicator(
                                                      strokeWidth: 2.5,
                                                      valueColor: AlwaysStoppedAnimation<Color>(
                                                        Colors.grey[600]!,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 12),
                                                  Text(
                                                    l10n.signingIn,
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.w600,
                                                      color: Colors.grey[600],
                                                    ),
                                                  ),
                                                ],
                                              )
                                            : Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  SvgPicture.asset(
                                                    'assets/images/google_logo.svg',
                                                    width: 22,
                                                    height: 22,
                                                  ),
                                                  const SizedBox(width: 12),
                                                  Text(
                                                    l10n.signInWithGoogle,
                                                    style: const TextStyle(
                                                      fontSize: 24,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                      ),
                                    ),
                                    const SizedBox(height: 43),
                                    SizedBox(
                                      width: 376,
                                      height: 126,
                                      child: OutlinedButton.icon(
                                        onPressed: null,
                                        style: OutlinedButton.styleFrom(
                                          backgroundColor: Colors.white,
                                          disabledForegroundColor: const Color(0xFF334155),
                                          disabledBackgroundColor: Colors.white,
                                          side: BorderSide(
                                            color: const Color(0xFF64748B).withValues(alpha: 0.3),
                                            width: 1.5,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(60),
                                          ),
                                        ),
                                        icon: const Icon(
                                          Icons.apple,
                                          size: 24,
                                          color: Color(0xFF334155),
                                        ),
                                        label: const Text(
                                          'Apple 登录',
                                          style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xFF334155),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 43),
                                    SizedBox(
                                      width: 376,
                                      height: 126,
                                      child: OutlinedButton(
                                        onPressed: widget.onGuestLogin,
                                        style: OutlinedButton.styleFrom(
                                          foregroundColor: const Color(0xFF64748B),
                                          side: BorderSide(
                                            color: const Color(0xFF64748B).withValues(alpha: 0.3),
                                            width: 1.5,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(60),
                                          ),
                                        ),
                                        child: Text(
                                          l10n.continueAsGuest,
                                          style: const TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        TextButton.icon(
                          onPressed: () {
                            pushGentle(context, const PrivacyPolicyPage());
                          },
                          icon: Icon(
                            CupertinoIcons.lock_shield,
                            size: 16,
                            color: const Color(0xFF0EA5E9).withValues(alpha: 0.8),
                          ),
                          label: Text(
                            l10n.privacyPolicy,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color(0xFF0EA5E9),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
