// ignore_for_file: public_member_api_docs, lines_longer_than_80_chars, comment_references

import 'package:flutter/material.dart';
import 'package:hananote/core/l10n/arb/app_localizations.dart';
import 'package:hananote/features/medication/domain/entities/enums.dart';
import 'package:hananote/features/medication/domain/usecases/get_today_schedule.dart';

/// A card displaying a due or completed scheduled dose for today.
class TodayDoseCard extends StatelessWidget {
  /// Creates a [TodayDoseCard].
  const TodayDoseCard({
    required this.item,
    required this.onTake,
    required this.onSkip,
    super.key,
  });

  /// The schedule item for today.
  final TodayScheduleItem item;

  /// Callback when [Take] is selected.
  final VoidCallback onTake;

  /// Callback when [Skip] is selected.
  final VoidCallback onSkip;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final drug = item.drug;
    final schedule = item.schedule;

    final isDone = item.isCompleted;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 0,
      color: isDone
          ? theme.colorScheme.surfaceContainerHighest.withAlpha(150)
          : theme.colorScheme.surfaceContainerLow,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: isDone
              ? Colors.transparent
              : theme.colorScheme.outlineVariant.withAlpha(50),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    _getRouteIcon(drug.administrationRoute),
                    color: theme.colorScheme.onPrimaryContainer,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        drug.name,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          decoration:
                              isDone ? TextDecoration.lineThrough : null,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${schedule.dosageAmount} ${schedule.dosageUnit.name}',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Text(
                    isDone ? l10n.completedDose : _getNextTimePlaceholder(l10n),
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: isDone
                          ? Colors.green
                          : theme.colorScheme.onSurfaceVariant,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                if (!isDone) ...[
                  TextButton(
                    onPressed: onSkip,
                    child: Text(
                      l10n.skipDose,
                      style: TextStyle(color: theme.colorScheme.error),
                    ),
                  ),
                  const SizedBox(width: 8),
                  FilledButton.tonal(
                    onPressed: onTake,
                    child: Text(l10n.takeDose),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _getNextTimePlaceholder(AppLocalizations l10n) {
    if (item.scheduledDateTimes.isEmpty) return l10n.today;
    // Just a basic heuristic for UI presentation
    final now = DateTime.now();
    for (final time in item.scheduledDateTimes) {
      if (time.isAfter(now)) {
        return l10n.nextTime(
          '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}',
        );
      }
    }
    return l10n.today;
  }

  IconData _getRouteIcon(AdministrationRoute route) {
    return switch (route) {
      AdministrationRoute.oral => Icons.medication,
      AdministrationRoute.sublingual => Icons.arrow_drop_down_circle,
      AdministrationRoute.transdermalPatch => Icons.healing,
      AdministrationRoute.transdermalGel => Icons.water_drop,
      AdministrationRoute.intramuscularInjection => Icons.vaccines,
      AdministrationRoute.subcutaneousInjection => Icons.vaccines,
      AdministrationRoute.rectal => Icons.arrow_downward,
    };
  }
}
