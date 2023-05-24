import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_status_model.freezed.dart';
part 'task_status_model.g.dart';

@freezed
class TaskStatusModel with _$TaskStatusModel {
  const factory TaskStatusModel({
    @JsonKey(name: 'bookingstatus_id') int? id,
    @JsonKey(name: 'bookingstatus_name') String? name,
    @JsonKey(name: 'bookingstatus_brush_colour_argb') String? color,
    bool? isdeleted,
  }) = _TaskStatusModel;

  static const empty = TaskStatusModel();

  factory TaskStatusModel.fromJson(Map<String, Object?> json) =>
      _$TaskStatusModelFromJson(json);
}
