// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'f_status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FStatusModel _$$_FStatusModelFromJson(Map<String, dynamic> json) =>
    _$_FStatusModel(
      id: json['jobstatus_id'] as int?,
      color: json['jobstatus_brush_colour_argb'] as String?,
      name: json['jobstatus_name'] as String?,
      isdeleted: json['isdeleted'] as bool?,
    );

Map<String, dynamic> _$$_FStatusModelToJson(_$_FStatusModel instance) =>
    <String, dynamic>{
      'jobstatus_id': instance.id,
      'jobstatus_brush_colour_argb': instance.color,
      'jobstatus_name': instance.name,
      'isdeleted': instance.isdeleted,
    };
