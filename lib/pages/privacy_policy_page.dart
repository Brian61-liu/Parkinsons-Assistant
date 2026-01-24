import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../l10n/app_localizations.dart';

/// 隐私政策页面
/// 符合 GDPR/HIPAA 合规要求
class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  static const _primaryColor = Color(0xFF0EA5E9);
  static const _secondaryColor = Color(0xFF10B981);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Scaffold(
      backgroundColor: const Color(0xFFF0F9FF),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [_primaryColor, _secondaryColor],
            ),
            boxShadow: [
              BoxShadow(
                color: _primaryColor.withValues(alpha: 0.3),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: CupertinoNavigationBar(
            backgroundColor: Colors.transparent,
            border: null,
            middle: Text(
              l10n.privacyPolicy,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            leading: CupertinoNavigationBarBackButton(
              color: Colors.white,
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 顶部图标和说明
              _buildHeader(l10n),
              const SizedBox(height: 24),
              
              // 各个章节
              _buildSection(
                icon: CupertinoIcons.info_circle_fill,
                title: l10n.privacyPolicyIntro,
                content: l10n.privacyPolicyIntroText,
                color: _primaryColor,
              ),
              _buildSection(
                icon: CupertinoIcons.folder_fill,
                title: l10n.dataCollection,
                content: l10n.dataCollectionText,
                color: _secondaryColor,
              ),
              _buildSection(
                icon: CupertinoIcons.chart_bar_fill,
                title: l10n.dataUsage,
                content: l10n.dataUsageText,
                color: const Color(0xFF8B5CF6),
              ),
              _buildSection(
                icon: CupertinoIcons.cloud_fill,
                title: l10n.dataStorage,
                content: l10n.dataStorageText,
                color: const Color(0xFFF59E0B),
              ),
              _buildSection(
                icon: CupertinoIcons.share_solid,
                title: l10n.dataSharing,
                content: l10n.dataSharingText,
                color: const Color(0xFFEC4899),
              ),
              _buildSection(
                icon: CupertinoIcons.person_crop_circle_fill_badge_checkmark,
                title: l10n.userRights,
                content: l10n.userRightsText,
                color: _primaryColor,
              ),
              _buildSection(
                icon: CupertinoIcons.shield_fill,
                title: l10n.dataSecurity,
                content: l10n.dataSecurityText,
                color: _secondaryColor,
              ),
              _buildSection(
                icon: CupertinoIcons.mail_solid,
                title: l10n.contactUs,
                content: l10n.contactUsText,
                color: const Color(0xFF6366F1),
              ),
              
              // 底部信息
              const SizedBox(height: 16),
              _buildFooter(l10n),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(AppLocalizations l10n) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            _primaryColor.withValues(alpha: 0.1),
            _secondaryColor.withValues(alpha: 0.1),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: _primaryColor.withValues(alpha: 0.2),
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [_primaryColor, _secondaryColor],
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              CupertinoIcons.lock_shield_fill,
              color: Colors.white,
              size: 28,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'HIPAA & GDPR',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E3A5F),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Compliant',
                  style: TextStyle(
                    fontSize: 14,
                    color: _secondaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection({
    required IconData icon,
    required String title,
    required String content,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: color, size: 20),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            content,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF64748B),
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter(AppLocalizations l10n) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.7),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFFE2E8F0),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                CupertinoIcons.calendar,
                size: 14,
                color: const Color(0xFF64748B).withValues(alpha: 0.7),
              ),
              const SizedBox(width: 6),
              Text(
                '${l10n.lastUpdated}: 2026-01-24',
                style: TextStyle(
                  color: const Color(0xFF64748B).withValues(alpha: 0.7),
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                CupertinoIcons.tag,
                size: 14,
                color: const Color(0xFF64748B).withValues(alpha: 0.7),
              ),
              const SizedBox(width: 6),
              Text(
                '${l10n.version}: 1.0.0',
                style: TextStyle(
                  color: const Color(0xFF64748B).withValues(alpha: 0.7),
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
