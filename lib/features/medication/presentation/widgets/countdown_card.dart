// ignore_for_file: lines_longer_than_80_chars
import 'dart:async';
import 'dart:math' as math;
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

  @override
  Widget build(BuildContext context) {
    final remaining = _calculateRemaining();

    return Container(
      decoration: BoxDecoration(
        gradient: HanaGradients.countdownGradient,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: HanaColors.onPrimary.withAlpha((255 * 0.2).round())),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(134, 78, 90, 0.12),
            blurRadius: 32,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            // Decorative 128px blur circle at bottom right
            Positioned(
              right: -32,
              bottom: -32,
              child: Container(
                width: 128,
                height: 128,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: HanaColors.onPrimary.withAlpha((255 * 0.2).round()),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 24,
                    sigmaY: 24,
                  ), // mapped to blur-2xl
                  child: Container(color: Colors.transparent),
                ),
              ),
            ),
            // Medication icon rotated 12 degrees upper right
            Positioned(
              right: 24,
              top: 24,
              child: Transform.rotate(
                angle: 12 * math.pi / 180,
                child: Opacity(
                  opacity: 0.2,
                  child: Icon(
                    Icons.medication,
                    size: 96,
                    color: HanaColors.onPrimary.withAlpha((255 * 0.4).round()),
                  ),
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
                        size: 14, // text-sm is usually 14px
                      ),
                      const SizedBox(width: 8),
                      Text(
                        widget.nextDoseLabel,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2, // tracking-widest roughly
                          color: HanaColors.onPrimaryContainer
                              .withAlpha((255 * 0.7).round()),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  if (widget.isCompleteForToday)
                    Text(
                      widget.completedLabel,
                      style: const TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        fontSize: 32,
                        fontWeight: FontWeight.w800,
                        color: HanaColors.onPrimaryContainer,
                      ),
                    )
                  else
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          '${remaining.$1}',
                          style: const TextStyle(
                            fontFamily: 'Plus Jakarta Sans',
                            fontSize: 40,
                            fontWeight: FontWeight.w800,
                            color: HanaColors.onPrimaryContainer,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          widget.hourUnitLabel,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: HanaColors.onPrimaryContainer,
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ), // Let the spacing match a bit
                        Text(
                          '${remaining.$2}',
                          style: const TextStyle(
                            fontFamily: 'Plus Jakarta Sans',
                            fontSize: 40,
                            fontWeight: FontWeight.w800,
                            color: HanaColors.onPrimaryContainer,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          widget.minuteUnitLabel,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: HanaColors.onPrimaryContainer,
                          ),
                        ),
                      ],
                    ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: HanaColors.onPrimary.withAlpha((255 * 0.4).round()),
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: HanaColors.onPrimary.withAlpha((255 * 0.3).round()),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                        child: Text(
                          '${widget.drugName} ${widget.dosage} · '
                          '${widget.route}',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: HanaColors.onPrimaryContainer,
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
