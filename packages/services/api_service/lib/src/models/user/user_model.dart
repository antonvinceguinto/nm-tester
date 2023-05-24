import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String token,
    required UserData user_data,
  }) = _UserModel;

  static const empty = UserModel(
    token: '',
    user_data: UserData.empty,
  );

  factory UserModel.fromJson(Map<String, Object?> json) =>
      _$UserModelFromJson(json);
}

@freezed
class UserData with _$UserData {
  const factory UserData({
    required String username,
    required String subscriber_email,
    required String subscriber_name_display,
  }) = _UserData;

  static const empty = UserData(
    username: '',
    subscriber_email: '',
    subscriber_name_display: '',
  );

  factory UserData.fromJson(Map<String, Object?> json) =>
      _$UserDataFromJson(json);
}
