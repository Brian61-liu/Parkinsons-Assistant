import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import '../l10n/app_localizations.dart';
import '../pages/tremor_test_page.dart';
import '../pages/voice_training_page.dart';
import '../pages/movement_training_page.dart';
import '../pages/data_management_page.dart';
import '../pages/privacy_policy_page.dart';
import '../services/auth_service.dart';
import '../services/avatar_service.dart';

// 主页面
class HomePage extends StatefulWidget {
  final Function(Locale) onLanguageChange;
  final Function(bool)? onGuestModeChanged;

  const HomePage({
    super.key,
    required this.onLanguageChange,
    this.onGuestModeChanged,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthService _authService = AuthService();
  final AvatarService _avatarService = AvatarService();
  bool _isUploadingAvatar = false;
  String? _localAvatarPath; // 本地头像路径

  @override
  void initState() {
    super.initState();
    _loadLocalAvatar();
  }

  /// 加载本地头像路径
  Future<void> _loadLocalAvatar() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final path = await _avatarService.getLocalAvatarPath(user.uid);
      if (mounted) {
        setState(() {
          _localAvatarPath = path;
        });
      }
    }
  }

  void _showLanguageDialog(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    final languages = [
      {'code': 'ar', 'country': '', 'name': l10n.arabic},
      {'code': 'zh', 'country': '', 'name': l10n.chinese},
      {'code': 'zh', 'country': 'TW', 'name': l10n.chineseTraditional},
      {'code': 'en', 'country': '', 'name': l10n.english},
      {'code': 'fr', 'country': '', 'name': l10n.french},
      {'code': 'de', 'country': '', 'name': l10n.german},
      {'code': 'it', 'country': '', 'name': l10n.italian},
      {'code': 'ja', 'country': '', 'name': l10n.japanese},
      {'code': 'ko', 'country': '', 'name': l10n.korean},
      {'code': 'pt', 'country': '', 'name': l10n.portuguese},
      {'code': 'ru', 'country': '', 'name': l10n.russian},
      {'code': 'es', 'country': '', 'name': l10n.spanish},
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
                      widget.onLanguageChange(Locale(
                        lang['code'] as String,
                        lang['country'] as String,
                      ));
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
                style: const TextStyle(color: Colors.red, fontSize: 17),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Future<void> _performLogout() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        // 已登录用户，执行登出
        debugPrint('开始执行登出...');
        await _authService.signOut();
        debugPrint('登出成功');
      } else {
        // 游客模式，退出游客模式
        debugPrint('退出游客模式...');
        widget.onGuestModeChanged?.call(false);
        debugPrint('已退出游客模式');
      }
    } catch (e) {
      debugPrint('退出失败: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('退出失败: $e')),
        );
      }
    }
  }

  void _showLogoutDialog(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final user = FirebaseAuth.instance.currentUser;
    final isGuest = user == null;
    
    showCupertinoDialog(
      context: context,
      builder: (dialogContext) => CupertinoAlertDialog(
        title: Text(isGuest ? '退出游客模式' : l10n.logout),
        content: Text(isGuest ? '确定要退出游客模式吗？退出后需要重新登录才能使用。' : l10n.logoutConfirm),
        actions: [
          CupertinoDialogAction(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              _performLogout();
            },
            child: Text(l10n.confirm),
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () {
              Navigator.of(dialogContext).pop();
            },
            child: Text(l10n.cancel),
          ),
        ],
      ),
    );
  }

  void _showSettingsMenu(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
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
              l10n.settings,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1E3A5F),
              ),
            ),
            const SizedBox(height: 16),
            // 语言设置
            _buildSettingsItem(
              icon: CupertinoIcons.globe,
              color: const Color(0xFF0EA5E9),
              title: l10n.selectLanguage,
              onTap: () {
                Navigator.pop(ctx);
                _showLanguageDialog(context);
              },
            ),
            // 数据管理
            _buildSettingsItem(
              icon: CupertinoIcons.shield_lefthalf_fill,
              color: const Color(0xFF10B981),
              title: l10n.dataManagement,
              onTap: () {
                Navigator.pop(ctx);
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const DataManagementPage(),
                  ),
                );
              },
            ),
            // 隐私政策
            _buildSettingsItem(
              icon: CupertinoIcons.doc_text,
              color: const Color(0xFF8B5CF6),
              title: l10n.privacyPolicy,
              onTap: () {
                Navigator.pop(ctx);
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const PrivacyPolicyPage(),
                  ),
                );
              },
            ),
            const Divider(height: 1),
            // 退出登录/退出游客模式
            _buildSettingsItem(
              icon: CupertinoIcons.square_arrow_left,
              color: Colors.red,
              title: FirebaseAuth.instance.currentUser == null ? '退出游客模式' : l10n.logout,
              onTap: () {
                Navigator.pop(ctx);
                _showLogoutDialog(context);
              },
              isDestructive: true,
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsItem({
    required IconData icon,
    required Color color,
    required String title,
    required VoidCallback onTap,
    bool isDestructive = false,
  }) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: color, size: 22),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: isDestructive ? Colors.red : const Color(0xFF334155),
        ),
      ),
      trailing: Icon(
        CupertinoIcons.chevron_right,
        color: Colors.grey[400],
        size: 18,
      ),
      onTap: onTap,
    );
  }

  // 构建用户头像
  Widget _buildUserAvatar(User user) {
    final String displayName = user.displayName ?? 'User';
    final String initials = _getInitials(displayName);
    
    Widget avatarWidget;
    
    if (_isUploadingAvatar) {
      // 上传中状态
      avatarWidget = Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF0EA5E9),
              Color(0xFF10B981),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF0EA5E9).withValues(alpha: 0.35),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        padding: const EdgeInsets.all(3),
        child: Container(
          width: 94,
          height: 94,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: const Center(
            child: CircularProgressIndicator(
              strokeWidth: 3,
              valueColor: AlwaysStoppedAnimation<Color>(
                Color(0xFF0EA5E9),
              ),
            ),
          ),
        ),
      );
    } else if (_localAvatarPath != null && File(_localAvatarPath!).existsSync()) {
      // 使用本地头像
      avatarWidget = Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF0EA5E9),
              Color(0xFF10B981),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF0EA5E9).withValues(alpha: 0.35),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        padding: const EdgeInsets.all(3),
        child: ClipOval(
          child: Image.file(
            File(_localAvatarPath!),
            width: 94,
            height: 94,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return _buildDefaultAvatarContent(initials);
            },
          ),
        ),
      );
    } else {
      // 使用默认头像（显示首字母）
      avatarWidget = _buildDefaultAvatar(initials);
    }
    
    // 添加点击功能和编辑图标
    return GestureDetector(
      onTap: _isUploadingAvatar ? null : () => _showChangeAvatarDialog(context),
      child: Stack(
        children: [
          avatarWidget,
          if (!_isUploadingAvatar)
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: const Color(0xFF0EA5E9),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.2),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: const Icon(
                  CupertinoIcons.camera_fill,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildDefaultAvatar(String initials) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF0EA5E9),
            Color(0xFF10B981),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0EA5E9).withValues(alpha: 0.35),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: _buildDefaultAvatarContent(initials),
    );
  }

  Widget _buildDefaultAvatarContent(String initials) {
    return Container(
      width: 94,
      height: 94,
      margin: const EdgeInsets.all(3),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: Center(
        child: Text(
          initials,
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0EA5E9),
          ),
        ),
      ),
    );
  }

  String _getInitials(String name) {
    final List<String> parts = name.trim().split(RegExp(r'\s+'));
    if (parts.isEmpty) return 'U';
    if (parts.length == 1) {
      return parts[0].isNotEmpty ? parts[0][0].toUpperCase() : 'U';
    }
    return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
  }

  String _getDisplayName(User user) {
    if (user.displayName != null && user.displayName!.isNotEmpty) {
      return user.displayName!;
    }
    return 'User';
  }

  /// 显示更改头像选项菜单
  void _showChangeAvatarDialog(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    showCupertinoModalPopup(
      context: context,
      builder: (ctx) => CupertinoActionSheet(
        title: Text(l10n.changeAvatar),
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(ctx);
              _pickAndUploadAvatar(context, ImageSource.gallery);
            },
            child: Text(l10n.selectFromGallery),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(ctx);
              _pickAndUploadAvatar(context, ImageSource.camera);
            },
            child: Text(l10n.takePhoto),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          isDestructiveAction: true,
          onPressed: () => Navigator.pop(ctx),
          child: Text(l10n.cancel),
        ),
      ),
    );
  }

  /// 选择并保存头像到本地
  Future<void> _pickAndUploadAvatar(BuildContext context, ImageSource source) async {
    final l10n = AppLocalizations.of(context)!;
    final user = FirebaseAuth.instance.currentUser;
    
    if (user == null) return;

    // 在 await 之前捕获 ScaffoldMessenger 引用
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    try {
      setState(() {
        _isUploadingAvatar = true;
      });

      // 选择图片
      final XFile? imageFile = await _avatarService.pickImage(source: source);
      
      if (imageFile == null) {
        if (mounted) {
          setState(() {
            _isUploadingAvatar = false;
          });
        }
        return;
      }

      // 保存头像到本地
      final File file = File(imageFile.path);
      final String localPath = await _avatarService.uploadAvatar(file, user);

      // 重置状态并更新本地路径
      if (mounted) {
        setState(() {
          _isUploadingAvatar = false;
          _localAvatarPath = localPath;
        });

        scaffoldMessenger.showSnackBar(
          SnackBar(
            content: Text(l10n.avatarUpdated),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isUploadingAvatar = false;
        });
        
        scaffoldMessenger.showSnackBar(
          SnackBar(
            content: Text('${l10n.avatarUpdateFailed}: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final user = FirebaseAuth.instance.currentUser;
    
    return Scaffold(
      backgroundColor: const Color(0xFFF0F9FF),
      body: SafeArea(
        child: Column(
          children: [
            // 顶部导航栏
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  // Logo 和标题
                  Expanded(
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF0EA5E9).withValues(alpha: 0.25),
                                blurRadius: 8,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/icon/app_icon.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
            l10n.appTitle,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Color(0xFF1E3A5F),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // 设置按钮
                  Material(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    elevation: 2,
                    shadowColor: const Color(0xFF0EA5E9).withValues(alpha: 0.3),
                    child: InkWell(
                      onTap: () => _showSettingsMenu(context),
                      borderRadius: BorderRadius.circular(12),
                      child: const SizedBox(
                        width: 48,
                        height: 48,
                        child: Icon(
                          CupertinoIcons.gear,
                          color: Color(0xFF0EA5E9),
                          size: 24,
            ),
          ),
        ),
      ),
                ],
              ),
            ),
            
            // 主内容区域
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
                    const SizedBox(height: 40),
                    
                    // 用户头像
                    if (user != null) ...[
                      _buildUserAvatar(user),
                      const SizedBox(height: 20),
                      Text(
                        l10n.welcome(_getDisplayName(user)),
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1E3A5F),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 40),
                    ],
                    
                    // 功能选择提示
            Text(
              l10n.selectTraining,
              style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xFF64748B),
              ),
              textAlign: TextAlign.center,
            ),
                    
                    const SizedBox(height: 24),
                    
                    // 手部震颤测试按钮
                    _buildFeatureButton(
                      icon: CupertinoIcons.hand_raised,
              title: l10n.tremorTest,
                      color: const Color(0xFF0EA5E9),
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) => const TremorTestPage(),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                    transitionDuration: const Duration(milliseconds: 200),
                  ),
                );
              },
            ),
                    
                    const SizedBox(height: 16),
                    
                    // 语音训练按钮
                    _buildFeatureButton(
                      icon: CupertinoIcons.mic_fill,
                      title: l10n.voiceTraining,
                      color: const Color(0xFF10B981),
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation, secondaryAnimation) => const VoiceTrainingPage(),
                            transitionsBuilder: (context, animation, secondaryAnimation, child) {
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            },
                            transitionDuration: const Duration(milliseconds: 200),
                          ),
                        );
                      },
                    ),
                    
                    const SizedBox(height: 16),
                    
                    // 肢体动作训练按钮
                    _buildFeatureButton(
                      icon: CupertinoIcons.hand_raised_fill,
                      title: l10n.movementTraining,
                      color: const Color(0xFF8B5CF6),
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation, secondaryAnimation) => const MovementTrainingPage(),
                            transitionsBuilder: (context, animation, secondaryAnimation, child) {
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            },
                            transitionDuration: const Duration(milliseconds: 200),
                          ),
                        );
                      },
                    ),
                    
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureButton({
    required IconData icon,
    required String title,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: color.withValues(alpha: 0.2),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(icon, color: color, size: 30),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E3A5F),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    AppLocalizations.of(context)!.clickToStartTest,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                CupertinoIcons.arrow_right,
                color: Colors.white,
                size: 22,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
