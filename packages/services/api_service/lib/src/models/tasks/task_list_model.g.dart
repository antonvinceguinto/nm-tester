// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TaskListModel _$$_TaskListModelFromJson(Map<String, dynamic> json) =>
    _$_TaskListModel(
      total_all: json['total_all'] as int? ?? 0,
      total: json['total'] as int? ?? 0,
      end_date: json['end_date'] == null
          ? null
          : DateTime.parse(json['end_date'] as String),
      first_date: json['first_date'] == null
          ? null
          : DateTime.parse(json['first_date'] as String),
      last_date: json['last_date'] == null
          ? null
          : DateTime.parse(json['last_date'] as String),
      start_date: json['start_date'] == null
          ? null
          : DateTime.parse(json['start_date'] as String),
      data: (json['data'] as List<dynamic>?)
              ?.map(
                  (e) => TaskInfoLevelModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_TaskListModelToJson(_$_TaskListModel instance) =>
    <String, dynamic>{
      'total_all': instance.total_all,
      'total': instance.total,
      'end_date': instance.end_date?.toIso8601String(),
      'first_date': instance.first_date?.toIso8601String(),
      'last_date': instance.last_date?.toIso8601String(),
      'start_date': instance.start_date?.toIso8601String(),
      'data': instance.data,
    };

_$_BookingKey _$$_BookingKeyFromJson(Map<String, dynamic> json) =>
    _$_BookingKey(
      bookingId: json['BookingId'] as int?,
      occurrenceDateTime: json['OccurrenceDateTime'] == null
          ? null
          : DateTime.parse(json['OccurrenceDateTime'] as String),
    );

Map<String, dynamic> _$$_BookingKeyToJson(_$_BookingKey instance) =>
    <String, dynamic>{
      'BookingId': instance.bookingId,
      'OccurrenceDateTime': instance.occurrenceDateTime?.toIso8601String(),
    };
