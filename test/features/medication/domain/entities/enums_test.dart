import 'package:flutter_test/flutter_test.dart';
import 'package:hananote/features/medication/domain/entities/enums.dart';

void main() {
  test('DrugCategory displayName exposes localized labels', () {
    expect(DrugCategory.estrogen.displayName, '雌激素');
    expect(DrugCategory.antiAndrogen.displayName, '抗雄');
    expect(DrugCategory.progestogen.displayName, '孕激素');
    expect(DrugCategory.auxiliary.displayName, '辅助药物');
  });

  test('AdministrationRoute displayName exposes localized labels', () {
    expect(AdministrationRoute.oral.displayName, '口服');
    expect(AdministrationRoute.sublingual.displayName, '舌下含服');
    expect(AdministrationRoute.transdermalPatch.displayName, '贴片');
    expect(AdministrationRoute.transdermalGel.displayName, '凝胶');
    expect(AdministrationRoute.intramuscularInjection.displayName, '肌肉注射');
    expect(AdministrationRoute.subcutaneousInjection.displayName, '皮下注射');
    expect(AdministrationRoute.rectal.displayName, '直肠给药');
  });

  test('DosageUnit displayName exposes localized labels', () {
    expect(DosageUnit.mg.displayName, 'mg');
    expect(DosageUnit.mcg.displayName, 'mcg');
    expect(DosageUnit.pump.displayName, '泵');
    expect(DosageUnit.patch.displayName, '贴');
    expect(DosageUnit.ml.displayName, 'ml');
  });
}
