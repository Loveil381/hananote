import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hananote/core/l10n/arb/app_localizations.dart';
import 'package:hananote/features/medication/domain/entities/drug.dart';
import 'package:hananote/features/medication/domain/entities/enums.dart';
import 'package:hananote/features/medication/presentation/widgets/drug_card.dart';

void main() {
  testWidgets('renders localized category and route labels', (tester) async {
    final drug = Drug(
      id: 'drug-1',
      name: 'Estradiol Valerate',
      genericName: 'Estradiol',
      category: DrugCategory.estrogen,
      administrationRoute: AdministrationRoute.oral,
      defaultDosageUnit: DosageUnit.mg,
      isActive: true,
      createdAt: DateTime(2026, 3),
    );

    await tester.pumpWidget(
      MaterialApp(
        locale: const Locale('zh'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: DrugCard(drug: drug),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('雌激素'), findsOneWidget);
    expect(find.text('口服'), findsOneWidget);
  });
}
