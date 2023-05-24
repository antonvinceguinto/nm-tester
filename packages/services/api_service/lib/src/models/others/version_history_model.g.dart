// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'version_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_VersionHistoryModel _$$_VersionHistoryModelFromJson(
        Map<String, dynamic> json) =>
    _$_VersionHistoryModel(
      appversion_version: json['appversion_version'] as String,
      appversion_date: json['appversion_date'] == null
          ? null
          : DateTime.parse(json['appversion_date'] as String),
      appversion_html: json['appversion_html'] as String,
    );

Map<String, dynamic> _$$_VersionHistoryModelToJson(
        _$_VersionHistoryModel instance) =>
    <String, dynamic>{
      'appversion_version': instance.appversion_version,
      'appversion_date': instance.appversion_date?.toIso8601String(),
      'appversion_html': instance.appversion_html,
    };
