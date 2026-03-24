import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:hananote/features/medication/presentation/bloc/today_schedule_bloc.dart';
import 'package:hananote/features/medication/presentation/bloc/today_schedule_event.dart';
import 'package:hananote/features/medication/presentation/bloc/today_schedule_state.dart';
import 'package:hananote/features/medication/presentation/widgets/dose_action_sheet.dart';
import 'package:hananote/features/medication/presentation/widgets/progress_ring.dart';
import 'package:hananote/features/medication/presentation/widgets/today_dose_card.dart';

/// The main page showing today's schedule.
class TodayPage extends StatefulWidget {
  /// Creates a [TodayPage].
  const TodayPage({super.key});

  @override
  State<TodayPage> createState() => _TodayPageState();
}

class _TodayPageState extends State<TodayPage> {
  @override
  void initState() {
    super.initState();
    context.read<TodayScheduleBloc>().add(LoadTodaySchedule());
  }

  String _getGreeting(AppLocalizations l10n) {
    final hour = DateTime.now().hour;
    if (hour < 12) return l10n.goodMorning;
    if (hour < 18) return l10n.goodAfternoon;
    return l10n.goodEvening;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final now = DateTime.now();
    // simple date formatting
    final dateStr = '${now.month}/${now.day}';

    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<TodayScheduleBloc, TodayScheduleState>(
          builder: (context, state) {
            return state.maybeWhen(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (msg) => Center(child: Text(msg)),
              loaded: (items, date, completedCount, totalCount) {
                if (items.isEmpty) {
                  return _buildEmptyState(context, l10n, theme);
                }

                returnCustomScrollView(
                  context,
                  l10n,
                  theme,
                  dateStr,
                  completedCount,
                  totalCount,
                  items,
                );
              },
              orElse: () => const SizedBox.shrink(),
            );
          },
        ),
      ),
    );
  }

  Widget returnCustomScrollView(
    BuildContext context,
    AppLocalizations l10n,
    ThemeData theme,
    String dateStr,
    int completedCount,
    int totalCount,
    dynamic items,
  ) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dateStr,
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      _getGreeting(l10n),
                      style: theme.textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                ProgressRing(
                  completedCount: completedCount,
                  totalCount: totalCount,
                ),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(bottom: 24),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final item = items[index];
                return TodayDoseCard(
                  item: item,
                  onTake: () => _handleTake(context, item),
                  onSkip: () => _handleSkip(context, item),
                );
              },
              childCount: items.length,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEmptyState(
    BuildContext context,
    AppLocalizations l10n,
    ThemeData theme,
  ) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.medication_liquid_outlined,
            size: 64,
            color: theme.colorScheme.onSurfaceVariant.withAlpha(100),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.noActiveDrugs,
            style: theme.textTheme.titleMedium,
          ),
          const SizedBox(height: 24),
          FilledButton.icon(
            onPressed: () {
              // Note: you may need to import go_router to use context.push
              GoRouter.of(context).push('/add_drug');
            },
            icon: const Icon(Icons.add),
            label: Text(l10n.addFirstDrug),
          ),
        ],
      ),
    );
  }

  Future<void> _handleTake(BuildContext context, dynamic item) async {
    final bloc = context.read<TodayScheduleBloc>();
    final route = item.drug.administrationRoute;
    DoseResult? result;

    if (route.name.contains('Injection') ||
        route.name.contains('Patch') ||
        route.name.contains('Gel')) {
      result = await DoseActionSheet.show(context, route: route);
      if (result == null) return; // User cancelled
    }

    bloc.add(
      LogDoseTodaySchedule(
        schedule: item.schedule,
        drug: item.drug,
        injectionSite: result?.injectionSite,
        patchSite: result?.patchSite,
        patchCount: result?.patchCount,
        gelPumps: result?.gelPumps,
        notes: result?.notes,
        skinReaction: null,
      ),
    );
  }

  void _handleSkip(BuildContext context, dynamic item) {
    context.read<TodayScheduleBloc>().add(
          SkipDoseTodaySchedule(
            schedule: item.schedule,
            drug: item.drug,
            notes: 'Skipped from Today page',
          ),
        );
  }
}
