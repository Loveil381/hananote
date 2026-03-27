import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hananote/app/theme/hana_colors.dart';
import 'package:hananote/features/timeline/domain/entities/enums.dart';
import 'package:hananote/features/timeline/domain/entities/timeline_event.dart';
import 'package:hananote/features/timeline/presentation/bloc/timeline_bloc.dart';
import 'package:hananote/features/timeline/presentation/bloc/timeline_event.dart';
import 'package:hananote/features/timeline/presentation/bloc/timeline_state.dart';
import 'package:intl/intl.dart';

/// Timeline page showing aggregated cross-feature events.
class TimelinePage extends StatelessWidget {
  /// Creates a [TimelinePage].
  const TimelinePage({super.key});

  @override
  Widget build(BuildContext context) {
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
                '时间线',
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
                    Icons.calendar_today,
                    color: HanaColors.primary,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          BlocBuilder<TimelineBloc, TimelineState>(
            builder: (context, state) {
              final selectedRange = switch (state) {
                TimelineLoaded(:final selectedRange) => selectedRange,
                _ => TimelineRange.oneMonth,
              };

              return SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 100),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        children: TimelineRange.values.indexed.map((entry) {
                          final index = entry.$1;
                          final range = entry.$2;

                          return Padding(
                            padding: EdgeInsets.only(
                              right: index == TimelineRange.values.length - 1
                                  ? 0
                                  : 8,
                            ),
                            child: _RangePill(
                              text: range.displayName,
                              isSelected: range == selectedRange,
                              onTap: () => context.read<TimelineBloc>().add(
                                    TimelineBlocEvent.selectRange(range),
                                  ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(height: 32),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: switch (state) {
                        TimelineInitial() || TimelineLoading() =>
                          const _TimelineLoadingView(),
                        TimelineError(:final message) => _TimelineErrorView(
                            message: message,
                          ),
                        TimelineLoaded(
                          :final events,
                          :final hrtStartDate,
                        ) =>
                          events.isEmpty
                              ? _TimelineEmptyView(
                                  hrtStartDate: hrtStartDate,
                                )
                              : _TimelineContent(
                                  events: events,
                                  hrtStartDate: hrtStartDate,
                                ),
                      },
                    ),
                    const SizedBox(height: 140),
                  ],
                ),
              );
            },
          ),
          Positioned(
            bottom: 120,
            right: 24,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: HanaColors.primary.withAlpha(51),
                    blurRadius: 16,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: FloatingActionButton(
                onPressed: () {},
                elevation: 0,
                backgroundColor: Colors.transparent,
                shape: const CircleBorder(),
                child: Container(
                  width: 56,
                  height: 56,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [HanaColors.primary, HanaColors.secondary],
                    ),
                  ),
                  child: const Icon(Icons.add, color: Colors.white, size: 28),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _RangePill extends StatelessWidget {
  const _RangePill({
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? HanaColors.primaryContainer
              : HanaColors.surfaceContainerHigh,
          borderRadius: BorderRadius.circular(9999),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: HanaColors.primaryContainer.withAlpha(51),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 12,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            color: isSelected
                ? HanaColors.onPrimaryContainer
                : HanaColors.onSurfaceVariant,
          ),
        ),
      ),
    );
  }
}

class _TimelineContent extends StatelessWidget {
  const _TimelineContent({
    required this.events,
    required this.hrtStartDate,
  });

  final List<TimelineEvent> events;
  final DateTime? hrtStartDate;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Positioned.fill(
          child: Center(
            child: Container(
              width: 2,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFFFB7C5), Color(0xFFFCD3FB)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
        ),
        Column(
          children: [
            ...events.indexed.expand((entry) sync* {
              final index = entry.$1;
              final event = entry.$2;

              yield _TimelineCard(
                date: _formatDate(event.date),
                type: event.type.displayName,
                title: event.title,
                subtitle: event.subtitle,
                borderColor: event.type.borderColor,
                icon: event.type.icon,
                iconColor: event.type.iconColor,
                isRight: index.isEven,
                extra: _buildExtra(event),
              );

              if (index != events.length - 1) {
                yield const SizedBox(height: 48);
              }
            }),
            if (hrtStartDate != null) ...[
              const SizedBox(height: 32),
              _JourneyStartMarker(date: hrtStartDate!),
            ],
          ],
        ),
      ],
    );
  }

  Widget? _buildExtra(TimelineEvent event) {
    if (event.type != TimelineEventType.bloodTest) {
      return null;
    }

    final targetRate = (event.metadata?['targetRate'] as num?)?.toDouble();
    if (targetRate == null) {
      return null;
    }

    final clampedRate = targetRate.clamp(0.0, 1.0);
    return Container(
      margin: const EdgeInsets.only(top: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '达标率 ${(clampedRate * 100).round()}%',
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: HanaColors.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 6),
          ClipRRect(
            borderRadius: BorderRadius.circular(9999),
            child: SizedBox(
              height: 12,
              child: Stack(
                children: [
                  Container(color: const Color(0xFFE8F5E9)),
                  FractionallySizedBox(
                    widthFactor: clampedRate,
                    child: Container(color: const Color(0xFF4CAF50)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  static String _formatDate(DateTime date) =>
      DateFormat('yyyy.M.d').format(date);
}

class _TimelineLoadingView extends StatelessWidget {
  const _TimelineLoadingView();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 120),
      child: Center(
        child: CircularProgressIndicator(color: HanaColors.primary),
      ),
    );
  }
}

class _TimelineErrorView extends StatelessWidget {
  const _TimelineErrorView({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 120, horizontal: 24),
      child: Column(
        children: [
          const Icon(
            Icons.error_outline_rounded,
            color: HanaColors.primary,
            size: 28,
          ),
          const SizedBox(height: 12),
          Text(
            message,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: HanaColors.onSurfaceVariant,
                ),
          ),
        ],
      ),
    );
  }
}

class _TimelineEmptyView extends StatelessWidget {
  const _TimelineEmptyView({required this.hrtStartDate});

  final DateTime? hrtStartDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: const BoxDecoration(
              color: HanaColors.surfaceContainerHigh,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.auto_stories_rounded,
              color: HanaColors.primary,
              size: 32,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            '你的故事即将开始 🌸',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: HanaColors.onSurface,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            '当你记录服药、检测和心情后，这里会慢慢长成一条属于你的时间线。',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: HanaColors.onSurfaceVariant,
                ),
          ),
          if (hrtStartDate != null) ...[
            const SizedBox(height: 40),
            _JourneyStartMarker(date: hrtStartDate!),
          ],
        ],
      ),
    );
  }
}

class _JourneyStartMarker extends StatelessWidget {
  const _JourneyStartMarker({required this.date});

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: const BoxDecoration(
            color: HanaColors.surfaceContainerHighest,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.psychology,
            color: HanaColors.primary,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          '旅程开始 ${DateFormat('yyyy.MM.dd').format(date)}',
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: HanaColors.onSurfaceVariant,
              ),
        ),
        const SizedBox(height: 16),
        Container(
          width: 8,
          height: 8,
          decoration: const BoxDecoration(
            color: HanaColors.primary,
            shape: BoxShape.circle,
          ),
        ),
      ],
    );
  }
}

class _TimelineCard extends StatelessWidget {
  const _TimelineCard({
    required this.date,
    required this.type,
    required this.title,
    required this.borderColor,
    required this.icon,
    required this.iconColor,
    required this.isRight,
    this.subtitle,
    this.extra,
  });

  final String date;
  final String type;
  final String title;
  final String? subtitle;
  final Color borderColor;
  final IconData icon;
  final Color iconColor;
  final bool isRight;
  final Widget? extra;

  @override
  Widget build(BuildContext context) {
    final cardWidget = Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: HanaColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        border: Border(
          left: isRight
              ? BorderSide(color: borderColor, width: 4)
              : BorderSide.none,
          right: !isRight
              ? BorderSide(color: borderColor, width: 4)
              : BorderSide.none,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0A864E5A),
            blurRadius: 20,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment:
            isRight ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (!isRight) ...[
                Text(
                  type,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: borderColor.withAlpha((255 * 0.6).round()),
                      ),
                ),
                const SizedBox(width: 8),
              ],
              Icon(icon, color: iconColor, size: 16),
              if (isRight) ...[
                const SizedBox(width: 8),
                Text(
                  type,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: borderColor.withAlpha((255 * 0.6).round()),
                      ),
                ),
              ],
            ],
          ),
          const SizedBox(height: 8),
          Text(
            title,
            textAlign: isRight ? TextAlign.left : TextAlign.right,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: HanaColors.onSurface,
                ),
          ),
          if (subtitle != null) ...[
            const SizedBox(height: 6),
            Text(
              subtitle!,
              textAlign: isRight ? TextAlign.left : TextAlign.right,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: HanaColors.onSurfaceVariant,
                    height: 1.4,
                  ),
            ),
          ],
          if (extra != null) extra!,
        ],
      ),
    );

    final dateWidget = Align(
      alignment: isRight ? Alignment.centerRight : Alignment.centerLeft,
      child: Text(
        date,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: HanaColors.onSurfaceVariant.withAlpha((255 * 0.4).round()),
              fontWeight: FontWeight.w600,
            ),
      ),
    );

    return IntrinsicHeight(
      child: Row(
        children: [
          Expanded(child: isRight ? dateWidget : cardWidget),
          SizedBox(
            width: 48,
            child: Center(
              child: Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: borderColor, width: 4),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(26),
                      blurRadius: 4,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(child: isRight ? cardWidget : dateWidget),
        ],
      ),
    );
  }
}
