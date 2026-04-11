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
    // bg-surface-container-low p-8 rounded-lg text-center
    return Container(
      clipBehavior: Clip.antiAlias,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: HanaColors.surfaceContainerLowOf(context),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Icon(
            Icons.format_quote,
            color: HanaColors.primaryOf(context).withAlpha(102), // primary/40%
            size: 32,
          ),
          const SizedBox(height: 12), // mb-3 from icon equivalent
          Text(
            quote,
            textAlign: TextAlign.center,
            // text-lg font-medium text-on-surface tracking-wide italic
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic,
              color: HanaColors.onSurfaceOf(context),
              letterSpacing: 0.5, // tracking-wide roughly matches this
            ),
          ),
        ],
      ),
    );
  }
}
