import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// The main application router configuration.
final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) =>
          const Scaffold(body: Center(child: Text('HanaNote v0.1.0+1'))),
    ),
  ],
);
