// Release prep note: Shared test fixtures stay undocumented to avoid adding
// boilerplate to throwaway test-only builders and constants.
// ignore_for_file: public_member_api_docs

import 'package:hananote/features/measurement/data/models/measurement_model.dart';
import 'package:hananote/features/measurement/domain/entities/measurement_entry.dart';

MeasurementEntry buildMeasurementEntry({
  String id = 'measurement-1',
  DateTime? date,
  double? bust = 86,
  double? underbust = 74,
  double? waist = 72,
  double? hip = 92,
  double? thigh = 54,
  double? bicep = 28,
  double? shoulder = 40,
  double? neck = 31,
  double? weight = 62,
  String? notes = 'Evening measurement',
  DateTime? createdAt,
  DateTime? updatedAt,
}) {
  return MeasurementEntry(
    id: id,
    date: date ?? DateTime(2026, 3, 27),
    bust: bust,
    underbust: underbust,
    waist: waist,
    hip: hip,
    thigh: thigh,
    bicep: bicep,
    shoulder: shoulder,
    neck: neck,
    weight: weight,
    notes: notes,
    createdAt: createdAt ?? DateTime(2026, 3, 27, 21),
    updatedAt: updatedAt,
  );
}

MeasurementModel buildMeasurementModel({
  String id = 'measurement-1',
  DateTime? date,
  double? bust = 86,
  double? underbust = 74,
  double? waist = 72,
  double? hip = 92,
  double? thigh = 54,
  double? bicep = 28,
  double? shoulder = 40,
  double? neck = 31,
  double? weight = 62,
  String? notes = 'Evening measurement',
  DateTime? createdAt,
  DateTime? updatedAt,
}) {
  return MeasurementModel(
    id: id,
    date: date ?? DateTime(2026, 3, 27),
    bust: bust,
    underbust: underbust,
    waist: waist,
    hip: hip,
    thigh: thigh,
    bicep: bicep,
    shoulder: shoulder,
    neck: neck,
    weight: weight,
    notes: notes,
    createdAt: createdAt ?? DateTime(2026, 3, 27, 21),
    updatedAt: updatedAt,
  );
}
