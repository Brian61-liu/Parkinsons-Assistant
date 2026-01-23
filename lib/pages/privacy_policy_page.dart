import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../l10n/app_localizations.dart';

/// 隐私政策页面
/// 符合 GDPR/HIPAA 合规要求
class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.privacyPolicy),
        backgroundColor: const Color(0xFF1a1a2e),
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF1a1a2e), Color(0xFF16213e)],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSection(
                  l10n.privacyPolicyIntro,
                  l10n.privacyPolicyIntroText,
                ),
                _buildSection(
                  l10n.dataCollection,
                  l10n.dataCollectionText,
                ),
                _buildSection(
                  l10n.dataUsage,
                  l10n.dataUsageText,
                ),
                _buildSection(
                  l10n.dataStorage,
                  l10n.dataStorageText,
                ),
                _buildSection(
                  l10n.dataSharing,
                  l10n.dataSharingText,
                ),
                _buildSection(
                  l10n.userRights,
                  l10n.userRightsText,
                ),
                _buildSection(
                  l10n.dataSecurity,
                  l10n.dataSecurityText,
                ),
                _buildSection(
                  l10n.contactUs,
                  l10n.contactUsText,
                ),
                const SizedBox(height: 20),
                Text(
                  '${l10n.lastUpdated}: 2026-01-23',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontSize: 12,
                  ),
                ),
                Text(
                  '${l10n.version}: 1.0.0',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSection(String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF4facfe),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: TextStyle(
              fontSize: 14,
              color: Colors.white.withOpacity(0.85),
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}
