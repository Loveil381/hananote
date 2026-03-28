import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hananote/app/theme/hana_colors.dart';
import 'package:hananote/features/timeline/domain/entities/enums.dart';
import 'package:hananote/features/timeline/domain/entities/timeline_event.dart';
import 'package:hananote/features/timeline/presentation/bloc/timeline_bloc.dart';
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
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showCreateSheet(context),
        backgroundColor: HanaColors.primary,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: BlocBuilder<TimelineBloc, TimelineState>(
        builder: (context, state) {
          return switch (state) {
            TimelineInitial() || TimelineLoading() => const Center(
                child: CircularProgressIndicator(color: HanaColors.primary),
              ),
            TimelineError(:final message) => Center(child: Text(message)),
            TimelineLoaded(:final events) =>
              _TimelineLoadedView(events: events),
          };
        },
      ),
    );
  }

  Future<void> _showCreateSheet(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      builder: (sheetContext) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.medication_outlined),
                title: const Text('记录服药'),
                onTap: () {
                  Navigator.of(sheetContext).pop();
                  context.push('/today');
                },
              ),
              ListTile(
                leading: const Icon(Icons.edit_note),
                title: const Text('写日记'),
                onTap: () {
                  Navigator.of(sheetContext).pop();
                  context.push('/record/journal/new');
                },
              ),
              ListTile(
                leading: const Icon(Icons.science_outlined),
                title: const Text('添加血检'),
                onTap: () {
                  Navigator.of(sheetContext).pop();
                  context.push('/data/add_report');
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class _TimelineLoadedView extends StatelessWidget {
  const _TimelineLoadedView({required this.events});

  final List<TimelineEvent> events;

  @override
  Widget build(BuildContext context) {
    if (events.isEmpty) {
      return const Center(child: Text('暂无可展示的时间线记录'));
    }

    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(24, 100, 24, 120),
      itemCount: events.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final event = events[index];
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: HanaColors.surfaceContainerLowest,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: event.type.borderColor),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                event.type.displayName,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: event.type.borderColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 6),
              Text(
                event.title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
              if (event.subtitle != null) ...[
                const SizedBox(height: 6),
                Text(
                  event.subtitle!,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: HanaColors.onSurfaceVariant,
                      ),
                ),
              ],
              const SizedBox(height: 8),
              Text(
                DateFormat('yyyy.MM.dd HH:mm').format(event.date),
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: HanaColors.onSurfaceVariant,
                    ),
              ),
            ],
          ),
        );
      },
    );
  }
}
