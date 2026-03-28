import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hananote/app/theme/hana_colors.dart';
import 'package:hananote/app/theme/hana_gradients.dart';

/// A card displaying the countdown to the next medication dose.
class CountdownCard extends StatefulWidget {
  /// Creates a [CountdownCard].
  const CountdownCard({
    required this.drugName,
    required this.dosage,
    required this.route,
    required this.nextDoseLabel,
    required this.completedLabel,
    required this.hourUnitLabel,
    required this.minuteUnitLabel,
    this.nextScheduledTime,
    this.isCompleteForToday = false,
    super.key,
  });

  /// The name of the drug.
  final String drugName;

  /// The dosage amount and unit.
  final String dosage;

  /// The route of administration.
  final String route;

  /// Localized heading above the countdown.
  final String nextDoseLabel;

  /// Localized completion label shown when today's schedule is finished.
  final String completedLabel;

  /// Localized hour unit label.
  final String hourUnitLabel;

  /// Localized minute unit label.
  final String minuteUnitLabel;

  /// The next due time for the reminder.
  final DateTime? nextScheduledTime;

  /// Whether all doses for today are already complete.
  final bool isCompleteForToday;

  @override
  State<CountdownCard> createState() => _CountdownCardState();
}

class _CountdownCardState extends State<CountdownCard> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(minutes: 1), (_) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final remaining = _calculateRemaining();

    return Container(
      decoration: BoxDecoration(
        gradient: HanaGradients.countdownGradient,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withAlpha(51)),
        boxShadow: [
          BoxShadow(
            color: HanaColors.primary.withAlpha(31),
            blurRadius: 32,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            Positioned(
              bottom: -40,
              right: -40,
              child: Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withAlpha(76),
                ),
              ),
            ),
            Positioned(
              top: -16,
              right: -16,
              child: Transform.rotate(
                angle: 12 * 3.1415926 / 180,
                child: Icon(
                  Icons.medication,
                  size: 100,
                  color: Colors.white.withAlpha(51),
                ),
              ),
            ),
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
                        widget.nextDoseLabel,
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
                      if (widget.isCompleteForToday)
                        Text(
                          widget.completedLabel,
                          style: theme.textTheme.headlineSmall?.copyWith(
                            color: HanaColors.onPrimaryContainer,
                            fontWeight: FontWeight.w800,
                            height: 1.1,
                          ),
                        ),
                      if (!widget.isCompleteForToday) ...[
                        Text(
                          '${remaining.$1}',
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
                          widget.hourUnitLabel,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: HanaColors.onPrimaryContainer,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          '${remaining.$2}',
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
                          widget.minuteUnitLabel,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: HanaColors.onPrimaryContainer,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 24),
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
                          color: Colors.white.withAlpha(102),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Text(
                          '${widget.drugName} · ${widget.dosage} · ${widget.route}',
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

  (int, int) _calculateRemaining() {
    if (widget.isCompleteForToday || widget.nextScheduledTime == null) {
      return (0, 0);
    }

    final diff = widget.nextScheduledTime!.difference(DateTime.now());
    if (diff.isNegative) {
      return (0, 0);
    }

    return (diff.inHours, diff.inMinutes % 60);
  }
}
