import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hananote/app/theme/hana_colors.dart';
import 'package:hananote/core/l10n/arb/app_localizations.dart';
import 'package:hananote/core/l10n/enum_l10n.dart';
import 'package:hananote/features/measurement/domain/entities/measurement_entry.dart';
import 'package:hananote/features/measurement/domain/entities/measurement_type.dart';
import 'package:hananote/features/measurement/presentation/blocs/measurement_bloc.dart';
import 'package:intl/intl.dart';

/// History page for body measurements.
class MeasurementPage extends StatelessWidget {
  /// Creates a [MeasurementPage].
  const MeasurementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<MeasurementBloc, MeasurementState>(
      listener: (context, state) {
        if (state is MeasurementError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      child: Scaffold(
        backgroundColor: HanaColors.background,
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.bodyMeasurementsTitle),
          backgroundColor: HanaColors.surface,
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () => _openEditor(context),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => _openEditor(context),
          icon: const Icon(Icons.add),
          label: Text(AppLocalizations.of(context)!.newMeasurement),
        ),
        body: BlocBuilder<MeasurementBloc, MeasurementState>(
          builder: (context, state) {
            return switch (state) {
              MeasurementInitial() || MeasurementLoading() => const Center(
                  child: CircularProgressIndicator(),
                ),
              MeasurementError() => const SizedBox.shrink(),
              MeasurementSaving() => const Center(
                  child: CircularProgressIndicator(),
                ),
              MeasurementSaved() => const SizedBox.shrink(),
              MeasurementLoaded(:final entries) => entries.isEmpty
                  ? const _MeasurementEmptyState()
                  : ListView.separated(
                      padding: const EdgeInsets.all(16),
                      itemBuilder: (context, index) {
                        final entry = entries[index];
                        return _MeasurementHistoryCard(entry: entry);
                      },
                      separatorBuilder: (_, __) => const SizedBox(height: 12),
                      itemCount: entries.length,
                    ),
            };
          },
        ),
      ),
    );
  }

  Future<void> _openEditor(
    BuildContext context, {
    MeasurementEntry? entry,
  }) async {
    final didSave = await context.push<bool>(
      '/measurement/edit',
      extra: entry,
    );
    if ((didSave ?? false) && context.mounted) {
      context.read<MeasurementBloc>().add(
            const MeasurementEvent.loadHistory(),
          );
    }
  }
}

class _MeasurementEmptyState extends StatelessWidget {
  const _MeasurementEmptyState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: HanaColors.secondaryContainer.withAlpha(90),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.straighten,
                size: 56,
                color: HanaColors.secondary,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              AppLocalizations.of(context)!.startRecordingChanges,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: HanaColors.primary,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              AppLocalizations.of(context)!.measurementEmptyHint,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: HanaColors.onSurfaceVariant,
                  ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _MeasurementHistoryCard extends StatelessWidget {
  const _MeasurementHistoryCard({required this.entry});

  final MeasurementEntry entry;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: HanaColors.surfaceContainerLowest,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () async {
          final didSave = await context.push<bool>(
            '/measurement/edit',
            extra: entry,
          );
          if ((didSave ?? false) && context.mounted) {
            context.read<MeasurementBloc>().add(
                  const MeasurementEvent.loadHistory(),
                );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DateFormat('yyyy.MM.dd').format(entry.date),
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _buildSummary(
                        entry,
                        AppLocalizations.of(context)!,
                      ),
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: HanaColors.onSurfaceVariant,
                          ),
                    ),
                    if ((entry.notes ?? '').trim().isNotEmpty) ...[
                      const SizedBox(height: 8),
                      Text(
                        entry.notes!,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: HanaColors.outline,
                            ),
                      ),
                    ],
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.delete_outline),
                onPressed: () async {
                  final l10n = AppLocalizations.of(context)!;
                  final confirmed = await showDialog<bool>(
                    context: context,
                    builder: (dialogContext) => AlertDialog(
                      title: Text(l10n.deleteMeasurementTitle),
                      content: Text(l10n.deleteMeasurementConfirm),
                      actions: [
                        TextButton(
                          onPressed: () =>
                              Navigator.of(dialogContext).pop(false),
                          child: Text(l10n.cancel),
                        ),
                        TextButton(
                          onPressed: () =>
                              Navigator.of(dialogContext).pop(true),
                          child: Text(l10n.delete),
                        ),
                      ],
                    ),
                  );

                  if ((confirmed ?? false) && context.mounted) {
                    context.read<MeasurementBloc>().add(
                          MeasurementEvent.deleteMeasurement(entry.id),
                        );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  static String _buildSummary(
    MeasurementEntry entry,
    AppLocalizations l10n,
  ) {
    final parts = <String>[];
    for (final type in MeasurementTypes.summary) {
      final value = entry.valueFor(type);
      if (value != null) {
        parts.add(
          '${type.localizedName(l10n)}: '
          '${_formatValue(value)}${type.unit}',
        );
      }
    }

    if (parts.isEmpty) {
      for (final type in MeasurementTypes.all) {
        final value = entry.valueFor(type);
        if (value != null) {
          parts.add(
            '${type.localizedName(l10n)}: '
            '${_formatValue(value)}${type.unit}',
          );
        }
        if (parts.length == 3) {
          break;
        }
      }
    }

    return parts.isEmpty ? l10n.measurementRecorded : parts.join(' · ');
  }

  static String _formatValue(double value) {
    return value == value.roundToDouble()
        ? value.toStringAsFixed(0)
        : value.toStringAsFixed(1);
  }
}
