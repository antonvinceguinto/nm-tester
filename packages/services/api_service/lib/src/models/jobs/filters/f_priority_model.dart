import 'package:freezed_annotation/freezed_annotation.dart';

part 'f_priority_model.freezed.dart';
part 'f_priority_model.g.dart';

@freezed
class FPriorityModel with _$FPriorityModel {
  const factory FPriorityModel({
    @JsonKey(name: 'priority_id') int? id,
    @JsonKey(name: 'priority_brush_colour_argb') String? color,
    @JsonKey(name: 'priority_name') String? name,
    bool? isdeleted,
  }) = _FPriorityModel;

  factory FPriorityModel.fromJson(Map<String, Object?> json) =>
      _$FPriorityModelFromJson(json);
}
