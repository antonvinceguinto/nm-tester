import 'package:freezed_annotation/freezed_annotation.dart';

import 'task_info_level_model.dart';

part 'task_list_model.freezed.dart';
part 'task_list_model.g.dart';

@freezed
class TaskListModel with _$TaskListModel {
  const factory TaskListModel({
    @Default(0) int total_all,
    @Default(0) int total,
    DateTime? end_date,
    DateTime? first_date,
    DateTime? last_date,
    DateTime? start_date,
    @Default([]) List<TaskInfoLevelModel> data,
  }) = _TaskListModel;

  factory TaskListModel.fromJson(Map<String, Object?> json) =>
      _$TaskListModelFromJson(json);
}

@freezed
class BookingKey with _$BookingKey {
  const factory BookingKey({
    @JsonKey(name: 'BookingId') int? bookingId,
    @JsonKey(name: 'OccurrenceDateTime') DateTime? occurrenceDateTime,
  }) = _BookingKey;

  factory BookingKey.fromJson(Map<String, Object?> json) =>
      _$BookingKeyFromJson(json);
}
