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
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: HanaColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: HanaColors.primaryFixed.withAlpha((255 * 0.3).round()),
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Icon(
                    Icons.medication,
                    color: HanaColors.primary,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$name $dosage',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: HanaColors.onSurface,
                    ),
                  ),
                  Text(
                    time,
                    style: TextStyle(
                      fontSize: 14,
                      color: HanaColors.onSurfaceVariant
                          .withAlpha((255 * 0.7).round()),
                    ),
                  ),
                ],
              ),
            ],
          ),
          if (isTaken)
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: HanaColors.secondaryContainer
                    .withAlpha((255 * 0.5).round()),
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Icon(
                  Icons.check,
                  color: HanaColors.secondary,
                  size: 18,
                  weight: 700,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
