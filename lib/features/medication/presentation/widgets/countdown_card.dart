import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hananote/app/theme/hana_colors.dart';
import 'package:hananote/app/theme/hana_gradients.dart';

/// A card displaying the countdown to the next medication dose.
class CountdownCard extends StatelessWidget {
  /// Creates a [CountdownCard].
  const CountdownCard({
    required this.hours,
    required this.minutes,
    required this.drugName,
    required this.dosage,
    required this.route,
    super.key,
  });

  /// The remaining hours.
  final int hours;

  /// The remaining minutes.
  final int minutes;

  /// The name of the drug.
  final String drugName;

  /// The dosage amount and unit.
  final String dosage;

  /// The route of administration.
  final String route;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        gradient: HanaGradients.countdownGradient,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withAlpha(51)), // white/20
        boxShadow: [
          BoxShadow(
            color: HanaColors.primary.withAlpha(31), // 0.12 opacity
            blurRadius: 32,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            // Bottom Right White Blur Circle
            Positioned(
              bottom: -40,
              right: -40,
              child: Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withAlpha(76), // ~30%
                ),
              ),
            ),
            // Top Right Translucent Rotated Icon
            Positioned(
              top: -16,
              right: -16,
              child: Transform.rotate(
                angle: 12 * 3.1415926 / 180,
                child: Icon(
                  Icons.medication,
                  size: 100,
                  color: Colors.white.withAlpha(51), // 20%
                ),
              ),
            ),
            // Foreground Content
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.schedule,
                        color: HanaColors.onPrimaryContainer,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '下次用药',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: HanaColors.onPrimaryContainer,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        '$hours',
                        style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w800,
                          color: HanaColors.onPrimaryContainer,
                          fontFamily: 'PlusJakartaSans',
                          height: 1,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '小时',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: HanaColors.onPrimaryContainer,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        '$minutes',
                        style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w800,
                          color: HanaColors.onPrimaryContainer,
                          fontFamily: 'PlusJakartaSans',
                          height: 1,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '分钟',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: HanaColors.onPrimaryContainer,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Glassmorphism Pill string
                  ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withAlpha(102), // 40%
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Text(
                          '$drugName · $dosage · $route',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: HanaColors.onPrimaryContainer,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
