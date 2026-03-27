// Release prep note: This page predates the release lint baseline and keeps a
// few file-level suppressions because the dense widget tree is being stabilized
// before a readability refactor.
// ignore_for_file: public_member_api_docs
// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: lines_longer_than_80_chars

import 'dart:ui';

import 'package:fl_chart/fl_chart.dart';
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
                '我的检查',
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
                    onPressed: () {},
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
            error: (e) => Center(child: Text(e.message)),
            loaded: (loadedState) => _buildBody(context, loadedState),
          );
        },
      ),
    );
  }

  Widget _buildBody(BuildContext context, BloodTestLoaded state) {
    final dateFormat = DateFormat('yyyy.MM.dd');
    final lastUpdatedText = state.lastUpdated != null
        ? '最近更新：${dateFormat.format(state.lastUpdated!)}'
        : '无最近更新';

    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 100),

          // Hormone Cards Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
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
                        color: HanaColors.onSurfaceVariant
                            .withAlpha((255 * 0.6).round()),
                      ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: state.latestReadings.values.map((reading) {
                final isSelected = state.selectedTrendHormone == reading.type;
                final status = reading.type.statusFor(reading.value);
                final statusColor = _getStatusColor(status);
                final (minVal, maxVal) = reading.type.targetRange;
                final rangeValue = '$minVal - $maxVal';

                return Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: GestureDetector(
                    onTap: () {
                      context.read<BloodTestBloc>().add(
                            SelectHormoneForTrend(reading.type),
                          );
                    },
                    child: _HormoneCard(
                      name: reading.type.displayName,
                      value: reading.value.toStringAsFixed(1),
                      unit: reading.type.defaultUnit,
                      rangeLabel: '目标范围',
                      rangeValue: rangeValue,
                      statusColor: statusColor,
                      isWarning: status != HormoneStatus.normal,
                      isSelected: isSelected,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),

          const SizedBox(height: 32),

          // Simulator Entry
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: InkWell(
              onTap: () => context.push('/data/simulator'),
              borderRadius: BorderRadius.circular(24),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [HanaColors.primary, HanaColors.secondary],
                  ),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x33864E5A),
                      blurRadius: 16,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: const BoxDecoration(
                        color: Colors.white24,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.science, color: Colors.white),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'PK 模拟器 (实验)',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '极具参考价值的多模型预测',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 16,
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 32),

          // Trend Chart Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: HanaColors.surfaceContainerLow,
                borderRadius: BorderRadius.circular(32),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${state.selectedTrendHormone.displayName}趋势',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: HanaColors.primary,
                            ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: HanaColors.surfaceContainerHigh,
                          borderRadius: BorderRadius.circular(9999),
                        ),
                        child: Row(
                          children: [
                            _buildRangePill(
                              context,
                              state,
                              TrendRange.oneMonth,
                              '1月',
                            ),
                            _buildRangePill(
                              context,
                              state,
                              TrendRange.threeMonths,
                              '3月',
                            ),
                            _buildRangePill(
                              context,
                              state,
                              TrendRange.sixMonths,
                              '6月',
                            ),
                            _buildRangePill(
                              context,
                              state,
                              TrendRange.oneYear,
                              '1年',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Chart Area
                  SizedBox(
                    height: 192,
                    width: double.infinity,
                    child: _buildTrendChart(state),
                  ),
                  const SizedBox(height: 48),
                  // Legend
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: HanaColors.primaryContainer,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            '实测数值',
                            style: TextStyle(
                              fontSize: 10,
                              color: HanaColors.onSurfaceVariant.withAlpha(153),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 16),
                      Row(
                        children: [
                          Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: const Color(0xFF10B981).withAlpha(26),
                              border: Border.all(
                                color: const Color(0xFF10B981).withAlpha(51),
                              ),
                            ),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            '目标健康域',
                            style: TextStyle(
                              fontSize: 10,
                              color: HanaColors.onSurfaceVariant.withAlpha(153),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 32),
          // History Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  '历史记录',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: HanaColors.primary,
                      ),
                ),
                const SizedBox(height: 16),
                ...state.reports.map((report) {
                  final dateStr = dateFormat.format(report.testDate);
                  final summary = report.readings
                      .take(3)
                      .map((r) => '${r.type.displayName}: ${r.value}')
                      .join(' / ');

                  var highestStatus = HormoneStatus.normal;
                  for (final r in report.readings) {
                    final status = r.type.statusFor(r.value);
                    if (status == HormoneStatus.critical) {
                      highestStatus = HormoneStatus.critical;
                    } else if (status == HormoneStatus.warning &&
                        highestStatus != HormoneStatus.critical) {
                      highestStatus = HormoneStatus.warning;
                    }
                  }

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: _HistoryCard(
                      date: dateStr,
                      summary: summary,
                      borderColor: _getStatusColor(highestStatus),
                    ),
                  );
                }),
              ],
            ),
          ),
          const SizedBox(height: 120),
        ],
      ),
    );
  }

  Widget _buildRangePill(
    BuildContext context,
    BloodTestLoaded state,
    TrendRange range,
    String text,
  ) {
    final isSelected = state.selectedRange == range;
    return GestureDetector(
      onTap: () {
        context.read<BloodTestBloc>().add(SelectTrendRange(range));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
          color: isSelected
              ? HanaColors.surfaceContainerLowest
              : Colors.transparent,
          borderRadius: BorderRadius.circular(9999),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.black.withAlpha(10),
                    blurRadius: 4,
                  ),
                ]
              : null,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 10,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
            color: isSelected
                ? HanaColors.primary
                : HanaColors.onSurfaceVariant.withAlpha((255 * 0.6).round()),
          ),
        ),
      ),
    );
  }

  Widget _buildTrendChart(BloodTestLoaded state) {
    if (state.trendData.isEmpty) {
      return const Center(
        child: Text(
          '暂无趋势数据',
          style: TextStyle(color: HanaColors.onSurfaceVariant),
        ),
      );
    }

    final readingWithDates = state.trendData.map((reading) {
      final report = state.reports.firstWhere(
        (r) => r.id == reading.reportId,
        orElse: () => state.reports.first,
      );
      return (date: report.testDate, value: reading.value);
    }).toList()
      ..sort((a, b) => a.date.compareTo(b.date));

    final spots = readingWithDates.asMap().entries.map((e) {
      return FlSpot(e.key.toDouble(), e.value.value);
    }).toList();

    final (minVal, maxVal) = state.selectedTrendHormone.targetRange;

    return LineChart(
      LineChartData(
        minY: minVal * 0.5,
        gridData: FlGridData(
          drawVerticalLine: false,
          horizontalInterval: maxVal > 0 ? maxVal / 2 : 1,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: HanaColors.onSurfaceVariant.withAlpha(13),
              strokeWidth: 1,
            );
          },
        ),
        titlesData: FlTitlesData(
          topTitles: const AxisTitles(),
          rightTitles: const AxisTitles(),
          leftTitles: const AxisTitles(),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              interval: 1,
              getTitlesWidget: (value, meta) {
                final index = value.toInt();
                if (index >= 0 && index < readingWithDates.length) {
                  final data = readingWithDates[index];
                  return Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      DateFormat('M月').format(data.date),
                      style: TextStyle(
                        fontSize: 10,
                        color: HanaColors.onSurfaceVariant.withAlpha(102),
                      ),
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ),
        borderData: FlBorderData(show: false),
        extraLinesData: ExtraLinesData(
          horizontalLines: [
            HorizontalLine(
              y: maxVal,
              color: const Color(0xFF10B981).withAlpha(26),
              label: HorizontalLineLabel(
                show: true,
                alignment: Alignment.topRight,
                padding: const EdgeInsets.only(right: 8, bottom: 4),
                style: const TextStyle(
                  fontSize: 8,
                  fontWeight: FontWeight.bold,
                  color: Color(0x8010B981),
                  letterSpacing: 2,
                ),
                labelResolver: (_) => 'TARGET',
              ),
            ),
            HorizontalLine(
              y: minVal,
              color: const Color(0xFF10B981).withAlpha(26),
            ),
          ],
        ),
        lineBarsData: [
          LineChartBarData(
            spots: spots,
            isCurved: true,
            color: const Color(0xFFFFB7C5),
            barWidth: 3,
            isStrokeCapRound: true,
            dotData: FlDotData(
              getDotPainter: (spot, percent, barData, index) {
                return FlDotCirclePainter(
                  radius: 6,
                  color: HanaColors.primary,
                  strokeWidth: 2,
                  strokeColor: Colors.white,
                );
              },
            ),
            belowBarData: BarAreaData(
              show: true,
              color: const Color(0x1A10B981),
              cutOffY: maxVal,
              applyCutOffY: true,
            ),
          ),
        ],
        lineTouchData: LineTouchData(
          touchTooltipData: LineTouchTooltipData(
            getTooltipColor: (_) => HanaColors.surfaceContainerHighest,
            tooltipRoundedRadius: 8,
            getTooltipItems: (touchedSpots) {
              return touchedSpots.map((LineBarSpot touchedSpot) {
                const textStyle = TextStyle(
                  color: HanaColors.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                );
                return LineTooltipItem(
                  touchedSpot.y.toStringAsFixed(1),
                  textStyle,
                );
              }).toList();
            },
          ),
        ),
      ),
    );
  }

  Color _getStatusColor(HormoneStatus status) {
    return switch (status) {
      HormoneStatus.normal => const Color(0xFF34D399),
      HormoneStatus.warning => HanaColors.tertiary,
      HormoneStatus.critical => HanaColors.error,
    };
  }
}

class _HormoneCard extends StatelessWidget {
  const _HormoneCard({
    required this.name,
    required this.value,
    required this.unit,
    required this.rangeLabel,
    required this.rangeValue,
    required this.statusColor,
    required this.isWarning,
    required this.isSelected,
  });

  final String name;
  final String value;
  final String unit;
  final String rangeLabel;
  final String rangeValue;
  final Color statusColor;
  final bool isWarning;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: 160),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: HanaColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: isSelected
              ? HanaColors.primary
              : isWarning
                  ? HanaColors.error.withAlpha((255 * 0.3).round())
                  : HanaColors.primary.withAlpha((255 * 0.05).round()),
          width: isSelected ? 2 : 1,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: HanaColors.onSurfaceVariant
                          .withAlpha((255 * 0.7).round()),
                    ),
              ),
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: statusColor,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(color: statusColor.withAlpha(102), blurRadius: 8),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            value,
            style: TextStyle(
              fontFamily: 'Plus Jakarta Sans',
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: isWarning ? HanaColors.error : HanaColors.primary,
            ),
          ),
          Text(
            unit,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: HanaColors.onSurfaceVariant
                      .withAlpha((255 * 0.6).round()),
                  letterSpacing: 1.5,
                ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.only(top: 16),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: HanaColors.primary.withAlpha((255 * 0.05).round()),
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  rangeLabel,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: HanaColors.onSurfaceVariant
                            .withAlpha((255 * 0.4).round()),
                      ),
                ),
                Text(
                  rangeValue,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: HanaColors.onSurface,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _HistoryCard extends StatelessWidget {
  const _HistoryCard({
    required this.date,
    required this.summary,
    required this.borderColor,
  });

  final String date;
  final String summary;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: HanaColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        border: Border(left: BorderSide(color: borderColor, width: 4)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x08864E5A),
            blurRadius: 12,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                date,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: HanaColors.onSurface,
                    ),
              ),
              const SizedBox(height: 4),
              Text(
                summary,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: HanaColors.onSurfaceVariant
                          .withAlpha((255 * 0.7).round()),
                    ),
              ),
            ],
          ),
          const Icon(Icons.chevron_right, color: Colors.black12),
        ],
      ),
    );
  }
}
