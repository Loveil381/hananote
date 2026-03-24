import 'package:go_router/go_router.dart';
import 'package:hananote/features/auth/presentation/pages/auth_wrapper_page.dart';

/// The main application router configuration.
final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const AuthWrapperPage(),
    ),
  ],
);
