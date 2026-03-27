import 'package:flutter/material.dart';
import 'package:hananote/app/theme/hana_colors.dart';
import 'package:hananote/core/l10n/arb/app_localizations.dart';

/// Fallback page shown when a subtree throws an unrecoverable UI error.
class ErrorFallbackPage extends StatelessWidget {
  /// Creates an [ErrorFallbackPage].
  const ErrorFallbackPage({this.error, super.key});

  /// Original error object, if one is available.
  final Object? error;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final title = l10n?.errorFallbackTitle ?? 'Something went wrong';
    final description = l10n?.errorFallbackDescription ??
        'Please reopen the app. If the problem continues, contact support.';

    return Scaffold(
      backgroundColor: HanaColors.background,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.error_outline,
                size: 64,
                color: HanaColors.onSurfaceVariant,
              ),
              const SizedBox(height: 16),
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Text(
                description,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: HanaColors.onSurfaceVariant,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
