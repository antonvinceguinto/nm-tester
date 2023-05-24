// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_role_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserRoleModel _$$_UserRoleModelFromJson(Map<String, dynamic> json) =>
    _$_UserRoleModel(
      subrole_id: json['subrole_id'] as int,
      subrole_subscription_id: json['subrole_subscription_id'] as int?,
      subrole_name: json['subrole_name'] as String?,
      subrole_user_count: json['subrole_user_count'] as int?,
      subrole_permissions: json['subrole_permissions'] as String?,
      subrole_type: json['subrole_type'] as int?,
    );

Map<String, dynamic> _$$_UserRoleModelToJson(_$_UserRoleModel instance) =>
    <String, dynamic>{
      'subrole_id': instance.subrole_id,
      'subrole_subscription_id': instance.subrole_subscription_id,
      'subrole_name': instance.subrole_name,
      'subrole_user_count': instance.subrole_user_count,
      'subrole_permissions': instance.subrole_permissions,
      'subrole_type': instance.subrole_type,
    };
