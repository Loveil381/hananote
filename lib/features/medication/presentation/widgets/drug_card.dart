import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hananote/features/medication/domain/entities/drug.dart';
import 'package:hananote/features/medication/domain/entities/enums.dart';

/// A card displaying drug details in the inventory or drug list.
class DrugCard extends StatelessWidget {
  /// Creates a [DrugCard].
  const DrugCard({
    required this.drug,
    this.onTap,
    this.onToggleActive,
    super.key,
  });

  /// The drug to display.
  final Drug drug;

  /// Callback when the card is tapped.
  final VoidCallback? onTap;

  /// Callback to toggle the active state.
  final ValueChanged<bool>? onToggleActive;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    return Card(
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 0,
      color: theme.colorScheme.surfaceContainerLow,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: theme.colorScheme.outlineVariant.withAlpha(50),
        ),
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          drug.name,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (drug.genericName.isNotEmpty) ...[
                          const SizedBox(height: 4),
                          Text(
                            drug.genericName,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  if (onToggleActive != null)
                    Switch(
                      value: drug.isActive,
                      onChanged: onToggleActive,
                    ),
                ],
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  _buildChip(
                    context,
                    label: _getCategoryName(context, drug.category),
                    color: _getCategoryColor(drug.category),
                  ),
                  _buildChip(
                    context,
                    label: _getRouteName(context, drug.administrationRoute),
                    icon: _getRouteIcon(drug.administrationRoute),
                  ),
                  if (!drug.isActive)
                    _buildChip(
                      context,
                      label: l10n.inactive,
                      color: Colors.grey,
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChip(
    BuildContext context, {
    required String label,
    Color? color,
    IconData? icon,
  }) {
    final theme = Theme.of(context);
    final chipColor = color ?? theme.colorScheme.primary;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: chipColor.withAlpha(25),
        borderRadius: BorderRadius.circular(8),
        border: BorderSide(color: chipColor.withAlpha(50)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 14, color: chipColor),
            const SizedBox(width: 4),
          ],
          Text(
            label,
            style: theme.textTheme.labelSmall?.copyWith(
              color: chipColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  String _getCategoryName(BuildContext context, DrugCategory category) {
    // Ideally this would come from ARB, but for simplicity:
    return category.name.toUpperCase();
  }

  Color _getCategoryColor(DrugCategory category) {
    return switch (category) {
      DrugCategory.estrogen => Colors.pink,
      DrugCategory.antiAndrogen => Colors.blue,
      DrugCategory.progestogen => Colors.purple,
      DrugCategory.auxiliary => Colors.teal,
    };
  }

  String _getRouteName(BuildContext context, AdministrationRoute route) {
    return route.name; // In a real app this uses l10n
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
