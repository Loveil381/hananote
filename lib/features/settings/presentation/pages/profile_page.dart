// ignore_for_file: public_member_api_docs

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hananote/app/theme/hana_colors.dart';
import 'package:hananote/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:hananote/features/settings/presentation/bloc/settings_event.dart';
import 'package:hananote/features/settings/presentation/bloc/settings_state.dart';
import 'package:intl/intl.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingsBloc, SettingsState>(
      listener: (context, state) {
        if (state is SettingsWiped) {
          context.go('/');
        } else if (state is SettingsError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      builder: (context, state) {
        if (state is! SettingsLoaded) {
          return const Scaffold(
            backgroundColor: HanaColors.background,
            body: Center(child: CircularProgressIndicator()),
          );
        }

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
            child: Column(
              children: [
                const SizedBox(height: 100), // Space for AppBar

                // Header Section
                Column(
                  children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                HanaColors.primary,
                                HanaColors.secondaryContainer,
                              ],
                            ),
                          ),
                          child: Container(
                            width: 96,
                            height: 96,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: HanaColors.primaryContainer,
                              border: Border.all(
                                color: HanaColors.surface,
                                width: 4,
                              ),
                              boxShadow: const [
                                BoxShadow(color: Colors.black12, blurRadius: 4),
                              ],
                            ),
                            child: const Icon(
                              Icons.person,
                              size: 48,
                              color: HanaColors.primary,
                            ),
                          ),
                        ),
                        Container(
                          transform: Matrix4.translationValues(-4, 4, 0),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: HanaColors.primary,
                            borderRadius: BorderRadius.circular(9999),
                            border:
                                Border.all(color: HanaColors.surface, width: 2),
                            boxShadow: const [
                              BoxShadow(color: Colors.black26, blurRadius: 8),
                            ],
                          ),
                          child: Text(
                            '${state.profile.hrtDayCount}d',
                            style: const TextStyle(
                              fontFamily: 'Be Vietnam Pro',
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: HanaColors.onPrimary,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      state.profile.displayName,
                      style:
                          Theme.of(context).textTheme.headlineMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: HanaColors.onSurface,
                              ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.favorite,
                          size: 14,
                          color: HanaColors.primary,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          'HRT ${state.profile.hrtDayCount} 天',
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: HanaColors.onSurfaceVariant,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 32),

                // Medication Management
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        '药物管理',
                        style:
                            Theme.of(context).textTheme.labelMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: HanaColors.onSurfaceVariant,
                                  letterSpacing: 1.5,
                                ),
                      ),
                      const SizedBox(height: 16),

                      // Top wide card
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: HanaColors.surfaceContainerLowest,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: HanaColors.outlineVariant.withAlpha(26),
                          ),
                          boxShadow: const [
                            BoxShadow(color: Color(0x05000000), blurRadius: 4),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 48,
                                  height: 48,
                                  decoration: BoxDecoration(
                                    color: HanaColors.primaryContainer
                                        .withAlpha(77),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.medication,
                                    color: HanaColors.primary,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      '我的用药',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: HanaColors.onSurface,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      '${state.activeDrugCount} 种',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: HanaColors.onSurfaceVariant
                                            .withAlpha(179),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Icon(
                              Icons.chevron_right,
                              color: HanaColors.onSurfaceVariant.withAlpha(128),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Grid cards
                      Row(
                        children: [
                          Expanded(
                            child: _SquareCard(
                              icon: Icons.inventory_2,
                              iconColor: HanaColors.secondary,
                              iconBgColor: HanaColors.secondaryContainer
                                  .withAlpha(128), // 50%
                              title: '库存',
                              subtitle: state.inventoryDaysRemaining != null
                                  ? '剩余 ${state.inventoryDaysRemaining} 天'
                                  : '暂无数据',
                              subtitleColor: HanaColors.secondary,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: _SquareCard(
                              icon: Icons.view_quilt,
                              iconColor: HanaColors.tertiary,
                              iconBgColor: HanaColors.tertiaryContainer
                                  .withAlpha(102), // 40%
                              title: '用药方案',
                              subtitle: '查看详情',
                              subtitleColor:
                                  HanaColors.onSurfaceVariant.withAlpha(179),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                // Privacy & Security
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        '隐私与安全',
                        style:
                            Theme.of(context).textTheme.labelMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: HanaColors.onSurfaceVariant,
                                  letterSpacing: 1.5,
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
                        clipBehavior: Clip.antiAlias,
                        child: Column(
                          children: [
                            _ListTileItem(
                              icon: Icons.lock,
                              iconColor: HanaColors.primary,
                              title: '应用锁',
                              trailing: Switch(
                                value: state.settings.appLockEnabled,
                                onChanged: (val) {
                                  context
                                      .read<SettingsBloc>()
                                      .add(ToggleAppLock(enabled: val));
                                },
                                activeThumbColor: HanaColors.onPrimary,
                                activeTrackColor: HanaColors.primary,
                              ),
                            ),
                            // Divider inside container
                            Divider(
                              height: 1,
                              thickness: 1,
                              color: HanaColors.surfaceVariant.withAlpha(51),
                            ),
                            _ListTileItem(
                              icon: Icons.visibility_off,
                              iconColor: HanaColors.primary,
                              title: '隐私模式',
                              subtitle: state.settings.privacyModeEnabled
                                  ? '已开启'
                                  : '自动隐藏敏感内容',
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
                              thickness: 1,
                              color: HanaColors.surfaceVariant.withAlpha(51),
                            ),
                            _ListTileItem(
                              icon: Icons.warning,
                              iconColor: HanaColors.tertiary,
                              title: '清除所有数据',
                              titleColor: HanaColors.tertiary,
                              isChevron: true,
                              chevronColor: HanaColors.tertiary,
                              onTap: () async {
                                final confirm = await showDialog<bool>(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: const Text('清除数据'),
                                    content: const Text('确定要清除所有本地数据吗？此操作不可逆。'),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(false),
                                        child: const Text('取消'),
                                      ),
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(true),
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
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                // Data Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        '数据',
                        style:
                            Theme.of(context).textTheme.labelMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: HanaColors.onSurfaceVariant,
                                  letterSpacing: 1.5,
                                ),
                      ),
                      const SizedBox(height: 16),
                      Column(
                        children: [
                          _ButtonRowItem(
                            icon: Icons.cloud_upload,
                            title: '导出备份',
                            trailingText: state.settings.lastBackupDate != null
                                ? DateFormat('M月d日')
                                    .format(state.settings.lastBackupDate!)
                                : '从未备份',
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
                            title: '生成 PDF 报告',
                            isChevron: true,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                // About Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        '关于',
                        style:
                            Theme.of(context).textTheme.labelMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: HanaColors.onSurfaceVariant,
                                  letterSpacing: 1.5,
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
                        clipBehavior: Clip.antiAlias,
                        child: Column(
                          children: [
                            const _ListTileItem(
                              title: '版本',
                              trailingText: 'v0.1.0',
                            ),
                            Divider(
                              height: 1,
                              thickness: 1,
                              color: HanaColors.surfaceVariant.withAlpha(51),
                            ),
                            const _ListTileItem(
                              title: '隐私政策',
                              isChevron: true,
                            ),
                            Divider(
                              height: 1,
                              thickness: 1,
                              color: HanaColors.surfaceVariant.withAlpha(51),
                            ),
                            const _ListTileItem(
                              title: '使用条款',
                              isChevron: true,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                // Footer Logo
                const Opacity(
                  opacity: 0.2,
                  child: Column(
                    children: [
                      Text(
                        'HanaNote',
                        style: TextStyle(
                          fontFamily: 'Plus Jakarta Sans',
                          fontWeight: FontWeight.w800,
                          fontSize: 18,
                          letterSpacing: 2,
                          color: HanaColors.primary,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '与你同行',
                        style: TextStyle(
                          fontFamily: 'Be Vietnam Pro',
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 2,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 120),
              ],
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
  });

  final IconData icon;
  final Color iconColor;
  final Color iconBgColor;
  final String title;
  final String subtitle;
  final Color subtitleColor;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: HanaColors.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: HanaColors.outlineVariant.withAlpha(26)),
          boxShadow: const [BoxShadow(color: Color(0x05000000), blurRadius: 4)],
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                if (icon != null) ...[
                  Icon(icon, color: iconColor, size: 24),
                  const SizedBox(width: 16),
                ],
                Column(
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
              ],
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: HanaColors.primary,
              ), // primary-fixed-variant equivalent approx
              const SizedBox(width: 16),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: HanaColors.onSurface,
                ),
              ),
            ],
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
