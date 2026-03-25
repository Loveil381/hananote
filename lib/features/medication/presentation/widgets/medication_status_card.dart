import 'package:flutter/material.dart';
import 'package:hananote/app/theme/hana_colors.dart';

/// A card displaying the current status of a medication dose.
class MedicationStatusCard extends StatelessWidget {
  /// Creates a [MedicationStatusCard].
  const MedicationStatusCard({
    required this.name,
    required this.dosage,
    required this.time,
    required this.isTaken,
    required this.accentColor,
    super.key,
  });

  /// The name of the medication.
  final String name;

  /// The dosage amount and unit.
  final String dosage;

  /// The time of the dose.
  final String time;

  /// Whether the dose has been taken.
  final bool isTaken;

  /// The accent color for the icon background.
  final Color accentColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      color: HanaColors.surfaceContainerLowest,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              // Left Icon
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: accentColor.withAlpha(77), // ~30%
                ),
                child: Center(
                  child: Icon(
                    Icons.medication,
                    color: accentColor,
                    size: 24,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              // Middle Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: HanaColors.onSurface,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '$dosage · $time',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: HanaColors.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              // Right Status
              if (isTaken)
                Container(
                  width: 24,
                  height: 24,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: HanaColors.primary,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.check,
                      color: HanaColors.onPrimary,
                      size: 16,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
