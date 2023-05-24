import 'package:freezed_annotation/freezed_annotation.dart';

part 'f_pricing_type_model.freezed.dart';
part 'f_pricing_type_model.g.dart';

@freezed
class FPricingTypeModel with _$FPricingTypeModel {
  const factory FPricingTypeModel({
    @JsonKey(name: 'pricingtype_id') int? id,
    String? color,
    @JsonKey(name: 'pricingtype_name') String? name,
    bool? isdeleted,
  }) = _FPricingTypeModel;

  factory FPricingTypeModel.fromJson(Map<String, Object?> json) =>
      _$FPricingTypeModelFromJson(json);
}
