// Release prep note: This page keeps long medication copy and route literals
// on one line because wrapping makes the card layout harder to scan.
// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hananote/app/theme/hana_colors.dart';
import 'package:hananote/features/medication/domain/usecases/get_today_schedule.dart';
import 'package:hananote/features/medication/presentation/bloc/today_schedule_bloc.dart';
import 'package:hananote/features/medication/presentation/bloc/today_schedule_event.dart';
import 'package:hananote/features/medication/presentation/bloc/today_schedule_state.dart';
import 'package:hananote/features/medication/presentation/widgets/countdown_card.dart';
import 'package:hananote/features/medication/presentation/widgets/medication_status_card.dart';
import 'package:hananote/features/medication/presentation/widgets/quote_card.dart';
import 'package:hananote/features/medication/presentation/widgets/upcoming_dose_card.dart';
import 'package:hananote/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:hananote/features/settings/presentation/bloc/settings_state.dart';

/// The main dashboard page for the current day's health tracking.
class TodayPage extends StatelessWidget {
  /// Creates a [TodayPage].
  const TodayPage({super.key});

  static const _dailyQuotes = [
    '你的每一点坚持，都在悄悄靠近更自在的自己。',
    '身体的变化需要时间，温柔地陪自己走下去。',
    '记录今天，也是为了更清楚地看见未来的你。',
    '稳定和耐心，本身就是一种很强大的力量。',
    '你认真照顾自己的样子，值得被温柔对待。',
    '哪怕只是小小一步，也是在向想成为的自己前进。',
    '请相信，今天的努力会在未来慢慢发光。',
    '允许自己慢一点，但不要否认已经走过的路。',
    '你的感受和变化都真实而重要，值得被认真记录。',
    '愿你在每一次回看时，都能看见自己的勇敢。',
    '今天也请把关心留给自己一点点。',
    '你不是在追赶谁，你是在稳稳地成为自己。',
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final settingsState = context.watch<SettingsBloc>().state;
    final displayName = settingsState is SettingsLoaded
        ? settingsState.profile.displayName
        : 'HanaNote \u7528\u6237';
    final hrtDays =
        settingsState is SettingsLoaded ? settingsState.profile.hrtDayCount : 0;
    final hour = DateTime.now().hour;
    final greeting = hour < 12
        ? '\u65E9\u5B89'
        : hour < 18
            ? '\u5348\u5B89'
            : '\u665A\u4E0A\u597D';
    final dailyQuote = _dailyQuotes[DateTime.now().day % _dailyQuotes.length];

    return Scaffold(
      backgroundColor: HanaColors.background,
      body: SafeArea(
        bottom: false,
        child: BlocBuilder<TodayScheduleBloc, TodayScheduleState>(
          builder: (context, state) {
            return CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 16,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.auto_awesome,
                          color: HanaColors.primary,
                          size: 28,
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: HanaColors.surfaceContainerHigh,
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.calendar_today,
                              color: HanaColors.onSurfaceVariant,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 16)),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              [greeting, displayName].join('\uFF0C'),
                              style: theme.textTheme.headlineLarge?.copyWith(
                                color: HanaColors.onSurface,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              ['HRT \u7B2C ', hrtDays.toString(), ' \u5929']
                                  .join(),
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: HanaColors.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                        const CircleAvatar(
                          radius: 28,
                          backgroundColor: HanaColors.primaryContainer,
                          child: Icon(
                            Icons.person,
                            color: HanaColors.onPrimaryContainer,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 32)),
                ..._buildStateContent(context, state, theme),
                const SliverPadding(padding: EdgeInsets.only(bottom: 120)),
              ],
            );
          },
        ),
      ),
    );
  }

  List<Widget> _buildStateContent(
    BuildContext context,
    TodayScheduleState state,
    ThemeData theme,
  ) {
    return state.when(
      initial: () => [
        const SliverFillRemaining(
          hasScrollBody: false,
          child: Center(child: CircularProgressIndicator()),
        ),
      ],
      loading: () => [
        const SliverFillRemaining(
          hasScrollBody: false,
          child: Center(child: CircularProgressIndicator()),
        ),
      ],
      error: (message) => [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(message, style: const TextStyle(color: Colors.red)),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => context
                      .read<TodayScheduleBloc>()
                      .add(const LoadTodaySchedule()),
                  child: const Text('\u91CD\u8BD5'),
                ),
              ],
            ),
          ),
        ),
      ],
      loaded: (items, date, completedCount, totalCount) {
        if (items.isEmpty) {
          return [
            const SliverFillRemaining(
              hasScrollBody: false,
              child: Center(
                child: Text('\u6682\u65E0\u7528\u836F\u8BB0\u5F55'),
              ),
            ),
          ];
        }

        final now = DateTime.now();
        TodayScheduleItem? upcoming;
        DateTime? upcomingTime;

        final uncompletedItems =
            items.where((item) => !item.isCompleted).toList();
        for (final item in uncompletedItems) {
          for (final dateTime in item.scheduledDateTimes) {
            if (!dateTime.isAfter(now)) {
              continue;
            }
            if (upcomingTime == null || dateTime.isBefore(upcomingTime)) {
              upcomingTime = dateTime;
              upcoming = item;
            }
          }
        }

        upcoming ??=
            uncompletedItems.isNotEmpty ? uncompletedItems.first : null;
        upcomingTime ??= upcoming?.scheduledDateTimes.firstOrNull ??
            DateTime.now().add(const Duration(hours: 1));

        final widgets = <Widget>[];
        final countdownDrug = upcoming ?? items.first;

        widgets.addAll([
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: CountdownCard(
                nextScheduledTime: upcomingTime,
                isCompleteForToday: uncompletedItems.isEmpty,
                drugName: countdownDrug.drug.name,
                dosage:
                    '${countdownDrug.schedule.dosageAmount}${countdownDrug.schedule.dosageUnit.name}',
                route: countdownDrug.schedule.administrationRoute.name,
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 32)),
        ]);

        final completedItems = items.where((item) => item.isCompleted).toList();
        if (completedItems.isNotEmpty) {
          widgets.addAll([
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  '\u5DF2\u670D\u836F',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: HanaColors.onSurface,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: completedItems.map((item) {
                    final firstTime = item.scheduledDateTimes.firstOrNull;
                    final timeText = firstTime != null
                        ? '${firstTime.hour.toString().padLeft(2, '0')}:${firstTime.minute.toString().padLeft(2, '0')}'
                        : '\u5168\u5929';

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: MedicationStatusCard(
                        name: item.drug.name,
                        dosage:
                            '${item.schedule.dosageAmount}${item.schedule.dosageUnit.name}',
                        time: timeText,
                        isTaken: true,
                        accentColor: HanaColors.primaryFixed,
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 32)),
          ]);
        }

        if (uncompletedItems.isNotEmpty) {
          widgets.addAll([
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  '\u5F85\u670D\u836F',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: HanaColors.onSurface,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: uncompletedItems.map((item) {
                    final firstTime = item.scheduledDateTimes.firstOrNull;
                    final timeText = firstTime != null
                        ? '${firstTime.hour.toString().padLeft(2, '0')}:${firstTime.minute.toString().padLeft(2, '0')}'
                        : '\u5168\u5929';

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: UpcomingDoseCard(
                        name: item.drug.name,
                        dosage:
                            '${item.schedule.dosageAmount}${item.schedule.dosageUnit.name}',
                        time: timeText,
                        period: '\u4ECA\u5929',
                        onTake: () {
                          context.read<TodayScheduleBloc>().add(
                                LogDoseTodaySchedule(
                                  drug: item.drug,
                                  schedule: item.schedule,
                                  scheduledDateTime: firstTime,
                                ),
                              );
                        },
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 32)),
          ]);
        }

        widgets.add(
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: QuoteCard(
                quote: dailyQuote,
              ),
            ),
          ),
        );

        return widgets;
      },
    );
  }
}
