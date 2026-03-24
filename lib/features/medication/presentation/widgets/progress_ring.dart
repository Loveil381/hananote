import 'package:flutter/material.dart';

/// A circular progress ring that displays the completed ratio of daily doses.
class ProgressRing extends StatelessWidget {
  /// Creates a [ProgressRing].
  const ProgressRing({
    required this.completedCount,
    required this.totalCount,
    super.key,
  });

  /// The number of completed doses.
  final int completedCount;

  /// The total number of prescribed doses.
  final int totalCount;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final percentage = totalCount == 0 ? 0.0 : completedCount / totalCount;
    final displayPercent = (percentage * 100).toInt();

    return SizedBox(
      width: 120,
      height: 120,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 120,
            height: 120,
            child: CircularProgressIndicator(
              value: percentage,
              strokeWidth: 8,
              backgroundColor: theme.colorScheme.surfaceContainerHighest,
              color: theme.colorScheme.primary,
              strokeCap: StrokeCap.round,
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '$displayPercent%',
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.primary,
                ),
              ),
              Text(
                '$completedCount / $totalCount',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
