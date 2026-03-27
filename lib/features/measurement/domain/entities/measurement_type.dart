// Release prep note: Internal enums remain undocumented to keep the domain
// layer terse until the broader API doc pass.
// ignore_for_file: public_member_api_docs

/// Supported body measurement types.
enum MeasurementType {
  bust('胸围', 'cm'),
  underbust('下胸围', 'cm'),
  waist('腰围', 'cm'),
  hip('臀围', 'cm'),
  thigh('大腿围', 'cm'),
  bicep('上臂围', 'cm'),
  shoulder('肩宽', 'cm'),
  neck('颈围', 'cm'),
  weight('体重', 'kg');

  const MeasurementType(this.displayName, this.unit);

  /// Localized display label.
  final String displayName;

  /// Display unit.
  final String unit;
}

/// Common measurement groupings used by the UI.
abstract final class MeasurementTypes {
  /// Core HRT tracking measurements.
  static const List<MeasurementType> core = [
    MeasurementType.bust,
    MeasurementType.waist,
    MeasurementType.hip,
    MeasurementType.thigh,
    MeasurementType.bicep,
  ];

  /// Optional extended measurements.
  static const List<MeasurementType> extended = [
    MeasurementType.underbust,
    MeasurementType.shoulder,
    MeasurementType.neck,
    MeasurementType.weight,
  ];

  /// Key summary measurements shown on the Record tab.
  static const List<MeasurementType> summary = [
    MeasurementType.bust,
    MeasurementType.waist,
    MeasurementType.hip,
  ];

  /// All measurement fields in a stable order.
  static const List<MeasurementType> all = [
    ...core,
    ...extended,
  ];
}
