import 'package:flutter/material.dart';
import 'package:hananote/app/theme/hana_colors.dart';
import 'package:hananote/core/l10n/arb/app_localizations.dart';
import 'package:hananote/core/l10n/enum_l10n.dart';
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
                      color: HanaColors.outline,
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
        border: Border.all(color: chipColor.withAlpha(50)),
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
    final l10n = AppLocalizations.of(context)!;
    return category.localizedName(l10n);
  }

  Color _getCategoryColor(DrugCategory category) {
    return switch (category) {
      DrugCategory.estrogen => HanaColors.categoryEstrogen,
      DrugCategory.antiAndrogen => HanaColors.categoryAntiAndrogen,
      DrugCategory.progestogen => HanaColors.categoryProgestogen,
      DrugCategory.auxiliary => HanaColors.categoryAuxiliary,
    };
  }

  String _getRouteName(BuildContext context, AdministrationRoute route) {
    final l10n = AppLocalizations.of(context)!;
    return route.localizedName(l10n);
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
