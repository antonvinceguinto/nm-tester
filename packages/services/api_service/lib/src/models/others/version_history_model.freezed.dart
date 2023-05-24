// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'version_history_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VersionHistoryModel _$VersionHistoryModelFromJson(Map<String, dynamic> json) {
  return _VersionHistoryModel.fromJson(json);
}

/// @nodoc
mixin _$VersionHistoryModel {
  String get appversion_version => throw _privateConstructorUsedError;
  DateTime? get appversion_date => throw _privateConstructorUsedError;
  String get appversion_html => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VersionHistoryModelCopyWith<VersionHistoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VersionHistoryModelCopyWith<$Res> {
  factory $VersionHistoryModelCopyWith(
          VersionHistoryModel value, $Res Function(VersionHistoryModel) then) =
      _$VersionHistoryModelCopyWithImpl<$Res, VersionHistoryModel>;
  @useResult
  $Res call(
      {String appversion_version,
      DateTime? appversion_date,
      String appversion_html});
}

/// @nodoc
class _$VersionHistoryModelCopyWithImpl<$Res, $Val extends VersionHistoryModel>
    implements $VersionHistoryModelCopyWith<$Res> {
  _$VersionHistoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appversion_version = null,
    Object? appversion_date = freezed,
    Object? appversion_html = null,
  }) {
    return _then(_value.copyWith(
      appversion_version: null == appversion_version
          ? _value.appversion_version
          : appversion_version // ignore: cast_nullable_to_non_nullable
              as String,
      appversion_date: freezed == appversion_date
          ? _value.appversion_date
          : appversion_date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      appversion_html: null == appversion_html
          ? _value.appversion_html
          : appversion_html // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_VersionHistoryModelCopyWith<$Res>
    implements $VersionHistoryModelCopyWith<$Res> {
  factory _$$_VersionHistoryModelCopyWith(_$_VersionHistoryModel value,
          $Res Function(_$_VersionHistoryModel) then) =
      __$$_VersionHistoryModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String appversion_version,
      DateTime? appversion_date,
      String appversion_html});
}

/// @nodoc
class __$$_VersionHistoryModelCopyWithImpl<$Res>
    extends _$VersionHistoryModelCopyWithImpl<$Res, _$_VersionHistoryModel>
    implements _$$_VersionHistoryModelCopyWith<$Res> {
  __$$_VersionHistoryModelCopyWithImpl(_$_VersionHistoryModel _value,
      $Res Function(_$_VersionHistoryModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appversion_version = null,
    Object? appversion_date = freezed,
    Object? appversion_html = null,
  }) {
    return _then(_$_VersionHistoryModel(
      appversion_version: null == appversion_version
          ? _value.appversion_version
          : appversion_version // ignore: cast_nullable_to_non_nullable
              as String,
      appversion_date: freezed == appversion_date
          ? _value.appversion_date
          : appversion_date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      appversion_html: null == appversion_html
          ? _value.appversion_html
          : appversion_html // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_VersionHistoryModel implements _VersionHistoryModel {
  const _$_VersionHistoryModel(
      {required this.appversion_version,
      required this.appversion_date,
      required this.appversion_html});

  factory _$_VersionHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$$_VersionHistoryModelFromJson(json);

  @override
  final String appversion_version;
  @override
  final DateTime? appversion_date;
  @override
  final String appversion_html;

  @override
  String toString() {
    return 'VersionHistoryModel(appversion_version: $appversion_version, appversion_date: $appversion_date, appversion_html: $appversion_html)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VersionHistoryModel &&
            (identical(other.appversion_version, appversion_version) ||
                other.appversion_version == appversion_version) &&
            (identical(other.appversion_date, appversion_date) ||
                other.appversion_date == appversion_date) &&
            (identical(other.appversion_html, appversion_html) ||
                other.appversion_html == appversion_html));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, appversion_version, appversion_date, appversion_html);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VersionHistoryModelCopyWith<_$_VersionHistoryModel> get copyWith =>
      __$$_VersionHistoryModelCopyWithImpl<_$_VersionHistoryModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VersionHistoryModelToJson(
      this,
    );
  }
}

abstract class _VersionHistoryModel implements VersionHistoryModel {
  const factory _VersionHistoryModel(
      {required final String appversion_version,
      required final DateTime? appversion_date,
      required final String appversion_html}) = _$_VersionHistoryModel;

  factory _VersionHistoryModel.fromJson(Map<String, dynamic> json) =
      _$_VersionHistoryModel.fromJson;

  @override
  String get appversion_version;
  @override
  DateTime? get appversion_date;
  @override
  String get appversion_html;
  @override
  @JsonKey(ignore: true)
  _$$_VersionHistoryModelCopyWith<_$_VersionHistoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}
