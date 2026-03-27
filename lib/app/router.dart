import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hananote/app/di/injection.dart';
import 'package:hananote/app/presentation/main_shell.dart';
import 'package:hananote/features/auth/presentation/pages/auth_wrapper_page.dart';
import 'package:hananote/features/blood_test/presentation/bloc/blood_test_bloc.dart';
import 'package:hananote/features/blood_test/presentation/bloc/blood_test_event.dart';
import 'package:hananote/features/blood_test/presentation/pages/data_page.dart';
import 'package:hananote/features/journal/presentation/bloc/record_bloc.dart';
import 'package:hananote/features/journal/presentation/bloc/record_event.dart';
import 'package:hananote/features/journal/presentation/pages/journal_edit_page.dart';
import 'package:hananote/features/journal/presentation/pages/record_page.dart';
import 'package:hananote/features/medication/presentation/bloc/today_schedule_bloc.dart';
import 'package:hananote/features/medication/presentation/bloc/today_schedule_event.dart';
import 'package:hananote/features/medication/presentation/pages/add_drug_page.dart';
import 'package:hananote/features/medication/presentation/pages/schedule_editor_page.dart';
import 'package:hananote/features/medication/presentation/pages/today_page.dart';
import 'package:hananote/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:hananote/features/settings/presentation/pages/profile_page.dart';
import 'package:hananote/features/timeline/presentation/bloc/timeline_bloc.dart';
import 'package:hananote/features/timeline/presentation/bloc/timeline_event.dart';
import 'package:hananote/features/timeline/presentation/pages/timeline_page.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

/// The main application router configuration.
final GoRouter appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const AuthWrapperPage(),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainShell(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/today',
              builder: (context, state) => BlocProvider(
                create: (_) =>
                    getIt<TodayScheduleBloc>()..add(const LoadTodaySchedule()),
                child: const TodayPage(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/record',
              builder: (context, state) => BlocProvider(
                create: (_) =>
                    getIt<RecordBloc>()..add(const LoadRecordSummary()),
                child: const RecordPage(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/timeline',
              builder: (context, state) => BlocProvider(
                create: (_) =>
                    getIt<TimelineBloc>()..add(const LoadTimeline()),
                child: const TimelinePage(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/data',
              builder: (context, state) => BlocProvider(
                create: (_) =>
                    getIt<BloodTestBloc>()..add(const LoadBloodTestDashboard()),
                child: const DataPage(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/profile',
              builder: (context, state) => BlocProvider.value(
                value: getIt<SettingsBloc>(),
                child: const ProfilePage(),
              ),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: '/add_drug',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => const AddDrugPage(),
    ),
    GoRoute(
      path: '/edit_schedule',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => const ScheduleEditorPage(),
    ),
    GoRoute(
      path: '/journal/edit',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => const JournalEditPage(),
    ),
  ],
);
