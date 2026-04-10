import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hananote/app/di/injection.dart';
import 'package:hananote/app/theme/hana_colors.dart';
import 'package:hananote/core/l10n/arb/app_localizations.dart';
import 'package:hananote/core/notifications/notification_service.dart';
import 'package:hananote/features/medication/domain/usecases/sync_medication_reminders.dart';
import 'package:hananote/features/notification/presentation/bloc/notification_settings_cubit.dart';
import 'package:hananote/features/notification/presentation/bloc/notification_settings_state.dart';
import 'package:hananote/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:hananote/features/settings/presentation/bloc/settings_event.dart';
import 'package:hananote/features/settings/presentation/bloc/settings_state.dart';

class NotificationSettingsPage extends StatelessWidget {
  const NotificationSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Scaffold(
      backgroundColor: HanaColors.background,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(64),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
            child: AppBar(
              backgroundColor: HanaColors.background.withAlpha((255 * 0.8).round()),
              elevation: 0,
              scrolledUnderElevation: 0,
              centerTitle: true,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: HanaColors.primary),
                onPressed: () => context.pop(),
              ),
              title: Text(
                l10n.notificationSettings,
                style: const TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: HanaColors.primary,
                  letterSpacing: -0.5,
                ),
              ),
            ),
          ),
        ),
      ),
      body: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, settingsState) {
          final notificationsEnabled = settingsState is SettingsLoaded
              ? settingsState.settings.notificationsEnabled
              : true;

          return BlocBuilder<NotificationSettingsCubit, NotificationSettingsState>(
            builder: (context, state) {
              final topPadding = MediaQuery.of(context).padding.top + kToolbarHeight + 16;

              return switch (state) {
                NotificationSettingsInitial() || NotificationSettingsLoading() => const Center(
                    child: CircularProgressIndicator(color: HanaColors.primary),
                  ),
                NotificationSettingsError(:final message) => Center(child: Text(message)),
                NotificationSettingsLoaded(:final drugs, :final schedules) => SingleChildScrollView(
                    padding: EdgeInsets.fromLTRB(24, topPadding, 24, 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Global notification toggle
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: HanaColors.surfaceContainerLowest,
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(color: HanaColors.surfaceContainerLowest, width: 2),
                            boxShadow: [
                              BoxShadow(
                                color: HanaColors.primary.withAlpha(10),
                                blurRadius: 24,
                                offset: const Offset(0, 8),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: HanaColors.primaryContainer.withAlpha(128),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  notificationsEnabled
                                      ? Icons.notifications_active
                                      : Icons.notifications_off_outlined,
                                  color: HanaColors.primary,
                                  size: 20,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Text(
                                  l10n.notificationSettings,
                                  style: const TextStyle(
                                    fontFamily: 'Plus Jakarta Sans',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: HanaColors.onSurface,
                                  ),
                                ),
                              ),
                              Switch(
                                value: notificationsEnabled,
                                onChanged: (value) {
                                  context.read<SettingsBloc>().add(
                                    SettingsEvent.toggleNotifications(enabled: value),
                                  );
                                  if (!value) {
                                    getIt<NotificationService>().cancelAllReminders();
                                  } else {
                                    getIt<SyncMedicationReminders>().call();
                                  }
                                },
                                activeTrackColor: HanaColors.primary,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          l10n.medicationReminders,
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.w800,
                                color: HanaColors.primary,
                                fontFamily: 'Plus Jakarta Sans',
                              ),
                        ),
                        const SizedBox(height: 16),
                        if (drugs.isEmpty)
                          _EmptyState(l10n: l10n)
                        else
                          ...drugs.map((drug) {
                            final schedule = schedules[drug.id];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: _DrugNotificationCard(
                                drugName: drug.name,
                                scheduleTimes: schedule?.scheduleTimes
                                        .map((t) => '${t.hour.toString().padLeft(2, '0')}:${t.minute.toString().padLeft(2, '0')}')
                                        .toList() ??
                                    [],
                                l10n: l10n,
                              ),
                            );
                          }),
                      ],
                    ),
                  ),
              };
            },
          );
        },
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState({required this.l10n});
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
      decoration: BoxDecoration(
        color: HanaColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: HanaColors.surfaceContainerLowest, width: 2),
        boxShadow: [
          BoxShadow(
            color: HanaColors.primary.withAlpha(10),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(
            Icons.notifications_off_outlined,
            size: 48,
            color: HanaColors.onSurfaceVariant.withAlpha(128),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.noActiveReminders,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: HanaColors.onSurfaceVariant.withAlpha(204),
            ),
          ),
          const SizedBox(height: 24),
          FilledButton.icon(
            onPressed: () => context.push('/drugs'),
            icon: const Icon(Icons.add),
            label: Text(l10n.addFirstDrugCta),
          ),
        ],
      ),
    );
  }
}

class _DrugNotificationCard extends StatefulWidget {
  const _DrugNotificationCard({
    required this.drugName,
    required this.scheduleTimes,
    required this.l10n,
  });

  final String drugName;
  final List<String> scheduleTimes;
  final AppLocalizations l10n;

  @override
  State<_DrugNotificationCard> createState() => _DrugNotificationCardState();
}

class _DrugNotificationCardState extends State<_DrugNotificationCard> {
  // Temporary local state for the MVP without persistence
  bool _isNotificationEnabled = true;

  @override
  Widget build(BuildContext context) {
    final hasTimes = widget.scheduleTimes.isNotEmpty;
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: HanaColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: HanaColors.surfaceContainerLowest, width: 2),
        boxShadow: [
          BoxShadow(
            color: HanaColors.primary.withAlpha(10),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.drugName,
                  style: const TextStyle(
                    fontFamily: 'Plus Jakarta Sans',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: HanaColors.onSurface,
                  ),
                ),
                const SizedBox(height: 8),
                if (hasTimes)
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: widget.scheduleTimes
                        .map((time) => Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: HanaColors.primaryContainer,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                time,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: HanaColors.primary,
                                ),
                              ),
                            ))
                        .toList(),
                  )
                else
                  Text(
                    widget.l10n.reminderTimes + ': -',
                    style: TextStyle(
                      fontSize: 13,
                      color: HanaColors.onSurfaceVariant.withAlpha(204),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Switch(
            value: _isNotificationEnabled,
            onChanged: (value) {
              setState(() => _isNotificationEnabled = value);
            },
            activeTrackColor: HanaColors.primary,
          ),
        ],
      ),
    );
  }
}
