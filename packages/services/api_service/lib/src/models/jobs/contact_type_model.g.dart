// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_type_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ContactTypeModel _$$_ContactTypeModelFromJson(Map<String, dynamic> json) =>
    _$_ContactTypeModel(
      contacttype_id: json['contacttype_id'] as int?,
      contacttype_name: json['contacttype_name'] as String?,
      contacttype_isdefault: json['contacttype_isdefault'] as bool? ?? false,
      contacttype_subscription_id:
          json['contacttype_subscription_id'] as int? ?? null,
      contacttype_isbuiltin: json['contacttype_isbuiltin'] as bool? ?? false,
      isdeleted: json['isdeleted'] as bool? ?? null,
    );

Map<String, dynamic> _$$_ContactTypeModelToJson(_$_ContactTypeModel instance) =>
    <String, dynamic>{
      'contacttype_id': instance.contacttype_id,
      'contacttype_name': instance.contacttype_name,
      'contacttype_isdefault': instance.contacttype_isdefault,
      'contacttype_subscription_id': instance.contacttype_subscription_id,
      'contacttype_isbuiltin': instance.contacttype_isbuiltin,
      'isdeleted': instance.isdeleted,
    };
