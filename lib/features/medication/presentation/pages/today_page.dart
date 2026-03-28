import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
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
    '你照顾自己的每一步，都会在未来开花。',
    '慢一点没有关系，稳定前进就很好。',
    '今天也值得为身体的变化感到期待。',
    '温柔对待自己，就是最长期有效的计划。',
    '记录不是负担，它会帮你看见自己的成长。',
    '哪怕只有一点点进步，也值得认真庆祝。',
    '身体在用自己的节奏回应你，给它一点时间。',
    '你已经走了很远，今天也继续向前。',
    '科学记录和温柔陪伴，可以同时存在。',
    '每一次坚持，都会让明天更安心。',
    '不必急着证明什么，你正在慢慢成为自己。',
    '今天的你，也值得被认真照顾。',
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final settingsState = context.watch<SettingsBloc>().state;
    final displayName = settingsState is SettingsLoaded
        ? settingsState.profile.displayName
        : 'HanaNote 用户';
    final hrtDays =
        settingsState is SettingsLoaded ? settingsState.profile.hrtDayCount : 0;
    final greeting = _greetingForHour(DateTime.now().hour);

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
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: HanaColors.surfaceContainerHigh,
                            borderRadius: BorderRadius.circular(999),
                          ),
                          child: Text(
                            _todayLabel(),
                            style: theme.textTheme.labelMedium?.copyWith(
                              color: HanaColors.onSurfaceVariant,
                              fontWeight: FontWeight.w600,
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
                              '$greeting，$displayName',
                              style: theme.textTheme.headlineLarge?.copyWith(
                                color: HanaColors.onSurface,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'HRT 第 $hrtDays 天',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: HanaColors.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(28),
                            onTap: () => context.push('/profile'),
                            child: const CircleAvatar(
                              radius: 28,
                              backgroundColor: HanaColors.primaryContainer,
                              child: Icon(
                                Icons.person,
                                color: HanaColors.onPrimaryContainer,
                              ),
                            ),
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
                Text(message, style: const TextStyle(color: HanaColors.error)),
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
        final countdownDosage = '${countdownDrug.schedule.dosageAmount}'
            '${countdownDrug.schedule.dosageUnit.name}';

        widgets.addAll([
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: CountdownCard(
                nextScheduledTime: upcomingTime,
                isCompleteForToday: uncompletedItems.isEmpty,
                drugName: countdownDrug.drug.name,
                dosage: countdownDosage,
                route: countdownDrug.schedule.administrationRoute.name,
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 32)),
        ]);

        String dosageLabel(TodayScheduleItem item) {
          return '${item.schedule.dosageAmount}'
              '${item.schedule.dosageUnit.name}';
        }

        String timeLabel(DateTime? dateTime) {
          if (dateTime == null) {
            return '全天';
          }
          return '${dateTime.hour.toString().padLeft(2, '0')}:'
              '${dateTime.minute.toString().padLeft(2, '0')}';
        }

        final completedItems = items.where((item) => item.isCompleted).toList();
        if (completedItems.isNotEmpty) {
          widgets.addAll([
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  '已服药',
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
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: MedicationStatusCard(
                        name: item.drug.name,
                        dosage: dosageLabel(item),
                        time: timeLabel(firstTime),
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
                  '待服药',
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
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: UpcomingDoseCard(
                        name: item.drug.name,
                        dosage: dosageLabel(item),
                        time: timeLabel(firstTime),
                        period: '今天',
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
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: QuoteCard(
                quote: _quoteForToday(),
              ),
            ),
          ),
        );

        return widgets;
      },
    );
  }

  String _greetingForHour(int hour) {
    if (hour < 12) {
      return '早安';
    }
    if (hour < 18) {
      return '午安';
    }
    return '晚上好';
  }

  String _todayLabel() {
    final now = DateTime.now();
    return '${now.month}月${now.day}日';
  }

  String _quoteForToday() {
    return _dailyQuotes[DateTime.now().day % _dailyQuotes.length];
  }
}
