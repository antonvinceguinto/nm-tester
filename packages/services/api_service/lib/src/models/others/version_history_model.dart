import 'package:freezed_annotation/freezed_annotation.dart';

part 'version_history_model.freezed.dart';
part 'version_history_model.g.dart';

@freezed
class VersionHistoryModel with _$VersionHistoryModel {
  const factory VersionHistoryModel({
    required String appversion_version,
    required DateTime? appversion_date,
    required String appversion_html,
  }) = _VersionHistoryModel;

  static const empty = VersionHistoryModel(
    appversion_version: '',
    appversion_date: null,
    appversion_html: '',
  );

  factory VersionHistoryModel.fromJson(Map<String, Object?> json) =>
      _$VersionHistoryModelFromJson(json);
}
