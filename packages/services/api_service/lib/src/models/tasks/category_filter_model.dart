// To parse this JSON data, do
//
//     final categoryFilterModel = categoryFilterModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_filter_model.freezed.dart';
part 'category_filter_model.g.dart';

@freezed
class CategoryFilterModel with _$CategoryFilterModel {
  const factory CategoryFilterModel({
    @JsonKey(name: 'usercategory_id') int? id,
    @JsonKey(name: 'usercategory_name') String? name,
    @JsonKey(name: 'usercategory_brush_colour_argb') String? color,
    bool? isdeleted,
  }) = _CategoryFilterModel;

  factory CategoryFilterModel.fromJson(Map<String, Object?> json) =>
      _$CategoryFilterModelFromJson(json);
}
