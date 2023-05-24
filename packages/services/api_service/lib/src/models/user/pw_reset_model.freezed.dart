// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pw_reset_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PasswordResetModel _$PasswordResetModelFromJson(Map<String, dynamic> json) {
  return _PasswordResetModel.fromJson(json);
}

/// @nodoc
mixin _$PasswordResetModel {
  String? get Message => throw _privateConstructorUsedError;
  String? get MessageTitle => throw _privateConstructorUsedError;
  bool? get Success => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PasswordResetModelCopyWith<PasswordResetModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PasswordResetModelCopyWith<$Res> {
  factory $PasswordResetModelCopyWith(
          PasswordResetModel value, $Res Function(PasswordResetModel) then) =
      _$PasswordResetModelCopyWithImpl<$Res, PasswordResetModel>;
  @useResult
  $Res call({String? Message, String? MessageTitle, bool? Success});
}

/// @nodoc
class _$PasswordResetModelCopyWithImpl<$Res, $Val extends PasswordResetModel>
    implements $PasswordResetModelCopyWith<$Res> {
  _$PasswordResetModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? Message = freezed,
    Object? MessageTitle = freezed,
    Object? Success = freezed,
  }) {
    return _then(_value.copyWith(
      Message: freezed == Message
          ? _value.Message
          : Message // ignore: cast_nullable_to_non_nullable
              as String?,
      MessageTitle: freezed == MessageTitle
          ? _value.MessageTitle
          : MessageTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      Success: freezed == Success
          ? _value.Success
          : Success // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PasswordResetModelCopyWith<$Res>
    implements $PasswordResetModelCopyWith<$Res> {
  factory _$$_PasswordResetModelCopyWith(_$_PasswordResetModel value,
          $Res Function(_$_PasswordResetModel) then) =
      __$$_PasswordResetModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? Message, String? MessageTitle, bool? Success});
}

/// @nodoc
class __$$_PasswordResetModelCopyWithImpl<$Res>
    extends _$PasswordResetModelCopyWithImpl<$Res, _$_PasswordResetModel>
    implements _$$_PasswordResetModelCopyWith<$Res> {
  __$$_PasswordResetModelCopyWithImpl(
      _$_PasswordResetModel _value, $Res Function(_$_PasswordResetModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? Message = freezed,
    Object? MessageTitle = freezed,
    Object? Success = freezed,
  }) {
    return _then(_$_PasswordResetModel(
      Message: freezed == Message
          ? _value.Message
          : Message // ignore: cast_nullable_to_non_nullable
              as String?,
      MessageTitle: freezed == MessageTitle
          ? _value.MessageTitle
          : MessageTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      Success: freezed == Success
          ? _value.Success
          : Success // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PasswordResetModel implements _PasswordResetModel {
  const _$_PasswordResetModel({this.Message, this.MessageTitle, this.Success});

  factory _$_PasswordResetModel.fromJson(Map<String, dynamic> json) =>
      _$$_PasswordResetModelFromJson(json);

  @override
  final String? Message;
  @override
  final String? MessageTitle;
  @override
  final bool? Success;

  @override
  String toString() {
    return 'PasswordResetModel(Message: $Message, MessageTitle: $MessageTitle, Success: $Success)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PasswordResetModel &&
            (identical(other.Message, Message) || other.Message == Message) &&
            (identical(other.MessageTitle, MessageTitle) ||
                other.MessageTitle == MessageTitle) &&
            (identical(other.Success, Success) || other.Success == Success));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, Message, MessageTitle, Success);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PasswordResetModelCopyWith<_$_PasswordResetModel> get copyWith =>
      __$$_PasswordResetModelCopyWithImpl<_$_PasswordResetModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PasswordResetModelToJson(
      this,
    );
  }
}

abstract class _PasswordResetModel implements PasswordResetModel {
  const factory _PasswordResetModel(
      {final String? Message,
      final String? MessageTitle,
      final bool? Success}) = _$_PasswordResetModel;

  factory _PasswordResetModel.fromJson(Map<String, dynamic> json) =
      _$_PasswordResetModel.fromJson;

  @override
  String? get Message;
  @override
  String? get MessageTitle;
  @override
  bool? get Success;
  @override
  @JsonKey(ignore: true)
  _$$_PasswordResetModelCopyWith<_$_PasswordResetModel> get copyWith =>
      throw _privateConstructorUsedError;
}
