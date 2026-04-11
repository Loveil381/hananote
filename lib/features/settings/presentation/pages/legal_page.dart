import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:hananote/app/theme/hana_colors.dart';
import 'package:hananote/core/l10n/arb/app_localizations.dart';

/// The type of legal page to display.
enum LegalPageType {
  /// Privacy policy page.
  privacy,

  /// Terms of use page.
  terms;

  /// Creates a [LegalPageType] from a route parameter string.
  static LegalPageType fromString(String value) {
    return switch (value) {
      'privacy' => LegalPageType.privacy,
      'terms' => LegalPageType.terms,
      _ => LegalPageType.privacy,
    };
  }
}

/// A page that displays legal content (privacy policy or terms of use).
class LegalPage extends StatelessWidget {
  /// Creates a [LegalPage].
  const LegalPage({required this.type, super.key});

  /// The type of legal content to display.
  final LegalPageType type;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final title = switch (type) {
      LegalPageType.privacy => l10n.privacyPolicy,
      LegalPageType.terms => l10n.termsOfUse,
    };

    final content = switch (type) {
      LegalPageType.privacy => l10n.privacyPolicyContent,
      LegalPageType.terms => l10n.termsOfUseContent,
    };

    return Scaffold(
      backgroundColor: HanaColors.background,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(64),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
            child: AppBar(
              backgroundColor:
                  HanaColors.background.withAlpha((255 * 0.8).round()),
              elevation: 0,
              scrolledUnderElevation: 0,
              centerTitle: true,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: HanaColors.primary),
                onPressed: () => Navigator.of(context).pop(),
              ),
              title: Text(
                title,
                style: const TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: HanaColors.primary,
                  letterSpacing: -0.5,
                ),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + kToolbarHeight + 24,
          bottom: MediaQuery.of(context).padding.bottom + 24,
          left: 24,
          right: 24,
        ),
        child: Text(
          content,
          style: const TextStyle(
            fontSize: 15,
            height: 1.7,
            color: HanaColors.onSurface,
          ),
        ),
      ),
    );
  }
}
