// ignore_for_file: lines_longer_than_80_chars
// Release prep note: This internal page exposes app-only widgets, so full
// dartdoc coverage is deferred to the documentation pass.
// ignore_for_file: public_member_api_docs

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hananote/app/theme/hana_colors.dart';
import 'package:hananote/core/constants/app_urls.dart';
import 'package:hananote/core/l10n/arb/app_localizations.dart';
import 'package:hananote/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:hananote/features/settings/presentation/bloc/settings_event.dart';
import 'package:hananote/features/settings/presentation/bloc/settings_state.dart';
import 'package:intl/intl.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }

  void _showFeaturePlannedSheet(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: HanaColors.surfaceContainerLowest,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      builder: (sheetContext) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 20, 24, 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 32),
                  decoration: BoxDecoration(
                    color: HanaColors.outlineVariant.withAlpha(128),
                    borderRadius: BorderRadius.circular(999),
                  ),
                ),
                const Icon(
                  Icons.construction_outlined,
                  size: 64,
                  color: HanaColors.primary,
                ),
                const SizedBox(height: 24),
                Text(
                  l10n.featureInDevelopment,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: HanaColors.onSurface,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  l10n.featureInDevelopmentDesc,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 14,
                    color: HanaColors.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () => Navigator.of(sheetContext).pop(),
                    child: Text(l10n.closeAction),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  BoxDecoration _bentoDecoration() {
    return BoxDecoration(
      color: HanaColors.surfaceContainerLowest,
      borderRadius: BorderRadius.circular(24),
      border: Border.all(
        color: HanaColors.primaryContainer.withAlpha(77),
      ), // 30% border
      boxShadow: [
        BoxShadow(
          color: HanaColors.primary.withAlpha(10), // 4% shadow
          blurRadius: 16,
          offset: const Offset(0, 4),
        ),
      ],
    );
  }

  Widget _bentoSeparator() {
    return Container(
      height: 1,
      margin: const EdgeInsets.symmetric(horizontal: 24),
      color: HanaColors.primary.withAlpha(13), // 5% band, not a hard line
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingsBloc, SettingsState>(
      listener: (context, state) {
        if (state is SettingsWiped) {
          context.go('/');
        } else if (state is SettingsError) {
          _showSnackBar(context, state.message);
        } else if (state is SettingsActionResult) {
          final l10n = AppLocalizations.of(context)!;
          if (state.actionKey == 'export_in_progress') {
            _showSnackBar(context, l10n.exportInProgress);
          } else if (state.actionKey == 'export_success') {
            _showSnackBar(context, l10n.exportSuccess);
          } else if (state.actionKey == 'export_failed') {
            _showSnackBar(context, l10n.exportFailed);
          }
        }
      },
      builder: (context, rootState) {
        final l10n = AppLocalizations.of(context)!;
        final state = rootState is SettingsActionResult ? rootState.previousState : rootState;

        if (state is SettingsError) {
          return Scaffold(
            backgroundColor: HanaColors.background,
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      state.message,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        context
                            .read<SettingsBloc>()
                            .add(const LoadSettingsDashboard());
                      },
                      child: Text(l10n.retry),
                    ),
                  ],
                ),
              ),
            ),
          );
        }

        if (state is! SettingsLoaded) {
          return const Scaffold(
            backgroundColor: HanaColors.background,
            body: Center(
              child: CircularProgressIndicator(color: HanaColors.primary),
            ),
          );
        }

        final theme = Theme.of(context);
        final localeName = Localizations.localeOf(context).toLanguageTag();
        final inventoryText = state.inventoryDaysRemaining != null
            ? l10n.inventoryDaysRemaining(state.inventoryDaysRemaining!)
            : l10n.inventoryDataUnavailable;
        final topPadding =
            MediaQuery.of(context).padding.top + kToolbarHeight + 16;
        final lastBackupText = state.settings.lastBackupDate != null
            ? DateFormat.yMMMd(localeName)
                .format(state.settings.lastBackupDate!)
            : l10n.noUpdatesYet;

        return Scaffold(
          backgroundColor: HanaColors.background,
          extendBodyBehindAppBar: true,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(64),
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                child: AppBar(
                  backgroundColor:
                      HanaColors.background.withAlpha((255 * 0.8).round()),
                  elevation: 0,
                  scrolledUnderElevation: 0,
                  centerTitle: true,
                  leading: IconButton(
                    icon: const Icon(Icons.settings, color: HanaColors.primary),
                    onPressed: () => context.push('/settings'),
                  ),
                  title: Text(
                    l10n.profile,
                    style: const TextStyle(
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: HanaColors.primary,
                      letterSpacing: -0.5,
                    ),
                  ),
                  actions: [
                    IconButton(
                      icon: const Icon(
                        Icons.notifications,
                        color: HanaColors.primary,
                      ),
                      onPressed: () =>
                          context.push('/notification_settings'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(24, topPadding, 24, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Column(
                    children: [
                      const CircleAvatar(
                        radius: 48,
                        backgroundColor: HanaColors.primaryContainer,
                        child: Icon(
                          Icons.person,
                          size: 48,
                          color: HanaColors.primary,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        state.profile.displayName,
                        style: theme.textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: HanaColors.primary,
                          fontFamily: 'Plus Jakarta Sans',
                        ),
                      ),
                      const SizedBox(height: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: HanaColors.surfaceContainerHigh,
                          borderRadius: BorderRadius.circular(9999),
                        ),
                        child: Text(
                          l10n.hrtDay(state.profile.hrtDayCount),
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: HanaColors.onSurfaceVariant
                                .withAlpha((255 * 0.8).round()),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 48),
                  Text(
                    l10n.medications,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                      color: HanaColors.primary,
                      fontFamily: 'Plus Jakarta Sans',
                    ),
                  ),
                  const SizedBox(height: 16),
                  InkWell(
                    borderRadius: BorderRadius.circular(24),
                    onTap: () => context.push('/drugs'),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: _bentoDecoration(),
                      child: Row(
                        children: [
                          Container(
                            width: 56,
                            height: 56,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: HanaColors.primaryContainer,
                            ),
                            child: const Icon(
                              Icons.medication,
                              color: HanaColors.primary,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  l10n.myMedications,
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.w800,
                                    fontFamily: 'Plus Jakarta Sans',
                                    color: HanaColors.onSurface,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  l10n.drugCount(state.activeDrugCount),
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: HanaColors.onSurfaceVariant
                                        .withAlpha(204),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Icon(
                            Icons.chevron_right,
                            color: HanaColors.outlineVariant,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: _SquareCard(
                          icon: Icons.inventory_2,
                          iconColor: HanaColors.secondary,
                          iconBgColor: HanaColors.secondaryContainer
                              .withAlpha(128), // 50%
                          title: l10n.inventory,
                          subtitle: inventoryText,
                          subtitleColor: HanaColors.secondary,
                          bentoDecoration: _bentoDecoration(),
                          onTap: () => context.push('/inventory'),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _SquareCard(
                          icon: Icons.view_quilt,
                          iconColor: HanaColors.primary,
                          iconBgColor:
                              HanaColors.primaryContainer.withAlpha(128), // 50%
                          title: l10n.medicationPlan,
                          subtitle: l10n.manageEditSchedules,
                          subtitleColor: HanaColors.onSurfaceVariant,
                          bentoDecoration: _bentoDecoration(),
                          onTap: () => context.push('/drugs'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Text(
                    l10n.privacySecurity,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                      color: HanaColors.primary,
                      fontFamily: 'Plus Jakarta Sans',
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    decoration: _bentoDecoration(),
                    child: Column(
                      children: [
                        _ListTileItem(
                          icon: Icons.lock,
                          iconColor: HanaColors.primary,
                          title: l10n.appLock,
                          trailing: Switch(
                            value: state.settings.appLockEnabled,
                            activeThumbColor: HanaColors.primary,
                            activeTrackColor: HanaColors.primaryContainer,
                            onChanged: (enabled) {
                              context
                                  .read<SettingsBloc>()
                                  .add(ToggleAppLock(enabled: enabled));
                            },
                          ),
                        ),
                        _bentoSeparator(),
                        _ListTileItem(
                          icon: Icons.visibility_off,
                          iconColor: HanaColors.primary,
                          title: l10n.privacyMode,
                          subtitle: state.settings.privacyModeEnabled
                              ? l10n.privacyModeEnabled
                              : l10n.privacyModeDisabled,
                          isChevron: true,
                          onTap: () {
                            context.read<SettingsBloc>().add(
                                  TogglePrivacyMode(
                                    enabled: !state.settings.privacyModeEnabled,
                                  ),
                                );
                          },
                        ),
                        _bentoSeparator(),
                        _ListTileItem(
                          icon: Icons.warning,
                          iconColor: HanaColors.error,
                          title: l10n.wipeAllData,
                          titleColor: HanaColors.error,
                          isChevron: true,
                          chevronColor: HanaColors.error,
                          onTap: () async {
                            final confirm = await showDialog<bool>(
                              context: context,
                              builder: (dialogContext) => AlertDialog(
                                backgroundColor:
                                    HanaColors.surfaceContainerLowest,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                title: Text(l10n.wipeAllDataTitle),
                                content: Text(l10n.wipeAllDataMessage),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.of(dialogContext).pop(false),
                                    child: Text(
                                      l10n.cancel,
                                      style: const TextStyle(
                                        color: HanaColors.onSurfaceVariant,
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.of(dialogContext).pop(true),
                                    child: Text(
                                      l10n.delete,
                                      style: const TextStyle(
                                        color: HanaColors.error,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );

                            if ((confirm ?? false) && context.mounted) {
                              context
                                  .read<SettingsBloc>()
                                  .add(const WipeSettingsData());
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  Text(
                    l10n.dataBackup,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                      color: HanaColors.primary,
                      fontFamily: 'Plus Jakarta Sans',
                    ),
                  ),
                  const SizedBox(height: 16),
                  _ButtonRowItem(
                    icon: Icons.cloud_upload,
                    title: l10n.exportBackup,
                    trailingText: lastBackupText,
                    decoration: _bentoDecoration(),
                    onTap: () =>
                        context.read<SettingsBloc>().add(const ExportDataEvent()),
                  ),
                  const SizedBox(height: 12),
                  _ButtonRowItem(
                    icon: Icons.cloud_download,
                    title: l10n.importBackup,
                    isChevron: true,
                    decoration: _bentoDecoration(),
                    onTap: () =>
                        _showFeaturePlannedSheet(context),
                  ),
                  const SizedBox(height: 12),
                  _ButtonRowItem(
                    icon: Icons.description,
                    title: l10n.generatePdf,
                    isChevron: true,
                    decoration: _bentoDecoration(),
                    onTap: () =>
                        _showFeaturePlannedSheet(context),
                  ),
                  const SizedBox(height: 40),
                  Text(
                    l10n.about,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                      color: HanaColors.primary,
                      fontFamily: 'Plus Jakarta Sans',
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    decoration: _bentoDecoration(),
                    child: Column(
                      children: [
                        _ListTileItem(
                          title: l10n.version,
                          trailingText: 'v${AppConstants.appVersion}',
                        ),
                        _bentoSeparator(),
                        _ListTileItem(
                          title: l10n.privacyPolicy,
                          isChevron: true,
                          onTap: () => context.push('/legal/privacy'),
                        ),
                        _bentoSeparator(),
                        _ListTileItem(
                          title: l10n.termsOfUse,
                          isChevron: true,
                          onTap: () => context.push('/legal/terms'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _SquareCard extends StatelessWidget {
  const _SquareCard({
    required this.icon,
    required this.iconColor,
    required this.iconBgColor,
    required this.title,
    required this.subtitle,
    required this.subtitleColor,
    required this.bentoDecoration,
    this.onTap,
  });

  final IconData icon;
  final Color iconColor;
  final Color iconBgColor;
  final String title;
  final String subtitle;
  final Color subtitleColor;
  final BoxDecoration bentoDecoration;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(24),
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: bentoDecoration,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: iconBgColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, color: iconColor),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w800,
                        fontFamily: 'Plus Jakarta Sans',
                        color: HanaColors.onSurface,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: subtitleColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ListTileItem extends StatelessWidget {
  const _ListTileItem({
    required this.title,
    this.icon,
    this.iconColor,
    this.titleColor,
    this.subtitle,
    this.isChevron = false,
    this.trailing,
    this.trailingText,
    this.chevronColor,
    this.onTap,
  });

  final IconData? icon;
  final Color? iconColor;
  final String title;
  final Color? titleColor;
  final String? subtitle;
  final bool isChevron;
  final Widget? trailing;
  final String? trailingText;
  final Color? chevronColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Row(
          children: [
            if (icon != null) ...[
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: (iconColor ?? HanaColors.primary).withAlpha(26), // 10%
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: iconColor ?? HanaColors.primary,
                  size: 20,
                ),
              ),
              const SizedBox(width: 16),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: titleColor ?? HanaColors.onSurface,
                    ),
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      subtitle!,
                      style: TextStyle(
                        fontSize: 12,
                        color: HanaColors.onSurfaceVariant.withAlpha(179),
                      ),
                    ),
                  ],
                ],
              ),
            ),
            if (trailing != null) trailing!,
            if (trailingText != null)
              Text(
                trailingText!,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: HanaColors.onSurfaceVariant,
                    ),
              ),
            if (isChevron)
              Icon(
                Icons.chevron_right,
                size: 20,
                color: chevronColor ?? HanaColors.outlineVariant,
              ),
          ],
        ),
      ),
    );
  }
}

class _ButtonRowItem extends StatelessWidget {
  const _ButtonRowItem({
    required this.icon,
    required this.title,
    required this.decoration,
    this.trailingText,
    this.isChevron = false,
    this.onTap,
  });

  final IconData icon;
  final String title;
  final String? trailingText;
  final bool isChevron;
  final BoxDecoration decoration;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          decoration: decoration,
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: HanaColors.primaryContainer.withAlpha(77), // 30%
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: HanaColors.primary, size: 20),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: HanaColors.onSurface,
                  ),
                ),
              ),
              if (trailingText != null) ...[
                Text(
                  trailingText!,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: HanaColors.onSurfaceVariant.withAlpha(204),
                  ),
                ),
                const SizedBox(width: 8),
              ],
              if (isChevron)
                const Icon(
                  Icons.chevron_right,
                  size: 20,
                  color: HanaColors.outlineVariant,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
