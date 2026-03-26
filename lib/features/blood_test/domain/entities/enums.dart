// ignore_for_file: public_member_api_docs

/// Supported hormone markers in blood test reports.
enum HormoneType {
  estradiol,
  testosterone,
  prolactin,
  progesterone,
  lh,
  fsh,
  shbg,
}

/// Indicates how close a reading is to the expected target range.
enum HormoneStatus { normal, warning, critical }

/// Helpers for presenting and evaluating [HormoneType] values.
extension HormoneTypeX on HormoneType {
  /// Localized display name used in the UI.
  String get displayName => switch (this) {
        HormoneType.estradiol => '雌二醇',
        HormoneType.testosterone => '睾酮',
        HormoneType.prolactin => '泌乳素',
        HormoneType.progesterone => '黄体酮',
        HormoneType.lh => 'LH',
        HormoneType.fsh => 'FSH',
        HormoneType.shbg => 'SHBG',
      };

  /// Default measurement unit used for this hormone.
  String get defaultUnit => switch (this) {
        HormoneType.estradiol => 'pg/mL',
        HormoneType.testosterone => 'ng/dL',
        HormoneType.prolactin => 'ng/mL',
        HormoneType.progesterone => 'ng/mL',
        HormoneType.lh => 'mIU/mL',
        HormoneType.fsh => 'mIU/mL',
        HormoneType.shbg => 'nmol/L',
      };

  /// Target ranges for feminizing HRT (WPATH / Endocrine Society guidelines).
  (double min, double max) get targetRange => switch (this) {
        HormoneType.estradiol => (100, 200),
        HormoneType.testosterone => (0, 50),
        HormoneType.prolactin => (0, 25),
        HormoneType.progesterone => (0, 10),
        HormoneType.lh => (0, 10),
        HormoneType.fsh => (0, 10),
        HormoneType.shbg => (30, 120),
      };

  /// Returns the qualitative status for the supplied [value].
  HormoneStatus statusFor(double value) {
    final (min, max) = targetRange;
    if (value >= min && value <= max) {
      return HormoneStatus.normal;
    }

    final distance = value < min ? min - value : value - max;
    final span = max - min;
    return distance / span > 0.5
        ? HormoneStatus.critical
        : HormoneStatus.warning;
  }
}
