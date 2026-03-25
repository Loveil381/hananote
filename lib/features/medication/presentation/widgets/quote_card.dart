import 'package:flutter/material.dart';
import 'package:hananote/app/theme/hana_colors.dart';

/// A card for displaying warm, encouraging quotes.
class QuoteCard extends StatelessWidget {
  /// Creates a [QuoteCard].
  const QuoteCard({
    required this.quote,
    super.key,
  });

  /// The quote text to display.
  final String quote;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: HanaColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          // Background Placeholder for future cherry blossom image
          Positioned.fill(
            child: Container(
              color: HanaColors.primaryContainer.withAlpha(26), // ~10%
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Icon(
                  Icons.format_quote,
                  color: HanaColors.primary,
                  size: 32,
                ),
                const SizedBox(height: 16),
                Text(
                  quote,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontStyle: FontStyle.italic,
                    color: HanaColors.onSurface,
                    letterSpacing: 1.2,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
