import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hananote/app/theme/hana_colors.dart';
import 'package:hananote/core/l10n/arb/app_localizations.dart';
import 'package:hananote/features/medication/domain/entities/enums.dart';
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
import 'package:intl/intl.dart';

/// The main dashboard page for the current day's health tracking.
class TodayPage extends StatelessWidget {
  /// Creates a [TodayPage].
  const TodayPage({super.key});

  static const _dailyQuotes = [
    '菴逧・ｯ丈ｸ谺｡蝮壽戟・碁・莨壼惠譛ｪ譚･謔・ｄ蠑闃ｱ縲・,
    '莉雁､ｩ荵溯ｯｷ貂ｩ譟泌慍辣ｧ鬘ｾ閾ｪ蟾ｱ・悟序蛹匁ｭ｣蝨ｨ蜿醍函縲・,
    '霄ｫ菴鍋噪豈丈ｸ轤ｹ蝗槫ｺ費ｼ碁・譏ｯ菴隶､逵溽函豢ｻ逧・ｯ∵紺縲・,
    '諷｢荳轤ｹ豐｡譛牙・邉ｻ・檎ｨｳ螳壼燕霑帶悽霄ｫ蟆ｱ譏ｯ蜉幃㍼縲・,
    '譛崎艮蜥瑚ｮｰ蠖穂ｸ肴弍莉ｻ蜉｡・梧弍菴蟇ｹ閾ｪ蟾ｱ逧・価隸ｺ縲・,
    '蜈∬ｮｸ閾ｪ蟾ｱ謖芽鰍螂乗・髟ｿ・御ｸ榊ｿ・柱莉ｻ菴穂ｺｺ豈碑ｾ・・,
    '菴豁｣蝨ｨ謌蝉ｸｺ諠ｳ謌蝉ｸｺ逧・ｺｺ・瑚ｿ吩ｻｶ莠句ｼ蠕怜ｺ・･昴・,
    '蜀肴勸騾夂噪荳螟ｩ・御ｹ溷庄莉･蝗荳ｺ隶､逵溷ｯｹ蠕・・蟾ｱ閠碁略蜈峨・,
    '辣ｧ鬘ｾ霄ｫ菴謎ｸ肴弍雍滓球・梧弍菴扈呎悴譚･蜀吩ｸ狗噪諠・ｹｦ縲・,
    '菴莉雁､ｩ逧・仙ｿ・ｼ御ｼ壼序謌先・螟ｩ逧・ｮ牙ｿ・・,
    '豈丈ｸ谺｡隶ｰ蠖暮・荳肴弍驥榊､搾ｼ瑚梧弍蝨ｨ逵玖ｧ∫悄螳樒噪閾ｪ蟾ｱ縲・,
    '莉雁､ｩ荵溷悪蠢倅ｺ・､ｸ螟ｸ閾ｪ蟾ｱ・御ｽ蟾ｲ扈丞★蠕怜ｾ亥･ｽ縲・,
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final settingsState = context.watch<SettingsBloc>().state;
    final displayName = settingsState is SettingsLoaded
        ? settingsState.profile.displayName
        : 'HanaNote 逕ｨ謌ｷ';
    final hrtDays =
        settingsState is SettingsLoaded ? settingsState.profile.hrtDayCount : 0;
    final greeting = _greetingForHour(DateTime.now().hour, l10n);

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
                            l10n.today,
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
                              '$greeting・・displayName',
                              style: theme.textTheme.headlineLarge?.copyWith(
                                color: HanaColors.onSurface,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              l10n.hrtDay(hrtDays),
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
                ..._buildStateContent(context, state, theme, l10n),
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
    AppLocalizations l10n,
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
                  child: Text(l10n.retry),
                ),
              ],
            ),
          ),
        ),
      ],
      loaded: (items, date, completedCount, totalCount) {
        if (items.isEmpty) {
          return [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Center(
                child: Text(l10n.noMedicationRecords),
              ),
            ),
          ];
        }

        final now = DateTime.now();
        final localeName = Localizations.localeOf(context).toLanguageTag();
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
            '${countdownDrug.schedule.dosageUnit.displayName}';

        widgets.addAll([
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: CountdownCard(
                nextScheduledTime: upcomingTime,
                isCompleteForToday: uncompletedItems.isEmpty,
                drugName: countdownDrug.drug.name,
                dosage: countdownDosage,
                route: countdownDrug.schedule.administrationRoute.displayName,
                nextDoseLabel: l10n.nextDose,
                completedLabel: l10n.todayCompleted,
                hourUnitLabel: l10n.hourUnit,
                minuteUnitLabel: l10n.minuteUnit,
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 32)),
        ]);

        String dosageLabel(TodayScheduleItem item) {
          return '${item.schedule.dosageAmount}'
              '${item.schedule.dosageUnit.displayName}';
        }

        String timeLabel(DateTime? dateTime) {
          if (dateTime == null) {
            return l10n.allDay;
          }
          return DateFormat.Hm(localeName).format(dateTime);
        }

        final completedItems = items.where((item) => item.isCompleted).toList();
        if (completedItems.isNotEmpty) {
          widgets.addAll([
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  l10n.takenDoses,
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
                  l10n.pendingDoses,
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
                        period: l10n.allDay,
                        takeLabel: l10n.takeDose,
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

  String _greetingForHour(int hour, AppLocalizations l10n) {
    if (hour < 12) {
      return l10n.goodMorning;
    }
    if (hour < 18) {
      return l10n.goodAfternoon;
    }
    return l10n.goodEvening;
  }

  String _quoteForToday() {
    return _dailyQuotes[DateTime.now().day % _dailyQuotes.length];
  }
}
