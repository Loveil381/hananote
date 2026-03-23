import 'package:flutter/material.dart';
import 'package:hananote/app/router.dart';
import 'package:hananote/app/theme/app_theme.dart';

/// Main application widget.
class HanaNote extends StatelessWidget {
  /// Constructor for [HanaNote].
  const HanaNote({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      title: 'HanaNote',
      theme: AppTheme.getTheme(AppThemeType.sakura),
      /*
      localizationsDelegates: const [
        // AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('zh'),
        Locale('ja'),
      ],
      */
    );
  }
}
