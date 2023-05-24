// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_role_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserRoleModel _$UserRoleModelFromJson(Map<String, dynamic> json) {
  return _UserRoleModel.fromJson(json);
}

/// @nodoc
mixin _$UserRoleModel {
  int get subrole_id => throw _privateConstructorUsedError;
  int? get subrole_subscription_id => throw _privateConstructorUsedError;
  String? get subrole_name => throw _privateConstructorUsedError;
  int? get subrole_user_count => throw _privateConstructorUsedError;
  String? get subrole_permissions => throw _privateConstructorUsedError;
  int? get subrole_type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserRoleModelCopyWith<UserRoleModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserRoleModelCopyWith<$Res> {
  factory $UserRoleModelCopyWith(
          UserRoleModel value, $Res Function(UserRoleModel) then) =
      _$UserRoleModelCopyWithImpl<$Res, UserRoleModel>;
  @useResult
  $Res call(
      {int subrole_id,
      int? subrole_subscription_id,
      String? subrole_name,
      int? subrole_user_count,
      String? subrole_permissions,
      int? subrole_type});
}

/// @nodoc
class _$UserRoleModelCopyWithImpl<$Res, $Val extends UserRoleModel>
    implements $UserRoleModelCopyWith<$Res> {
  _$UserRoleModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subrole_id = null,
    Object? subrole_subscription_id = freezed,
    Object? subrole_name = freezed,
    Object? subrole_user_count = freezed,
    Object? subrole_permissions = freezed,
    Object? subrole_type = freezed,
  }) {
    return _then(_value.copyWith(
      subrole_id: null == subrole_id
          ? _value.subrole_id
          : subrole_id // ignore: cast_nullable_to_non_nullable
              as int,
      subrole_subscription_id: freezed == subrole_subscription_id
          ? _value.subrole_subscription_id
          : subrole_subscription_id // ignore: cast_nullable_to_non_nullable
              as int?,
      subrole_name: freezed == subrole_name
          ? _value.subrole_name
          : subrole_name // ignore: cast_nullable_to_non_nullable
              as String?,
      subrole_user_count: freezed == subrole_user_count
          ? _value.subrole_user_count
          : subrole_user_count // ignore: cast_nullable_to_non_nullable
              as int?,
      subrole_permissions: freezed == subrole_permissions
          ? _value.subrole_permissions
          : subrole_permissions // ignore: cast_nullable_to_non_nullable
              as String?,
      subrole_type: freezed == subrole_type
          ? _value.subrole_type
          : subrole_type // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserRoleModelCopyWith<$Res>
    implements $UserRoleModelCopyWith<$Res> {
  factory _$$_UserRoleModelCopyWith(
          _$_UserRoleModel value, $Res Function(_$_UserRoleModel) then) =
      __$$_UserRoleModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int subrole_id,
      int? subrole_subscription_id,
      String? subrole_name,
      int? subrole_user_count,
      String? subrole_permissions,
      int? subrole_type});
}

/// @nodoc
class __$$_UserRoleModelCopyWithImpl<$Res>
    extends _$UserRoleModelCopyWithImpl<$Res, _$_UserRoleModel>
    implements _$$_UserRoleModelCopyWith<$Res> {
  __$$_UserRoleModelCopyWithImpl(
      _$_UserRoleModel _value, $Res Function(_$_UserRoleModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subrole_id = null,
    Object? subrole_subscription_id = freezed,
    Object? subrole_name = freezed,
    Object? subrole_user_count = freezed,
    Object? subrole_permissions = freezed,
    Object? subrole_type = freezed,
  }) {
    return _then(_$_UserRoleModel(
      subrole_id: null == subrole_id
          ? _value.subrole_id
          : subrole_id // ignore: cast_nullable_to_non_nullable
              as int,
      subrole_subscription_id: freezed == subrole_subscription_id
          ? _value.subrole_subscription_id
          : subrole_subscription_id // ignore: cast_nullable_to_non_nullable
              as int?,
      subrole_name: freezed == subrole_name
          ? _value.subrole_name
          : subrole_name // ignore: cast_nullable_to_non_nullable
              as String?,
      subrole_user_count: freezed == subrole_user_count
          ? _value.subrole_user_count
          : subrole_user_count // ignore: cast_nullable_to_non_nullable
              as int?,
      subrole_permissions: freezed == subrole_permissions
          ? _value.subrole_permissions
          : subrole_permissions // ignore: cast_nullable_to_non_nullable
              as String?,
      subrole_type: freezed == subrole_type
          ? _value.subrole_type
          : subrole_type // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserRoleModel implements _UserRoleModel {
  const _$_UserRoleModel(
      {required this.subrole_id,
      this.subrole_subscription_id,
      this.subrole_name,
      this.subrole_user_count,
      this.subrole_permissions,
      this.subrole_type});

  factory _$_UserRoleModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserRoleModelFromJson(json);

  @override
  final int subrole_id;
  @override
  final int? subrole_subscription_id;
  @override
  final String? subrole_name;
  @override
  final int? subrole_user_count;
  @override
  final String? subrole_permissions;
  @override
  final int? subrole_type;

  @override
  String toString() {
    return 'UserRoleModel(subrole_id: $subrole_id, subrole_subscription_id: $subrole_subscription_id, subrole_name: $subrole_name, subrole_user_count: $subrole_user_count, subrole_permissions: $subrole_permissions, subrole_type: $subrole_type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserRoleModel &&
            (identical(other.subrole_id, subrole_id) ||
                other.subrole_id == subrole_id) &&
            (identical(
                    other.subrole_subscription_id, subrole_subscription_id) ||
                other.subrole_subscription_id == subrole_subscription_id) &&
            (identical(other.subrole_name, subrole_name) ||
                other.subrole_name == subrole_name) &&
            (identical(other.subrole_user_count, subrole_user_count) ||
                other.subrole_user_count == subrole_user_count) &&
            (identical(other.subrole_permissions, subrole_permissions) ||
                other.subrole_permissions == subrole_permissions) &&
            (identical(other.subrole_type, subrole_type) ||
                other.subrole_type == subrole_type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      subrole_id,
      subrole_subscription_id,
      subrole_name,
      subrole_user_count,
      subrole_permissions,
      subrole_type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserRoleModelCopyWith<_$_UserRoleModel> get copyWith =>
      __$$_UserRoleModelCopyWithImpl<_$_UserRoleModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserRoleModelToJson(
      this,
    );
  }
}

abstract class _UserRoleModel implements UserRoleModel {
  const factory _UserRoleModel(
      {required final int subrole_id,
      final int? subrole_subscription_id,
      final String? subrole_name,
      final int? subrole_user_count,
      final String? subrole_permissions,
      final int? subrole_type}) = _$_UserRoleModel;

  factory _UserRoleModel.fromJson(Map<String, dynamic> json) =
      _$_UserRoleModel.fromJson;

  @override
  int get subrole_id;
  @override
  int? get subrole_subscription_id;
  @override
  String? get subrole_name;
  @override
  int? get subrole_user_count;
  @override
  String? get subrole_permissions;
  @override
  int? get subrole_type;
  @override
  @JsonKey(ignore: true)
  _$$_UserRoleModelCopyWith<_$_UserRoleModel> get copyWith =>
      throw _privateConstructorUsedError;
}
