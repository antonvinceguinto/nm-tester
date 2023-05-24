import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_role_model.freezed.dart';
part 'user_role_model.g.dart';

@freezed
class UserRoleModel with _$UserRoleModel {
  const factory UserRoleModel({
    required int subrole_id,
    int? subrole_subscription_id,
    String? subrole_name,
    int? subrole_user_count,
    String? subrole_permissions,
    int? subrole_type,
  }) = _UserRoleModel;

  factory UserRoleModel.fromJson(Map<String, Object?> json) =>
      _$UserRoleModelFromJson(json);
}
