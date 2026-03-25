// ignore_for_file: public_member_api_docs

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:hananote/app/theme/hana_colors.dart';

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
      body: SingleChildScrollView(
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
                    '最近更新：2026.03.15',
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: HanaColors.onSurfaceVariant
                              .withAlpha((255 * 0.6).round()),
                        ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  _HormoneCard(
                    name: '雌二醇',
                    value: '156',
                    unit: 'pg/mL',
                    rangeLabel: '目标范围',
                    rangeValue: '100 - 200',
                    statusColor: Color(0xFF34D399),
                    isWarning: false,
                  ),
                  SizedBox(width: 16),
                  _HormoneCard(
                    name: '睾酮',
                    value: '32',
                    unit: 'ng/dL',
                    rangeLabel: '目标范围',
                    rangeValue: '< 50',
                    statusColor: Color(0xFF34D399),
                    isWarning: false,
                  ),
                  SizedBox(width: 16),
                  _HormoneCard(
                    name: '泌乳素',
                    value: '28',
                    unit: 'ng/mL',
                    rangeLabel: '阈值',
                    rangeValue: '≥ 25',
                    statusColor: Color(0xFFFBBF24),
                    isWarning: true,
                  ),
                ],
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
                          '雌二醇趋势',
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
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
                              _buildPill('1月', false),
                              _buildPill('3月', true),
                              _buildPill('6月', false),
                              _buildPill('1年', false),
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
                      child: Stack(
                        children: [
                          // Grid Lines
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(
                              4,
                              (index) => Container(
                                height: 1,
                                color:
                                    HanaColors.onSurfaceVariant.withAlpha(13),
                              ),
                            ),
                          ),
                          // Target Zone
                          Positioned(
                            top: 48,
                            bottom: 48,
                            left: 0,
                            right: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFF10B981).withAlpha(13),
                                border: Border(
                                  top: BorderSide(
                                    color:
                                        const Color(0xFF10B981).withAlpha(26),
                                  ),
                                  bottom: BorderSide(
                                    color:
                                        const Color(0xFF10B981).withAlpha(26),
                                  ),
                                ),
                              ),
                              alignment: Alignment.centerRight,
                              padding: const EdgeInsets.only(right: 8),
                              child: const Text(
                                'TARGET',
                                style: TextStyle(
                                  fontSize: 8,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0x8010B981),
                                  letterSpacing: 2,
                                ),
                              ),
                            ),
                          ),
                          // Spline
                          Positioned.fill(
                            child: CustomPaint(
                              painter: _TrendChartPainter(),
                            ),
                          ),
                          // X Axis Labels
                          Positioned(
                            bottom: -24,
                            left: 0,
                            right: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '1月',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: HanaColors.onSurfaceVariant
                                        .withAlpha(102),
                                  ),
                                ),
                                Text(
                                  '2月',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: HanaColors.onSurfaceVariant
                                        .withAlpha(102),
                                  ),
                                ),
                                Text(
                                  '3月',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: HanaColors.onSurfaceVariant
                                        .withAlpha(102),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
                                color:
                                    HanaColors.onSurfaceVariant.withAlpha(153),
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
                                color:
                                    HanaColors.onSurfaceVariant.withAlpha(153),
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
                  const _HistoryCard(
                    date: '2026.03.15',
                    summary: '雌二醇: 156 / 睾酮: 32',
                    borderColor: Color(0xFF34D399),
                  ),
                  const SizedBox(height: 12),
                  const _HistoryCard(
                    date: '2026.02.12',
                    summary: '雌二醇: 142 / 睾酮: 35',
                    borderColor: Color(0xFF34D399),
                  ),
                  const SizedBox(height: 12),
                  const _HistoryCard(
                    date: '2026.01.10',
                    summary: '雌二醇: 98 / 睾酮: 31',
                    borderColor: Color(0xFFFBBF24),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 120),
          ],
        ),
      ),
    );
  }

  Widget _buildPill(String text, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color:
            isSelected ? HanaColors.surfaceContainerLowest : Colors.transparent,
        borderRadius: BorderRadius.circular(9999),
        boxShadow: isSelected
            ? [BoxShadow(color: Colors.black.withAlpha(10), blurRadius: 4)]
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
    );
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
  });

  final String name;
  final String value;
  final String unit;
  final String rangeLabel;
  final String rangeValue;
  final Color statusColor;
  final bool isWarning;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: 160),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: HanaColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: isWarning
              ? HanaColors.tertiaryContainer.withAlpha((255 * 0.3).round())
              : HanaColors.primary.withAlpha((255 * 0.05).round()),
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
              color: isWarning ? HanaColors.tertiary : HanaColors.primary,
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

class _TrendChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path = Path()
      ..moveTo(0, size.height * 0.8)
      ..quadraticBezierTo(
        size.width * 0.25,
        size.height * 0.6,
        size.width * 0.5,
        size.height * 0.4,
      )
      ..quadraticBezierTo(
        size.width * 0.75,
        size.height * 0.2,
        size.width,
        size.height * 0.45,
      );

    final paintLine = Paint()
      ..color = const Color(0xFFFFB7C5)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawPath(path, paintLine);

    final pointPaint = Paint()
      ..color = HanaColors.primary
      ..style = PaintingStyle.fill;
    final strokePaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final points = [
      Offset(0, size.height * 0.8),
      Offset(size.width * 0.5, size.height * 0.4),
      Offset(size.width, size.height * 0.45),
    ];

    for (final p in points) {
      canvas
        ..drawCircle(p, 6, pointPaint)
        ..drawCircle(p, 6, strokePaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
