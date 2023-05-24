// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TaskListModel _$TaskListModelFromJson(Map<String, dynamic> json) {
  return _TaskListModel.fromJson(json);
}

/// @nodoc
mixin _$TaskListModel {
  int get total_all => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  DateTime? get end_date => throw _privateConstructorUsedError;
  DateTime? get first_date => throw _privateConstructorUsedError;
  DateTime? get last_date => throw _privateConstructorUsedError;
  DateTime? get start_date => throw _privateConstructorUsedError;
  List<TaskInfoLevelModel> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskListModelCopyWith<TaskListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskListModelCopyWith<$Res> {
  factory $TaskListModelCopyWith(
          TaskListModel value, $Res Function(TaskListModel) then) =
      _$TaskListModelCopyWithImpl<$Res, TaskListModel>;
  @useResult
  $Res call(
      {int total_all,
      int total,
      DateTime? end_date,
      DateTime? first_date,
      DateTime? last_date,
      DateTime? start_date,
      List<TaskInfoLevelModel> data});
}

/// @nodoc
class _$TaskListModelCopyWithImpl<$Res, $Val extends TaskListModel>
    implements $TaskListModelCopyWith<$Res> {
  _$TaskListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total_all = null,
    Object? total = null,
    Object? end_date = freezed,
    Object? first_date = freezed,
    Object? last_date = freezed,
    Object? start_date = freezed,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      total_all: null == total_all
          ? _value.total_all
          : total_all // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      end_date: freezed == end_date
          ? _value.end_date
          : end_date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      first_date: freezed == first_date
          ? _value.first_date
          : first_date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      last_date: freezed == last_date
          ? _value.last_date
          : last_date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      start_date: freezed == start_date
          ? _value.start_date
          : start_date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<TaskInfoLevelModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TaskListModelCopyWith<$Res>
    implements $TaskListModelCopyWith<$Res> {
  factory _$$_TaskListModelCopyWith(
          _$_TaskListModel value, $Res Function(_$_TaskListModel) then) =
      __$$_TaskListModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int total_all,
      int total,
      DateTime? end_date,
      DateTime? first_date,
      DateTime? last_date,
      DateTime? start_date,
      List<TaskInfoLevelModel> data});
}

/// @nodoc
class __$$_TaskListModelCopyWithImpl<$Res>
    extends _$TaskListModelCopyWithImpl<$Res, _$_TaskListModel>
    implements _$$_TaskListModelCopyWith<$Res> {
  __$$_TaskListModelCopyWithImpl(
      _$_TaskListModel _value, $Res Function(_$_TaskListModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total_all = null,
    Object? total = null,
    Object? end_date = freezed,
    Object? first_date = freezed,
    Object? last_date = freezed,
    Object? start_date = freezed,
    Object? data = null,
  }) {
    return _then(_$_TaskListModel(
      total_all: null == total_all
          ? _value.total_all
          : total_all // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      end_date: freezed == end_date
          ? _value.end_date
          : end_date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      first_date: freezed == first_date
          ? _value.first_date
          : first_date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      last_date: freezed == last_date
          ? _value.last_date
          : last_date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      start_date: freezed == start_date
          ? _value.start_date
          : start_date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<TaskInfoLevelModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TaskListModel implements _TaskListModel {
  const _$_TaskListModel(
      {this.total_all = 0,
      this.total = 0,
      this.end_date,
      this.first_date,
      this.last_date,
      this.start_date,
      final List<TaskInfoLevelModel> data = const []})
      : _data = data;

  factory _$_TaskListModel.fromJson(Map<String, dynamic> json) =>
      _$$_TaskListModelFromJson(json);

  @override
  @JsonKey()
  final int total_all;
  @override
  @JsonKey()
  final int total;
  @override
  final DateTime? end_date;
  @override
  final DateTime? first_date;
  @override
  final DateTime? last_date;
  @override
  final DateTime? start_date;
  final List<TaskInfoLevelModel> _data;
  @override
  @JsonKey()
  List<TaskInfoLevelModel> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'TaskListModel(total_all: $total_all, total: $total, end_date: $end_date, first_date: $first_date, last_date: $last_date, start_date: $start_date, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TaskListModel &&
            (identical(other.total_all, total_all) ||
                other.total_all == total_all) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.end_date, end_date) ||
                other.end_date == end_date) &&
            (identical(other.first_date, first_date) ||
                other.first_date == first_date) &&
            (identical(other.last_date, last_date) ||
                other.last_date == last_date) &&
            (identical(other.start_date, start_date) ||
                other.start_date == start_date) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      total_all,
      total,
      end_date,
      first_date,
      last_date,
      start_date,
      const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TaskListModelCopyWith<_$_TaskListModel> get copyWith =>
      __$$_TaskListModelCopyWithImpl<_$_TaskListModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TaskListModelToJson(
      this,
    );
  }
}

abstract class _TaskListModel implements TaskListModel {
  const factory _TaskListModel(
      {final int total_all,
      final int total,
      final DateTime? end_date,
      final DateTime? first_date,
      final DateTime? last_date,
      final DateTime? start_date,
      final List<TaskInfoLevelModel> data}) = _$_TaskListModel;

  factory _TaskListModel.fromJson(Map<String, dynamic> json) =
      _$_TaskListModel.fromJson;

  @override
  int get total_all;
  @override
  int get total;
  @override
  DateTime? get end_date;
  @override
  DateTime? get first_date;
  @override
  DateTime? get last_date;
  @override
  DateTime? get start_date;
  @override
  List<TaskInfoLevelModel> get data;
  @override
  @JsonKey(ignore: true)
  _$$_TaskListModelCopyWith<_$_TaskListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

BookingKey _$BookingKeyFromJson(Map<String, dynamic> json) {
  return _BookingKey.fromJson(json);
}

/// @nodoc
mixin _$BookingKey {
  @JsonKey(name: 'BookingId')
  int? get bookingId => throw _privateConstructorUsedError;
  @JsonKey(name: 'OccurrenceDateTime')
  DateTime? get occurrenceDateTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookingKeyCopyWith<BookingKey> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingKeyCopyWith<$Res> {
  factory $BookingKeyCopyWith(
          BookingKey value, $Res Function(BookingKey) then) =
      _$BookingKeyCopyWithImpl<$Res, BookingKey>;
  @useResult
  $Res call(
      {@JsonKey(name: 'BookingId') int? bookingId,
      @JsonKey(name: 'OccurrenceDateTime') DateTime? occurrenceDateTime});
}

/// @nodoc
class _$BookingKeyCopyWithImpl<$Res, $Val extends BookingKey>
    implements $BookingKeyCopyWith<$Res> {
  _$BookingKeyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookingId = freezed,
    Object? occurrenceDateTime = freezed,
  }) {
    return _then(_value.copyWith(
      bookingId: freezed == bookingId
          ? _value.bookingId
          : bookingId // ignore: cast_nullable_to_non_nullable
              as int?,
      occurrenceDateTime: freezed == occurrenceDateTime
          ? _value.occurrenceDateTime
          : occurrenceDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BookingKeyCopyWith<$Res>
    implements $BookingKeyCopyWith<$Res> {
  factory _$$_BookingKeyCopyWith(
          _$_BookingKey value, $Res Function(_$_BookingKey) then) =
      __$$_BookingKeyCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'BookingId') int? bookingId,
      @JsonKey(name: 'OccurrenceDateTime') DateTime? occurrenceDateTime});
}

/// @nodoc
class __$$_BookingKeyCopyWithImpl<$Res>
    extends _$BookingKeyCopyWithImpl<$Res, _$_BookingKey>
    implements _$$_BookingKeyCopyWith<$Res> {
  __$$_BookingKeyCopyWithImpl(
      _$_BookingKey _value, $Res Function(_$_BookingKey) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookingId = freezed,
    Object? occurrenceDateTime = freezed,
  }) {
    return _then(_$_BookingKey(
      bookingId: freezed == bookingId
          ? _value.bookingId
          : bookingId // ignore: cast_nullable_to_non_nullable
              as int?,
      occurrenceDateTime: freezed == occurrenceDateTime
          ? _value.occurrenceDateTime
          : occurrenceDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BookingKey implements _BookingKey {
  const _$_BookingKey(
      {@JsonKey(name: 'BookingId') this.bookingId,
      @JsonKey(name: 'OccurrenceDateTime') this.occurrenceDateTime});

  factory _$_BookingKey.fromJson(Map<String, dynamic> json) =>
      _$$_BookingKeyFromJson(json);

  @override
  @JsonKey(name: 'BookingId')
  final int? bookingId;
  @override
  @JsonKey(name: 'OccurrenceDateTime')
  final DateTime? occurrenceDateTime;

  @override
  String toString() {
    return 'BookingKey(bookingId: $bookingId, occurrenceDateTime: $occurrenceDateTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BookingKey &&
            (identical(other.bookingId, bookingId) ||
                other.bookingId == bookingId) &&
            (identical(other.occurrenceDateTime, occurrenceDateTime) ||
                other.occurrenceDateTime == occurrenceDateTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, bookingId, occurrenceDateTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BookingKeyCopyWith<_$_BookingKey> get copyWith =>
      __$$_BookingKeyCopyWithImpl<_$_BookingKey>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BookingKeyToJson(
      this,
    );
  }
}

abstract class _BookingKey implements BookingKey {
  const factory _BookingKey(
      {@JsonKey(name: 'BookingId')
          final int? bookingId,
      @JsonKey(name: 'OccurrenceDateTime')
          final DateTime? occurrenceDateTime}) = _$_BookingKey;

  factory _BookingKey.fromJson(Map<String, dynamic> json) =
      _$_BookingKey.fromJson;

  @override
  @JsonKey(name: 'BookingId')
  int? get bookingId;
  @override
  @JsonKey(name: 'OccurrenceDateTime')
  DateTime? get occurrenceDateTime;
  @override
  @JsonKey(ignore: true)
  _$$_BookingKeyCopyWith<_$_BookingKey> get copyWith =>
      throw _privateConstructorUsedError;
}
