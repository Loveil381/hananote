import 'package:flutter/material.dart';
import 'package:hananote/app/theme/hana_colors.dart';

/// A card for the next immediately upcoming medication dose.
class UpcomingDoseCard extends StatelessWidget {
  /// Creates a [UpcomingDoseCard].
  const UpcomingDoseCard({
    required this.name,
    required this.dosage,
    required this.time,
    required this.period,
    this.onTake,
    super.key,
  });

  /// The name of the medication.
  final String name;

  /// The dosage amount.
  final String dosage;

  /// The exact time of the dose.
  final String time;

  /// The period of the dose.
  final String period;

  /// Callback when the take action is pressed.
  final VoidCallback? onTake;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: HanaColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: HanaColors.tertiaryContainer.withAlpha(77),
          width: 2,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: HanaColors.tertiaryContainer.withAlpha(51),
              ),
              child: const Center(
                child: Icon(
                  Icons.calendar_month,
                  color: HanaColors.tertiary,
                  size: 28,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$name $dosage',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: HanaColors.onSurface,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: HanaColors.surfaceContainerHigh,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          period,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: HanaColors.onSurfaceVariant,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        time,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: HanaColors.onSurfaceVariant,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFFFB7C5), Color(0xFFC8A2C8)],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: ElevatedButton(
                onPressed: onTake,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  '服药',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
