// Release prep note: This internal page exposes app-only widgets, so full
// dartdoc coverage is deferred to the documentation pass.
// ignore_for_file: public_member_api_docs

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hananote/app/theme/hana_colors.dart';
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

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingsBloc, SettingsState>(
      listener: (context, state) {
        if (state is SettingsWiped) {
          context.go('/');
        } else if (state is SettingsError) {
          _showSnackBar(context, state.message);
        }
      },
      builder: (context, state) {
        if (state is SettingsError) {
          final l10n = AppLocalizations.of(context);
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
                      child: Text(l10n?.retry ?? 'Retry'),
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
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final theme = Theme.of(context);
        final inventoryText = state.inventoryDaysRemaining != null
            ? '约剩 ${state.inventoryDaysRemaining} 天'
            : '暂无库存数据';

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
                    onPressed: () {},
                  ),
                  title: const Text(
                    '我的',
                    style: TextStyle(
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
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 100, 20, 120),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 48,
                        backgroundColor: HanaColors.primaryContainer,
                        child: const Icon(
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
                          color: HanaColors.onSurface,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'HRT ${state.profile.hrtDayCount} 天',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: HanaColors.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  Text(
                    '用药管理',
                    style: theme.textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: HanaColors.onSurfaceVariant,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 16),
                  InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () => context.push('/drugs'),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: HanaColors.surfaceContainerLowest,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: HanaColors.outlineVariant.withAlpha(26),
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
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
                                  '我的用药',
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '${state.activeDrugCount} 项',
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: HanaColors.onSurfaceVariant,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Icon(
                            Icons.chevron_right,
                            color: HanaColors.onSurfaceVariant,
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
                          iconBgColor: HanaColors.secondaryContainer,
                          title: '库存',
                          subtitle: inventoryText,
                          subtitleColor: HanaColors.secondary,
                          onTap: () =>
                              _showSnackBar(context, '库存功能即将上线'),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _SquareCard(
                          icon: Icons.view_quilt,
                          iconColor: HanaColors.primary,
                          iconBgColor: HanaColors.primaryContainer,
                          title: '用药方案',
                          subtitle: '查看和编辑',
                          subtitleColor: HanaColors.onSurfaceVariant,
                          onTap: () => context.push('/drugs'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  Text(
                    '隐私与安全',
                    style: theme.textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: HanaColors.onSurfaceVariant,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    decoration: BoxDecoration(
                      color: HanaColors.surfaceContainerLowest,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: HanaColors.outlineVariant.withAlpha(26),
                      ),
                    ),
                    child: Column(
                      children: [
                        _ListTileItem(
                          icon: Icons.lock,
                          iconColor: HanaColors.primary,
                          title: '应用锁',
                          trailing: Switch(
                            value: state.settings.appLockEnabled,
                            onChanged: (enabled) {
                              context
                                  .read<SettingsBloc>()
                                  .add(ToggleAppLock(enabled: enabled));
                            },
                          ),
                        ),
                        Divider(
                          height: 1,
                          color: HanaColors.surfaceVariant.withAlpha(51),
                        ),
                        _ListTileItem(
                          icon: Icons.visibility_off,
                          iconColor: HanaColors.primary,
                          title: '隐私模式',
                          subtitle: state.settings.privacyModeEnabled
                              ? '当前已开启'
                              : '隐藏敏感内容',
                          isChevron: true,
                          onTap: () {
                            context.read<SettingsBloc>().add(
                                  TogglePrivacyMode(
                                    enabled:
                                        !state.settings.privacyModeEnabled,
                                  ),
                                );
                          },
                        ),
                        Divider(
                          height: 1,
                          color: HanaColors.surfaceVariant.withAlpha(51),
                        ),
                        _ListTileItem(
                          icon: Icons.warning,
                          iconColor: HanaColors.error,
                          title: '清除全部数据',
                          titleColor: HanaColors.error,
                          isChevron: true,
                          chevronColor: HanaColors.error,
                          onTap: () async {
                            final confirm = await showDialog<bool>(
                              context: context,
                              builder: (dialogContext) => AlertDialog(
                                title: const Text('清除数据'),
                                content: const Text(
                                  '此操作会删除所有本地数据，且无法恢复。',
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.of(dialogContext).pop(false),
                                    child: const Text('取消'),
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.of(dialogContext).pop(true),
                                    child: const Text(
                                      '清除',
                                      style: TextStyle(color: Colors.red),
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
                  const SizedBox(height: 32),
                  Text(
                    '数据',
                    style: theme.textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: HanaColors.onSurfaceVariant,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _ButtonRowItem(
                    icon: Icons.cloud_upload,
                    title: '导出备份',
                    trailingText: state.settings.lastBackupDate != null
                        ? DateFormat('M月d日').format(state.settings.lastBackupDate!)
                        : '尚未备份',
                  ),
                  const SizedBox(height: 12),
                  const _ButtonRowItem(
                    icon: Icons.cloud_download,
                    title: '导入恢复',
                    isChevron: true,
                  ),
                  const SizedBox(height: 12),
                  const _ButtonRowItem(
                    icon: Icons.description,
                    title: '生成 PDF',
                    isChevron: true,
                  ),
                  const SizedBox(height: 32),
                  Text(
                    '关于',
                    style: theme.textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: HanaColors.onSurfaceVariant,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    decoration: BoxDecoration(
                      color: HanaColors.surfaceContainerLowest,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: HanaColors.outlineVariant.withAlpha(26),
                      ),
                    ),
                    child: Column(
                      children: const [
                        _ListTileItem(
                          title: '版本',
                          trailingText: 'v1.0.0',
                        ),
                        Divider(height: 1),
                        _ListTileItem(
                          title: '隐私政策',
                          isChevron: true,
                        ),
                        Divider(height: 1),
                        _ListTileItem(
                          title: '使用条款',
                          isChevron: true,
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
    this.onTap,
  });

  final IconData icon;
  final Color iconColor;
  final Color iconBgColor;
  final String title;
  final String subtitle;
  final Color subtitleColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: HanaColors.surfaceContainerLowest,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: HanaColors.outlineVariant.withAlpha(26),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 40,
                  height: 40,
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
                        fontWeight: FontWeight.w600,
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
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            if (icon != null) ...[
              Icon(icon, color: iconColor, size: 24),
              const SizedBox(width: 16),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: titleColor ?? HanaColors.onSurface,
                    ),
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(height: 2),
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
                color:
                    chevronColor ?? HanaColors.onSurfaceVariant.withAlpha(102),
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
    this.trailingText,
    this.isChevron = false,
  });

  final IconData icon;
  final String title;
  final String? trailingText;
  final bool isChevron;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: HanaColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(icon, color: HanaColors.primary),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: HanaColors.onSurface,
              ),
            ),
          ),
          if (trailingText != null)
            Text(
              trailingText!,
              style: TextStyle(
                fontSize: 12,
                color: HanaColors.onSurfaceVariant.withAlpha(179),
              ),
            ),
          if (isChevron)
            Icon(
              Icons.chevron_right,
              color: HanaColors.onSurfaceVariant.withAlpha(102),
            ),
        ],
      ),
    );
  }
}
