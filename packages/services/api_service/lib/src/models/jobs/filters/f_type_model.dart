import 'package:freezed_annotation/freezed_annotation.dart';

part 'f_type_model.freezed.dart';
part 'f_type_model.g.dart';

@freezed
class FTypeModel with _$FTypeModel {
  const factory FTypeModel({
    @JsonKey(name: 'jobtype_id') int? id,
    @JsonKey(name: 'jobtype_brush_colour_argb') String? color,
    @JsonKey(name: 'jobtype_name') String? name,
    bool? isdeleted,
  }) = _FTypeModel;

  factory FTypeModel.fromJson(Map<String, Object?> json) =>
      _$FTypeModelFromJson(json);
}
