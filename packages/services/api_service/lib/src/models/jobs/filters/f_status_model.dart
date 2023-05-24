import 'package:freezed_annotation/freezed_annotation.dart';

part 'f_status_model.freezed.dart';
part 'f_status_model.g.dart';

@freezed
class FStatusModel with _$FStatusModel {
  const factory FStatusModel({
    @JsonKey(name: 'jobstatus_id') int? id,
    @JsonKey(name: 'jobstatus_brush_colour_argb') String? color,
    @JsonKey(name: 'jobstatus_name') String? name,
    bool? isdeleted,
  }) = _FStatusModel;

  factory FStatusModel.fromJson(Map<String, Object?> json) =>
      _$FStatusModelFromJson(json);
}
