// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contact_type_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ContactTypeModel _$ContactTypeModelFromJson(Map<String, dynamic> json) {
  return _ContactTypeModel.fromJson(json);
}

/// @nodoc
mixin _$ContactTypeModel {
  int? get contacttype_id => throw _privateConstructorUsedError;
  String? get contacttype_name => throw _privateConstructorUsedError;
  bool? get contacttype_isdefault => throw _privateConstructorUsedError;
  int? get contacttype_subscription_id => throw _privateConstructorUsedError;
  bool? get contacttype_isbuiltin => throw _privateConstructorUsedError;
  bool? get isdeleted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContactTypeModelCopyWith<ContactTypeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactTypeModelCopyWith<$Res> {
  factory $ContactTypeModelCopyWith(
          ContactTypeModel value, $Res Function(ContactTypeModel) then) =
      _$ContactTypeModelCopyWithImpl<$Res, ContactTypeModel>;
  @useResult
  $Res call(
      {int? contacttype_id,
      String? contacttype_name,
      bool? contacttype_isdefault,
      int? contacttype_subscription_id,
      bool? contacttype_isbuiltin,
      bool? isdeleted});
}

/// @nodoc
class _$ContactTypeModelCopyWithImpl<$Res, $Val extends ContactTypeModel>
    implements $ContactTypeModelCopyWith<$Res> {
  _$ContactTypeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contacttype_id = freezed,
    Object? contacttype_name = freezed,
    Object? contacttype_isdefault = freezed,
    Object? contacttype_subscription_id = freezed,
    Object? contacttype_isbuiltin = freezed,
    Object? isdeleted = freezed,
  }) {
    return _then(_value.copyWith(
      contacttype_id: freezed == contacttype_id
          ? _value.contacttype_id
          : contacttype_id // ignore: cast_nullable_to_non_nullable
              as int?,
      contacttype_name: freezed == contacttype_name
          ? _value.contacttype_name
          : contacttype_name // ignore: cast_nullable_to_non_nullable
              as String?,
      contacttype_isdefault: freezed == contacttype_isdefault
          ? _value.contacttype_isdefault
          : contacttype_isdefault // ignore: cast_nullable_to_non_nullable
              as bool?,
      contacttype_subscription_id: freezed == contacttype_subscription_id
          ? _value.contacttype_subscription_id
          : contacttype_subscription_id // ignore: cast_nullable_to_non_nullable
              as int?,
      contacttype_isbuiltin: freezed == contacttype_isbuiltin
          ? _value.contacttype_isbuiltin
          : contacttype_isbuiltin // ignore: cast_nullable_to_non_nullable
              as bool?,
      isdeleted: freezed == isdeleted
          ? _value.isdeleted
          : isdeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ContactTypeModelCopyWith<$Res>
    implements $ContactTypeModelCopyWith<$Res> {
  factory _$$_ContactTypeModelCopyWith(
          _$_ContactTypeModel value, $Res Function(_$_ContactTypeModel) then) =
      __$$_ContactTypeModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? contacttype_id,
      String? contacttype_name,
      bool? contacttype_isdefault,
      int? contacttype_subscription_id,
      bool? contacttype_isbuiltin,
      bool? isdeleted});
}

/// @nodoc
class __$$_ContactTypeModelCopyWithImpl<$Res>
    extends _$ContactTypeModelCopyWithImpl<$Res, _$_ContactTypeModel>
    implements _$$_ContactTypeModelCopyWith<$Res> {
  __$$_ContactTypeModelCopyWithImpl(
      _$_ContactTypeModel _value, $Res Function(_$_ContactTypeModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contacttype_id = freezed,
    Object? contacttype_name = freezed,
    Object? contacttype_isdefault = freezed,
    Object? contacttype_subscription_id = freezed,
    Object? contacttype_isbuiltin = freezed,
    Object? isdeleted = freezed,
  }) {
    return _then(_$_ContactTypeModel(
      contacttype_id: freezed == contacttype_id
          ? _value.contacttype_id
          : contacttype_id // ignore: cast_nullable_to_non_nullable
              as int?,
      contacttype_name: freezed == contacttype_name
          ? _value.contacttype_name
          : contacttype_name // ignore: cast_nullable_to_non_nullable
              as String?,
      contacttype_isdefault: freezed == contacttype_isdefault
          ? _value.contacttype_isdefault
          : contacttype_isdefault // ignore: cast_nullable_to_non_nullable
              as bool?,
      contacttype_subscription_id: freezed == contacttype_subscription_id
          ? _value.contacttype_subscription_id
          : contacttype_subscription_id // ignore: cast_nullable_to_non_nullable
              as int?,
      contacttype_isbuiltin: freezed == contacttype_isbuiltin
          ? _value.contacttype_isbuiltin
          : contacttype_isbuiltin // ignore: cast_nullable_to_non_nullable
              as bool?,
      isdeleted: freezed == isdeleted
          ? _value.isdeleted
          : isdeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ContactTypeModel implements _ContactTypeModel {
  const _$_ContactTypeModel(
      {required this.contacttype_id,
      required this.contacttype_name,
      this.contacttype_isdefault = false,
      this.contacttype_subscription_id = null,
      this.contacttype_isbuiltin = false,
      this.isdeleted = null});

  factory _$_ContactTypeModel.fromJson(Map<String, dynamic> json) =>
      _$$_ContactTypeModelFromJson(json);

  @override
  final int? contacttype_id;
  @override
  final String? contacttype_name;
  @override
  @JsonKey()
  final bool? contacttype_isdefault;
  @override
  @JsonKey()
  final int? contacttype_subscription_id;
  @override
  @JsonKey()
  final bool? contacttype_isbuiltin;
  @override
  @JsonKey()
  final bool? isdeleted;

  @override
  String toString() {
    return 'ContactTypeModel(contacttype_id: $contacttype_id, contacttype_name: $contacttype_name, contacttype_isdefault: $contacttype_isdefault, contacttype_subscription_id: $contacttype_subscription_id, contacttype_isbuiltin: $contacttype_isbuiltin, isdeleted: $isdeleted)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ContactTypeModel &&
            (identical(other.contacttype_id, contacttype_id) ||
                other.contacttype_id == contacttype_id) &&
            (identical(other.contacttype_name, contacttype_name) ||
                other.contacttype_name == contacttype_name) &&
            (identical(other.contacttype_isdefault, contacttype_isdefault) ||
                other.contacttype_isdefault == contacttype_isdefault) &&
            (identical(other.contacttype_subscription_id,
                    contacttype_subscription_id) ||
                other.contacttype_subscription_id ==
                    contacttype_subscription_id) &&
            (identical(other.contacttype_isbuiltin, contacttype_isbuiltin) ||
                other.contacttype_isbuiltin == contacttype_isbuiltin) &&
            (identical(other.isdeleted, isdeleted) ||
                other.isdeleted == isdeleted));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      contacttype_id,
      contacttype_name,
      contacttype_isdefault,
      contacttype_subscription_id,
      contacttype_isbuiltin,
      isdeleted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ContactTypeModelCopyWith<_$_ContactTypeModel> get copyWith =>
      __$$_ContactTypeModelCopyWithImpl<_$_ContactTypeModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ContactTypeModelToJson(
      this,
    );
  }
}

abstract class _ContactTypeModel implements ContactTypeModel {
  const factory _ContactTypeModel(
      {required final int? contacttype_id,
      required final String? contacttype_name,
      final bool? contacttype_isdefault,
      final int? contacttype_subscription_id,
      final bool? contacttype_isbuiltin,
      final bool? isdeleted}) = _$_ContactTypeModel;

  factory _ContactTypeModel.fromJson(Map<String, dynamic> json) =
      _$_ContactTypeModel.fromJson;

  @override
  int? get contacttype_id;
  @override
  String? get contacttype_name;
  @override
  bool? get contacttype_isdefault;
  @override
  int? get contacttype_subscription_id;
  @override
  bool? get contacttype_isbuiltin;
  @override
  bool? get isdeleted;
  @override
  @JsonKey(ignore: true)
  _$$_ContactTypeModelCopyWith<_$_ContactTypeModel> get copyWith =>
      throw _privateConstructorUsedError;
}
