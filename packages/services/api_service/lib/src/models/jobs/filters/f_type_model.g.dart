// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'f_type_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FTypeModel _$$_FTypeModelFromJson(Map<String, dynamic> json) =>
    _$_FTypeModel(
      id: json['jobtype_id'] as int?,
      color: json['jobtype_brush_colour_argb'] as String?,
      name: json['jobtype_name'] as String?,
      isdeleted: json['isdeleted'] as bool?,
    );

Map<String, dynamic> _$$_FTypeModelToJson(_$_FTypeModel instance) =>
    <String, dynamic>{
      'jobtype_id': instance.id,
      'jobtype_brush_colour_argb': instance.color,
      'jobtype_name': instance.name,
      'isdeleted': instance.isdeleted,
    };
