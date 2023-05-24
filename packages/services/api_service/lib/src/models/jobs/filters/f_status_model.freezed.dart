// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'f_status_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FStatusModel _$FStatusModelFromJson(Map<String, dynamic> json) {
  return _FStatusModel.fromJson(json);
}

/// @nodoc
mixin _$FStatusModel {
  @JsonKey(name: 'jobstatus_id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'jobstatus_brush_colour_argb')
  String? get color => throw _privateConstructorUsedError;
  @JsonKey(name: 'jobstatus_name')
  String? get name => throw _privateConstructorUsedError;
  bool? get isdeleted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FStatusModelCopyWith<FStatusModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FStatusModelCopyWith<$Res> {
  factory $FStatusModelCopyWith(
          FStatusModel value, $Res Function(FStatusModel) then) =
      _$FStatusModelCopyWithImpl<$Res, FStatusModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'jobstatus_id') int? id,
      @JsonKey(name: 'jobstatus_brush_colour_argb') String? color,
      @JsonKey(name: 'jobstatus_name') String? name,
      bool? isdeleted});
}

/// @nodoc
class _$FStatusModelCopyWithImpl<$Res, $Val extends FStatusModel>
    implements $FStatusModelCopyWith<$Res> {
  _$FStatusModelCopyWithImpl(this._value, this._then);

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
abstract class _$$_FStatusModelCopyWith<$Res>
    implements $FStatusModelCopyWith<$Res> {
  factory _$$_FStatusModelCopyWith(
          _$_FStatusModel value, $Res Function(_$_FStatusModel) then) =
      __$$_FStatusModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'jobstatus_id') int? id,
      @JsonKey(name: 'jobstatus_brush_colour_argb') String? color,
      @JsonKey(name: 'jobstatus_name') String? name,
      bool? isdeleted});
}

/// @nodoc
class __$$_FStatusModelCopyWithImpl<$Res>
    extends _$FStatusModelCopyWithImpl<$Res, _$_FStatusModel>
    implements _$$_FStatusModelCopyWith<$Res> {
  __$$_FStatusModelCopyWithImpl(
      _$_FStatusModel _value, $Res Function(_$_FStatusModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? color = freezed,
    Object? name = freezed,
    Object? isdeleted = freezed,
  }) {
    return _then(_$_FStatusModel(
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
class _$_FStatusModel implements _FStatusModel {
  const _$_FStatusModel(
      {@JsonKey(name: 'jobstatus_id') this.id,
      @JsonKey(name: 'jobstatus_brush_colour_argb') this.color,
      @JsonKey(name: 'jobstatus_name') this.name,
      this.isdeleted});

  factory _$_FStatusModel.fromJson(Map<String, dynamic> json) =>
      _$$_FStatusModelFromJson(json);

  @override
  @JsonKey(name: 'jobstatus_id')
  final int? id;
  @override
  @JsonKey(name: 'jobstatus_brush_colour_argb')
  final String? color;
  @override
  @JsonKey(name: 'jobstatus_name')
  final String? name;
  @override
  final bool? isdeleted;

  @override
  String toString() {
    return 'FStatusModel(id: $id, color: $color, name: $name, isdeleted: $isdeleted)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FStatusModel &&
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
  _$$_FStatusModelCopyWith<_$_FStatusModel> get copyWith =>
      __$$_FStatusModelCopyWithImpl<_$_FStatusModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FStatusModelToJson(
      this,
    );
  }
}

abstract class _FStatusModel implements FStatusModel {
  const factory _FStatusModel(
      {@JsonKey(name: 'jobstatus_id') final int? id,
      @JsonKey(name: 'jobstatus_brush_colour_argb') final String? color,
      @JsonKey(name: 'jobstatus_name') final String? name,
      final bool? isdeleted}) = _$_FStatusModel;

  factory _FStatusModel.fromJson(Map<String, dynamic> json) =
      _$_FStatusModel.fromJson;

  @override
  @JsonKey(name: 'jobstatus_id')
  int? get id;
  @override
  @JsonKey(name: 'jobstatus_brush_colour_argb')
  String? get color;
  @override
  @JsonKey(name: 'jobstatus_name')
  String? get name;
  @override
  bool? get isdeleted;
  @override
  @JsonKey(ignore: true)
  _$$_FStatusModelCopyWith<_$_FStatusModel> get copyWith =>
      throw _privateConstructorUsedError;
}
