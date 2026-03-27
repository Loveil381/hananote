import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

/// Profile information shown on the settings dashboard.
@freezed
class UserProfile with _$UserProfile {
  /// Creates a [UserProfile].
  const factory UserProfile({
    required String displayName,
    required int hrtDayCount,
    required DateTime hrtStartDate,
    String? avatarPath,
  }) = _UserProfile;

  /// Creates a [UserProfile] from JSON.
  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}
