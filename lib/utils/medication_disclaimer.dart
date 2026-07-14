import 'package:flutter/cupertino.dart';
import '../l10n/app_localizations.dart';
import '../services/medication_reminder_service.dart';

/// 用药清单免责声明弹窗；接受后启用功能并请求本地通知权限。
Future<bool> showMedicationDisclaimerDialog(
  BuildContext context,
  MedicationReminderService service,
) async {
  final l10n = AppLocalizations.of(context)!;
  final accepted = await showCupertinoDialog<bool>(
    context: context,
    builder: (ctx) => CupertinoAlertDialog(
      title: Text(l10n.medicationList),
      content: Padding(
        padding: const EdgeInsets.only(top: 12),
        child: Text(
          '${l10n.medicationDisclaimer}\n\n'
          '${l10n.medicationNotificationPermissionNote}',
        ),
      ),
      actions: [
        CupertinoDialogAction(
          onPressed: () => Navigator.pop(ctx, false),
          child: Text(l10n.cancel),
        ),
        CupertinoDialogAction(
          isDefaultAction: true,
          onPressed: () => Navigator.pop(ctx, true),
          child: Text(l10n.medicationDisclaimerAccept),
        ),
      ],
    ),
  );
  if (accepted == true) {
    await service.acceptDisclaimerAndEnable();
    return true;
  }
  return false;
}

/// 若尚未接受免责声明则弹窗；已接受返回 true。
Future<bool> ensureMedicationDisclaimer(
  BuildContext context,
  MedicationReminderService service,
) async {
  if (await service.hasAcceptedDisclaimer()) return true;
  if (!context.mounted) return false;
  return showMedicationDisclaimerDialog(context, service);
}
