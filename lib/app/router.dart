import 'package:go_router/go_router.dart';
import 'package:hananote/app/pages/home_page.dart';
import 'package:hananote/features/auth/presentation/pages/auth_wrapper_page.dart';
import 'package:hananote/features/medication/presentation/pages/add_drug_page.dart';
import 'package:hananote/features/medication/presentation/pages/schedule_editor_page.dart';

/// The main application router configuration.
final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const AuthWrapperPage(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/add_drug',
      builder: (context, state) => const AddDrugPage(),
    ),
    GoRoute(
      path: '/edit_schedule',
      builder: (context, state) => const ScheduleEditorPage(),
    ),
  ],
);
