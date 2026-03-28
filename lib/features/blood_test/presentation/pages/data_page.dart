// Release prep note: This page keeps a few dense sections simple while the
// blood test editor flow is being connected.
// ignore_for_file: public_member_api_docs

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hananote/app/theme/hana_colors.dart';
import 'package:hananote/features/blood_test/domain/entities/enums.dart';
import 'package:hananote/features/blood_test/presentation/bloc/blood_test_bloc.dart';
import 'package:hananote/features/blood_test/presentation/bloc/blood_test_event.dart';
import 'package:hananote/features/blood_test/presentation/bloc/blood_test_state.dart';
import 'package:intl/intl.dart';

class DataPage extends StatelessWidget {
  const DataPage({super.key});

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
              centerTitle: false,
              titleSpacing: 0,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: HanaColors.primary),
                onPressed: () {},
              ),
              title: const Text(
                '数据',
                style: TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: HanaColors.primary,
                  letterSpacing: -0.5,
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: ElevatedButton.icon(
                    onPressed: () => context.push('/data/add_report'),
                    icon: const Icon(Icons.add, size: 16, color: Colors.white),
                    label: const Text(
                      '添加报告',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: HanaColors.primary,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 6,
                      ),
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9999),
                      ),
                      elevation: 0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: BlocBuilder<BloodTestBloc, BloodTestState>(
        builder: (context, state) {
          return state.map(
            initial: (_) => const SizedBox.shrink(),
            loading: (_) => const Center(
              child: CircularProgressIndicator(color: HanaColors.primary),
            ),
            error: (error) => Center(child: Text(error.message)),
            loaded: (loaded) => _LoadedView(state: loaded),
          );
        },
      ),
    );
  }
}

class _LoadedView extends StatelessWidget {
  const _LoadedView({required this.state});

  final BloodTestLoaded state;

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('yyyy.MM.dd');
    final lastUpdatedText = state.lastUpdated == null
        ? '暂无更新'
        : '最后更新：${dateFormat.format(state.lastUpdated!)}';

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 100, 16, 120),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '激素指标',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: HanaColors.primary,
                    ),
              ),
              Text(
                lastUpdatedText,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: HanaColors.onSurfaceVariant.withAlpha(153),
                    ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: state.latestReadings.values.map((reading) {
              final status = reading.type.statusFor(reading.value);
              return _HormoneCard(
                name: reading.type.displayName,
                value:
                    '${reading.value.toStringAsFixed(1)} ${reading.type.defaultUnit}',
                subtitle: status.displayName,
                borderColor: switch (status) {
                  HormoneStatus.normal => const Color(0xFF34D399),
                  HormoneStatus.warning => HanaColors.tertiary,
                  HormoneStatus.critical => HanaColors.error,
                },
                onTap: () {
                  context.read<BloodTestBloc>().add(
                        SelectHormoneForTrend(reading.type),
                      );
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 24),
          InkWell(
            onTap: () => context.push('/data/simulator'),
            borderRadius: BorderRadius.circular(24),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [HanaColors.primary, HanaColors.secondary],
                ),
                borderRadius: BorderRadius.circular(24),
              ),
              child: const Row(
                children: [
                  Icon(Icons.science, color: Colors.white),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'PK 模拟器',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 16,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 32),
          Text(
            '历史记录',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: HanaColors.primary,
                ),
          ),
          const SizedBox(height: 16),
          if (state.reports.isEmpty)
            const _EmptyHistoryCard()
          else
            ...state.reports.map((report) {
              final summary = report.readings
                  .take(3)
                  .map((reading) => '${reading.type.displayName}: ${reading.value}')
                  .join(' / ');
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: _HistoryCard(
                  date: dateFormat.format(report.testDate),
                  summary: summary,
                  onTap: () =>
                      context.push('/data/add_report?id=${report.id}'),
                ),
              );
            }),
        ],
      ),
    );
  }
}

class _HormoneCard extends StatelessWidget {
  const _HormoneCard({
    required this.name,
    required this.value,
    required this.subtitle,
    required this.borderColor,
    required this.onTap,
  });

  final String name;
  final String value;
  final String subtitle;
  final Color borderColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: HanaColors.surfaceContainerLowest,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: borderColor),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: HanaColors.onSurfaceVariant,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  value,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: HanaColors.onSurfaceVariant,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _HistoryCard extends StatelessWidget {
  const _HistoryCard({
    required this.date,
    required this.summary,
    required this.onTap,
  });

  final String date;
  final String summary;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: HanaColors.surfaceContainerLowest,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: HanaColors.outlineVariant.withAlpha(26)),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      date,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      summary,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
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
    );
  }
}

class _EmptyHistoryCard extends StatelessWidget {
  const _EmptyHistoryCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: HanaColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: HanaColors.outlineVariant.withAlpha(26)),
      ),
      child: Text(
        '暂无血检记录',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: HanaColors.onSurfaceVariant,
            ),
      ),
    );
  }
}
