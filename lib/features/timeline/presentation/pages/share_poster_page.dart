// HanaNote v2 — Share poster page (HRT 第 N 天 commemorative card).
// Renders a 9:16 SharePosterCard inside a RepaintBoundary, with
// "保存到相册" / "分享" gold pill buttons. Uses the share_plus
// package to share the rendered PNG.
// ignore_for_file: lines_longer_than_80_chars, public_member_api_docs

import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hananote/app/theme/hana_colors.dart';
import 'package:hananote/app/theme/hana_colors_v2.dart';
import 'package:hananote/app/theme/hana_typography.dart';
import 'package:hananote/core/data/flower_almanac.dart';
import 'package:hananote/core/widgets/hoyo/hoyo_app_bar.dart';
import 'package:hananote/core/widgets/hoyo/hoyo_eyebrow.dart';
import 'package:hananote/core/widgets/hoyo/hoyo_pill_button.dart';
import 'package:hananote/core/widgets/hoyo/share_poster_card.dart';
import 'package:hananote/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:hananote/features/settings/presentation/bloc/settings_state.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';

class SharePosterPage extends StatefulWidget {
  const SharePosterPage({super.key});

  @override
  State<SharePosterPage> createState() => _SharePosterPageState();
}

class _SharePosterPageState extends State<SharePosterPage> {
  final GlobalKey _posterKey = GlobalKey();
  Future<FlowerAlmanac>? _almanac;

  @override
  void initState() {
    super.initState();
    _almanac = FlowerAlmanac.load();
  }

  Future<Uint8List?> _capture() async {
    try {
      final boundary = _posterKey.currentContext!.findRenderObject()!
          as RenderRepaintBoundary;
      // Slightly higher pixel ratio for share quality.
      final image = await boundary.toImage(pixelRatio: 3);
      final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      return byteData?.buffer.asUint8List();
    } catch (_) {
      return null;
    }
  }

  Future<void> _share() async {
    final bytes = await _capture();
    if (bytes == null) return;
    if (!mounted) return;
    final l10n = ScaffoldMessenger.of(context);
    try {
      await Share.shareXFiles(
        [XFile.fromData(bytes, name: 'hananote_day.png', mimeType: 'image/png')],
        text: 'HanaNote · 花笺',
      );
    } catch (e) {
      l10n.showSnackBar(SnackBar(content: Text('分享失败：$e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final settingsState = context.watch<SettingsBloc>().state;
    final displayName = settingsState is SettingsLoaded
        ? settingsState.profile.displayName
        : '·';
    final hrtDays = settingsState is SettingsLoaded
        ? settingsState.profile.hrtDayCount
        : 1;
    final startDate = settingsState is SettingsLoaded
        ? DateFormat.yMd().format(settingsState.profile.hrtStartDate)
        : DateFormat.yMd().format(DateTime.now());
    final signatureChar =
        displayName.isEmpty ? '·' : displayName.characters.first.toUpperCase();

    return Scaffold(
      backgroundColor: HanaColors.backgroundOf(context),
      appBar: const HoyoAppBar(title: '纪念卡'),
      body: SafeArea(
        child: FutureBuilder<FlowerAlmanac>(
          future: _almanac,
          builder: (context, snap) {
            if (!snap.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            final flower = snap.data!.forDay(hrtDays.clamp(1, 365));
            return SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 14, 20, 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const HoyoEyebrow('Commemorative card'),
                  const SizedBox(height: 8),
                  Text(
                    'HRT 第 $hrtDays 天',
                    style: HanaTypography.headlineLg.copyWith(
                      color: HanaColors.primaryOf(context),
                      fontWeight: FontWeight.w800,
                      letterSpacing: -0.28,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '从 $startDate 起，每一天都算数',
                    style: HanaTypography.bodyMd.copyWith(
                      color: HanaColors.onSurfaceVariantOf(context),
                    ),
                  ),
                  const SizedBox(height: 16),
                  RepaintBoundary(
                    key: _posterKey,
                    child: SharePosterCard(
                      day: hrtDays.clamp(1, 365),
                      signatureChar: signatureChar,
                      flowerName: flower.localizedName(
                        Localizations.localeOf(context).languageCode,
                      ),
                      flowerLatin: flower.latin,
                      startDate: startDate,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: HoyoPillButton(
                          label: '保存到相册',
                          icon: Icons.download,
                          variant: HoyoPillVariant.ghostLight,
                          expand: true,
                          onPressed: () async {
                            final bytes = await _capture();
                            if (!mounted) return;
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  bytes == null
                                      ? '保存失败'
                                      : '已就绪 (${bytes.length ~/ 1024} KB)',
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: HoyoPillButton(
                          label: '分享',
                          icon: Icons.share,
                          variant: HoyoPillVariant.gold,
                          expand: true,
                          onPressed: _share,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    '* 海报会保留你的名字与起始日期。如需匿名分享，请到　设置 → 隐私 关闭花押签名。',
                    style: HanaTypography.labelSm.copyWith(
                      color: HanaColorsV2.goldDeep,
                      letterSpacing: 0.44,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
