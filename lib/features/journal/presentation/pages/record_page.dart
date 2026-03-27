// ignore_for_file: public_member_api_docs

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hananote/app/theme/hana_colors.dart';
import 'package:hananote/features/journal/presentation/bloc/record_bloc.dart';
import 'package:hananote/features/journal/presentation/bloc/record_state.dart';
import 'package:intl/intl.dart';

class RecordPage extends StatelessWidget {
  const RecordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecordBloc, RecordState>(
      builder: (context, state) {
        final todayStr = DateFormat('M月d日').format(DateTime.now());

        var moodTag = '开始你的第一篇日记';
        var photoTag = '还没有拍照记录';
        var measureTag = '还没有测量记录';

        state.mapOrNull(
          loaded: (loadedState) {
            if (loadedState.journalStreak > 0) {
              moodTag = '已连续记录 ${loadedState.journalStreak} 天';
            }
            if (loadedState.lastPhotoDate != null) {
              final dateStr =
                  DateFormat('M月d日').format(loadedState.lastPhotoDate!);
              photoTag = '上次：$dateStr';
            }
            if (loadedState.lastMeasurementSummary != null) {
              measureTag = loadedState.lastMeasurementSummary!;
            }
          },
        );

        return Scaffold(
          backgroundColor: HanaColors.background,
          extendBodyBehindAppBar: true,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(64),
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                child: AppBar(
                  backgroundColor: HanaColors.background.withAlpha(
                    (255 * 0.8).round(),
                  ),
                  elevation: 0,
                  scrolledUnderElevation: 0,
                  centerTitle: true,
                  leading: IconButton(
                    icon: const Icon(Icons.notes, color: HanaColors.primary),
                    onPressed: () {},
                  ),
                  title: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        '今日记录',
                        style: TextStyle(
                          fontFamily: 'Plus Jakarta Sans',
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: HanaColors.primary,
                          letterSpacing: -0.5,
                        ),
                      ),
                      Text(
                        todayStr,
                        style: TextStyle(
                          fontFamily: 'Plus Jakarta Sans',
                          fontWeight: FontWeight.w500,
                          fontSize: 10,
                          color: HanaColors.primary.withAlpha(
                            (255 * 0.6).round(),
                          ),
                          letterSpacing: 2,
                        ),
                      ),
                    ],
                  ),
                  actions: [
                    IconButton(
                      icon: const Icon(
                        Icons.history_edu,
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
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 100),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    '你好，\n今天想留下什么回忆？',
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          fontFamily: 'Plus Jakarta Sans',
                          fontWeight: FontWeight.w800,
                          color: HanaColors.primary,
                          letterSpacing: -0.5,
                          height: 1.2,
                        ),
                  ),
                ),
                const SizedBox(height: 32),
                _RecordEntryCard(
                  icon: Icons.camera_alt,
                  title: '拍照记录',
                  subtitle: '加密存储，只有你能看到',
                  tag: photoTag,
                  accentColor: HanaColors.primaryContainer,
                  tagBgColor: HanaColors.primaryContainer.withAlpha(77),
                  bgIcon: Icons.photo_library,
                  bgIconRotation: 12 * 3.14159 / 180,
                ),
                const SizedBox(height: 24),
                _RecordEntryCard(
                  icon: Icons.straighten,
                  title: '身体测量',
                  subtitle: '记录身体的每一点变化',
                  tag: measureTag,
                  accentColor: HanaColors.secondaryContainer,
                  tagBgColor: HanaColors.secondaryContainer.withAlpha(128),
                  bgIcon: Icons.show_chart,
                  bgIconRotation: -12 * 3.14159 / 180,
                  onTap: () => context.push('/measurement'),
                ),
                const SizedBox(height: 24),
                _RecordEntryCard(
                  icon: Icons.menu_book,
                  title: '心情日记',
                  subtitle: '今天想说点什么',
                  tag: moodTag,
                  accentColor: HanaColors.surfaceContainerHigh,
                  tagBgColor: HanaColors.surfaceContainerHigh,
                  bgIcon: Icons.auto_stories,
                  bgIconRotation: 6 * 3.14159 / 180,
                  onTap: () => context.push('/journal/edit'),
                ),
                const SizedBox(height: 48),
                Center(
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Icon(
                        Icons.spa,
                        size: 64,
                        color: HanaColors.primary.withAlpha(77),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: const BoxDecoration(
                            color: HanaColors.primaryContainer,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Center(
                  child: Text(
                    '每一次记录都是对未来的温柔期许',
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: HanaColors.primary.withAlpha(153),
                          letterSpacing: 2,
                        ),
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

class _RecordEntryCard extends StatelessWidget {
  const _RecordEntryCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.tag,
    required this.accentColor,
    required this.tagBgColor,
    required this.bgIcon,
    required this.bgIconRotation,
    this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final String tag;
  final Color accentColor;
  final Color tagBgColor;
  final IconData bgIcon;
  final double bgIconRotation;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap ?? () {},
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: HanaColors.surfaceContainerLowest,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: accentColor.withAlpha(26)),
            boxShadow: [
              BoxShadow(
                color: accentColor.withAlpha(10),
                blurRadius: 16,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: -48,
                right: -48,
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                  child: Container(
                    width: 128,
                    height: 128,
                    decoration: BoxDecoration(
                      color: accentColor.withAlpha(26),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: accentColor.withAlpha(51),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Icon(
                      icon,
                      color: accentColor == HanaColors.surfaceContainerHigh
                          ? HanaColors.primary
                          : accentColor,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: HanaColors.onSurface,
                                  ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          subtitle,
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: HanaColors.onSurfaceVariant
                                        .withAlpha((255 * 0.7).round()),
                                  ),
                        ),
                        const SizedBox(height: 16),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: tagBgColor,
                            borderRadius: BorderRadius.circular(9999),
                          ),
                          child: Text(
                            tag,
                            style: TextStyle(
                              color:
                                  accentColor == HanaColors.surfaceContainerHigh
                                      ? HanaColors.onSurfaceVariant
                                      : accentColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Transform.rotate(
                    angle: bgIconRotation,
                    child: Icon(
                      bgIcon,
                      size: 64,
                      color: accentColor == HanaColors.surfaceContainerHigh
                          ? HanaColors.onSurfaceVariant.withAlpha(51)
                          : accentColor.withAlpha(51),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
