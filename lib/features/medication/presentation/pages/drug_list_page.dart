import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hananote/core/l10n/arb/app_localizations.dart';
import 'package:hananote/features/medication/domain/entities/drug.dart';
import 'package:hananote/features/medication/presentation/bloc/drug_list_cubit.dart';
import 'package:hananote/features/medication/presentation/bloc/drug_list_state.dart';
import 'package:hananote/features/medication/presentation/widgets/drug_card.dart';

/// Page to list all user medications.
class DrugListPage extends StatefulWidget {
  /// Creates a [DrugListPage].
  const DrugListPage({super.key});

  @override
  State<DrugListPage> createState() => _DrugListPageState();
}

class _DrugListPageState extends State<DrugListPage> {
  @override
  void initState() {
    super.initState();
    context.read<DrugListCubit>().loadDrugs();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.medications),
        centerTitle: true,
      ),
      body: BlocBuilder<DrugListCubit, DrugListState>(
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (msg) => Center(child: Text(msg)),
            loaded: (drugs) {
              if (drugs.isEmpty) {
                return _buildEmptyState(context, l10n, theme);
              }

              final activeDrugs = drugs.where((d) => d.isActive).toList();
              final inactiveDrugs = drugs.where((d) => !d.isActive).toList();

              return ListView(
                padding: const EdgeInsets.only(bottom: 88), // Space for FAB
                children: [
                  if (activeDrugs.isNotEmpty) ...[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
                      child: Text(
                        l10n.active,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                    ),
                    ...activeDrugs.map((d) => _buildDrugItem(context, d, l10n)),
                  ],
                  if (inactiveDrugs.isNotEmpty) ...[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 24, 24, 8),
                      child: Text(
                        l10n.inactive,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                    ...inactiveDrugs
                        .map((d) => _buildDrugItem(context, d, l10n)),
                  ],
                ],
              );
            },
            orElse: () => const SizedBox.shrink(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.push('/add_drug', extra: context.read<DrugListCubit>());
        },
        icon: const Icon(Icons.add),
        label: Text(l10n.addDrug),
      ),
    );
  }

  Widget _buildEmptyState(
    BuildContext context,
    AppLocalizations l10n,
    ThemeData theme,
  ) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.medication_outlined,
            size: 64,
            color: theme.colorScheme.onSurfaceVariant.withAlpha(100),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.noActiveDrugs,
            style: theme.textTheme.titleMedium,
          ),
        ],
      ),
    );
  }

  Widget _buildDrugItem(
    BuildContext context,
    Drug drug,
    AppLocalizations l10n,
  ) {
    return Dismissible(
      key: ValueKey(drug.id),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) async {
        return showDialog<bool>(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text(l10n.delete),
            content: Text(l10n.confirmDeleteDrug),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(ctx).pop(false),
                child: Text(l10n.cancel),
              ),
              FilledButton(
                onPressed: () => Navigator.of(ctx).pop(true),
                style: FilledButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.error,
                  foregroundColor: Theme.of(context).colorScheme.onError,
                ),
                child: Text(l10n.delete),
              ),
            ],
          ),
        );
      },
      onDismissed: (_) {
        context.read<DrugListCubit>().deleteDrug(drug.id);
      },
      background: Container(
        color: Theme.of(context).colorScheme.error,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 24),
        child: Icon(
          Icons.delete,
          color: Theme.of(context).colorScheme.onError,
        ),
      ),
      child: DrugCard(
        drug: drug,
        onTap: () {
          context.push('/edit_schedule/${drug.id}');
        },
        onToggleActive: (_) {
          context.read<DrugListCubit>().toggleDrugActive(drug);
        },
      ),
    );
  }
}
