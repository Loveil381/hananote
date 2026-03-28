// Release prep note: InventoryPage still relies on a deprecated color API and
// a few long medication labels until the post-release UI cleanup.
// ignore_for_file: deprecated_member_use, lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hananote/core/l10n/arb/app_localizations.dart';
import 'package:hananote/features/medication/domain/usecases/check_inventory.dart';
import 'package:hananote/features/medication/presentation/bloc/inventory_cubit.dart';
import 'package:hananote/features/medication/presentation/bloc/inventory_state.dart';

/// Page displaying stock levels of active medications.
class InventoryPage extends StatefulWidget {
  /// Creates an [InventoryPage].
  const InventoryPage({super.key});

  @override
  State<InventoryPage> createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {
  @override
  void initState() {
    super.initState();
    context.read<InventoryCubit>().loadInventory();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.inventory),
        centerTitle: true,
      ),
      body: BlocBuilder<InventoryCubit, InventoryState>(
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (msg) => Center(child: Text(msg)),
            loaded: (statuses, lowStockCount) {
              if (statuses.isEmpty) {
                return Center(child: Text(l10n.noActiveDrugs));
              }

              return ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: statuses.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  return _buildInventoryCard(
                    context,
                    statuses[index],
                    l10n,
                    theme,
                  );
                },
              );
            },
            orElse: () => const SizedBox.shrink(),
          );
        },
      ),
    );
  }

  Widget _buildInventoryCard(
    BuildContext context,
    InventoryStatus status,
    AppLocalizations l10n,
    ThemeData theme,
  ) {
    final isLowStock = status.isLowStock;

    return Card(
      elevation: 0,
      color: theme.colorScheme.surfaceContainerLow,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: isLowStock
              ? theme.colorScheme.error.withOpacity(0.5)
              : theme.colorScheme.outlineVariant.withAlpha(50),
          width: isLowStock ? 2 : 1,
        ),
      ),
      child: InkWell(
        onTap: () => _showUpdateDialog(context, status, l10n),
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      status.drug.name,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    if (status.daysRemaining != null)
                      Text(
                        l10n.daysLeft(status.daysRemaining!),
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: isLowStock
                              ? theme.colorScheme.error
                              : theme.colorScheme.onSurfaceVariant,
                          fontWeight: isLowStock ? FontWeight.bold : null,
                        ),
                      )
                    else
                      Text(
                        l10n.inventoryDataUnavailable,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurface.withAlpha(128),
                        ),
                      ),
                  ],
                ),
              ),
              if (isLowStock)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.errorContainer,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.warning_amber_rounded,
                        size: 16,
                        color: theme.colorScheme.onErrorContainer,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        l10n.lowStock,
                        style: theme.textTheme.labelMedium?.copyWith(
                          color: theme.colorScheme.onErrorContainer,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _showUpdateDialog(
    BuildContext context,
    InventoryStatus status,
    AppLocalizations l10n,
  ) {
    final controller = TextEditingController();
    showDialog<void>(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: Text(l10n.inventory),
          content: TextField(
            controller: controller,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              hintText: 'New Amount (${status.drug.defaultDosageUnit.name})',
              border: const OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: Text(l10n.cancel),
            ),
            FilledButton(
              onPressed: () {
                final qty = double.tryParse(controller.text.trim());
                if (qty != null) {
                  context
                      .read<InventoryCubit>()
                      .updateStock(status.drug.id, qty);
                }
                Navigator.of(ctx).pop();
              },
              child: Text(l10n.save),
            ),
          ],
        );
      },
    );
  }
}
