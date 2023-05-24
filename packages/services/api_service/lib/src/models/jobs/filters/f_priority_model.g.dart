// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'f_priority_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FPriorityModel _$$_FPriorityModelFromJson(Map<String, dynamic> json) =>
    _$_FPriorityModel(
      id: json['priority_id'] as int?,
      color: json['priority_brush_colour_argb'] as String?,
      name: json['priority_name'] as String?,
      isdeleted: json['isdeleted'] as bool?,
    );

Map<String, dynamic> _$$_FPriorityModelToJson(_$_FPriorityModel instance) =>
    <String, dynamic>{
      'priority_id': instance.id,
      'priority_brush_colour_argb': instance.color,
      'priority_name': instance.name,
      'isdeleted': instance.isdeleted,
    };
