import 'package:flutter/material.dart';
import 'package:hananote/core/l10n/arb/app_localizations.dart';

/// Minimal placeholder page for creating or editing a blood test report.
class BloodTestEditPage extends StatelessWidget {
  /// Creates a [BloodTestEditPage].
  const BloodTestEditPage({
    super.key,
    this.reportId,
  });

  /// Existing report id when editing.
  final String? reportId;

  @override
  Widget build(BuildContext context) {
    final isEditing = reportId != null && reportId!.isNotEmpty;
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          isEditing ? l10n.bloodTestEditTitle : l10n.bloodTestNewTitle,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: l10n.bloodTestDateLabel,
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: InputDecoration(
              labelText: l10n.bloodTestLabLabel,
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            minLines: 4,
            maxLines: 6,
            decoration: InputDecoration(
              labelText: l10n.bloodTestSummaryLabel,
              hintText: l10n.bloodTestSummaryHint,
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 24),
          FilledButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(l10n.bloodTestFormWip)),
              );
            },
            child: Text(
              isEditing
                  ? l10n.bloodTestSavePlaceholder
                  : l10n.bloodTestCreatePlaceholder,
            ),
          ),
        ],
      ),
    );
  }
}
