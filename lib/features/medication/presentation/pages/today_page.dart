import 'package:flutter/material.dart';
import 'package:hananote/app/theme/hana_colors.dart';
import 'package:hananote/features/medication/presentation/widgets/countdown_card.dart';
import 'package:hananote/features/medication/presentation/widgets/medication_status_card.dart';
import 'package:hananote/features/medication/presentation/widgets/quote_card.dart';
import 'package:hananote/features/medication/presentation/widgets/upcoming_dose_card.dart';

/// The main dashboard page for the current day's health tracking.
class TodayPage extends StatelessWidget {
  /// Creates a [TodayPage].
  const TodayPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: HanaColors.background,
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            // Top App Bar Area
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.auto_awesome,
                      color: HanaColors.primary,
                      size: 28,
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: HanaColors.surfaceContainerHigh,
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.calendar_today,
                          color: HanaColors.onSurfaceVariant,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),

            // Greeting Section
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '早安，小花',
                          style: theme.textTheme.headlineLarge?.copyWith(
                            color: HanaColors.onSurface,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'HRT 第 325 天',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: HanaColors.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                    const CircleAvatar(
                      radius: 28,
                      backgroundColor: HanaColors.primaryContainer,
                      child: Icon(
                        Icons.person,
                        color: HanaColors.onPrimaryContainer,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 32)),

            // Countdown Card
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: CountdownCard(
                  hours: 2,
                  minutes: 34,
                  drugName: '戊酸雌二醇',
                  dosage: '2mg',
                  route: '口服',
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 32)),

            // Morning · Completed Section
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  '早晨 · 已完成',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: HanaColors.onSurface,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    MedicationStatusCard(
                      name: '戊酸雌二醇',
                      dosage: '2mg',
                      time: '08:30',
                      isTaken: true,
                      accentColor: HanaColors.primaryFixed,
                    ),
                    SizedBox(height: 12),
                    MedicationStatusCard(
                      name: '螺内酯',
                      dosage: '50mg',
                      time: '08:30',
                      isTaken: true,
                      accentColor: HanaColors.secondaryFixed,
                    ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 32)),

            // Upcoming Section
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  '即将到来',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: HanaColors.onSurface,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: UpcomingDoseCard(
                  name: '戊酸雌二醇',
                  dosage: '2mg',
                  time: '今晚 20:00',
                  period: '晚间',
                  onTake: () {},
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 32)),

            // Quote Section
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: QuoteCard(
                  quote: '每一天的坚持，都是对自己灵魂负责。',
                ),
              ),
            ),

            // Bottom Safe Padding (Avoid tab bar clipping)
            const SliverPadding(padding: EdgeInsets.only(bottom: 120)),
          ],
        ),
      ),
    );
  }
}
