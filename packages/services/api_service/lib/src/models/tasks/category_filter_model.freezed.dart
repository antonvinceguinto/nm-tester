// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_filter_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CategoryFilterModel _$CategoryFilterModelFromJson(Map<String, dynamic> json) {
  return _CategoryFilterModel.fromJson(json);
}

/// @nodoc
mixin _$CategoryFilterModel {
  @JsonKey(name: 'usercategory_id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'usercategory_name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'usercategory_brush_colour_argb')
  String? get color => throw _privateConstructorUsedError;
  bool? get isdeleted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryFilterModelCopyWith<CategoryFilterModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryFilterModelCopyWith<$Res> {
  factory $CategoryFilterModelCopyWith(
          CategoryFilterModel value, $Res Function(CategoryFilterModel) then) =
      _$CategoryFilterModelCopyWithImpl<$Res, CategoryFilterModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'usercategory_id') int? id,
      @JsonKey(name: 'usercategory_name') String? name,
      @JsonKey(name: 'usercategory_brush_colour_argb') String? color,
      bool? isdeleted});
}

/// @nodoc
class _$CategoryFilterModelCopyWithImpl<$Res, $Val extends CategoryFilterModel>
    implements $CategoryFilterModelCopyWith<$Res> {
  _$CategoryFilterModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? color = freezed,
    Object? isdeleted = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      isdeleted: freezed == isdeleted
          ? _value.isdeleted
          : isdeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CategoryFilterModelCopyWith<$Res>
    implements $CategoryFilterModelCopyWith<$Res> {
  factory _$$_CategoryFilterModelCopyWith(_$_CategoryFilterModel value,
          $Res Function(_$_CategoryFilterModel) then) =
      __$$_CategoryFilterModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'usercategory_id') int? id,
      @JsonKey(name: 'usercategory_name') String? name,
      @JsonKey(name: 'usercategory_brush_colour_argb') String? color,
      bool? isdeleted});
}

/// @nodoc
class __$$_CategoryFilterModelCopyWithImpl<$Res>
    extends _$CategoryFilterModelCopyWithImpl<$Res, _$_CategoryFilterModel>
    implements _$$_CategoryFilterModelCopyWith<$Res> {
  __$$_CategoryFilterModelCopyWithImpl(_$_CategoryFilterModel _value,
      $Res Function(_$_CategoryFilterModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? color = freezed,
    Object? isdeleted = freezed,
  }) {
    return _then(_$_CategoryFilterModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
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
class _$_CategoryFilterModel implements _CategoryFilterModel {
  const _$_CategoryFilterModel(
      {@JsonKey(name: 'usercategory_id') this.id,
      @JsonKey(name: 'usercategory_name') this.name,
      @JsonKey(name: 'usercategory_brush_colour_argb') this.color,
      this.isdeleted});

  factory _$_CategoryFilterModel.fromJson(Map<String, dynamic> json) =>
      _$$_CategoryFilterModelFromJson(json);

  @override
  @JsonKey(name: 'usercategory_id')
  final int? id;
  @override
  @JsonKey(name: 'usercategory_name')
  final String? name;
  @override
  @JsonKey(name: 'usercategory_brush_colour_argb')
  final String? color;
  @override
  final bool? isdeleted;

  @override
  String toString() {
    return 'CategoryFilterModel(id: $id, name: $name, color: $color, isdeleted: $isdeleted)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CategoryFilterModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.isdeleted, isdeleted) ||
                other.isdeleted == isdeleted));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, color, isdeleted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CategoryFilterModelCopyWith<_$_CategoryFilterModel> get copyWith =>
      __$$_CategoryFilterModelCopyWithImpl<_$_CategoryFilterModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CategoryFilterModelToJson(
      this,
    );
  }
}

abstract class _CategoryFilterModel implements CategoryFilterModel {
  const factory _CategoryFilterModel(
      {@JsonKey(name: 'usercategory_id') final int? id,
      @JsonKey(name: 'usercategory_name') final String? name,
      @JsonKey(name: 'usercategory_brush_colour_argb') final String? color,
      final bool? isdeleted}) = _$_CategoryFilterModel;

  factory _CategoryFilterModel.fromJson(Map<String, dynamic> json) =
      _$_CategoryFilterModel.fromJson;

  @override
  @JsonKey(name: 'usercategory_id')
  int? get id;
  @override
  @JsonKey(name: 'usercategory_name')
  String? get name;
  @override
  @JsonKey(name: 'usercategory_brush_colour_argb')
  String? get color;
  @override
  bool? get isdeleted;
  @override
  @JsonKey(ignore: true)
  _$$_CategoryFilterModelCopyWith<_$_CategoryFilterModel> get copyWith =>
      throw _privateConstructorUsedError;
}
