// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'f_pricing_type_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FPricingTypeModel _$$_FPricingTypeModelFromJson(Map<String, dynamic> json) =>
    _$_FPricingTypeModel(
      id: json['pricingtype_id'] as int?,
      color: json['color'] as String?,
      name: json['pricingtype_name'] as String?,
      isdeleted: json['isdeleted'] as bool?,
    );

Map<String, dynamic> _$$_FPricingTypeModelToJson(
        _$_FPricingTypeModel instance) =>
    <String, dynamic>{
      'pricingtype_id': instance.id,
      'color': instance.color,
      'pricingtype_name': instance.name,
      'isdeleted': instance.isdeleted,
    };
