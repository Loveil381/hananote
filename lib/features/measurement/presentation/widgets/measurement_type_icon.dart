import 'package:flutter/material.dart';
import 'package:hananote/features/measurement/domain/entities/measurement_type.dart';

/// Presentation-layer icon mapping for [MeasurementType].
extension MeasurementTypeIconX on MeasurementType {
  /// Returns the icon used for this measurement type.
  IconData get icon {
    return switch (this) {
      MeasurementType.bust => Icons.accessibility_new,
      MeasurementType.underbust => Icons.accessibility_new,
      MeasurementType.waist => Icons.straighten,
      MeasurementType.hip => Icons.accessibility,
      MeasurementType.thigh => Icons.directions_walk,
      MeasurementType.bicep => Icons.fitness_center,
      MeasurementType.shoulder => Icons.open_with,
      MeasurementType.neck => Icons.face,
      MeasurementType.weight => Icons.monitor_weight,
    };
  }
}

/// Small icon widget for measurement labels.
class MeasurementTypeIcon extends StatelessWidget {
  /// Creates a [MeasurementTypeIcon].
  const MeasurementTypeIcon({
    required this.type,
    super.key,
    this.color,
    this.size = 18,
  });

  /// Measurement type to render.
  final MeasurementType type;

  /// Optional icon color.
  final Color? color;

  /// Icon size.
  final double size;

  @override
  Widget build(BuildContext context) {
    return Icon(
      type.icon,
      color: color,
      size: size,
    );
  }
}
