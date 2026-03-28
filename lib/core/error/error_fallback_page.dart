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
    final title = l10n?.errorFallbackTitle ?? '\u51FA\u4E86\u70B9\u95EE\u9898';
    final description = l10n?.errorFallbackDescription ??
        '\u8BF7\u91CD\u65B0\u6253\u5F00\u5E94\u7528\u3002'
            '\u5982\u679C\u95EE\u9898\u6301\u7EED\u5B58\u5728\uFF0C'
            '\u8BF7\u8054\u7CFB\u652F\u6301\u3002';

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
