import 'package:flutter/material.dart';
import 'package:hananote/app/theme/hana_colors.dart';
import 'package:hananote/core/l10n/arb/app_localizations.dart';
import 'package:hananote/core/update/update_service.dart';
import 'package:url_launcher/url_launcher.dart';

/// Shows a bottom sheet prompting the user to update.
Future<void> showUpdateDialog(
  BuildContext context,
  AppUpdateInfo info,
) {
  final l10n = AppLocalizations.of(context)!;

  return showModalBottomSheet<void>(
    context: context,
    backgroundColor: HanaColors.surfaceContainerLowest,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
    ),
    builder: (sheetContext) {
      return SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 20, 24, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: 24),
                decoration: BoxDecoration(
                  color: HanaColors.outlineVariant.withAlpha(128),
                  borderRadius: BorderRadius.circular(999),
                ),
              ),
              const Icon(
                Icons.system_update_outlined,
                size: 56,
                color: HanaColors.primary,
              ),
              const SizedBox(height: 16),
              Text(
                l10n.updateAvailable,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: HanaColors.onSurface,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'v${info.latestVersion}',
                style: const TextStyle(
                  fontSize: 14,
                  color: HanaColors.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              if (info.releaseNotes.isNotEmpty) ...[
                const SizedBox(height: 16),
                Container(
                  constraints: const BoxConstraints(maxHeight: 120),
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: HanaColors.surfaceContainerLow,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: SingleChildScrollView(
                    child: Text(
                      info.releaseNotes,
                      style: const TextStyle(
                        fontSize: 13,
                        color: HanaColors.onSurfaceVariant,
                        height: 1.5,
                      ),
                    ),
                  ),
                ),
              ],
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () {
                    final url = info.downloadUrl ?? info.htmlUrl;
                    launchUrl(
                      Uri.parse(url),
                      mode: LaunchMode.externalApplication,
                    );
                    Navigator.of(sheetContext).pop();
                  },
                  child: Text(l10n.updateNow),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () => Navigator.of(sheetContext).pop(),
                  child: Text(l10n.updateLater),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
