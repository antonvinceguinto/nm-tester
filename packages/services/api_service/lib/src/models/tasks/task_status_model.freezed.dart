// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_status_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TaskStatusModel _$TaskStatusModelFromJson(Map<String, dynamic> json) {
  return _TaskStatusModel.fromJson(json);
}

/// @nodoc
mixin _$TaskStatusModel {
  @JsonKey(name: 'bookingstatus_id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'bookingstatus_name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'bookingstatus_brush_colour_argb')
  String? get color => throw _privateConstructorUsedError;
  bool? get isdeleted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskStatusModelCopyWith<TaskStatusModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskStatusModelCopyWith<$Res> {
  factory $TaskStatusModelCopyWith(
          TaskStatusModel value, $Res Function(TaskStatusModel) then) =
      _$TaskStatusModelCopyWithImpl<$Res, TaskStatusModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'bookingstatus_id') int? id,
      @JsonKey(name: 'bookingstatus_name') String? name,
      @JsonKey(name: 'bookingstatus_brush_colour_argb') String? color,
      bool? isdeleted});
}

/// @nodoc
class _$TaskStatusModelCopyWithImpl<$Res, $Val extends TaskStatusModel>
    implements $TaskStatusModelCopyWith<$Res> {
  _$TaskStatusModelCopyWithImpl(this._value, this._then);

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
abstract class _$$_TaskStatusModelCopyWith<$Res>
    implements $TaskStatusModelCopyWith<$Res> {
  factory _$$_TaskStatusModelCopyWith(
          _$_TaskStatusModel value, $Res Function(_$_TaskStatusModel) then) =
      __$$_TaskStatusModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'bookingstatus_id') int? id,
      @JsonKey(name: 'bookingstatus_name') String? name,
      @JsonKey(name: 'bookingstatus_brush_colour_argb') String? color,
      bool? isdeleted});
}

/// @nodoc
class __$$_TaskStatusModelCopyWithImpl<$Res>
    extends _$TaskStatusModelCopyWithImpl<$Res, _$_TaskStatusModel>
    implements _$$_TaskStatusModelCopyWith<$Res> {
  __$$_TaskStatusModelCopyWithImpl(
      _$_TaskStatusModel _value, $Res Function(_$_TaskStatusModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? color = freezed,
    Object? isdeleted = freezed,
  }) {
    return _then(_$_TaskStatusModel(
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
class _$_TaskStatusModel implements _TaskStatusModel {
  const _$_TaskStatusModel(
      {@JsonKey(name: 'bookingstatus_id') this.id,
      @JsonKey(name: 'bookingstatus_name') this.name,
      @JsonKey(name: 'bookingstatus_brush_colour_argb') this.color,
      this.isdeleted});

  factory _$_TaskStatusModel.fromJson(Map<String, dynamic> json) =>
      _$$_TaskStatusModelFromJson(json);

  @override
  @JsonKey(name: 'bookingstatus_id')
  final int? id;
  @override
  @JsonKey(name: 'bookingstatus_name')
  final String? name;
  @override
  @JsonKey(name: 'bookingstatus_brush_colour_argb')
  final String? color;
  @override
  final bool? isdeleted;

  @override
  String toString() {
    return 'TaskStatusModel(id: $id, name: $name, color: $color, isdeleted: $isdeleted)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TaskStatusModel &&
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
  _$$_TaskStatusModelCopyWith<_$_TaskStatusModel> get copyWith =>
      __$$_TaskStatusModelCopyWithImpl<_$_TaskStatusModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TaskStatusModelToJson(
      this,
    );
  }
}

abstract class _TaskStatusModel implements TaskStatusModel {
  const factory _TaskStatusModel(
      {@JsonKey(name: 'bookingstatus_id') final int? id,
      @JsonKey(name: 'bookingstatus_name') final String? name,
      @JsonKey(name: 'bookingstatus_brush_colour_argb') final String? color,
      final bool? isdeleted}) = _$_TaskStatusModel;

  factory _TaskStatusModel.fromJson(Map<String, dynamic> json) =
      _$_TaskStatusModel.fromJson;

  @override
  @JsonKey(name: 'bookingstatus_id')
  int? get id;
  @override
  @JsonKey(name: 'bookingstatus_name')
  String? get name;
  @override
  @JsonKey(name: 'bookingstatus_brush_colour_argb')
  String? get color;
  @override
  bool? get isdeleted;
  @override
  @JsonKey(ignore: true)
  _$$_TaskStatusModelCopyWith<_$_TaskStatusModel> get copyWith =>
      throw _privateConstructorUsedError;
}
