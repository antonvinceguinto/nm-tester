// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TaskStatusModel _$$_TaskStatusModelFromJson(Map<String, dynamic> json) =>
    _$_TaskStatusModel(
      id: json['bookingstatus_id'] as int?,
      name: json['bookingstatus_name'] as String?,
      color: json['bookingstatus_brush_colour_argb'] as String?,
      isdeleted: json['isdeleted'] as bool?,
    );

Map<String, dynamic> _$$_TaskStatusModelToJson(_$_TaskStatusModel instance) =>
    <String, dynamic>{
      'bookingstatus_id': instance.id,
      'bookingstatus_name': instance.name,
      'bookingstatus_brush_colour_argb': instance.color,
      'isdeleted': instance.isdeleted,
    };
