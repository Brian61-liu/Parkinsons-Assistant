import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';

/// 服务条款页面（草稿；联系方式为占位）
class TermsOfServicePage extends StatelessWidget {
  const TermsOfServicePage({super.key});

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
              l10n.termsOfService,
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
              _buildSection(
                icon: CupertinoIcons.doc_text_fill,
                title: l10n.termsIntro,
                content: l10n.termsIntroText,
                color: _primaryColor,
              ),
              _buildSection(
                icon: CupertinoIcons.checkmark_seal_fill,
                title: l10n.termsAcceptance,
                content: l10n.termsAcceptanceText,
                color: _secondaryColor,
              ),
              _buildSection(
                icon: CupertinoIcons.app_badge_fill,
                title: l10n.termsUseOfApp,
                content: l10n.termsUseOfAppText,
                color: const Color(0xFF8B5CF6),
              ),
              _buildSection(
                icon: CupertinoIcons.heart_slash_fill,
                title: l10n.termsMedicalDisclaimer,
                content: l10n.termsMedicalDisclaimerText,
                color: const Color(0xFFF59E0B),
              ),
              _buildSection(
                icon: CupertinoIcons.person_crop_circle_fill,
                title: l10n.termsAccounts,
                content: l10n.termsAccountsText,
                color: const Color(0xFFEC4899),
              ),
              _buildSection(
                icon: CupertinoIcons.exclamationmark_triangle_fill,
                title: l10n.termsLimitation,
                content: l10n.termsLimitationText,
                color: const Color(0xFFEF4444),
              ),
              _buildSection(
                icon: CupertinoIcons.arrow_2_circlepath,
                title: l10n.termsChanges,
                content: l10n.termsChangesText,
                color: _primaryColor,
              ),
              _buildSection(
                icon: CupertinoIcons.mail_solid,
                title: l10n.contactUs,
                content: l10n.contactUsText,
                color: const Color(0xFF6366F1),
              ),
              const SizedBox(height: 16),
              _buildFooter(l10n),
            ],
          ),
        ),
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
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        children: [
          Text(
            '${l10n.lastUpdated}: 2026-08-02',
            style: TextStyle(
              color: const Color(0xFF64748B).withValues(alpha: 0.7),
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '${l10n.version}: 1.0.0 (draft)',
            style: TextStyle(
              color: const Color(0xFF64748B).withValues(alpha: 0.7),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
