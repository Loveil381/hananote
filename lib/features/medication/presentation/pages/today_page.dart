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

/// The main dashboard page for the current day's health tracking.
class TodayPage extends StatelessWidget {
  /// Creates a [TodayPage].
  const TodayPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: HanaColors.background,
      body: SafeArea(
        bottom: false,
        child: BlocBuilder<TodayScheduleBloc, TodayScheduleState>(
          builder: (context, state) {
            return CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                // Top App Bar Area
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

                // Greeting Section
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
                              '早安，小花',
                              style: theme.textTheme.headlineLarge?.copyWith(
                                color: HanaColors.onSurface,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'HRT 第 325 天',
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

                // Determine inner content based on state
                ..._buildStateContent(context, state, theme),

                // Bottom Safe Padding (Avoid tab bar clipping)
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
                  child: const Text('重试'),
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
                child: Text('暂无用药记录'),
              ),
            ),
          ];
        }

        final now = DateTime.now();
        TodayScheduleItem? upcoming;
        DateTime? upcomingTime;

        final uncompletedItems = items.where((i) => !i.isCompleted).toList();
        for (final item in uncompletedItems) {
          for (final dt in item.scheduledDateTimes) {
            if (dt.isAfter(now)) {
              if (upcomingTime == null || dt.isBefore(upcomingTime)) {
                upcomingTime = dt;
                upcoming = item;
              }
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
                dosage: '${countdownDrug.schedule.dosageAmount}'
                    '${countdownDrug.schedule.dosageUnit.name}',
                route: countdownDrug.schedule.administrationRoute.name,
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 32)),
        ]);

        // Completed Section
        final completedItems = items.where((i) => i.isCompleted).toList();
        if (completedItems.isNotEmpty) {
          widgets.addAll([
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  '已完成',
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
                    final timeStr = firstTime != null
                        ? '${firstTime.hour.toString().padLeft(2, '0')}:${firstTime.minute.toString().padLeft(2, '0')}'
                        : '全天';

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: MedicationStatusCard(
                        name: item.drug.name,
                        dosage: '${item.schedule.dosageAmount}'
                            '${item.schedule.dosageUnit.name}',
                        time: timeStr,
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

        // Upcoming / Uncompleted Section List
        if (uncompletedItems.isNotEmpty) {
          widgets.addAll([
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  '剩余',
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
                    final timeStr = firstTime != null
                        ? '${firstTime.hour.toString().padLeft(2, '0')}:${firstTime.minute.toString().padLeft(2, '0')}'
                        : '全天';

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: UpcomingDoseCard(
                        name: item.drug.name,
                        dosage: '${item.schedule.dosageAmount}'
                            '${item.schedule.dosageUnit.name}',
                        time: timeStr,
                        period: '预计',
                        onTake: () {
                          context.read<TodayScheduleBloc>().add(
                                LogDoseTodaySchedule(
                                  drug: item.drug,
                                  schedule: item.schedule,
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

        // Quote Section
        widgets.add(
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: QuoteCard(
                quote: '每一天的坚持，都是对自己灵魂负责。',
              ),
            ),
          ),
        );

        return widgets;
      },
    );
  }
}
