// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'f_pricing_type_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FPricingTypeModel _$FPricingTypeModelFromJson(Map<String, dynamic> json) {
  return _FPricingTypeModel.fromJson(json);
}

/// @nodoc
mixin _$FPricingTypeModel {
  @JsonKey(name: 'pricingtype_id')
  int? get id => throw _privateConstructorUsedError;
  String? get color => throw _privateConstructorUsedError;
  @JsonKey(name: 'pricingtype_name')
  String? get name => throw _privateConstructorUsedError;
  bool? get isdeleted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FPricingTypeModelCopyWith<FPricingTypeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FPricingTypeModelCopyWith<$Res> {
  factory $FPricingTypeModelCopyWith(
          FPricingTypeModel value, $Res Function(FPricingTypeModel) then) =
      _$FPricingTypeModelCopyWithImpl<$Res, FPricingTypeModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'pricingtype_id') int? id,
      String? color,
      @JsonKey(name: 'pricingtype_name') String? name,
      bool? isdeleted});
}

/// @nodoc
class _$FPricingTypeModelCopyWithImpl<$Res, $Val extends FPricingTypeModel>
    implements $FPricingTypeModelCopyWith<$Res> {
  _$FPricingTypeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? color = freezed,
    Object? name = freezed,
    Object? isdeleted = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      isdeleted: freezed == isdeleted
          ? _value.isdeleted
          : isdeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FPricingTypeModelCopyWith<$Res>
    implements $FPricingTypeModelCopyWith<$Res> {
  factory _$$_FPricingTypeModelCopyWith(_$_FPricingTypeModel value,
          $Res Function(_$_FPricingTypeModel) then) =
      __$$_FPricingTypeModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'pricingtype_id') int? id,
      String? color,
      @JsonKey(name: 'pricingtype_name') String? name,
      bool? isdeleted});
}

/// @nodoc
class __$$_FPricingTypeModelCopyWithImpl<$Res>
    extends _$FPricingTypeModelCopyWithImpl<$Res, _$_FPricingTypeModel>
    implements _$$_FPricingTypeModelCopyWith<$Res> {
  __$$_FPricingTypeModelCopyWithImpl(
      _$_FPricingTypeModel _value, $Res Function(_$_FPricingTypeModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? color = freezed,
    Object? name = freezed,
    Object? isdeleted = freezed,
  }) {
    return _then(_$_FPricingTypeModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      isdeleted: freezed == isdeleted
          ? _value.isdeleted
          : isdeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FPricingTypeModel implements _FPricingTypeModel {
  const _$_FPricingTypeModel(
      {@JsonKey(name: 'pricingtype_id') this.id,
      this.color,
      @JsonKey(name: 'pricingtype_name') this.name,
      this.isdeleted});

  factory _$_FPricingTypeModel.fromJson(Map<String, dynamic> json) =>
      _$$_FPricingTypeModelFromJson(json);

  @override
  @JsonKey(name: 'pricingtype_id')
  final int? id;
  @override
  final String? color;
  @override
  @JsonKey(name: 'pricingtype_name')
  final String? name;
  @override
  final bool? isdeleted;

  @override
  String toString() {
    return 'FPricingTypeModel(id: $id, color: $color, name: $name, isdeleted: $isdeleted)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FPricingTypeModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isdeleted, isdeleted) ||
                other.isdeleted == isdeleted));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, color, name, isdeleted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FPricingTypeModelCopyWith<_$_FPricingTypeModel> get copyWith =>
      __$$_FPricingTypeModelCopyWithImpl<_$_FPricingTypeModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FPricingTypeModelToJson(
      this,
    );
  }
}

abstract class _FPricingTypeModel implements FPricingTypeModel {
  const factory _FPricingTypeModel(
      {@JsonKey(name: 'pricingtype_id') final int? id,
      final String? color,
      @JsonKey(name: 'pricingtype_name') final String? name,
      final bool? isdeleted}) = _$_FPricingTypeModel;

  factory _FPricingTypeModel.fromJson(Map<String, dynamic> json) =
      _$_FPricingTypeModel.fromJson;

  @override
  @JsonKey(name: 'pricingtype_id')
  int? get id;
  @override
  String? get color;
  @override
  @JsonKey(name: 'pricingtype_name')
  String? get name;
  @override
  bool? get isdeleted;
  @override
  @JsonKey(ignore: true)
  _$$_FPricingTypeModelCopyWith<_$_FPricingTypeModel> get copyWith =>
      throw _privateConstructorUsedError;
}
