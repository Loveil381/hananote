import 'package:flutter/material.dart';
import 'package:hananote/app/theme/hana_colors.dart';
import 'package:hananote/core/l10n/arb/app_localizations.dart';
import 'package:hananote/core/update/apk_installer.dart';
import 'package:hananote/core/update/update_service.dart';

/// Shows the update bottom sheet with in-app download and install.
Future<void> showUpdateDialog(
  BuildContext context,
  AppUpdateInfo info,
) {
  return showModalBottomSheet<void>(
    context: context,
    isDismissible: false,
    enableDrag: false,
    backgroundColor: HanaColors.surfaceContainerLowest,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
    ),
    builder: (_) => _UpdateSheet(info: info),
  );
}

enum _UpdateState { initial, downloading, downloaded, error }

class _UpdateSheet extends StatefulWidget {
  const _UpdateSheet({required this.info});
  final AppUpdateInfo info;

  @override
  State<_UpdateSheet> createState() => _UpdateSheetState();
}

class _UpdateSheetState extends State<_UpdateSheet> {
  _UpdateState _state = _UpdateState.initial;
  double _progress = 0;
  String? _apkPath;

  Future<void> _startDownload() async {
    final url = widget.info.downloadUrl;
    if (url == null || url.isEmpty) return;

    setState(() {
      _state = _UpdateState.downloading;
      _progress = 0;
    });

    try {
      final path = await UpdateService.downloadApk(
        url,
        (p) {
          if (mounted) setState(() => _progress = p);
        },
      );
      if (mounted) {
        setState(() {
          _state = _UpdateState.downloaded;
          _apkPath = path;
        });
      }
    } catch (_) {
      if (mounted) setState(() => _state = _UpdateState.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

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
              'v${widget.info.latestVersion}',
              style: const TextStyle(
                fontSize: 14,
                color: HanaColors.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
            if (widget.info.releaseNotes.isNotEmpty) ...[
              const SizedBox(height: 16),
              Container(
                constraints: const BoxConstraints(maxHeight: 100),
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: HanaColors.surfaceContainerLow,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: SingleChildScrollView(
                  child: Text(
                    widget.info.releaseNotes,
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
            ..._buildActions(l10n),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildActions(AppLocalizations l10n) {
    return switch (_state) {
      _UpdateState.initial => [
        SizedBox(
          width: double.infinity,
          child: FilledButton(
            onPressed: _startDownload,
            child: Text(l10n.updateNow),
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: double.infinity,
          child: TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(l10n.updateLater),
          ),
        ),
      ],
      _UpdateState.downloading => [
        Text(
          l10n.downloadProgress((_progress * 100).toStringAsFixed(0)),
          style: const TextStyle(
            fontSize: 14,
            color: HanaColors.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 12),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: LinearProgressIndicator(
            value: _progress,
            minHeight: 8,
            backgroundColor: HanaColors.surfaceContainerHigh,
            valueColor:
                const AlwaysStoppedAnimation<Color>(HanaColors.primary),
          ),
        ),
      ],
      _UpdateState.downloaded => [
        SizedBox(
          width: double.infinity,
          child: FilledButton(
            onPressed: () {
              if (_apkPath != null) ApkInstaller.install(_apkPath!);
            },
            child: Text(l10n.installUpdate),
          ),
        ),
      ],
      _UpdateState.error => [
        Text(
          l10n.downloadFailed,
          style: const TextStyle(
            fontSize: 14,
            color: HanaColors.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          child: FilledButton(
            onPressed: _startDownload,
            child: Text(l10n.updateNow),
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: double.infinity,
          child: TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(l10n.updateLater),
          ),
        ),
      ],
    };
  }
}
