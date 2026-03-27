// Release prep note: These internal widgets stay undocumented, and a few sheet
// labels remain intentionally unwrapped for readability.
// ignore_for_file: public_member_api_docs, lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:hananote/core/l10n/arb/app_localizations.dart';
import 'package:hananote/features/medication/domain/entities/enums.dart';

/// A bottom sheet that gathers extra details for doses requiring sites/counts.
class DoseActionSheet extends StatefulWidget {
  const DoseActionSheet({
    required this.route,
    super.key,
  });

  /// The route being administered.
  final AdministrationRoute route;

  /// Displays the sheet and returns the gathered details.
  static Future<DoseResult?> show(
    BuildContext context, {
    required AdministrationRoute route,
  }) {
    return showModalBottomSheet<DoseResult>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) => DoseActionSheet(route: route),
    );
  }

  @override
  State<DoseActionSheet> createState() => _DoseActionSheetState();
}

class _DoseActionSheetState extends State<DoseActionSheet> {
  InjectionSite? _injectionSite;
  PatchSite? _patchSite;
  int? _patchCount;
  int? _gelPumps;
  final _notesController = TextEditingController();

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Padding(
      padding: EdgeInsets.only(
        left: 24,
        right: 24,
        top: 24,
        bottom: 24 + bottomInset,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            l10n.takeDose,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          if (widget.route.isInjection) ...[
            Text(l10n.injectionSite, style: theme.textTheme.labelLarge),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: InjectionSite.values.map((site) {
                return ChoiceChip(
                  label: Text(site.name),
                  selected: _injectionSite == site,
                  onSelected: (val) {
                    if (val) setState(() => _injectionSite = site);
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
          ],
          if (widget.route.isPatch) ...[
            Text(l10n.patchSite, style: theme.textTheme.labelLarge),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: PatchSite.values.map((site) {
                return ChoiceChip(
                  label: Text(site.name),
                  selected: _patchSite == site,
                  onSelected: (val) {
                    if (val) setState(() => _patchSite = site);
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            Text(l10n.quantity, style: theme.textTheme.labelLarge),
            const SizedBox(height: 8),
            DropdownButtonFormField<int>(
              initialValue: _patchCount ?? 1,
              decoration: const InputDecoration(border: OutlineInputBorder()),
              items: [1, 2, 3, 4]
                  .map((e) => DropdownMenuItem(value: e, child: Text('$e')))
                  .toList(),
              onChanged: (val) => setState(() => _patchCount = val),
            ),
            const SizedBox(height: 16),
          ],
          if (widget.route.isGel) ...[
            Text(l10n.quantity, style: theme.textTheme.labelLarge),
            const SizedBox(height: 8),
            DropdownButtonFormField<int>(
              initialValue: _gelPumps ?? 1,
              decoration: const InputDecoration(border: OutlineInputBorder()),
              items: List.generate(10, (i) => i + 1)
                  .map((e) => DropdownMenuItem(value: e, child: Text('$e')))
                  .toList(),
              onChanged: (val) => setState(() => _gelPumps = val),
            ),
            const SizedBox(height: 16),
          ],
          TextField(
            controller: _notesController,
            decoration: InputDecoration(
              labelText: l10n.notes,
              border: const OutlineInputBorder(),
            ),
            maxLines: 2,
          ),
          const SizedBox(height: 24),
          FilledButton(
            onPressed: () {
              Navigator.of(context).pop(
                DoseResult(
                  injectionSite: _injectionSite,
                  patchSite: _patchSite,
                  patchCount: _patchCount,
                  gelPumps: _gelPumps,
                  notes: _notesController.text.trim().isEmpty
                      ? null
                      : _notesController.text.trim(),
                ),
              );
            },
            child: Text(l10n.confirm),
          ),
        ],
      ),
    );
  }
}

/// The extra details gathered before taking a dose.
class DoseResult {
  const DoseResult({
    this.injectionSite,
    this.patchSite,
    this.patchCount,
    this.gelPumps,
    this.notes,
  });

  final InjectionSite? injectionSite;
  final PatchSite? patchSite;
  final int? patchCount;
  final int? gelPumps;
  final String? notes;
}
