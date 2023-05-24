import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_type_model.freezed.dart';
part 'contact_type_model.g.dart';

String contactTypeToJson(List<ContactTypeModel> data) =>
    json.encode(new List<dynamic>.from(data.map((x) => x.toJson())));

Map<String, dynamic> contactTypeFromJson(String str) =>
    Map.from(json.decode(str)).map((k, v) => MapEntry<String, dynamic>(k, v));

@freezed
class ContactTypeModel with _$ContactTypeModel {
  const factory ContactTypeModel({
    required int? contacttype_id,
    required String? contacttype_name,
    @Default(false) bool? contacttype_isdefault,
    @Default(null) int? contacttype_subscription_id,
    @Default(false) bool? contacttype_isbuiltin,
    @Default(null) bool? isdeleted,
  }) = _ContactTypeModel;

  static const empty = ContactTypeModel(
    contacttype_id: 0,
    contacttype_name: '',
    contacttype_isdefault: false,
    contacttype_subscription_id: 0,
    contacttype_isbuiltin: false,
  );

  factory ContactTypeModel.fromJson(Map<String, Object?> json) =>
      _$ContactTypeModelFromJson(json);
}
