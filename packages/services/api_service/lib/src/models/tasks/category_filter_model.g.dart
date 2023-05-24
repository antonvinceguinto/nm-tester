// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_filter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CategoryFilterModel _$$_CategoryFilterModelFromJson(
        Map<String, dynamic> json) =>
    _$_CategoryFilterModel(
      id: json['usercategory_id'] as int?,
      name: json['usercategory_name'] as String?,
      color: json['usercategory_brush_colour_argb'] as String?,
      isdeleted: json['isdeleted'] as bool?,
    );

Map<String, dynamic> _$$_CategoryFilterModelToJson(
        _$_CategoryFilterModel instance) =>
    <String, dynamic>{
      'usercategory_id': instance.id,
      'usercategory_name': instance.name,
      'usercategory_brush_colour_argb': instance.color,
      'isdeleted': instance.isdeleted,
    };
