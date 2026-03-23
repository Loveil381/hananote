import 'package:flutter/material.dart';
import 'package:hananote/app/router.dart';

/// Main application widget.
class HanaNote extends StatelessWidget {
  /// Constructor for [HanaNote].
  const HanaNote({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      title: 'HanaNote',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pinkAccent),
        useMaterial3: true,
      ),
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
