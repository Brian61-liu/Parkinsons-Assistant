import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import '../l10n/app_localizations.dart';
import '../services/auth_service.dart';
import '../services/database_service.dart';

/// 数据管理页面
/// GDPR 合规：数据可携带权、数据删除权
class DataManagementPage extends StatefulWidget {
  const DataManagementPage({super.key});

  @override
  State<DataManagementPage> createState() => _DataManagementPageState();
}

class _DataManagementPageState extends State<DataManagementPage> {
  final AuthService _authService = AuthService();
  final DatabaseService _databaseService = DatabaseService();
  bool _isExporting = false;
  bool _isDeletingRecords = false;
  bool _isDeletingAccount = false;

  // 操作超时时间（秒）
  static const int _operationTimeout = 30;

  Future<void> _exportData() async {
    final l10n = AppLocalizations.of(context)!;
    
    setState(() => _isExporting = true);
    
    try {
      final data = await _authService.exportUserData().timeout(
        const Duration(seconds: _operationTimeout),
        onTimeout: () => throw Exception('操作超时，请检查网络连接'),
      );
      final jsonString = const JsonEncoder.withIndent('  ').convert(data);
      
      // 复制到剪贴板
      await Clipboard.setData(ClipboardData(text: jsonString));
      
      if (mounted) {
        _showSuccessDialog(l10n.exportSuccess, l10n.exportSuccessMessage);
      }
    } catch (e) {
      if (mounted) {
        _showErrorDialog(l10n.error, e.toString());
      }
    } finally {
      if (mounted) {
        setState(() => _isExporting = false);
      }
    }
  }

  Future<void> _deleteAllRecords() async {
    final l10n = AppLocalizations.of(context)!;
    
    final confirmed = await showCupertinoDialog<bool>(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(l10n.deleteAllData),
        content: Text(l10n.deleteAllDataConfirm),
        actions: [
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () => Navigator.pop(context, true),
            child: Text(l10n.delete),
          ),
          CupertinoDialogAction(
            onPressed: () => Navigator.pop(context, false),
            child: Text(l10n.cancel),
          ),
        ],
      ),
    );

    if (confirmed != true) return;

    setState(() => _isDeletingRecords = true);

    try {
      // 删除本地数据库记录
      await _databaseService.deleteAllTremorRecords();
      
      // 尝试删除云端记录（如果失败不影响本地删除）
      try {
        await _authService.deleteAllTremorRecords().timeout(
          const Duration(seconds: _operationTimeout),
          onTimeout: () => throw Exception('云端同步超时'),
        );
      } catch (e) {
        // 云端删除失败，但本地已删除成功
        debugPrint('云端记录删除失败: $e');
      }
      
      if (mounted) {
        _showSuccessDialog(l10n.deleteSuccess, l10n.deleteSuccessMessage);
      }
    } catch (e) {
      if (mounted) {
        _showErrorDialog(l10n.error, e.toString());
      }
    } finally {
      if (mounted) {
        setState(() => _isDeletingRecords = false);
      }
    }
  }

  Future<void> _deleteAccount() async {
    final l10n = AppLocalizations.of(context)!;
    
    // 第一次确认
    final firstConfirm = await showCupertinoDialog<bool>(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(l10n.deleteAccount),
        content: Text(l10n.deleteAccountWarning),
        actions: [
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () => Navigator.pop(context, true),
            child: Text(l10n.continue_),
          ),
          CupertinoDialogAction(
            onPressed: () => Navigator.pop(context, false),
            child: Text(l10n.cancel),
          ),
        ],
      ),
    );

    if (firstConfirm != true) return;
    if (!mounted) return;

    // 第二次确认（更严格的警告）
    final finalConfirm = await showCupertinoDialog<bool>(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(l10n.finalWarning),
        content: Text(l10n.deleteAccountFinalWarning),
        actions: [
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () => Navigator.pop(context, true),
            child: Text(l10n.deleteForever),
          ),
          CupertinoDialogAction(
            onPressed: () => Navigator.pop(context, false),
            child: Text(l10n.cancel),
          ),
        ],
      ),
    );

    if (finalConfirm != true) return;

    setState(() => _isDeletingAccount = true);

    try {
      await _authService.deleteAccount();
      
      // 删除成功，返回到根页面（让 main.dart 的 StreamBuilder 处理导航）
      if (mounted) {
        Navigator.of(context).popUntil((route) => route.isFirst);
      }
    } catch (e) {
      if (mounted) {
        _showErrorDialog(l10n.error, e.toString());
        setState(() => _isDeletingAccount = false);
      }
    }
  }

  void _showSuccessDialog(String title, String message) {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(CupertinoIcons.checkmark_circle_fill, 
                color: Colors.green, size: 24),
            const SizedBox(width: 8),
            Flexible(child: Text(title)),
          ],
        ),
        content: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(message),
        ),
        actions: [
          CupertinoDialogAction(
            child: const Text('确定'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  void _showErrorDialog(String title, String message) {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(CupertinoIcons.exclamationmark_circle_fill, 
                color: Colors.red, size: 24),
            const SizedBox(width: 8),
            Flexible(child: Text(title)),
          ],
        ),
        content: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(message, style: const TextStyle(fontSize: 14)),
        ),
        actions: [
          CupertinoDialogAction(
            child: const Text('确定'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.dataManagement),
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
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              // GDPR 提示
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF4facfe).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: const Color(0xFF4facfe).withValues(alpha: 0.3),
                  ),
                ),
                child: Row(
                  children: [
                    const Icon(
                      CupertinoIcons.shield_lefthalf_fill,
                      color: Color(0xFF4facfe),
                      size: 32,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        l10n.gdprRights,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // 数据导出
              _buildActionCard(
                icon: CupertinoIcons.cloud_download,
                iconColor: Colors.green,
                title: l10n.exportData,
                description: l10n.exportDataDescription,
                buttonText: _isExporting ? l10n.exporting : l10n.export,
                isLoading: _isExporting,
                onPressed: _isExporting ? null : _exportData,
              ),

              const SizedBox(height: 16),

              // 删除所有测试记录
              _buildActionCard(
                icon: CupertinoIcons.trash,
                iconColor: Colors.orange,
                title: l10n.deleteAllRecords,
                description: l10n.deleteAllRecordsDescription,
                buttonText: l10n.delete,
                isDestructive: true,
                isLoading: _isDeletingRecords,
                onPressed: _isDeletingRecords ? null : _deleteAllRecords,
              ),

              const SizedBox(height: 16),

              // 删除账户
              _buildActionCard(
                icon: CupertinoIcons.person_crop_circle_badge_minus,
                iconColor: Colors.red,
                title: l10n.deleteAccount,
                description: l10n.deleteAccountDescription,
                buttonText: l10n.deleteAccount,
                isDestructive: true,
                isLoading: _isDeletingAccount,
                onPressed: _isDeletingAccount ? null : _deleteAccount,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String description,
    required String buttonText,
    bool isDestructive = false,
    bool isLoading = false,
    VoidCallback? onPressed,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: iconColor.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: iconColor, size: 24),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.7),
              fontSize: 14,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: isDestructive 
                    ? Colors.red.withValues(alpha: 0.8) 
                    : const Color(0xFF4facfe),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: isLoading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : Text(buttonText),
            ),
          ),
        ],
      ),
    );
  }
}
