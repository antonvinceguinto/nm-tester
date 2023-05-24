// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sheet_weekly_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ListWeeklySummaryModel _$ListWeeklySummaryModelFromJson(
    Map<String, dynamic> json) {
  return _ListWeeklySummaryModel.fromJson(json);
}

/// @nodoc
mixin _$ListWeeklySummaryModel {
  List<WeeklyTimesheetDatum> get data => throw _privateConstructorUsedError;
  bool? get timesheet_islocked => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ListWeeklySummaryModelCopyWith<ListWeeklySummaryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListWeeklySummaryModelCopyWith<$Res> {
  factory $ListWeeklySummaryModelCopyWith(ListWeeklySummaryModel value,
          $Res Function(ListWeeklySummaryModel) then) =
      _$ListWeeklySummaryModelCopyWithImpl<$Res, ListWeeklySummaryModel>;
  @useResult
  $Res call({List<WeeklyTimesheetDatum> data, bool? timesheet_islocked});
}

/// @nodoc
class _$ListWeeklySummaryModelCopyWithImpl<$Res,
        $Val extends ListWeeklySummaryModel>
    implements $ListWeeklySummaryModelCopyWith<$Res> {
  _$ListWeeklySummaryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? timesheet_islocked = freezed,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<WeeklyTimesheetDatum>,
      timesheet_islocked: freezed == timesheet_islocked
          ? _value.timesheet_islocked
          : timesheet_islocked // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ListWeeklySummaryModelCopyWith<$Res>
    implements $ListWeeklySummaryModelCopyWith<$Res> {
  factory _$$_ListWeeklySummaryModelCopyWith(_$_ListWeeklySummaryModel value,
          $Res Function(_$_ListWeeklySummaryModel) then) =
      __$$_ListWeeklySummaryModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<WeeklyTimesheetDatum> data, bool? timesheet_islocked});
}

/// @nodoc
class __$$_ListWeeklySummaryModelCopyWithImpl<$Res>
    extends _$ListWeeklySummaryModelCopyWithImpl<$Res,
        _$_ListWeeklySummaryModel>
    implements _$$_ListWeeklySummaryModelCopyWith<$Res> {
  __$$_ListWeeklySummaryModelCopyWithImpl(_$_ListWeeklySummaryModel _value,
      $Res Function(_$_ListWeeklySummaryModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? timesheet_islocked = freezed,
  }) {
    return _then(_$_ListWeeklySummaryModel(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<WeeklyTimesheetDatum>,
      timesheet_islocked: freezed == timesheet_islocked
          ? _value.timesheet_islocked
          : timesheet_islocked // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ListWeeklySummaryModel implements _ListWeeklySummaryModel {
  const _$_ListWeeklySummaryModel(
      {final List<WeeklyTimesheetDatum> data = const [],
      this.timesheet_islocked = false})
      : _data = data;

  factory _$_ListWeeklySummaryModel.fromJson(Map<String, dynamic> json) =>
      _$$_ListWeeklySummaryModelFromJson(json);

  final List<WeeklyTimesheetDatum> _data;
  @override
  @JsonKey()
  List<WeeklyTimesheetDatum> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  @JsonKey()
  final bool? timesheet_islocked;

  @override
  String toString() {
    return 'ListWeeklySummaryModel(data: $data, timesheet_islocked: $timesheet_islocked)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ListWeeklySummaryModel &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.timesheet_islocked, timesheet_islocked) ||
                other.timesheet_islocked == timesheet_islocked));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_data), timesheet_islocked);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ListWeeklySummaryModelCopyWith<_$_ListWeeklySummaryModel> get copyWith =>
      __$$_ListWeeklySummaryModelCopyWithImpl<_$_ListWeeklySummaryModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ListWeeklySummaryModelToJson(
      this,
    );
  }
}

abstract class _ListWeeklySummaryModel implements ListWeeklySummaryModel {
  const factory _ListWeeklySummaryModel(
      {final List<WeeklyTimesheetDatum> data,
      final bool? timesheet_islocked}) = _$_ListWeeklySummaryModel;

  factory _ListWeeklySummaryModel.fromJson(Map<String, dynamic> json) =
      _$_ListWeeklySummaryModel.fromJson;

  @override
  List<WeeklyTimesheetDatum> get data;
  @override
  bool? get timesheet_islocked;
  @override
  @JsonKey(ignore: true)
  _$$_ListWeeklySummaryModelCopyWith<_$_ListWeeklySummaryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

WeeklyTimesheetDatum _$WeeklyTimesheetDatumFromJson(Map<String, dynamic> json) {
  return _WeeklyTimesheetDatum.fromJson(json);
}

/// @nodoc
mixin _$WeeklyTimesheetDatum {
  double? get id => throw _privateConstructorUsedError;
  DateTime? get date => throw _privateConstructorUsedError;
  double? get total_time_assigned => throw _privateConstructorUsedError;
  double? get total_buy_price => throw _privateConstructorUsedError;
  double? get state => throw _privateConstructorUsedError;
  List<TimesheetEntry>? get timesheet_entries =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeeklyTimesheetDatumCopyWith<WeeklyTimesheetDatum> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeeklyTimesheetDatumCopyWith<$Res> {
  factory $WeeklyTimesheetDatumCopyWith(WeeklyTimesheetDatum value,
          $Res Function(WeeklyTimesheetDatum) then) =
      _$WeeklyTimesheetDatumCopyWithImpl<$Res, WeeklyTimesheetDatum>;
  @useResult
  $Res call(
      {double? id,
      DateTime? date,
      double? total_time_assigned,
      double? total_buy_price,
      double? state,
      List<TimesheetEntry>? timesheet_entries});
}

/// @nodoc
class _$WeeklyTimesheetDatumCopyWithImpl<$Res,
        $Val extends WeeklyTimesheetDatum>
    implements $WeeklyTimesheetDatumCopyWith<$Res> {
  _$WeeklyTimesheetDatumCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? date = freezed,
    Object? total_time_assigned = freezed,
    Object? total_buy_price = freezed,
    Object? state = freezed,
    Object? timesheet_entries = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as double?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      total_time_assigned: freezed == total_time_assigned
          ? _value.total_time_assigned
          : total_time_assigned // ignore: cast_nullable_to_non_nullable
              as double?,
      total_buy_price: freezed == total_buy_price
          ? _value.total_buy_price
          : total_buy_price // ignore: cast_nullable_to_non_nullable
              as double?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as double?,
      timesheet_entries: freezed == timesheet_entries
          ? _value.timesheet_entries
          : timesheet_entries // ignore: cast_nullable_to_non_nullable
              as List<TimesheetEntry>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WeeklyTimesheetDatumCopyWith<$Res>
    implements $WeeklyTimesheetDatumCopyWith<$Res> {
  factory _$$_WeeklyTimesheetDatumCopyWith(_$_WeeklyTimesheetDatum value,
          $Res Function(_$_WeeklyTimesheetDatum) then) =
      __$$_WeeklyTimesheetDatumCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double? id,
      DateTime? date,
      double? total_time_assigned,
      double? total_buy_price,
      double? state,
      List<TimesheetEntry>? timesheet_entries});
}

/// @nodoc
class __$$_WeeklyTimesheetDatumCopyWithImpl<$Res>
    extends _$WeeklyTimesheetDatumCopyWithImpl<$Res, _$_WeeklyTimesheetDatum>
    implements _$$_WeeklyTimesheetDatumCopyWith<$Res> {
  __$$_WeeklyTimesheetDatumCopyWithImpl(_$_WeeklyTimesheetDatum _value,
      $Res Function(_$_WeeklyTimesheetDatum) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? date = freezed,
    Object? total_time_assigned = freezed,
    Object? total_buy_price = freezed,
    Object? state = freezed,
    Object? timesheet_entries = freezed,
  }) {
    return _then(_$_WeeklyTimesheetDatum(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as double?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      total_time_assigned: freezed == total_time_assigned
          ? _value.total_time_assigned
          : total_time_assigned // ignore: cast_nullable_to_non_nullable
              as double?,
      total_buy_price: freezed == total_buy_price
          ? _value.total_buy_price
          : total_buy_price // ignore: cast_nullable_to_non_nullable
              as double?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as double?,
      timesheet_entries: freezed == timesheet_entries
          ? _value._timesheet_entries
          : timesheet_entries // ignore: cast_nullable_to_non_nullable
              as List<TimesheetEntry>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WeeklyTimesheetDatum implements _WeeklyTimesheetDatum {
  const _$_WeeklyTimesheetDatum(
      {this.id,
      this.date,
      this.total_time_assigned,
      this.total_buy_price,
      this.state,
      final List<TimesheetEntry>? timesheet_entries})
      : _timesheet_entries = timesheet_entries;

  factory _$_WeeklyTimesheetDatum.fromJson(Map<String, dynamic> json) =>
      _$$_WeeklyTimesheetDatumFromJson(json);

  @override
  final double? id;
  @override
  final DateTime? date;
  @override
  final double? total_time_assigned;
  @override
  final double? total_buy_price;
  @override
  final double? state;
  final List<TimesheetEntry>? _timesheet_entries;
  @override
  List<TimesheetEntry>? get timesheet_entries {
    final value = _timesheet_entries;
    if (value == null) return null;
    if (_timesheet_entries is EqualUnmodifiableListView)
      return _timesheet_entries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'WeeklyTimesheetDatum(id: $id, date: $date, total_time_assigned: $total_time_assigned, total_buy_price: $total_buy_price, state: $state, timesheet_entries: $timesheet_entries)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WeeklyTimesheetDatum &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.total_time_assigned, total_time_assigned) ||
                other.total_time_assigned == total_time_assigned) &&
            (identical(other.total_buy_price, total_buy_price) ||
                other.total_buy_price == total_buy_price) &&
            (identical(other.state, state) || other.state == state) &&
            const DeepCollectionEquality()
                .equals(other._timesheet_entries, _timesheet_entries));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      date,
      total_time_assigned,
      total_buy_price,
      state,
      const DeepCollectionEquality().hash(_timesheet_entries));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WeeklyTimesheetDatumCopyWith<_$_WeeklyTimesheetDatum> get copyWith =>
      __$$_WeeklyTimesheetDatumCopyWithImpl<_$_WeeklyTimesheetDatum>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WeeklyTimesheetDatumToJson(
      this,
    );
  }
}

abstract class _WeeklyTimesheetDatum implements WeeklyTimesheetDatum {
  const factory _WeeklyTimesheetDatum(
      {final double? id,
      final DateTime? date,
      final double? total_time_assigned,
      final double? total_buy_price,
      final double? state,
      final List<TimesheetEntry>? timesheet_entries}) = _$_WeeklyTimesheetDatum;

  factory _WeeklyTimesheetDatum.fromJson(Map<String, dynamic> json) =
      _$_WeeklyTimesheetDatum.fromJson;

  @override
  double? get id;
  @override
  DateTime? get date;
  @override
  double? get total_time_assigned;
  @override
  double? get total_buy_price;
  @override
  double? get state;
  @override
  List<TimesheetEntry>? get timesheet_entries;
  @override
  @JsonKey(ignore: true)
  _$$_WeeklyTimesheetDatumCopyWith<_$_WeeklyTimesheetDatum> get copyWith =>
      throw _privateConstructorUsedError;
}

TimesheetEntry _$TimesheetEntryFromJson(Map<String, dynamic> json) {
  return _TimesheetEntry.fromJson(json);
}

/// @nodoc
mixin _$TimesheetEntry {
  String? get task_number => throw _privateConstructorUsedError;
  String? get task_summary => throw _privateConstructorUsedError;
  String? get job_number => throw _privateConstructorUsedError;
  String? get job_name => throw _privateConstructorUsedError;
  String? get job_address => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  double? get time_total => throw _privateConstructorUsedError;
  double? get buy_price => throw _privateConstructorUsedError;
  bool? get is_job_entry => throw _privateConstructorUsedError;
  bool? get is_billable => throw _privateConstructorUsedError;
  bool? get billableitem_ismanually_invoiced =>
      throw _privateConstructorUsedError;
  String? get billableitem_entry_type => throw _privateConstructorUsedError;
  bool? get billableitem_istime => throw _privateConstructorUsedError;
  bool? get billableitem_istime_range => throw _privateConstructorUsedError;
  double? get billableitem_buy_subtotal => throw _privateConstructorUsedError;
  double? get billableitem_sell_subtotal => throw _privateConstructorUsedError;
  double? get billableitem_invoiced_total => throw _privateConstructorUsedError;
  List<dynamic>? get target_billableitem_summaries =>
      throw _privateConstructorUsedError;
  DateTime? get start_time => throw _privateConstructorUsedError;
  DateTime? get end_time => throw _privateConstructorUsedError;
  double? get client_contact_id => throw _privateConstructorUsedError;
  String? get client_contact_name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimesheetEntryCopyWith<TimesheetEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimesheetEntryCopyWith<$Res> {
  factory $TimesheetEntryCopyWith(
          TimesheetEntry value, $Res Function(TimesheetEntry) then) =
      _$TimesheetEntryCopyWithImpl<$Res, TimesheetEntry>;
  @useResult
  $Res call(
      {String? task_number,
      String? task_summary,
      String? job_number,
      String? job_name,
      String? job_address,
      String? title,
      String? description,
      double? time_total,
      double? buy_price,
      bool? is_job_entry,
      bool? is_billable,
      bool? billableitem_ismanually_invoiced,
      String? billableitem_entry_type,
      bool? billableitem_istime,
      bool? billableitem_istime_range,
      double? billableitem_buy_subtotal,
      double? billableitem_sell_subtotal,
      double? billableitem_invoiced_total,
      List<dynamic>? target_billableitem_summaries,
      DateTime? start_time,
      DateTime? end_time,
      double? client_contact_id,
      String? client_contact_name});
}

/// @nodoc
class _$TimesheetEntryCopyWithImpl<$Res, $Val extends TimesheetEntry>
    implements $TimesheetEntryCopyWith<$Res> {
  _$TimesheetEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? task_number = freezed,
    Object? task_summary = freezed,
    Object? job_number = freezed,
    Object? job_name = freezed,
    Object? job_address = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? time_total = freezed,
    Object? buy_price = freezed,
    Object? is_job_entry = freezed,
    Object? is_billable = freezed,
    Object? billableitem_ismanually_invoiced = freezed,
    Object? billableitem_entry_type = freezed,
    Object? billableitem_istime = freezed,
    Object? billableitem_istime_range = freezed,
    Object? billableitem_buy_subtotal = freezed,
    Object? billableitem_sell_subtotal = freezed,
    Object? billableitem_invoiced_total = freezed,
    Object? target_billableitem_summaries = freezed,
    Object? start_time = freezed,
    Object? end_time = freezed,
    Object? client_contact_id = freezed,
    Object? client_contact_name = freezed,
  }) {
    return _then(_value.copyWith(
      task_number: freezed == task_number
          ? _value.task_number
          : task_number // ignore: cast_nullable_to_non_nullable
              as String?,
      task_summary: freezed == task_summary
          ? _value.task_summary
          : task_summary // ignore: cast_nullable_to_non_nullable
              as String?,
      job_number: freezed == job_number
          ? _value.job_number
          : job_number // ignore: cast_nullable_to_non_nullable
              as String?,
      job_name: freezed == job_name
          ? _value.job_name
          : job_name // ignore: cast_nullable_to_non_nullable
              as String?,
      job_address: freezed == job_address
          ? _value.job_address
          : job_address // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      time_total: freezed == time_total
          ? _value.time_total
          : time_total // ignore: cast_nullable_to_non_nullable
              as double?,
      buy_price: freezed == buy_price
          ? _value.buy_price
          : buy_price // ignore: cast_nullable_to_non_nullable
              as double?,
      is_job_entry: freezed == is_job_entry
          ? _value.is_job_entry
          : is_job_entry // ignore: cast_nullable_to_non_nullable
              as bool?,
      is_billable: freezed == is_billable
          ? _value.is_billable
          : is_billable // ignore: cast_nullable_to_non_nullable
              as bool?,
      billableitem_ismanually_invoiced: freezed ==
              billableitem_ismanually_invoiced
          ? _value.billableitem_ismanually_invoiced
          : billableitem_ismanually_invoiced // ignore: cast_nullable_to_non_nullable
              as bool?,
      billableitem_entry_type: freezed == billableitem_entry_type
          ? _value.billableitem_entry_type
          : billableitem_entry_type // ignore: cast_nullable_to_non_nullable
              as String?,
      billableitem_istime: freezed == billableitem_istime
          ? _value.billableitem_istime
          : billableitem_istime // ignore: cast_nullable_to_non_nullable
              as bool?,
      billableitem_istime_range: freezed == billableitem_istime_range
          ? _value.billableitem_istime_range
          : billableitem_istime_range // ignore: cast_nullable_to_non_nullable
              as bool?,
      billableitem_buy_subtotal: freezed == billableitem_buy_subtotal
          ? _value.billableitem_buy_subtotal
          : billableitem_buy_subtotal // ignore: cast_nullable_to_non_nullable
              as double?,
      billableitem_sell_subtotal: freezed == billableitem_sell_subtotal
          ? _value.billableitem_sell_subtotal
          : billableitem_sell_subtotal // ignore: cast_nullable_to_non_nullable
              as double?,
      billableitem_invoiced_total: freezed == billableitem_invoiced_total
          ? _value.billableitem_invoiced_total
          : billableitem_invoiced_total // ignore: cast_nullable_to_non_nullable
              as double?,
      target_billableitem_summaries: freezed == target_billableitem_summaries
          ? _value.target_billableitem_summaries
          : target_billableitem_summaries // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      start_time: freezed == start_time
          ? _value.start_time
          : start_time // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      end_time: freezed == end_time
          ? _value.end_time
          : end_time // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      client_contact_id: freezed == client_contact_id
          ? _value.client_contact_id
          : client_contact_id // ignore: cast_nullable_to_non_nullable
              as double?,
      client_contact_name: freezed == client_contact_name
          ? _value.client_contact_name
          : client_contact_name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TimesheetEntryCopyWith<$Res>
    implements $TimesheetEntryCopyWith<$Res> {
  factory _$$_TimesheetEntryCopyWith(
          _$_TimesheetEntry value, $Res Function(_$_TimesheetEntry) then) =
      __$$_TimesheetEntryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? task_number,
      String? task_summary,
      String? job_number,
      String? job_name,
      String? job_address,
      String? title,
      String? description,
      double? time_total,
      double? buy_price,
      bool? is_job_entry,
      bool? is_billable,
      bool? billableitem_ismanually_invoiced,
      String? billableitem_entry_type,
      bool? billableitem_istime,
      bool? billableitem_istime_range,
      double? billableitem_buy_subtotal,
      double? billableitem_sell_subtotal,
      double? billableitem_invoiced_total,
      List<dynamic>? target_billableitem_summaries,
      DateTime? start_time,
      DateTime? end_time,
      double? client_contact_id,
      String? client_contact_name});
}

/// @nodoc
class __$$_TimesheetEntryCopyWithImpl<$Res>
    extends _$TimesheetEntryCopyWithImpl<$Res, _$_TimesheetEntry>
    implements _$$_TimesheetEntryCopyWith<$Res> {
  __$$_TimesheetEntryCopyWithImpl(
      _$_TimesheetEntry _value, $Res Function(_$_TimesheetEntry) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? task_number = freezed,
    Object? task_summary = freezed,
    Object? job_number = freezed,
    Object? job_name = freezed,
    Object? job_address = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? time_total = freezed,
    Object? buy_price = freezed,
    Object? is_job_entry = freezed,
    Object? is_billable = freezed,
    Object? billableitem_ismanually_invoiced = freezed,
    Object? billableitem_entry_type = freezed,
    Object? billableitem_istime = freezed,
    Object? billableitem_istime_range = freezed,
    Object? billableitem_buy_subtotal = freezed,
    Object? billableitem_sell_subtotal = freezed,
    Object? billableitem_invoiced_total = freezed,
    Object? target_billableitem_summaries = freezed,
    Object? start_time = freezed,
    Object? end_time = freezed,
    Object? client_contact_id = freezed,
    Object? client_contact_name = freezed,
  }) {
    return _then(_$_TimesheetEntry(
      task_number: freezed == task_number
          ? _value.task_number
          : task_number // ignore: cast_nullable_to_non_nullable
              as String?,
      task_summary: freezed == task_summary
          ? _value.task_summary
          : task_summary // ignore: cast_nullable_to_non_nullable
              as String?,
      job_number: freezed == job_number
          ? _value.job_number
          : job_number // ignore: cast_nullable_to_non_nullable
              as String?,
      job_name: freezed == job_name
          ? _value.job_name
          : job_name // ignore: cast_nullable_to_non_nullable
              as String?,
      job_address: freezed == job_address
          ? _value.job_address
          : job_address // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      time_total: freezed == time_total
          ? _value.time_total
          : time_total // ignore: cast_nullable_to_non_nullable
              as double?,
      buy_price: freezed == buy_price
          ? _value.buy_price
          : buy_price // ignore: cast_nullable_to_non_nullable
              as double?,
      is_job_entry: freezed == is_job_entry
          ? _value.is_job_entry
          : is_job_entry // ignore: cast_nullable_to_non_nullable
              as bool?,
      is_billable: freezed == is_billable
          ? _value.is_billable
          : is_billable // ignore: cast_nullable_to_non_nullable
              as bool?,
      billableitem_ismanually_invoiced: freezed ==
              billableitem_ismanually_invoiced
          ? _value.billableitem_ismanually_invoiced
          : billableitem_ismanually_invoiced // ignore: cast_nullable_to_non_nullable
              as bool?,
      billableitem_entry_type: freezed == billableitem_entry_type
          ? _value.billableitem_entry_type
          : billableitem_entry_type // ignore: cast_nullable_to_non_nullable
              as String?,
      billableitem_istime: freezed == billableitem_istime
          ? _value.billableitem_istime
          : billableitem_istime // ignore: cast_nullable_to_non_nullable
              as bool?,
      billableitem_istime_range: freezed == billableitem_istime_range
          ? _value.billableitem_istime_range
          : billableitem_istime_range // ignore: cast_nullable_to_non_nullable
              as bool?,
      billableitem_buy_subtotal: freezed == billableitem_buy_subtotal
          ? _value.billableitem_buy_subtotal
          : billableitem_buy_subtotal // ignore: cast_nullable_to_non_nullable
              as double?,
      billableitem_sell_subtotal: freezed == billableitem_sell_subtotal
          ? _value.billableitem_sell_subtotal
          : billableitem_sell_subtotal // ignore: cast_nullable_to_non_nullable
              as double?,
      billableitem_invoiced_total: freezed == billableitem_invoiced_total
          ? _value.billableitem_invoiced_total
          : billableitem_invoiced_total // ignore: cast_nullable_to_non_nullable
              as double?,
      target_billableitem_summaries: freezed == target_billableitem_summaries
          ? _value._target_billableitem_summaries
          : target_billableitem_summaries // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      start_time: freezed == start_time
          ? _value.start_time
          : start_time // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      end_time: freezed == end_time
          ? _value.end_time
          : end_time // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      client_contact_id: freezed == client_contact_id
          ? _value.client_contact_id
          : client_contact_id // ignore: cast_nullable_to_non_nullable
              as double?,
      client_contact_name: freezed == client_contact_name
          ? _value.client_contact_name
          : client_contact_name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TimesheetEntry implements _TimesheetEntry {
  const _$_TimesheetEntry(
      {this.task_number,
      this.task_summary,
      this.job_number,
      this.job_name,
      this.job_address,
      this.title,
      this.description,
      this.time_total,
      this.buy_price,
      this.is_job_entry,
      this.is_billable,
      this.billableitem_ismanually_invoiced,
      this.billableitem_entry_type,
      this.billableitem_istime,
      this.billableitem_istime_range,
      this.billableitem_buy_subtotal,
      this.billableitem_sell_subtotal,
      this.billableitem_invoiced_total,
      final List<dynamic>? target_billableitem_summaries,
      this.start_time,
      this.end_time,
      this.client_contact_id,
      this.client_contact_name})
      : _target_billableitem_summaries = target_billableitem_summaries;

  factory _$_TimesheetEntry.fromJson(Map<String, dynamic> json) =>
      _$$_TimesheetEntryFromJson(json);

  @override
  final String? task_number;
  @override
  final String? task_summary;
  @override
  final String? job_number;
  @override
  final String? job_name;
  @override
  final String? job_address;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final double? time_total;
  @override
  final double? buy_price;
  @override
  final bool? is_job_entry;
  @override
  final bool? is_billable;
  @override
  final bool? billableitem_ismanually_invoiced;
  @override
  final String? billableitem_entry_type;
  @override
  final bool? billableitem_istime;
  @override
  final bool? billableitem_istime_range;
  @override
  final double? billableitem_buy_subtotal;
  @override
  final double? billableitem_sell_subtotal;
  @override
  final double? billableitem_invoiced_total;
  final List<dynamic>? _target_billableitem_summaries;
  @override
  List<dynamic>? get target_billableitem_summaries {
    final value = _target_billableitem_summaries;
    if (value == null) return null;
    if (_target_billableitem_summaries is EqualUnmodifiableListView)
      return _target_billableitem_summaries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final DateTime? start_time;
  @override
  final DateTime? end_time;
  @override
  final double? client_contact_id;
  @override
  final String? client_contact_name;

  @override
  String toString() {
    return 'TimesheetEntry(task_number: $task_number, task_summary: $task_summary, job_number: $job_number, job_name: $job_name, job_address: $job_address, title: $title, description: $description, time_total: $time_total, buy_price: $buy_price, is_job_entry: $is_job_entry, is_billable: $is_billable, billableitem_ismanually_invoiced: $billableitem_ismanually_invoiced, billableitem_entry_type: $billableitem_entry_type, billableitem_istime: $billableitem_istime, billableitem_istime_range: $billableitem_istime_range, billableitem_buy_subtotal: $billableitem_buy_subtotal, billableitem_sell_subtotal: $billableitem_sell_subtotal, billableitem_invoiced_total: $billableitem_invoiced_total, target_billableitem_summaries: $target_billableitem_summaries, start_time: $start_time, end_time: $end_time, client_contact_id: $client_contact_id, client_contact_name: $client_contact_name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TimesheetEntry &&
            (identical(other.task_number, task_number) ||
                other.task_number == task_number) &&
            (identical(other.task_summary, task_summary) ||
                other.task_summary == task_summary) &&
            (identical(other.job_number, job_number) ||
                other.job_number == job_number) &&
            (identical(other.job_name, job_name) ||
                other.job_name == job_name) &&
            (identical(other.job_address, job_address) ||
                other.job_address == job_address) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.time_total, time_total) ||
                other.time_total == time_total) &&
            (identical(other.buy_price, buy_price) ||
                other.buy_price == buy_price) &&
            (identical(other.is_job_entry, is_job_entry) ||
                other.is_job_entry == is_job_entry) &&
            (identical(other.is_billable, is_billable) ||
                other.is_billable == is_billable) &&
            (identical(other.billableitem_ismanually_invoiced,
                    billableitem_ismanually_invoiced) ||
                other.billableitem_ismanually_invoiced ==
                    billableitem_ismanually_invoiced) &&
            (identical(other.billableitem_entry_type, billableitem_entry_type) ||
                other.billableitem_entry_type == billableitem_entry_type) &&
            (identical(other.billableitem_istime, billableitem_istime) ||
                other.billableitem_istime == billableitem_istime) &&
            (identical(other.billableitem_istime_range, billableitem_istime_range) ||
                other.billableitem_istime_range == billableitem_istime_range) &&
            (identical(other.billableitem_buy_subtotal, billableitem_buy_subtotal) ||
                other.billableitem_buy_subtotal == billableitem_buy_subtotal) &&
            (identical(other.billableitem_sell_subtotal, billableitem_sell_subtotal) ||
                other.billableitem_sell_subtotal ==
                    billableitem_sell_subtotal) &&
            (identical(other.billableitem_invoiced_total, billableitem_invoiced_total) ||
                other.billableitem_invoiced_total ==
                    billableitem_invoiced_total) &&
            const DeepCollectionEquality().equals(
                other._target_billableitem_summaries,
                _target_billableitem_summaries) &&
            (identical(other.start_time, start_time) ||
                other.start_time == start_time) &&
            (identical(other.end_time, end_time) ||
                other.end_time == end_time) &&
            (identical(other.client_contact_id, client_contact_id) ||
                other.client_contact_id == client_contact_id) &&
            (identical(other.client_contact_name, client_contact_name) ||
                other.client_contact_name == client_contact_name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        task_number,
        task_summary,
        job_number,
        job_name,
        job_address,
        title,
        description,
        time_total,
        buy_price,
        is_job_entry,
        is_billable,
        billableitem_ismanually_invoiced,
        billableitem_entry_type,
        billableitem_istime,
        billableitem_istime_range,
        billableitem_buy_subtotal,
        billableitem_sell_subtotal,
        billableitem_invoiced_total,
        const DeepCollectionEquality().hash(_target_billableitem_summaries),
        start_time,
        end_time,
        client_contact_id,
        client_contact_name
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TimesheetEntryCopyWith<_$_TimesheetEntry> get copyWith =>
      __$$_TimesheetEntryCopyWithImpl<_$_TimesheetEntry>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TimesheetEntryToJson(
      this,
    );
  }
}

abstract class _TimesheetEntry implements TimesheetEntry {
  const factory _TimesheetEntry(
      {final String? task_number,
      final String? task_summary,
      final String? job_number,
      final String? job_name,
      final String? job_address,
      final String? title,
      final String? description,
      final double? time_total,
      final double? buy_price,
      final bool? is_job_entry,
      final bool? is_billable,
      final bool? billableitem_ismanually_invoiced,
      final String? billableitem_entry_type,
      final bool? billableitem_istime,
      final bool? billableitem_istime_range,
      final double? billableitem_buy_subtotal,
      final double? billableitem_sell_subtotal,
      final double? billableitem_invoiced_total,
      final List<dynamic>? target_billableitem_summaries,
      final DateTime? start_time,
      final DateTime? end_time,
      final double? client_contact_id,
      final String? client_contact_name}) = _$_TimesheetEntry;

  factory _TimesheetEntry.fromJson(Map<String, dynamic> json) =
      _$_TimesheetEntry.fromJson;

  @override
  String? get task_number;
  @override
  String? get task_summary;
  @override
  String? get job_number;
  @override
  String? get job_name;
  @override
  String? get job_address;
  @override
  String? get title;
  @override
  String? get description;
  @override
  double? get time_total;
  @override
  double? get buy_price;
  @override
  bool? get is_job_entry;
  @override
  bool? get is_billable;
  @override
  bool? get billableitem_ismanually_invoiced;
  @override
  String? get billableitem_entry_type;
  @override
  bool? get billableitem_istime;
  @override
  bool? get billableitem_istime_range;
  @override
  double? get billableitem_buy_subtotal;
  @override
  double? get billableitem_sell_subtotal;
  @override
  double? get billableitem_invoiced_total;
  @override
  List<dynamic>? get target_billableitem_summaries;
  @override
  DateTime? get start_time;
  @override
  DateTime? get end_time;
  @override
  double? get client_contact_id;
  @override
  String? get client_contact_name;
  @override
  @JsonKey(ignore: true)
  _$$_TimesheetEntryCopyWith<_$_TimesheetEntry> get copyWith =>
      throw _privateConstructorUsedError;
}
