/// Mood levels available for a journal entry.
enum MoodLevel {
  /// Very negative mood.
  veryBad,

  /// Somewhat negative mood.
  bad,

  /// Neutral mood.
  neutral,

  /// Positive mood.
  good,

  /// Very positive mood.
  veryGood,
}

/// Convenience accessors for [MoodLevel].
extension MoodLevelX on MoodLevel {
  /// Human-readable label.
  String get displayName => switch (this) {
        MoodLevel.veryBad => '很差',
        MoodLevel.bad => '不太好',
        MoodLevel.neutral => '一般',
        MoodLevel.good => '不错',
        MoodLevel.veryGood => '很好',
      };

  /// Emoji representation.
  String get emoji => switch (this) {
        MoodLevel.veryBad => '😢',
        MoodLevel.bad => '😔',
        MoodLevel.neutral => '😐',
        MoodLevel.good => '😊',
        MoodLevel.veryGood => '🥰',
      };

  /// Numeric representation from 1 to 5.
  int get numericValue => switch (this) {
        MoodLevel.veryBad => 1,
        MoodLevel.bad => 2,
        MoodLevel.neutral => 3,
        MoodLevel.good => 4,
        MoodLevel.veryGood => 5,
      };
}
