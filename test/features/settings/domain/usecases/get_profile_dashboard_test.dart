import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/settings/domain/entities/app_settings.dart';
import 'package:hananote/features/settings/domain/entities/user_profile.dart';
import 'package:hananote/features/settings/domain/repositories/settings_repository.dart';
import 'package:hananote/features/settings/domain/usecases/get_profile_dashboard.dart';
import 'package:mocktail/mocktail.dart';

class _MockSettingsRepository extends Mock implements SettingsRepository {}

void main() {
  late _MockSettingsRepository repository;
  late GetProfileDashboard useCase;

  const appSettings = AppSettings(
    appLockEnabled: true,
    privacyModeEnabled: false,
    blurOverlayEnabled: true,
    lastBackupDate: null,
  );
  final userProfile = UserProfile.withCalculatedHrtDayCount(
    displayName: '小花',
    hrtStartDate: DateTime(2025, 11, 30),
    today: DateTime(2026, 3, 27),
  );

  setUp(() {
    repository = _MockSettingsRepository();
    useCase = GetProfileDashboard(repository);
  });

  group('GetProfileDashboard', () {
    test('returns the aggregated dashboard when all queries succeed', () async {
      when(() => repository.getUserProfile())
          .thenAnswer((_) async => right(userProfile));
      when(() => repository.getAppSettings())
          .thenAnswer((_) async => right(appSettings));
      when(() => repository.getActiveDrugCount())
          .thenAnswer((_) async => right(2));
      when(() => repository.getInventoryDaysRemaining())
          .thenAnswer((_) async => right(18));

      final result = await useCase();

      expect(result.isRight(), isTrue);
      final dashboard =
          result.getOrElse((_) => throw StateError('expected dashboard'));
      expect(dashboard.profile, userProfile);
      expect(dashboard.settings, appSettings);
      expect(dashboard.activeDrugCount, 2);
      expect(dashboard.inventoryDaysRemaining, 18);
      verify(() => repository.getUserProfile()).called(1);
      verify(() => repository.getAppSettings()).called(1);
      verify(() => repository.getActiveDrugCount()).called(1);
      verify(() => repository.getInventoryDaysRemaining()).called(1);
    });

    test('returns the first failure when loading the profile fails', () async {
      const failure = Failure.storage(message: 'profile unavailable');
      when(() => repository.getUserProfile())
          .thenAnswer((_) async => left(failure));

      final result = await useCase();

      expect(result.isLeft(), isTrue);
      expect(
        result.swap().getOrElse((_) => throw StateError('expected failure')),
        failure,
      );
      verify(() => repository.getUserProfile()).called(1);
      verifyNever(() => repository.getAppSettings());
      verifyNever(() => repository.getActiveDrugCount());
      verifyNever(() => repository.getInventoryDaysRemaining());
    });
  });
}
