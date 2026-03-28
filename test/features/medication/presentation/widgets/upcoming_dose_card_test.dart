import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hananote/features/medication/presentation/widgets/upcoming_dose_card.dart';

void main() {
  testWidgets('renders the take button label in Chinese', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: UpcomingDoseCard(
            name: 'Estradiol',
            dosage: '2mg',
            time: '08:00',
            period: '今天',
          ),
        ),
      ),
    );

    expect(find.text('服药'), findsOneWidget);
  });
}
