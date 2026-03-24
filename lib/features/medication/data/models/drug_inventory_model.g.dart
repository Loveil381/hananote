// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drug_inventory_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DrugInventoryModelImpl _$$DrugInventoryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DrugInventoryModelImpl(
      id: json['id'] as String,
      drugId: json['drug_id'] as String,
      quantity: (json['quantity'] as num).toDouble(),
      unit: json['unit'] as String,
      purchaseDate: json['purchase_date'] as String,
      updatedAt: json['updated_at'] as String,
      expirationDate: json['expiration_date'] as String?,
      batchNumber: json['batch_number'] as String?,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$DrugInventoryModelImplToJson(
        _$DrugInventoryModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'drug_id': instance.drugId,
      'quantity': instance.quantity,
      'unit': instance.unit,
      'purchase_date': instance.purchaseDate,
      'updated_at': instance.updatedAt,
      'expiration_date': instance.expirationDate,
      'batch_number': instance.batchNumber,
      'notes': instance.notes,
    };
