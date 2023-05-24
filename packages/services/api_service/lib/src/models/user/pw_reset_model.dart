import 'package:freezed_annotation/freezed_annotation.dart';

part 'pw_reset_model.freezed.dart';
part 'pw_reset_model.g.dart';

@freezed
class PasswordResetModel with _$PasswordResetModel {
  const factory PasswordResetModel({
    String? Message,
    String? MessageTitle,
    bool? Success,
  }) = _PasswordResetModel;

  static const empty = PasswordResetModel(
    Message: '',
    MessageTitle: '',
    Success: false,
  );

  factory PasswordResetModel.fromJson(Map<String, Object?> json) =>
      _$PasswordResetModelFromJson(json);
}
