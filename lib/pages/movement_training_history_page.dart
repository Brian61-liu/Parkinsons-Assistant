import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import '../l10n/app_localizations.dart';
import '../services/database_service.dart';
import '../models/movement_training_record.dart';

class MovementTrainingHistoryPage extends StatefulWidget {
  const MovementTrainingHistoryPage({super.key});

  @override
  State<MovementTrainingHistoryPage> createState() => _MovementTrainingHistoryPageState();
}

class _MovementTrainingHistoryPageState extends State<MovementTrainingHistoryPage> {
  final DatabaseService _databaseService = DatabaseService();
  List<MovementTrainingRecord> _records = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadRecords();
  }

  Future<void> _loadRecords() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final records = await _databaseService.getAllMovementTrainingRecords();
      if (mounted) {
        setState(() {
          _records = records;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('加载记录失败: $e')),
        );
      }
    }
  }

  Future<void> _deleteRecord(int id) async {
    final l10n = AppLocalizations.of(context)!;
    
    final confirmed = await showCupertinoDialog<bool>(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(l10n.deleteRecord),
        content: Text(l10n.deleteRecordConfirm),
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

    if (confirmed == true) {
      try {
        await _databaseService.deleteMovementTrainingRecord(id);
        await _loadRecords();
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(l10n.recordDeleted)),
          );
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('删除失败: $e')),
          );
        }
      }
    }
  }

  String _formatDuration(int seconds) {
    final l10n = AppLocalizations.of(context)!;
    final minutes = seconds ~/ 60;
    final secs = seconds % 60;
    if (minutes > 0) {
      return '$minutes${l10n.minutes} $secs${l10n.seconds}';
    }
    return '$secs${l10n.seconds}';
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: const Color(0xFFF0F9FF),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () => Navigator.pop(context),
          child: const Icon(
            CupertinoIcons.arrow_left,
            color: Color(0xFF1E3A5F),
            size: 28,
          ),
        ),
        title: Text(
          l10n.trainingHistory,
          style: const TextStyle(
            color: Color(0xFF1E3A5F),
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _records.isEmpty
              ? _buildEmptyState(l10n)
              : _buildRecordsList(l10n),
    );
  }

  Widget _buildEmptyState(AppLocalizations l10n) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            CupertinoIcons.clock,
            size: 80,
            color: Color(0xFF64748B),
          ),
          const SizedBox(height: 24),
          Text(
            l10n.noTrainingRecords,
            style: const TextStyle(
              color: Color(0xFF64748B),
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            l10n.noTrainingRecordsHint,
            style: const TextStyle(
              color: Color(0xFF94A3B8),
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildRecordsList(AppLocalizations l10n) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _records.length,
      itemBuilder: (context, index) {
        final record = _records[index];
        return _buildRecordCard(record, l10n);
      },
    );
  }

  Widget _buildRecordCard(MovementTrainingRecord record, AppLocalizations l10n) {
    final dateFormat = DateFormat('yyyy-MM-dd HH:mm');
    final dateStr = dateFormat.format(record.timestamp);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
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
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () => _showRecordDetails(record, l10n),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                // 图标
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: record.goalReached
                        ? Colors.green.withValues(alpha: 0.1)
                        : Colors.orange.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    record.goalReached
                        ? CupertinoIcons.check_mark_circled_solid
                        : CupertinoIcons.clock,
                    color: record.goalReached ? Colors.green : Colors.orange,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 16),
                // 信息
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        dateStr,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1E3A5F),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Text(
                            '${l10n.successCount}: ${record.successCount}/${record.targetCount}',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color(0xFF64748B),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            '${l10n.duration}: ${_formatDuration(record.duration)}',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color(0xFF64748B),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // 删除按钮
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () => _deleteRecord(record.id!),
                  child: const Icon(
                    CupertinoIcons.delete,
                    color: Colors.red,
                    size: 22,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showRecordDetails(MovementTrainingRecord record, AppLocalizations l10n) {
    final dateFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
    final dateStr = dateFormat.format(record.timestamp);

    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(l10n.trainingDetails),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${l10n.testDate}: $dateStr'),
            const SizedBox(height: 8),
            Text('${l10n.successCount}: ${record.successCount}/${record.targetCount}'),
            const SizedBox(height: 8),
            Text('${l10n.duration}: ${_formatDuration(record.duration)}'),
            const SizedBox(height: 8),
            Text('${l10n.goalStatus}: ${record.goalReached ? l10n.goalReached : l10n.goalNotReached}'),
          ],
        ),
        actions: [
          CupertinoDialogAction(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.ok),
          ),
        ],
      ),
    );
  }
}
