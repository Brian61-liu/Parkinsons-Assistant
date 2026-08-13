import 'dart:async';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../l10n/app_localizations.dart';
import '../../services/auth_service.dart';
import '../../services/avatar_service.dart';
import '../../services/cloud_sync_service.dart';
import '../../services/cloud_sync_status_service.dart';
import '../../services/database_service.dart';
import '../../theme/app_colors.dart';
import '../../utils/gentle_page_route.dart';
import '../accessibility_settings_page.dart';
import '../data_management_page.dart';
import '../medication_reminders_page.dart';
import '../privacy_policy_page.dart';
import '../terms_of_service_page.dart';
import '../training_reminders_page.dart';

/// 我的 Tab：账号信息 + 设置入口（替代 comingSoon 占位）。
class ProfileTabPage extends StatefulWidget {
  const ProfileTabPage({
    super.key,
    required this.onLanguageChange,
    this.onGuestModeChanged,
  });

  final Function(Locale) onLanguageChange;
  final Function(bool)? onGuestModeChanged;

  @override
  State<ProfileTabPage> createState() => _ProfileTabPageState();
}

class _ProfileTabPageState extends State<ProfileTabPage> {
  final _authService = AuthService();
  final _avatarService = AvatarService();
  final _databaseService = DatabaseService();
  final _syncStatus = CloudSyncStatusService.instance;

  String? _localAvatarPath;

  @override
  void initState() {
    super.initState();
    _syncStatus.addListener(_onSyncChanged);
    // ignore: discarded_futures
    _syncStatus.load();
    _loadLocalAvatar();
  }

  @override
  void dispose() {
    _syncStatus.removeListener(_onSyncChanged);
    super.dispose();
  }

  void _onSyncChanged() {
    if (mounted) setState(() {});
  }

  Future<void> _loadLocalAvatar() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;
    final path = await _avatarService.getLocalAvatarPath(user.uid);
    if (mounted) setState(() => _localAvatarPath = path);
  }

  Future<void> _syncData() async {
    final l10n = AppLocalizations.of(context)!;
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(l10n.loginRequiredForSync)));
      }
      return;
    }
    if (_syncStatus.isSyncing) return;

    _syncStatus.beginSync();
    try {
      await _databaseService.syncFromCloud().timeout(
        CloudSyncService.networkTimeout + const Duration(seconds: 10),
        onTimeout: () => throw TimeoutException(
          'cloud sync timed out',
          CloudSyncService.networkTimeout + const Duration(seconds: 10),
        ),
      );
      await _syncStatus.endSuccess();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n.dataSynced),
            duration: const Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      await _syncStatus.endFailure(e);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n.syncFailed),
            duration: const Duration(seconds: 5),
            action: SnackBarAction(
              label: l10n.syncRetry,
              onPressed: () {
                // ignore: discarded_futures
                _syncData();
              },
            ),
          ),
        );
      }
    }
  }

  String _syncTitle(AppLocalizations l10n) {
    if (_syncStatus.isSyncing) return l10n.syncing;
    return l10n.syncToCloud;
  }

  String? _syncSubtitle(AppLocalizations l10n) {
    if (_syncStatus.isSyncing) return null;
    if (_syncStatus.lastFailed) return l10n.syncFailedHint;
    final at = _syncStatus.lastSuccessAt;
    if (at == null) return null;
    final locale = Localizations.localeOf(context).toString();
    final formatted = DateFormat.yMd(locale).add_Hm().format(at.toLocal());
    return l10n.lastSyncedAt(formatted);
  }

  void _showLanguageDialog() {
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

    showModalBottomSheet<void>(
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
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: Text(
                l10n.cancel,
                style: const TextStyle(color: Colors.red, fontSize: 17),
              ),
            ),
            const SizedBox(height: 8),
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
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('$e')));
      }
    }
  }

  void _showLogoutDialog() {
    final l10n = AppLocalizations.of(context)!;
    final isGuest = FirebaseAuth.instance.currentUser == null;
    showCupertinoDialog<void>(
      context: context,
      builder: (dialogContext) => CupertinoAlertDialog(
        title: Text(isGuest ? l10n.exitGuestMode : l10n.logout),
        content: Text(isGuest ? l10n.exitGuestModeConfirm : l10n.logoutConfirm),
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

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final user = FirebaseAuth.instance.currentUser;
    final isGuest = user == null;

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 28),
          children: [
            Text(
              l10n.profileTabTitle,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E3A5F),
              ),
            ),
            const SizedBox(height: 16),
            _accountCard(l10n, user, isGuest),
            const SizedBox(height: 20),
            _sectionLabel(l10n.profileSectionPreferences),
            _groupCard([
              _row(
                icon: CupertinoIcons.globe,
                color: AppColors.primary,
                title: l10n.selectLanguage,
                onTap: _showLanguageDialog,
              ),
              _row(
                icon: CupertinoIcons.textformat,
                color: const Color(0xFF0EA5E9),
                title: l10n.accessibilitySettings,
                onTap: () =>
                    pushGentle(context, const AccessibilitySettingsPage()),
              ),
              _row(
                icon: CupertinoIcons.bell,
                color: const Color(0xFFF59E0B),
                title: l10n.trainingReminderPageTitle,
                onTap: () => pushGentle(context, const TrainingRemindersPage()),
              ),
            ]),
            const SizedBox(height: 16),
            _sectionLabel(l10n.profileSectionAccount),
            _groupCard([
              if (!isGuest)
                _row(
                  icon: _syncStatus.lastFailed && !_syncStatus.isSyncing
                      ? CupertinoIcons.exclamationmark_circle
                      : CupertinoIcons.cloud_upload,
                  color: _syncStatus.lastFailed && !_syncStatus.isSyncing
                      ? const Color(0xFFDC2626)
                      : const Color(0xFF8B5CF6),
                  title: _syncTitle(l10n),
                  subtitle: _syncSubtitle(l10n),
                  onTap: _syncStatus.isSyncing ? null : _syncData,
                ),
              _row(
                icon: Icons.medication_outlined,
                color: AppColors.warningAmber,
                title: l10n.medicationList,
                onTap: () =>
                    pushGentle(context, const MedicationRemindersPage()),
              ),
              _row(
                icon: CupertinoIcons.shield_lefthalf_fill,
                color: AppColors.successGreen,
                title: l10n.dataManagement,
                onTap: () => pushGentle(context, const DataManagementPage()),
              ),
            ]),
            const SizedBox(height: 16),
            _sectionLabel(l10n.profileSectionLegal),
            _groupCard([
              _row(
                icon: CupertinoIcons.lock_shield,
                color: const Color(0xFF8B5CF6),
                title: l10n.privacyPolicy,
                onTap: () => pushGentle(context, const PrivacyPolicyPage()),
              ),
              _row(
                icon: CupertinoIcons.doc_text,
                color: const Color(0xFF0EA5E9),
                title: l10n.termsOfService,
                onTap: () => pushGentle(context, const TermsOfServicePage()),
              ),
            ]),
            const SizedBox(height: 20),
            _groupCard([
              _row(
                icon: CupertinoIcons.square_arrow_left,
                color: Colors.red,
                title: isGuest ? l10n.exitGuestMode : l10n.logout,
                onTap: _showLogoutDialog,
                isDestructive: true,
              ),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _accountCard(AppLocalizations l10n, User? user, bool isGuest) {
    final displayName = user?.displayName;
    final email = user?.email;
    final name = isGuest
        ? l10n.profileGuestLabel
        : (displayName != null && displayName.isNotEmpty
              ? displayName
              : (email ?? l10n.profileSignedInLabel));
    final subtitle = isGuest
        ? l10n.profileGuestSubtitle
        : (email ?? l10n.profileSignedInLabel);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          _avatar(user, isGuest),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1E3A5F),
                  ),
                ),
                if (subtitle != name) ...[
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFF64748B),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _avatar(User? user, bool isGuest) {
    const size = 56.0;
    Widget inner;
    if (!isGuest &&
        _localAvatarPath != null &&
        File(_localAvatarPath!).existsSync()) {
      inner = ClipOval(
        child: Image.file(
          File(_localAvatarPath!),
          width: size,
          height: size,
          fit: BoxFit.cover,
        ),
      );
    } else {
      final label = isGuest
          ? '?'
          : _initials(user?.displayName ?? user?.email ?? 'U');
      inner = Center(
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: AppColors.primary,
          ),
        ),
      );
    }
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.primaryLight,
      ),
      child: inner,
    );
  }

  String _initials(String name) {
    final parts = name.trim().split(RegExp(r'\s+'));
    if (parts.isEmpty || parts.first.isEmpty) return 'U';
    if (parts.length == 1) return parts[0][0].toUpperCase();
    return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
  }

  Widget _sectionLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 8),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: Color(0xFF64748B),
        ),
      ),
    );
  }

  Widget _groupCard(List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(children: children),
    );
  }

  Widget _row({
    required IconData icon,
    required Color color,
    required String title,
    String? subtitle,
    VoidCallback? onTap,
    bool isDestructive = false,
  }) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 2),
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.12),
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
      subtitle: subtitle == null
          ? null
          : Text(
              subtitle,
              style: TextStyle(
                fontSize: 13,
                color: _syncStatus.lastFailed
                    ? const Color(0xFFDC2626)
                    : const Color(0xFF94A3B8),
              ),
            ),
      trailing: Icon(
        CupertinoIcons.chevron_right,
        size: 16,
        color: Colors.grey.shade400,
      ),
    );
  }
}
