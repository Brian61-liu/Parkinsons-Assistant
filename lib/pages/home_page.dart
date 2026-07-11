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
import '../services/database_service.dart';
import '../services/home_dashboard_service.dart';
import '../models/home_dashboard_snapshot.dart';
import '../utils/gentle_page_route.dart';
import '../pages/rehab_report_page.dart';
import '../services/medication_reminder_service.dart';
import 'medication_reminders_page.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';

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
  final DatabaseService _databaseService = DatabaseService();
  final HomeDashboardService _dashboardService = HomeDashboardService();

  bool _isUploadingAvatar = false;
  String? _localAvatarPath;
  bool _isSyncing = false;

  HomeDashboardSnapshot _snapshot = HomeDashboardSnapshot.empty;
  bool _snapshotLoading = true;

  @override
  void initState() {
    super.initState();
    _loadLocalAvatar();
    _syncDataOnLogin();
    _loadDashboard();
  }

  Future<void> _loadDashboard() async {
    final snap = await _dashboardService.load();
    if (mounted) {
      setState(() {
        _snapshot = snap;
        _snapshotLoading = false;
      });
    }
  }

  Future<void> _syncDataOnLogin() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      Future.delayed(const Duration(seconds: 1), () async {
        await _syncData(showMessage: false);
      });
    }
  }

  Future<void> _syncData({bool showMessage = true}) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      if (showMessage && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('请先登录以使用云端同步功能')),
        );
      }
      return;
    }
    if (_isSyncing) return;
    setState(() => _isSyncing = true);
    try {
      await _databaseService.syncFromCloud();
      if (showMessage && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('数据同步完成'),
            duration: Duration(seconds: 2),
          ),
        );
      }
      await _loadDashboard();
    } catch (e) {
      if (showMessage && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('同步失败: $e'),
            duration: const Duration(seconds: 3),
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _isSyncing = false);
    }
  }

  Future<void> _loadLocalAvatar() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final path = await _avatarService.getLocalAvatarPath(user.uid);
      if (mounted) setState(() => _localAvatarPath = path);
    }
  }

  // ── 设置菜单 ─────────────────────────────────────────────

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
                      widget.onLanguageChange(
                        Locale(
                          lang['code'] as String,
                          lang['country'] as String,
                        ),
                      );
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
        await _authService.signOut();
      } else {
        widget.onGuestModeChanged?.call(false);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('退出失败: $e')));
      }
    }
  }

  void _showLogoutDialog(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isGuest = FirebaseAuth.instance.currentUser == null;
    showCupertinoDialog(
      context: context,
      builder: (dialogContext) => CupertinoAlertDialog(
        title: Text(isGuest ? '退出游客模式' : l10n.logout),
        content: Text(
          isGuest
              ? '确定要退出游客模式吗？退出后需要重新登录才能使用。'
              : l10n.logoutConfirm,
        ),
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
            onPressed: () => Navigator.of(dialogContext).pop(),
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
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => SafeArea(
        child: SingleChildScrollView(
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
              const SizedBox(height: 8),
              _buildSettingsItem(
                icon: CupertinoIcons.globe,
                color: AppColors.primary,
                title: l10n.selectLanguage,
                onTap: () {
                  Navigator.pop(ctx);
                  _showLanguageDialog(context);
                },
              ),
              if (FirebaseAuth.instance.currentUser != null)
                _buildSettingsItem(
                  icon: CupertinoIcons.cloud_upload,
                  color: const Color(0xFF8B5CF6),
                  title: _isSyncing ? '同步中...' : '同步数据',
                  onTap: () {
                    if (!_isSyncing) {
                      Navigator.pop(ctx);
                      _syncData();
                    }
                  },
                ),
              if (_snapshot.medicationEnabled)
                _buildSettingsItem(
                  icon: Icons.medication_outlined,
                  color: AppColors.warningAmber,
                  title: l10n.medicationList,
                  onTap: () {
                    Navigator.pop(ctx);
                    pushGentle(context, const MedicationRemindersPage())
                        .then((_) => _loadDashboard());
                  },
                ),
              _buildSettingsItem(
                icon: CupertinoIcons.chart_bar_alt_fill,
                color: const Color(0xFF6366F1),
                title: l10n.rehabReport,
                onTap: () {
                  Navigator.pop(ctx);
                  pushGentle(context, const RehabReportPage());
                },
              ),
              _buildSettingsItem(
                icon: CupertinoIcons.shield_lefthalf_fill,
                color: AppColors.successGreen,
                title: l10n.dataManagement,
                onTap: () {
                  Navigator.pop(ctx);
                  pushGentle(context, const DataManagementPage());
                },
              ),
              _buildSettingsItem(
                icon: CupertinoIcons.doc_text,
                color: const Color(0xFF8B5CF6),
                title: l10n.privacyPolicy,
                onTap: () {
                  Navigator.pop(ctx);
                  pushGentle(context, const PrivacyPolicyPage());
                },
              ),
              const Divider(height: 1),
              _buildSettingsItem(
                icon: CupertinoIcons.square_arrow_left,
                color: Colors.red,
                title: FirebaseAuth.instance.currentUser == null
                    ? '退出游客模式'
                    : l10n.logout,
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
      visualDensity: VisualDensity.compact,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      minVerticalPadding: 8,
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
      trailing: Icon(CupertinoIcons.chevron_right, color: Colors.grey[400], size: 18),
      onTap: onTap,
    );
  }

  // ── 头像 ─────────────────────────────────────────────────

  Widget _buildAvatar(User user, double size) {
    final initials = _getInitials(user.displayName ?? 'User');
    Widget inner;

    if (_isUploadingAvatar) {
      inner = const Center(
        child: CircularProgressIndicator(strokeWidth: 2.5),
      );
    } else if (_localAvatarPath != null &&
        File(_localAvatarPath!).existsSync()) {
      inner = ClipOval(
        child: Image.file(
          File(_localAvatarPath!),
          width: size,
          height: size,
          fit: BoxFit.cover,
          errorBuilder: (_, e, s) => _initialsText(initials, size),
        ),
      );
    } else {
      inner = _initialsText(initials, size);
    }

    return Tooltip(
      message: '更换头像',
      child: Semantics(
        button: true,
        label: '用户头像',
        hint: _isUploadingAvatar ? '正在上传头像' : '双击更换头像',
        child: GestureDetector(
          onTap: _isUploadingAvatar
              ? null
              : () => _showChangeAvatarDialog(context),
          child: Container(
            width: size,
            height: size,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primaryLight,
            ),
            child: inner,
          ),
        ),
      ),
    );
  }

  Widget _initialsText(String initials, double avatarSize) => Center(
        child: Text(
          initials,
          style: TextStyle(
            fontSize: avatarSize * 0.38,
            fontWeight: FontWeight.w700,
            color: AppColors.primary,
          ),
        ),
      );

  String _getInitials(String name) {
    final parts = name.trim().split(RegExp(r'\s+'));
    if (parts.isEmpty) return 'U';
    if (parts.length == 1) {
      return parts[0].isNotEmpty ? parts[0][0].toUpperCase() : 'U';
    }
    return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
  }

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

  Future<void> _pickAndUploadAvatar(
    BuildContext context,
    ImageSource source,
  ) async {
    final l10n = AppLocalizations.of(context)!;
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    try {
      setState(() => _isUploadingAvatar = true);
      final XFile? imageFile = await _avatarService.pickImage(source: source);
      if (imageFile == null) {
        if (mounted) setState(() => _isUploadingAvatar = false);
        return;
      }
      final file = File(imageFile.path);
      final localPath = await _avatarService.uploadAvatar(file, user);
      if (mounted) {
        setState(() {
          _isUploadingAvatar = false;
          _localAvatarPath = localPath;
        });
        scaffoldMessenger.showSnackBar(SnackBar(
          content: Text(l10n.avatarUpdated),
          backgroundColor: Colors.green,
        ));
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isUploadingAvatar = false);
        scaffoldMessenger.showSnackBar(SnackBar(
          content: Text('${l10n.avatarUpdateFailed}: $e'),
          backgroundColor: Colors.red,
        ));
      }
    }
  }

  // ── 工具 ─────────────────────────────────────────────────

  String _relativeTime(BuildContext context, DateTime dt) {
    final l10n = AppLocalizations.of(context)!;
    final now = DateTime.now();
    final diff = now.difference(dt);
    if (diff.inDays == 0) return l10n.relativeToday;
    if (diff.inDays == 1) return l10n.relativeYesterday;
    return l10n.relativeDaysAgo(diff.inDays);
  }

  String _formatDuration(BuildContext context, int? secs) {
    final l10n = AppLocalizations.of(context)!;
    if (secs == null) return '';
    if (secs < 60) return l10n.durationSec(secs);
    return l10n.durationMin(secs ~/ 60);
  }

  // ── BUILD ─────────────────────────────────────────────────

  /// 根据可用高度计算紧凑布局参数，保证一屏内排下所有板块。
  _HomeLayoutMetrics _layoutMetrics(double height) {
    if (height < 620) {
      return const _HomeLayoutMetrics(
        sectionGap: 4,
        headerTop: 8,
        cardPadding: 10,
        iconBgSize: 34,
        iconSize: 18,
        labelFontSize: 11,
        bodyFontSize: 11,
        appTitleSize: 24,
        streakPaddingH: 10,
        streakPaddingV: 6,
        avatarSize: 40,
        activityIconSize: 30,
        gridFlex: 52,
        activityFlex: 28,
      );
    }
    if (height < 740) {
      return const _HomeLayoutMetrics(
        sectionGap: 6,
        headerTop: 10,
        cardPadding: 12,
        iconBgSize: 38,
        iconSize: 20,
        labelFontSize: 12,
        bodyFontSize: 11,
        appTitleSize: 26,
        streakPaddingH: 12,
        streakPaddingV: 8,
        avatarSize: 44,
        activityIconSize: 32,
        gridFlex: 54,
        activityFlex: 30,
      );
    }
    return const _HomeLayoutMetrics(
      sectionGap: 8,
      headerTop: 12,
      cardPadding: 14,
      iconBgSize: 42,
      iconSize: 22,
      labelFontSize: 13,
      bodyFontSize: 12,
      appTitleSize: 28,
      streakPaddingH: 14,
      streakPaddingV: 10,
      avatarSize: 48,
      activityIconSize: 34,
      gridFlex: 56,
      activityFlex: 32,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final metrics = _layoutMetrics(constraints.maxHeight);

            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.pageHorizontal,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // ── App Bar ──────────────────────────────
                  Padding(
                    padding: EdgeInsets.only(top: metrics.headerTop),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            l10n.appTitle,
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge
                                ?.copyWith(fontSize: metrics.appTitleSize),
                          ),
                        ),
                        Tooltip(
                          message: l10n.settings,
                          child: Semantics(
                            button: true,
                            label: l10n.settings,
                            hint: '打开设置菜单',
                            child: InkWell(
                              onTap: () => _showSettingsMenu(context),
                              borderRadius: BorderRadius.circular(12),
                              child: const SizedBox(
                                width: AppSpacing.minTapTarget,
                                height: AppSpacing.minTapTarget,
                                child: Icon(
                                  CupertinoIcons.gear,
                                  color: AppColors.textSecondary,
                                  size: 24,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: metrics.sectionGap),

                  // ── 头像行 + Streak ──────────────────────
                  Row(
                    children: [
                      if (user != null) ...[
                        _buildAvatar(user, metrics.avatarSize),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            user.displayName?.isNotEmpty == true
                                ? user.displayName!
                                : 'User',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: metrics.labelFontSize + 3,
                                ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ] else
                        const Spacer(),
                      _buildStreakCard(context, l10n, metrics),
                    ],
                  ),

                  SizedBox(height: metrics.sectionGap),

                  // ── 2×2 卡片网格（占剩余高度的大头） ────────
                  Expanded(
                    flex: metrics.gridFlex,
                    child: LayoutBuilder(
                      builder: (context, gridConstraints) {
                        final gap = AppSpacing.cardGap;
                        final cellW =
                            (gridConstraints.maxWidth - gap) / 2;
                        final cellH =
                            (gridConstraints.maxHeight - gap) / 2;
                        final aspectRatio =
                            cellW / cellH.clamp(1, double.infinity);

                        return GridView.count(
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount: 2,
                          mainAxisSpacing: gap,
                          crossAxisSpacing: gap,
                          childAspectRatio: aspectRatio,
                          children: [
                            _buildVoiceCard(context, l10n, metrics),
                            _buildHandCard(context, l10n, metrics),
                            _buildMotionCard(context, l10n, metrics),
                            _buildMedicationCard(context, l10n, metrics),
                          ],
                        );
                      },
                    ),
                  ),

                  SizedBox(height: metrics.sectionGap),

                  // ── 最近活动标题 ─────────────────────────
                  Text(
                    l10n.recentActivity,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontSize: metrics.labelFontSize + 2,
                        ),
                  ),

                  SizedBox(height: metrics.sectionGap / 2),

                  // ── 最近活动列表（填满剩余高度） ───────────
                  Expanded(
                    flex: metrics.activityFlex,
                    child: _buildRecentActivityList(context, l10n, metrics),
                  ),

                  SizedBox(height: metrics.sectionGap),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  // ── Streak 小卡片 ────────────────────────────────────────

  Widget _buildStreakCard(
    BuildContext context,
    AppLocalizations l10n,
    _HomeLayoutMetrics metrics,
  ) {
    final days = _snapshot.trainingStreakDays;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: metrics.streakPaddingH,
        vertical: metrics.streakPaddingV,
      ),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(14),
        boxShadow: _cardShadow(),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: metrics.iconBgSize - 4,
            height: metrics.iconBgSize - 4,
            decoration: BoxDecoration(
              color: AppColors.primaryLight,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              Icons.calendar_today_outlined,
              size: metrics.iconSize - 2,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                l10n.trainingStreakLabel,
                style: TextStyle(
                  fontSize: metrics.bodyFontSize,
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 1),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    days == 0 ? '—' : '$days',
                    style: TextStyle(
                      fontSize: metrics.labelFontSize + 8,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  if (days > 0) ...[
                    const SizedBox(width: 3),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 2),
                      child: Text(
                        l10n.trainingStreak(days),
                        style: TextStyle(
                          fontSize: metrics.bodyFontSize,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ),
                    const SizedBox(width: 2),
                    Text('🔥', style: TextStyle(fontSize: metrics.iconSize - 4)),
                  ],
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ── 通用卡片骨架 ─────────────────────────────────────────

  Widget _buildMetricCard({
    required BuildContext context,
    required String title,
    required IconData icon,
    required Color iconBgColor,
    required VoidCallback onTap,
    required Widget content,
    required _HomeLayoutMetrics metrics,
    bool showInfoButton = false,
  }) {
    return Semantics(
      button: true,
      label: title,
      child: Material(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
              boxShadow: _cardShadow(),
            ),
            padding: EdgeInsets.all(metrics.cardPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: metrics.iconBgSize,
                      height: metrics.iconBgSize,
                      decoration: BoxDecoration(
                        color: iconBgColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        icon,
                        color: AppColors.primary,
                        size: metrics.iconSize,
                      ),
                    ),
                    const Spacer(),
                    if (showInfoButton)
                      ExcludeSemantics(
                        child: GestureDetector(
                          onTap: () => _showNonMedicalDisclaimer(context),
                          child: Icon(
                            Icons.info_outline,
                            size: metrics.iconSize - 4,
                            color: AppColors.textTertiary,
                          ),
                        ),
                      ),
                  ],
                ),
                SizedBox(height: metrics.sectionGap / 2 + 2),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: metrics.labelFontSize,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textSecondary,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: metrics.sectionGap / 2),
                Expanded(child: content),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showNonMedicalDisclaimer(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    showCupertinoDialog(
      context: context,
      builder: (ctx) => CupertinoAlertDialog(
        title: Text(l10n.nonMedicalDisclaimerTitle),
        content: Text(l10n.nonMedicalDisclaimerBody),
        actions: [
          CupertinoDialogAction(
            onPressed: () => Navigator.pop(ctx),
            child: Text(l10n.ok),
          ),
        ],
      ),
    );
  }

  // ── 语音卡片 ─────────────────────────────────────────────

  Widget _buildVoiceCard(
    BuildContext context,
    AppLocalizations l10n,
    _HomeLayoutMetrics metrics,
  ) {
    final item = _snapshot.lastVoice;
    return _buildMetricCard(
      context: context,
      title: l10n.voiceClarity,
      icon: CupertinoIcons.mic_fill,
      iconBgColor: AppColors.voiceIconBg,
      metrics: metrics,
      onTap: () => pushGentle(context, const VoiceTrainingPage())
          .then((_) => _loadDashboard()),
      content: _snapshotLoading
          ? _loadingIndicator()
          : item == null
              ? _emptyState(l10n.noTrainingYet, l10n.tapToStart, metrics)
              : _trainingInfo(
                  context,
                  metrics: metrics,
                  topLine: l10n.lastTrainingAgo(
                      _relativeTime(context, item.timestamp)),
                  details: [
                    _formatDuration(context, item.durationSeconds),
                    l10n.voiceSessionCount,
                  ].where((s) => s.isNotEmpty).join(' · '),
                ),
    );
  }

  Widget _buildHandCard(
    BuildContext context,
    AppLocalizations l10n,
    _HomeLayoutMetrics metrics,
  ) {
    final item = _snapshot.lastHand;
    return _buildMetricCard(
      context: context,
      title: l10n.handStability,
      icon: CupertinoIcons.hand_raised_fill,
      iconBgColor: AppColors.handIconBg,
      metrics: metrics,
      showInfoButton: true,
      onTap: () => pushGentle(context, const TremorTestPage())
          .then((_) => _loadDashboard()),
      content: _snapshotLoading
          ? _loadingIndicator()
          : item == null
              ? _emptyState(l10n.noMeasurementYet, l10n.tapToStart, metrics)
              : _trainingInfo(
                  context,
                  metrics: metrics,
                  topLine: l10n.lastMeasurementAgo(
                      _relativeTime(context, item.timestamp)),
                  details: [
                    _formatDuration(context, item.durationSeconds),
                    l10n.handMeasurementCount,
                  ].where((s) => s.isNotEmpty).join(' · '),
                ),
    );
  }

  Widget _buildMotionCard(
    BuildContext context,
    AppLocalizations l10n,
    _HomeLayoutMetrics metrics,
  ) {
    final item = _snapshot.lastMotion;
    return _buildMetricCard(
      context: context,
      title: l10n.movementAbility,
      icon: Icons.directions_walk,
      iconBgColor: AppColors.motionIconBg,
      metrics: metrics,
      onTap: () => pushGentle(context, const MovementTrainingPage())
          .then((_) => _loadDashboard()),
      content: _snapshotLoading
          ? _loadingIndicator()
          : item == null
              ? _emptyState(l10n.noTrainingYet, l10n.tapToStart, metrics)
              : _trainingInfo(
                  context,
                  metrics: metrics,
                  topLine: l10n.lastTrainingAgo(
                      _relativeTime(context, item.timestamp)),
                  details: [
                    _formatDuration(context, item.durationSeconds),
                    l10n.motionCompletionCount(
                        item.successCount, item.targetCount),
                  ].where((s) => s.isNotEmpty).join(' · '),
                ),
    );
  }

  Widget _buildMedicationCard(
    BuildContext context,
    AppLocalizations l10n,
    _HomeLayoutMetrics metrics,
  ) {
    final enabled = _snapshot.medicationEnabled;
    final nextTime = _snapshot.nextMedicationTime;

    return _buildMetricCard(
      context: context,
      title: l10n.medicationReminder,
      icon: Icons.medication_outlined,
      iconBgColor: AppColors.medIconBg,
      metrics: metrics,
      onTap: () {
        pushGentle(context, const MedicationRemindersPage())
            .then((_) => _loadDashboard());
      },
      content: _snapshotLoading
          ? _loadingIndicator()
          : !enabled
              ? _emptyState(
                  l10n.medicationSetupPrompt,
                  l10n.medicationSetupSubtitle,
                  metrics,
                )
              : nextTime == null
                  ? _emptyState(l10n.medicationNoUpcoming, '', metrics)
                  : _medicationInfo(context, l10n, nextTime, metrics),
    );
  }

  Widget _medicationInfo(
    BuildContext context,
    AppLocalizations l10n,
    String timeHhmm,
    _HomeLayoutMetrics metrics,
  ) {
    final (h, m) = MedicationReminderService.parseTime(timeHhmm);
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, h, m);
    final isPast = dt.isBefore(now);

    final formatted = TimeOfDay(hour: h, minute: m).format(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          l10n.medicationNextDoseLabel,
          style: TextStyle(
            fontSize: metrics.bodyFontSize,
            color: AppColors.textTertiary,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          formatted,
          style: TextStyle(
            fontSize: metrics.labelFontSize + 6,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          decoration: BoxDecoration(
            color: isPast
                ? AppColors.warningAmberLight
                : AppColors.successGreenLight,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            isPast
                ? l10n.medicationStatusPending
                : l10n.medicationStatusUpcoming,
            style: TextStyle(
              fontSize: metrics.bodyFontSize,
              fontWeight: FontWeight.w600,
              color: isPast ? AppColors.warningAmber : AppColors.successGreen,
            ),
          ),
        ),
      ],
    );
  }

  Widget _trainingInfo(
    BuildContext context, {
    required _HomeLayoutMetrics metrics,
    required String topLine,
    required String details,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          topLine,
          style: TextStyle(
            fontSize: metrics.labelFontSize,
            fontWeight: FontWeight.w500,
            color: AppColors.textPrimary,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        if (details.isNotEmpty) ...[
          const SizedBox(height: 2),
          Text(
            details,
            style: TextStyle(
              fontSize: metrics.bodyFontSize,
              color: AppColors.textSecondary,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ],
    );
  }

  Widget _emptyState(
    String title,
    String subtitle,
    _HomeLayoutMetrics metrics,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: metrics.labelFontSize,
            fontWeight: FontWeight.w500,
            color: AppColors.textPrimary,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        if (subtitle.isNotEmpty) ...[
          const SizedBox(height: 2),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: metrics.bodyFontSize,
              color: AppColors.textTertiary,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ],
    );
  }

  Widget _loadingIndicator() => const Center(
        child: SizedBox(
          width: 18,
          height: 18,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      );

  // ── 最近活动列表 ─────────────────────────────────────────

  Widget _buildRecentActivityList(
    BuildContext context,
    AppLocalizations l10n,
    _HomeLayoutMetrics metrics,
  ) {
    final items = _snapshot.recentActivities;

    if (items.isEmpty) {
      return Container(
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
          boxShadow: _cardShadow(),
        ),
        alignment: Alignment.center,
        child: Text(
          l10n.noTrainingYet,
          style: TextStyle(
            fontSize: metrics.bodyFontSize,
            color: AppColors.textSecondary,
          ),
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
        boxShadow: _cardShadow(),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          for (int i = 0; i < items.length; i++)
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: _buildActivityTile(
                      context,
                      l10n,
                      items[i],
                      metrics,
                    ),
                  ),
                  if (i < items.length - 1)
                    const Divider(
                      height: 1,
                      indent: 12,
                      endIndent: 12,
                      color: AppColors.borderLight,
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildActivityTile(
    BuildContext context,
    AppLocalizations l10n,
    RecentActivityItem item,
    _HomeLayoutMetrics metrics,
  ) {
    final String title;
    final IconData icon;
    final VoidCallback onTap;

    switch (item.type) {
      case ActivityType.voice:
        title = l10n.voiceTraining;
        icon = CupertinoIcons.mic_fill;
        onTap = () => pushGentle(context, const VoiceTrainingPage())
            .then((_) => _loadDashboard());
      case ActivityType.hand:
        title = l10n.tremorTest;
        icon = CupertinoIcons.hand_raised_fill;
        onTap = () => pushGentle(context, const TremorTestPage())
            .then((_) => _loadDashboard());
      case ActivityType.motion:
        title = l10n.movementTraining;
        icon = Icons.directions_walk;
        onTap = () => pushGentle(context, const MovementTrainingPage())
            .then((_) => _loadDashboard());
    }

    final timeLabel = _relativeTime(context, item.timestamp);
    final durationLabel = _formatDuration(context, item.durationSeconds);

    String detailLine = timeLabel;
    if (durationLabel.isNotEmpty) detailLine += ' · $durationLabel';
    if (item.type == ActivityType.motion &&
        item.successCount != null &&
        item.targetCount != null) {
      detailLine +=
          ' · ${l10n.motionCompletionCount(item.successCount!, item.targetCount!)}';
    }
    if (item.type == ActivityType.voice) {
      detailLine += ' · ${l10n.voiceSessionCount}';
    }

    return Semantics(
      button: true,
      label: title,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                ExcludeSemantics(
                  child: Container(
                    width: metrics.activityIconSize,
                    height: metrics.activityIconSize,
                    decoration: BoxDecoration(
                      color: AppColors.primaryLight,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      icon,
                      color: AppColors.primary,
                      size: metrics.iconSize - 4,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: metrics.labelFontSize + 1,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        detailLine,
                        style: TextStyle(
                          fontSize: metrics.bodyFontSize,
                          color: AppColors.textSecondary,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Icon(
                  CupertinoIcons.chevron_right,
                  size: metrics.iconSize - 6,
                  color: AppColors.textTertiary,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ── 卡片阴影 ────────────────────────────────────────────

  List<BoxShadow> _cardShadow() => [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.06),
          blurRadius: 12,
          offset: const Offset(0, 4),
        ),
      ];
}

/// 根据屏幕可用高度动态调整的布局参数，保证一屏内排下所有板块。
class _HomeLayoutMetrics {
  final double sectionGap;
  final double headerTop;
  final double cardPadding;
  final double iconBgSize;
  final double iconSize;
  final double labelFontSize;
  final double bodyFontSize;
  final double appTitleSize;
  final double streakPaddingH;
  final double streakPaddingV;
  final double avatarSize;
  final double activityIconSize;
  final int gridFlex;
  final int activityFlex;

  const _HomeLayoutMetrics({
    required this.sectionGap,
    required this.headerTop,
    required this.cardPadding,
    required this.iconBgSize,
    required this.iconSize,
    required this.labelFontSize,
    required this.bodyFontSize,
    required this.appTitleSize,
    required this.streakPaddingH,
    required this.streakPaddingV,
    required this.avatarSize,
    required this.activityIconSize,
    required this.gridFlex,
    required this.activityFlex,
  });
}
