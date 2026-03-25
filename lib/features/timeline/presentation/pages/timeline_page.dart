// ignore_for_file: public_member_api_docs

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:hananote/app/theme/hana_colors.dart';

class TimelinePage extends StatelessWidget {
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
                '成长轨迹',
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
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 100),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      _buildPill('1月', true),
                      const SizedBox(width: 8),
                      _buildPill('3月', false),
                      const SizedBox(width: 8),
                      _buildPill('6月', false),
                      const SizedBox(width: 8),
                      _buildPill('1年', false),
                      const SizedBox(width: 8),
                      _buildPill('全部', false),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Stack(
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
                          const _TimelineCard(
                            date: '2026.3.15',
                            type: '里程碑',
                            title: 'HRT 100 天',
                            borderColor: Color(0xFFFFD700),
                            icon: Icons.star,
                            iconColor: Color(0xFFB8860B),
                            isRight: true,
                          ),
                          const SizedBox(height: 48),
                          _TimelineCard(
                            date: '2026.2.20',
                            type: '血液检测',
                            title: '雌二醇 89→156 pg/mL',
                            borderColor: const Color(0xFF4CAF50),
                            icon: Icons.favorite,
                            iconColor: const Color(0xFF4CAF50),
                            isRight: false,
                            extra: Container(
                              margin: const EdgeInsets.only(top: 8),
                              height: 16,
                              decoration: BoxDecoration(
                                color: const Color(0xFFE8F5E9),
                                borderRadius: BorderRadius.circular(9999),
                              ),
                              child: LayoutBuilder(
                                builder: (context, constraints) {
                                  return Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      width: constraints.maxWidth * 0.67,
                                      height: 16,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF4CAF50),
                                        borderRadius:
                                            BorderRadius.circular(9999),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          const SizedBox(height: 48),
                          const _TimelineCard(
                            date: '2026.1.15',
                            type: '身体变化',
                            title: '胸围 +2.3cm (3个月)',
                            borderColor: HanaColors.secondary,
                            icon: Icons.straighten,
                            iconColor: HanaColors.secondary,
                            isRight: true,
                          ),
                          const SizedBox(height: 48),
                          const _TimelineCard(
                            date: '2025.12.15',
                            type: '心情',
                            title: '今天心情很好',
                            borderColor: HanaColors.primaryContainer,
                            icon: Icons.local_florist,
                            iconColor: HanaColors.primary,
                            isRight: false,
                          ),
                          const SizedBox(height: 32),
                          Column(
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
                                '旅程开始 · 2025.12.01',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall
                                    ?.copyWith(
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
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 140),
              ],
            ),
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

  Widget _buildPill(String text, bool isSelected) {
    return Container(
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
    this.extra,
  });

  final String date;
  final String type;
  final String title;
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
