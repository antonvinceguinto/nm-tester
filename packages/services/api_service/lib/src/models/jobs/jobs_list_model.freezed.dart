// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'jobs_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

JobsListModel _$JobsListModelFromJson(Map<String, dynamic> json) {
  return _JobsListModel.fromJson(json);
}

/// @nodoc
mixin _$JobsListModel {
  DateTime? get sync_date => throw _privateConstructorUsedError;
  int get total_all => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  List<JobInfoLevelModel> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $JobsListModelCopyWith<JobsListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JobsListModelCopyWith<$Res> {
  factory $JobsListModelCopyWith(
          JobsListModel value, $Res Function(JobsListModel) then) =
      _$JobsListModelCopyWithImpl<$Res, JobsListModel>;
  @useResult
  $Res call(
      {DateTime? sync_date,
      int total_all,
      int total,
      List<JobInfoLevelModel> data});
}

/// @nodoc
class _$JobsListModelCopyWithImpl<$Res, $Val extends JobsListModel>
    implements $JobsListModelCopyWith<$Res> {
  _$JobsListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sync_date = freezed,
    Object? total_all = null,
    Object? total = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      sync_date: freezed == sync_date
          ? _value.sync_date
          : sync_date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      total_all: null == total_all
          ? _value.total_all
          : total_all // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<JobInfoLevelModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_JobsListModelCopyWith<$Res>
    implements $JobsListModelCopyWith<$Res> {
  factory _$$_JobsListModelCopyWith(
          _$_JobsListModel value, $Res Function(_$_JobsListModel) then) =
      __$$_JobsListModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime? sync_date,
      int total_all,
      int total,
      List<JobInfoLevelModel> data});
}

/// @nodoc
class __$$_JobsListModelCopyWithImpl<$Res>
    extends _$JobsListModelCopyWithImpl<$Res, _$_JobsListModel>
    implements _$$_JobsListModelCopyWith<$Res> {
  __$$_JobsListModelCopyWithImpl(
      _$_JobsListModel _value, $Res Function(_$_JobsListModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sync_date = freezed,
    Object? total_all = null,
    Object? total = null,
    Object? data = null,
  }) {
    return _then(_$_JobsListModel(
      sync_date: freezed == sync_date
          ? _value.sync_date
          : sync_date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      total_all: null == total_all
          ? _value.total_all
          : total_all // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<JobInfoLevelModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_JobsListModel implements _JobsListModel {
  const _$_JobsListModel(
      {this.sync_date,
      this.total_all = 0,
      this.total = 0,
      final List<JobInfoLevelModel> data = const []})
      : _data = data;

  factory _$_JobsListModel.fromJson(Map<String, dynamic> json) =>
      _$$_JobsListModelFromJson(json);

  @override
  final DateTime? sync_date;
  @override
  @JsonKey()
  final int total_all;
  @override
  @JsonKey()
  final int total;
  final List<JobInfoLevelModel> _data;
  @override
  @JsonKey()
  List<JobInfoLevelModel> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'JobsListModel(sync_date: $sync_date, total_all: $total_all, total: $total, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_JobsListModel &&
            (identical(other.sync_date, sync_date) ||
                other.sync_date == sync_date) &&
            (identical(other.total_all, total_all) ||
                other.total_all == total_all) &&
            (identical(other.total, total) || other.total == total) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, sync_date, total_all, total,
      const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_JobsListModelCopyWith<_$_JobsListModel> get copyWith =>
      __$$_JobsListModelCopyWithImpl<_$_JobsListModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_JobsListModelToJson(
      this,
    );
  }
}

abstract class _JobsListModel implements JobsListModel {
  const factory _JobsListModel(
      {final DateTime? sync_date,
      final int total_all,
      final int total,
      final List<JobInfoLevelModel> data}) = _$_JobsListModel;

  factory _JobsListModel.fromJson(Map<String, dynamic> json) =
      _$_JobsListModel.fromJson;

  @override
  DateTime? get sync_date;
  @override
  int get total_all;
  @override
  int get total;
  @override
  List<JobInfoLevelModel> get data;
  @override
  @JsonKey(ignore: true)
  _$$_JobsListModelCopyWith<_$_JobsListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

JobInfoLevelModel _$JobInfoLevelModelFromJson(Map<String, dynamic> json) {
  return _JobInfoLevelModel.fromJson(json);
}

/// @nodoc
mixin _$JobInfoLevelModel {
  @JsonKey(name: 'JobContacts')
  List<JobContact> get job_contacts => throw _privateConstructorUsedError;
  int? get job_id => throw _privateConstructorUsedError;
  String? get job_name => throw _privateConstructorUsedError;
  String? get job_number => throw _privateConstructorUsedError;
  String? get job_code => throw _privateConstructorUsedError;
  String? get job_description_text => throw _privateConstructorUsedError;
  String? get job_order_number => throw _privateConstructorUsedError;
  DateTime? get job_due => throw _privateConstructorUsedError;
  DateTime? get job_completed_date => throw _privateConstructorUsedError;
  String? get job_address => throw _privateConstructorUsedError;
  String? get job_address_coords => throw _privateConstructorUsedError;
  String? get job_jobstatus_name => throw _privateConstructorUsedError;
  String? get job_jobstatus_brush_colour_argb =>
      throw _privateConstructorUsedError;
  String? get job_jobtype_name => throw _privateConstructorUsedError;
  String? get job_jobtype_brush_colour_argb =>
      throw _privateConstructorUsedError;
  int? get job_client_contact_id => throw _privateConstructorUsedError;
  String? get job_client_contact_name => throw _privateConstructorUsedError;
  int? get job_site_contact_id => throw _privateConstructorUsedError;
  String? get job_site_contact_name => throw _privateConstructorUsedError;
  String? get job_priority_name => throw _privateConstructorUsedError;
  String? get job_priority_brush_colour_argb =>
      throw _privateConstructorUsedError;
  int? get job_subscription_id => throw _privateConstructorUsedError;
  String? get job_subscription_name => throw _privateConstructorUsedError;
  DateTime? get job_created_date => throw _privateConstructorUsedError;
  bool? get job_has_notes => throw _privateConstructorUsedError;
  bool? get job_has_files => throw _privateConstructorUsedError;
  bool? get job_has_photos => throw _privateConstructorUsedError;
  bool? get job_has_scribbles => throw _privateConstructorUsedError;
  bool? get job_iscomplete => throw _privateConstructorUsedError;
  bool? get job_istemplate => throw _privateConstructorUsedError;
  bool? get job_isinternal => throw _privateConstructorUsedError;
  double? get job_actual_charges_subtotal => throw _privateConstructorUsedError;
  double? get job_costs_subtotal => throw _privateConstructorUsedError;
  double? get job_non_billable_buy_subtotal =>
      throw _privateConstructorUsedError;
  double? get job_invoiced_subtotal => throw _privateConstructorUsedError;
  double? get job_margin => throw _privateConstructorUsedError;
  double? get job_estimated_revenue_subtotal =>
      throw _privateConstructorUsedError;
  double? get job_estimated_cost_subtotal => throw _privateConstructorUsedError;
  double? get job_accepted_quote_subtotal => throw _privateConstructorUsedError;
  bool get jobcont_is_assigned => throw _privateConstructorUsedError;
  String? get jobcont_acceptance_status => throw _privateConstructorUsedError;
  String? get jobcont_acceptance_status_name =>
      throw _privateConstructorUsedError;
  bool? get job_timesheet_must_be_associated_with_task =>
      throw _privateConstructorUsedError;
  String? get job_pricingtype_name => throw _privateConstructorUsedError;
  bool? get job_is_displayed_on_timeline => throw _privateConstructorUsedError;
  DateTime? get job_start => throw _privateConstructorUsedError;
  DateTime? get job_end => throw _privateConstructorUsedError;
  bool? get job_isallday => throw _privateConstructorUsedError;
  double? get job_progress => throw _privateConstructorUsedError;
  double? get job_timeline_progress => throw _privateConstructorUsedError;
  int? get job_jobstatus_id => throw _privateConstructorUsedError;
  int? get job_jobtype_id => throw _privateConstructorUsedError;
  String? get job_client_contact_email => throw _privateConstructorUsedError;
  String? get job_client_contact_phone_mobile =>
      throw _privateConstructorUsedError;
  DateTime? get job_client_contact_updated =>
      throw _privateConstructorUsedError;
  DateTime? get job_client_users_updated => throw _privateConstructorUsedError;
  int? get job_priority_id => throw _privateConstructorUsedError;
  DateTime? get job_first_booking => throw _privateConstructorUsedError;
  DateTime? get job_last_booking => throw _privateConstructorUsedError;
  DateTime? get job_first_timeline_booking =>
      throw _privateConstructorUsedError;
  DateTime? get job_last_timeline_booking => throw _privateConstructorUsedError;
  String? get job_time_zone => throw _privateConstructorUsedError;
  bool? get is_owner => throw _privateConstructorUsedError;
  int? get job_created_by_contact_id => throw _privateConstructorUsedError;
  String? get job_created_by_contact_name_display =>
      throw _privateConstructorUsedError;
  String? get job_created_by_contact_email =>
      throw _privateConstructorUsedError;
  String? get job_created_by_contact_phone_mobile =>
      throw _privateConstructorUsedError;
  int? get job_updated_by_contact_id => throw _privateConstructorUsedError;
  String? get job_updated_by_contact_name_display =>
      throw _privateConstructorUsedError;
  String? get job_updated_by_contact_email =>
      throw _privateConstructorUsedError;
  String? get job_updated_by_contact_phone_mobile =>
      throw _privateConstructorUsedError;
  dynamic get job_sheet_content => throw _privateConstructorUsedError;
  bool? get job_isdeleted => throw _privateConstructorUsedError;
  ActualChargesTotals? get actual_charges_totals =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'ETag')
  String? get e_tag => throw _privateConstructorUsedError;
  int? get job_book_id => throw _privateConstructorUsedError;
  bool? get job_has_book => throw _privateConstructorUsedError;
  String? get book_summary => throw _privateConstructorUsedError;
  DateTime? get book_updated_date => throw _privateConstructorUsedError;
  DateTime? get book_start => throw _privateConstructorUsedError;
  DateTime? get book_end => throw _privateConstructorUsedError;
  bool? get book_isallday => throw _privateConstructorUsedError;
  int? get book_billables => throw _privateConstructorUsedError;
  int? get job_pricingtype_id => throw _privateConstructorUsedError;
  bool? get job_has_unlinked_bookings => throw _privateConstructorUsedError;
  bool? get job_has_linked_bookings => throw _privateConstructorUsedError;
  CostSummary? get cost_summary => throw _privateConstructorUsedError;
  DateTime? get job_updated_date => throw _privateConstructorUsedError;
  bool? get job_due_isset => throw _privateConstructorUsedError;
  bool? get job_client_contact_id_specified =>
      throw _privateConstructorUsedError;
  bool? get job_site_contact_id_specified => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $JobInfoLevelModelCopyWith<JobInfoLevelModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JobInfoLevelModelCopyWith<$Res> {
  factory $JobInfoLevelModelCopyWith(
          JobInfoLevelModel value, $Res Function(JobInfoLevelModel) then) =
      _$JobInfoLevelModelCopyWithImpl<$Res, JobInfoLevelModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'JobContacts') List<JobContact> job_contacts,
      int? job_id,
      String? job_name,
      String? job_number,
      String? job_code,
      String? job_description_text,
      String? job_order_number,
      DateTime? job_due,
      DateTime? job_completed_date,
      String? job_address,
      String? job_address_coords,
      String? job_jobstatus_name,
      String? job_jobstatus_brush_colour_argb,
      String? job_jobtype_name,
      String? job_jobtype_brush_colour_argb,
      int? job_client_contact_id,
      String? job_client_contact_name,
      int? job_site_contact_id,
      String? job_site_contact_name,
      String? job_priority_name,
      String? job_priority_brush_colour_argb,
      int? job_subscription_id,
      String? job_subscription_name,
      DateTime? job_created_date,
      bool? job_has_notes,
      bool? job_has_files,
      bool? job_has_photos,
      bool? job_has_scribbles,
      bool? job_iscomplete,
      bool? job_istemplate,
      bool? job_isinternal,
      double? job_actual_charges_subtotal,
      double? job_costs_subtotal,
      double? job_non_billable_buy_subtotal,
      double? job_invoiced_subtotal,
      double? job_margin,
      double? job_estimated_revenue_subtotal,
      double? job_estimated_cost_subtotal,
      double? job_accepted_quote_subtotal,
      bool jobcont_is_assigned,
      String? jobcont_acceptance_status,
      String? jobcont_acceptance_status_name,
      bool? job_timesheet_must_be_associated_with_task,
      String? job_pricingtype_name,
      bool? job_is_displayed_on_timeline,
      DateTime? job_start,
      DateTime? job_end,
      bool? job_isallday,
      double? job_progress,
      double? job_timeline_progress,
      int? job_jobstatus_id,
      int? job_jobtype_id,
      String? job_client_contact_email,
      String? job_client_contact_phone_mobile,
      DateTime? job_client_contact_updated,
      DateTime? job_client_users_updated,
      int? job_priority_id,
      DateTime? job_first_booking,
      DateTime? job_last_booking,
      DateTime? job_first_timeline_booking,
      DateTime? job_last_timeline_booking,
      String? job_time_zone,
      bool? is_owner,
      int? job_created_by_contact_id,
      String? job_created_by_contact_name_display,
      String? job_created_by_contact_email,
      String? job_created_by_contact_phone_mobile,
      int? job_updated_by_contact_id,
      String? job_updated_by_contact_name_display,
      String? job_updated_by_contact_email,
      String? job_updated_by_contact_phone_mobile,
      dynamic job_sheet_content,
      bool? job_isdeleted,
      ActualChargesTotals? actual_charges_totals,
      @JsonKey(name: 'ETag') String? e_tag,
      int? job_book_id,
      bool? job_has_book,
      String? book_summary,
      DateTime? book_updated_date,
      DateTime? book_start,
      DateTime? book_end,
      bool? book_isallday,
      int? book_billables,
      int? job_pricingtype_id,
      bool? job_has_unlinked_bookings,
      bool? job_has_linked_bookings,
      CostSummary? cost_summary,
      DateTime? job_updated_date,
      bool? job_due_isset,
      bool? job_client_contact_id_specified,
      bool? job_site_contact_id_specified});

  $ActualChargesTotalsCopyWith<$Res>? get actual_charges_totals;
  $CostSummaryCopyWith<$Res>? get cost_summary;
}

/// @nodoc
class _$JobInfoLevelModelCopyWithImpl<$Res, $Val extends JobInfoLevelModel>
    implements $JobInfoLevelModelCopyWith<$Res> {
  _$JobInfoLevelModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? job_contacts = null,
    Object? job_id = freezed,
    Object? job_name = freezed,
    Object? job_number = freezed,
    Object? job_code = freezed,
    Object? job_description_text = freezed,
    Object? job_order_number = freezed,
    Object? job_due = freezed,
    Object? job_completed_date = freezed,
    Object? job_address = freezed,
    Object? job_address_coords = freezed,
    Object? job_jobstatus_name = freezed,
    Object? job_jobstatus_brush_colour_argb = freezed,
    Object? job_jobtype_name = freezed,
    Object? job_jobtype_brush_colour_argb = freezed,
    Object? job_client_contact_id = freezed,
    Object? job_client_contact_name = freezed,
    Object? job_site_contact_id = freezed,
    Object? job_site_contact_name = freezed,
    Object? job_priority_name = freezed,
    Object? job_priority_brush_colour_argb = freezed,
    Object? job_subscription_id = freezed,
    Object? job_subscription_name = freezed,
    Object? job_created_date = freezed,
    Object? job_has_notes = freezed,
    Object? job_has_files = freezed,
    Object? job_has_photos = freezed,
    Object? job_has_scribbles = freezed,
    Object? job_iscomplete = freezed,
    Object? job_istemplate = freezed,
    Object? job_isinternal = freezed,
    Object? job_actual_charges_subtotal = freezed,
    Object? job_costs_subtotal = freezed,
    Object? job_non_billable_buy_subtotal = freezed,
    Object? job_invoiced_subtotal = freezed,
    Object? job_margin = freezed,
    Object? job_estimated_revenue_subtotal = freezed,
    Object? job_estimated_cost_subtotal = freezed,
    Object? job_accepted_quote_subtotal = freezed,
    Object? jobcont_is_assigned = null,
    Object? jobcont_acceptance_status = freezed,
    Object? jobcont_acceptance_status_name = freezed,
    Object? job_timesheet_must_be_associated_with_task = freezed,
    Object? job_pricingtype_name = freezed,
    Object? job_is_displayed_on_timeline = freezed,
    Object? job_start = freezed,
    Object? job_end = freezed,
    Object? job_isallday = freezed,
    Object? job_progress = freezed,
    Object? job_timeline_progress = freezed,
    Object? job_jobstatus_id = freezed,
    Object? job_jobtype_id = freezed,
    Object? job_client_contact_email = freezed,
    Object? job_client_contact_phone_mobile = freezed,
    Object? job_client_contact_updated = freezed,
    Object? job_client_users_updated = freezed,
    Object? job_priority_id = freezed,
    Object? job_first_booking = freezed,
    Object? job_last_booking = freezed,
    Object? job_first_timeline_booking = freezed,
    Object? job_last_timeline_booking = freezed,
    Object? job_time_zone = freezed,
    Object? is_owner = freezed,
    Object? job_created_by_contact_id = freezed,
    Object? job_created_by_contact_name_display = freezed,
    Object? job_created_by_contact_email = freezed,
    Object? job_created_by_contact_phone_mobile = freezed,
    Object? job_updated_by_contact_id = freezed,
    Object? job_updated_by_contact_name_display = freezed,
    Object? job_updated_by_contact_email = freezed,
    Object? job_updated_by_contact_phone_mobile = freezed,
    Object? job_sheet_content = freezed,
    Object? job_isdeleted = freezed,
    Object? actual_charges_totals = freezed,
    Object? e_tag = freezed,
    Object? job_book_id = freezed,
    Object? job_has_book = freezed,
    Object? book_summary = freezed,
    Object? book_updated_date = freezed,
    Object? book_start = freezed,
    Object? book_end = freezed,
    Object? book_isallday = freezed,
    Object? book_billables = freezed,
    Object? job_pricingtype_id = freezed,
    Object? job_has_unlinked_bookings = freezed,
    Object? job_has_linked_bookings = freezed,
    Object? cost_summary = freezed,
    Object? job_updated_date = freezed,
    Object? job_due_isset = freezed,
    Object? job_client_contact_id_specified = freezed,
    Object? job_site_contact_id_specified = freezed,
  }) {
    return _then(_value.copyWith(
      job_contacts: null == job_contacts
          ? _value.job_contacts
          : job_contacts // ignore: cast_nullable_to_non_nullable
              as List<JobContact>,
      job_id: freezed == job_id
          ? _value.job_id
          : job_id // ignore: cast_nullable_to_non_nullable
              as int?,
      job_name: freezed == job_name
          ? _value.job_name
          : job_name // ignore: cast_nullable_to_non_nullable
              as String?,
      job_number: freezed == job_number
          ? _value.job_number
          : job_number // ignore: cast_nullable_to_non_nullable
              as String?,
      job_code: freezed == job_code
          ? _value.job_code
          : job_code // ignore: cast_nullable_to_non_nullable
              as String?,
      job_description_text: freezed == job_description_text
          ? _value.job_description_text
          : job_description_text // ignore: cast_nullable_to_non_nullable
              as String?,
      job_order_number: freezed == job_order_number
          ? _value.job_order_number
          : job_order_number // ignore: cast_nullable_to_non_nullable
              as String?,
      job_due: freezed == job_due
          ? _value.job_due
          : job_due // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      job_completed_date: freezed == job_completed_date
          ? _value.job_completed_date
          : job_completed_date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      job_address: freezed == job_address
          ? _value.job_address
          : job_address // ignore: cast_nullable_to_non_nullable
              as String?,
      job_address_coords: freezed == job_address_coords
          ? _value.job_address_coords
          : job_address_coords // ignore: cast_nullable_to_non_nullable
              as String?,
      job_jobstatus_name: freezed == job_jobstatus_name
          ? _value.job_jobstatus_name
          : job_jobstatus_name // ignore: cast_nullable_to_non_nullable
              as String?,
      job_jobstatus_brush_colour_argb: freezed ==
              job_jobstatus_brush_colour_argb
          ? _value.job_jobstatus_brush_colour_argb
          : job_jobstatus_brush_colour_argb // ignore: cast_nullable_to_non_nullable
              as String?,
      job_jobtype_name: freezed == job_jobtype_name
          ? _value.job_jobtype_name
          : job_jobtype_name // ignore: cast_nullable_to_non_nullable
              as String?,
      job_jobtype_brush_colour_argb: freezed == job_jobtype_brush_colour_argb
          ? _value.job_jobtype_brush_colour_argb
          : job_jobtype_brush_colour_argb // ignore: cast_nullable_to_non_nullable
              as String?,
      job_client_contact_id: freezed == job_client_contact_id
          ? _value.job_client_contact_id
          : job_client_contact_id // ignore: cast_nullable_to_non_nullable
              as int?,
      job_client_contact_name: freezed == job_client_contact_name
          ? _value.job_client_contact_name
          : job_client_contact_name // ignore: cast_nullable_to_non_nullable
              as String?,
      job_site_contact_id: freezed == job_site_contact_id
          ? _value.job_site_contact_id
          : job_site_contact_id // ignore: cast_nullable_to_non_nullable
              as int?,
      job_site_contact_name: freezed == job_site_contact_name
          ? _value.job_site_contact_name
          : job_site_contact_name // ignore: cast_nullable_to_non_nullable
              as String?,
      job_priority_name: freezed == job_priority_name
          ? _value.job_priority_name
          : job_priority_name // ignore: cast_nullable_to_non_nullable
              as String?,
      job_priority_brush_colour_argb: freezed == job_priority_brush_colour_argb
          ? _value.job_priority_brush_colour_argb
          : job_priority_brush_colour_argb // ignore: cast_nullable_to_non_nullable
              as String?,
      job_subscription_id: freezed == job_subscription_id
          ? _value.job_subscription_id
          : job_subscription_id // ignore: cast_nullable_to_non_nullable
              as int?,
      job_subscription_name: freezed == job_subscription_name
          ? _value.job_subscription_name
          : job_subscription_name // ignore: cast_nullable_to_non_nullable
              as String?,
      job_created_date: freezed == job_created_date
          ? _value.job_created_date
          : job_created_date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      job_has_notes: freezed == job_has_notes
          ? _value.job_has_notes
          : job_has_notes // ignore: cast_nullable_to_non_nullable
              as bool?,
      job_has_files: freezed == job_has_files
          ? _value.job_has_files
          : job_has_files // ignore: cast_nullable_to_non_nullable
              as bool?,
      job_has_photos: freezed == job_has_photos
          ? _value.job_has_photos
          : job_has_photos // ignore: cast_nullable_to_non_nullable
              as bool?,
      job_has_scribbles: freezed == job_has_scribbles
          ? _value.job_has_scribbles
          : job_has_scribbles // ignore: cast_nullable_to_non_nullable
              as bool?,
      job_iscomplete: freezed == job_iscomplete
          ? _value.job_iscomplete
          : job_iscomplete // ignore: cast_nullable_to_non_nullable
              as bool?,
      job_istemplate: freezed == job_istemplate
          ? _value.job_istemplate
          : job_istemplate // ignore: cast_nullable_to_non_nullable
              as bool?,
      job_isinternal: freezed == job_isinternal
          ? _value.job_isinternal
          : job_isinternal // ignore: cast_nullable_to_non_nullable
              as bool?,
      job_actual_charges_subtotal: freezed == job_actual_charges_subtotal
          ? _value.job_actual_charges_subtotal
          : job_actual_charges_subtotal // ignore: cast_nullable_to_non_nullable
              as double?,
      job_costs_subtotal: freezed == job_costs_subtotal
          ? _value.job_costs_subtotal
          : job_costs_subtotal // ignore: cast_nullable_to_non_nullable
              as double?,
      job_non_billable_buy_subtotal: freezed == job_non_billable_buy_subtotal
          ? _value.job_non_billable_buy_subtotal
          : job_non_billable_buy_subtotal // ignore: cast_nullable_to_non_nullable
              as double?,
      job_invoiced_subtotal: freezed == job_invoiced_subtotal
          ? _value.job_invoiced_subtotal
          : job_invoiced_subtotal // ignore: cast_nullable_to_non_nullable
              as double?,
      job_margin: freezed == job_margin
          ? _value.job_margin
          : job_margin // ignore: cast_nullable_to_non_nullable
              as double?,
      job_estimated_revenue_subtotal: freezed == job_estimated_revenue_subtotal
          ? _value.job_estimated_revenue_subtotal
          : job_estimated_revenue_subtotal // ignore: cast_nullable_to_non_nullable
              as double?,
      job_estimated_cost_subtotal: freezed == job_estimated_cost_subtotal
          ? _value.job_estimated_cost_subtotal
          : job_estimated_cost_subtotal // ignore: cast_nullable_to_non_nullable
              as double?,
      job_accepted_quote_subtotal: freezed == job_accepted_quote_subtotal
          ? _value.job_accepted_quote_subtotal
          : job_accepted_quote_subtotal // ignore: cast_nullable_to_non_nullable
              as double?,
      jobcont_is_assigned: null == jobcont_is_assigned
          ? _value.jobcont_is_assigned
          : jobcont_is_assigned // ignore: cast_nullable_to_non_nullable
              as bool,
      jobcont_acceptance_status: freezed == jobcont_acceptance_status
          ? _value.jobcont_acceptance_status
          : jobcont_acceptance_status // ignore: cast_nullable_to_non_nullable
              as String?,
      jobcont_acceptance_status_name: freezed == jobcont_acceptance_status_name
          ? _value.jobcont_acceptance_status_name
          : jobcont_acceptance_status_name // ignore: cast_nullable_to_non_nullable
              as String?,
      job_timesheet_must_be_associated_with_task: freezed ==
              job_timesheet_must_be_associated_with_task
          ? _value.job_timesheet_must_be_associated_with_task
          : job_timesheet_must_be_associated_with_task // ignore: cast_nullable_to_non_nullable
              as bool?,
      job_pricingtype_name: freezed == job_pricingtype_name
          ? _value.job_pricingtype_name
          : job_pricingtype_name // ignore: cast_nullable_to_non_nullable
              as String?,
      job_is_displayed_on_timeline: freezed == job_is_displayed_on_timeline
          ? _value.job_is_displayed_on_timeline
          : job_is_displayed_on_timeline // ignore: cast_nullable_to_non_nullable
              as bool?,
      job_start: freezed == job_start
          ? _value.job_start
          : job_start // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      job_end: freezed == job_end
          ? _value.job_end
          : job_end // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      job_isallday: freezed == job_isallday
          ? _value.job_isallday
          : job_isallday // ignore: cast_nullable_to_non_nullable
              as bool?,
      job_progress: freezed == job_progress
          ? _value.job_progress
          : job_progress // ignore: cast_nullable_to_non_nullable
              as double?,
      job_timeline_progress: freezed == job_timeline_progress
          ? _value.job_timeline_progress
          : job_timeline_progress // ignore: cast_nullable_to_non_nullable
              as double?,
      job_jobstatus_id: freezed == job_jobstatus_id
          ? _value.job_jobstatus_id
          : job_jobstatus_id // ignore: cast_nullable_to_non_nullable
              as int?,
      job_jobtype_id: freezed == job_jobtype_id
          ? _value.job_jobtype_id
          : job_jobtype_id // ignore: cast_nullable_to_non_nullable
              as int?,
      job_client_contact_email: freezed == job_client_contact_email
          ? _value.job_client_contact_email
          : job_client_contact_email // ignore: cast_nullable_to_non_nullable
              as String?,
      job_client_contact_phone_mobile: freezed ==
              job_client_contact_phone_mobile
          ? _value.job_client_contact_phone_mobile
          : job_client_contact_phone_mobile // ignore: cast_nullable_to_non_nullable
              as String?,
      job_client_contact_updated: freezed == job_client_contact_updated
          ? _value.job_client_contact_updated
          : job_client_contact_updated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      job_client_users_updated: freezed == job_client_users_updated
          ? _value.job_client_users_updated
          : job_client_users_updated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      job_priority_id: freezed == job_priority_id
          ? _value.job_priority_id
          : job_priority_id // ignore: cast_nullable_to_non_nullable
              as int?,
      job_first_booking: freezed == job_first_booking
          ? _value.job_first_booking
          : job_first_booking // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      job_last_booking: freezed == job_last_booking
          ? _value.job_last_booking
          : job_last_booking // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      job_first_timeline_booking: freezed == job_first_timeline_booking
          ? _value.job_first_timeline_booking
          : job_first_timeline_booking // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      job_last_timeline_booking: freezed == job_last_timeline_booking
          ? _value.job_last_timeline_booking
          : job_last_timeline_booking // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      job_time_zone: freezed == job_time_zone
          ? _value.job_time_zone
          : job_time_zone // ignore: cast_nullable_to_non_nullable
              as String?,
      is_owner: freezed == is_owner
          ? _value.is_owner
          : is_owner // ignore: cast_nullable_to_non_nullable
              as bool?,
      job_created_by_contact_id: freezed == job_created_by_contact_id
          ? _value.job_created_by_contact_id
          : job_created_by_contact_id // ignore: cast_nullable_to_non_nullable
              as int?,
      job_created_by_contact_name_display: freezed ==
              job_created_by_contact_name_display
          ? _value.job_created_by_contact_name_display
          : job_created_by_contact_name_display // ignore: cast_nullable_to_non_nullable
              as String?,
      job_created_by_contact_email: freezed == job_created_by_contact_email
          ? _value.job_created_by_contact_email
          : job_created_by_contact_email // ignore: cast_nullable_to_non_nullable
              as String?,
      job_created_by_contact_phone_mobile: freezed ==
              job_created_by_contact_phone_mobile
          ? _value.job_created_by_contact_phone_mobile
          : job_created_by_contact_phone_mobile // ignore: cast_nullable_to_non_nullable
              as String?,
      job_updated_by_contact_id: freezed == job_updated_by_contact_id
          ? _value.job_updated_by_contact_id
          : job_updated_by_contact_id // ignore: cast_nullable_to_non_nullable
              as int?,
      job_updated_by_contact_name_display: freezed ==
              job_updated_by_contact_name_display
          ? _value.job_updated_by_contact_name_display
          : job_updated_by_contact_name_display // ignore: cast_nullable_to_non_nullable
              as String?,
      job_updated_by_contact_email: freezed == job_updated_by_contact_email
          ? _value.job_updated_by_contact_email
          : job_updated_by_contact_email // ignore: cast_nullable_to_non_nullable
              as String?,
      job_updated_by_contact_phone_mobile: freezed ==
              job_updated_by_contact_phone_mobile
          ? _value.job_updated_by_contact_phone_mobile
          : job_updated_by_contact_phone_mobile // ignore: cast_nullable_to_non_nullable
              as String?,
      job_sheet_content: freezed == job_sheet_content
          ? _value.job_sheet_content
          : job_sheet_content // ignore: cast_nullable_to_non_nullable
              as dynamic,
      job_isdeleted: freezed == job_isdeleted
          ? _value.job_isdeleted
          : job_isdeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      actual_charges_totals: freezed == actual_charges_totals
          ? _value.actual_charges_totals
          : actual_charges_totals // ignore: cast_nullable_to_non_nullable
              as ActualChargesTotals?,
      e_tag: freezed == e_tag
          ? _value.e_tag
          : e_tag // ignore: cast_nullable_to_non_nullable
              as String?,
      job_book_id: freezed == job_book_id
          ? _value.job_book_id
          : job_book_id // ignore: cast_nullable_to_non_nullable
              as int?,
      job_has_book: freezed == job_has_book
          ? _value.job_has_book
          : job_has_book // ignore: cast_nullable_to_non_nullable
              as bool?,
      book_summary: freezed == book_summary
          ? _value.book_summary
          : book_summary // ignore: cast_nullable_to_non_nullable
              as String?,
      book_updated_date: freezed == book_updated_date
          ? _value.book_updated_date
          : book_updated_date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      book_start: freezed == book_start
          ? _value.book_start
          : book_start // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      book_end: freezed == book_end
          ? _value.book_end
          : book_end // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      book_isallday: freezed == book_isallday
          ? _value.book_isallday
          : book_isallday // ignore: cast_nullable_to_non_nullable
              as bool?,
      book_billables: freezed == book_billables
          ? _value.book_billables
          : book_billables // ignore: cast_nullable_to_non_nullable
              as int?,
      job_pricingtype_id: freezed == job_pricingtype_id
          ? _value.job_pricingtype_id
          : job_pricingtype_id // ignore: cast_nullable_to_non_nullable
              as int?,
      job_has_unlinked_bookings: freezed == job_has_unlinked_bookings
          ? _value.job_has_unlinked_bookings
          : job_has_unlinked_bookings // ignore: cast_nullable_to_non_nullable
              as bool?,
      job_has_linked_bookings: freezed == job_has_linked_bookings
          ? _value.job_has_linked_bookings
          : job_has_linked_bookings // ignore: cast_nullable_to_non_nullable
              as bool?,
      cost_summary: freezed == cost_summary
          ? _value.cost_summary
          : cost_summary // ignore: cast_nullable_to_non_nullable
              as CostSummary?,
      job_updated_date: freezed == job_updated_date
          ? _value.job_updated_date
          : job_updated_date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      job_due_isset: freezed == job_due_isset
          ? _value.job_due_isset
          : job_due_isset // ignore: cast_nullable_to_non_nullable
              as bool?,
      job_client_contact_id_specified: freezed ==
              job_client_contact_id_specified
          ? _value.job_client_contact_id_specified
          : job_client_contact_id_specified // ignore: cast_nullable_to_non_nullable
              as bool?,
      job_site_contact_id_specified: freezed == job_site_contact_id_specified
          ? _value.job_site_contact_id_specified
          : job_site_contact_id_specified // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ActualChargesTotalsCopyWith<$Res>? get actual_charges_totals {
    if (_value.actual_charges_totals == null) {
      return null;
    }

    return $ActualChargesTotalsCopyWith<$Res>(_value.actual_charges_totals!,
        (value) {
      return _then(_value.copyWith(actual_charges_totals: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CostSummaryCopyWith<$Res>? get cost_summary {
    if (_value.cost_summary == null) {
      return null;
    }

    return $CostSummaryCopyWith<$Res>(_value.cost_summary!, (value) {
      return _then(_value.copyWith(cost_summary: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_JobInfoLevelModelCopyWith<$Res>
    implements $JobInfoLevelModelCopyWith<$Res> {
  factory _$$_JobInfoLevelModelCopyWith(_$_JobInfoLevelModel value,
          $Res Function(_$_JobInfoLevelModel) then) =
      __$$_JobInfoLevelModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'JobContacts') List<JobContact> job_contacts,
      int? job_id,
      String? job_name,
      String? job_number,
      String? job_code,
      String? job_description_text,
      String? job_order_number,
      DateTime? job_due,
      DateTime? job_completed_date,
      String? job_address,
      String? job_address_coords,
      String? job_jobstatus_name,
      String? job_jobstatus_brush_colour_argb,
      String? job_jobtype_name,
      String? job_jobtype_brush_colour_argb,
      int? job_client_contact_id,
      String? job_client_contact_name,
      int? job_site_contact_id,
      String? job_site_contact_name,
      String? job_priority_name,
      String? job_priority_brush_colour_argb,
      int? job_subscription_id,
      String? job_subscription_name,
      DateTime? job_created_date,
      bool? job_has_notes,
      bool? job_has_files,
      bool? job_has_photos,
      bool? job_has_scribbles,
      bool? job_iscomplete,
      bool? job_istemplate,
      bool? job_isinternal,
      double? job_actual_charges_subtotal,
      double? job_costs_subtotal,
      double? job_non_billable_buy_subtotal,
      double? job_invoiced_subtotal,
      double? job_margin,
      double? job_estimated_revenue_subtotal,
      double? job_estimated_cost_subtotal,
      double? job_accepted_quote_subtotal,
      bool jobcont_is_assigned,
      String? jobcont_acceptance_status,
      String? jobcont_acceptance_status_name,
      bool? job_timesheet_must_be_associated_with_task,
      String? job_pricingtype_name,
      bool? job_is_displayed_on_timeline,
      DateTime? job_start,
      DateTime? job_end,
      bool? job_isallday,
      double? job_progress,
      double? job_timeline_progress,
      int? job_jobstatus_id,
      int? job_jobtype_id,
      String? job_client_contact_email,
      String? job_client_contact_phone_mobile,
      DateTime? job_client_contact_updated,
      DateTime? job_client_users_updated,
      int? job_priority_id,
      DateTime? job_first_booking,
      DateTime? job_last_booking,
      DateTime? job_first_timeline_booking,
      DateTime? job_last_timeline_booking,
      String? job_time_zone,
      bool? is_owner,
      int? job_created_by_contact_id,
      String? job_created_by_contact_name_display,
      String? job_created_by_contact_email,
      String? job_created_by_contact_phone_mobile,
      int? job_updated_by_contact_id,
      String? job_updated_by_contact_name_display,
      String? job_updated_by_contact_email,
      String? job_updated_by_contact_phone_mobile,
      dynamic job_sheet_content,
      bool? job_isdeleted,
      ActualChargesTotals? actual_charges_totals,
      @JsonKey(name: 'ETag') String? e_tag,
      int? job_book_id,
      bool? job_has_book,
      String? book_summary,
      DateTime? book_updated_date,
      DateTime? book_start,
      DateTime? book_end,
      bool? book_isallday,
      int? book_billables,
      int? job_pricingtype_id,
      bool? job_has_unlinked_bookings,
      bool? job_has_linked_bookings,
      CostSummary? cost_summary,
      DateTime? job_updated_date,
      bool? job_due_isset,
      bool? job_client_contact_id_specified,
      bool? job_site_contact_id_specified});

  @override
  $ActualChargesTotalsCopyWith<$Res>? get actual_charges_totals;
  @override
  $CostSummaryCopyWith<$Res>? get cost_summary;
}

/// @nodoc
class __$$_JobInfoLevelModelCopyWithImpl<$Res>
    extends _$JobInfoLevelModelCopyWithImpl<$Res, _$_JobInfoLevelModel>
    implements _$$_JobInfoLevelModelCopyWith<$Res> {
  __$$_JobInfoLevelModelCopyWithImpl(
      _$_JobInfoLevelModel _value, $Res Function(_$_JobInfoLevelModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? job_contacts = null,
    Object? job_id = freezed,
    Object? job_name = freezed,
    Object? job_number = freezed,
    Object? job_code = freezed,
    Object? job_description_text = freezed,
    Object? job_order_number = freezed,
    Object? job_due = freezed,
    Object? job_completed_date = freezed,
    Object? job_address = freezed,
    Object? job_address_coords = freezed,
    Object? job_jobstatus_name = freezed,
    Object? job_jobstatus_brush_colour_argb = freezed,
    Object? job_jobtype_name = freezed,
    Object? job_jobtype_brush_colour_argb = freezed,
    Object? job_client_contact_id = freezed,
    Object? job_client_contact_name = freezed,
    Object? job_site_contact_id = freezed,
    Object? job_site_contact_name = freezed,
    Object? job_priority_name = freezed,
    Object? job_priority_brush_colour_argb = freezed,
    Object? job_subscription_id = freezed,
    Object? job_subscription_name = freezed,
    Object? job_created_date = freezed,
    Object? job_has_notes = freezed,
    Object? job_has_files = freezed,
    Object? job_has_photos = freezed,
    Object? job_has_scribbles = freezed,
    Object? job_iscomplete = freezed,
    Object? job_istemplate = freezed,
    Object? job_isinternal = freezed,
    Object? job_actual_charges_subtotal = freezed,
    Object? job_costs_subtotal = freezed,
    Object? job_non_billable_buy_subtotal = freezed,
    Object? job_invoiced_subtotal = freezed,
    Object? job_margin = freezed,
    Object? job_estimated_revenue_subtotal = freezed,
    Object? job_estimated_cost_subtotal = freezed,
    Object? job_accepted_quote_subtotal = freezed,
    Object? jobcont_is_assigned = null,
    Object? jobcont_acceptance_status = freezed,
    Object? jobcont_acceptance_status_name = freezed,
    Object? job_timesheet_must_be_associated_with_task = freezed,
    Object? job_pricingtype_name = freezed,
    Object? job_is_displayed_on_timeline = freezed,
    Object? job_start = freezed,
    Object? job_end = freezed,
    Object? job_isallday = freezed,
    Object? job_progress = freezed,
    Object? job_timeline_progress = freezed,
    Object? job_jobstatus_id = freezed,
    Object? job_jobtype_id = freezed,
    Object? job_client_contact_email = freezed,
    Object? job_client_contact_phone_mobile = freezed,
    Object? job_client_contact_updated = freezed,
    Object? job_client_users_updated = freezed,
    Object? job_priority_id = freezed,
    Object? job_first_booking = freezed,
    Object? job_last_booking = freezed,
    Object? job_first_timeline_booking = freezed,
    Object? job_last_timeline_booking = freezed,
    Object? job_time_zone = freezed,
    Object? is_owner = freezed,
    Object? job_created_by_contact_id = freezed,
    Object? job_created_by_contact_name_display = freezed,
    Object? job_created_by_contact_email = freezed,
    Object? job_created_by_contact_phone_mobile = freezed,
    Object? job_updated_by_contact_id = freezed,
    Object? job_updated_by_contact_name_display = freezed,
    Object? job_updated_by_contact_email = freezed,
    Object? job_updated_by_contact_phone_mobile = freezed,
    Object? job_sheet_content = freezed,
    Object? job_isdeleted = freezed,
    Object? actual_charges_totals = freezed,
    Object? e_tag = freezed,
    Object? job_book_id = freezed,
    Object? job_has_book = freezed,
    Object? book_summary = freezed,
    Object? book_updated_date = freezed,
    Object? book_start = freezed,
    Object? book_end = freezed,
    Object? book_isallday = freezed,
    Object? book_billables = freezed,
    Object? job_pricingtype_id = freezed,
    Object? job_has_unlinked_bookings = freezed,
    Object? job_has_linked_bookings = freezed,
    Object? cost_summary = freezed,
    Object? job_updated_date = freezed,
    Object? job_due_isset = freezed,
    Object? job_client_contact_id_specified = freezed,
    Object? job_site_contact_id_specified = freezed,
  }) {
    return _then(_$_JobInfoLevelModel(
      job_contacts: null == job_contacts
          ? _value._job_contacts
          : job_contacts // ignore: cast_nullable_to_non_nullable
              as List<JobContact>,
      job_id: freezed == job_id
          ? _value.job_id
          : job_id // ignore: cast_nullable_to_non_nullable
              as int?,
      job_name: freezed == job_name
          ? _value.job_name
          : job_name // ignore: cast_nullable_to_non_nullable
              as String?,
      job_number: freezed == job_number
          ? _value.job_number
          : job_number // ignore: cast_nullable_to_non_nullable
              as String?,
      job_code: freezed == job_code
          ? _value.job_code
          : job_code // ignore: cast_nullable_to_non_nullable
              as String?,
      job_description_text: freezed == job_description_text
          ? _value.job_description_text
          : job_description_text // ignore: cast_nullable_to_non_nullable
              as String?,
      job_order_number: freezed == job_order_number
          ? _value.job_order_number
          : job_order_number // ignore: cast_nullable_to_non_nullable
              as String?,
      job_due: freezed == job_due
          ? _value.job_due
          : job_due // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      job_completed_date: freezed == job_completed_date
          ? _value.job_completed_date
          : job_completed_date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      job_address: freezed == job_address
          ? _value.job_address
          : job_address // ignore: cast_nullable_to_non_nullable
              as String?,
      job_address_coords: freezed == job_address_coords
          ? _value.job_address_coords
          : job_address_coords // ignore: cast_nullable_to_non_nullable
              as String?,
      job_jobstatus_name: freezed == job_jobstatus_name
          ? _value.job_jobstatus_name
          : job_jobstatus_name // ignore: cast_nullable_to_non_nullable
              as String?,
      job_jobstatus_brush_colour_argb: freezed ==
              job_jobstatus_brush_colour_argb
          ? _value.job_jobstatus_brush_colour_argb
          : job_jobstatus_brush_colour_argb // ignore: cast_nullable_to_non_nullable
              as String?,
      job_jobtype_name: freezed == job_jobtype_name
          ? _value.job_jobtype_name
          : job_jobtype_name // ignore: cast_nullable_to_non_nullable
              as String?,
      job_jobtype_brush_colour_argb: freezed == job_jobtype_brush_colour_argb
          ? _value.job_jobtype_brush_colour_argb
          : job_jobtype_brush_colour_argb // ignore: cast_nullable_to_non_nullable
              as String?,
      job_client_contact_id: freezed == job_client_contact_id
          ? _value.job_client_contact_id
          : job_client_contact_id // ignore: cast_nullable_to_non_nullable
              as int?,
      job_client_contact_name: freezed == job_client_contact_name
          ? _value.job_client_contact_name
          : job_client_contact_name // ignore: cast_nullable_to_non_nullable
              as String?,
      job_site_contact_id: freezed == job_site_contact_id
          ? _value.job_site_contact_id
          : job_site_contact_id // ignore: cast_nullable_to_non_nullable
              as int?,
      job_site_contact_name: freezed == job_site_contact_name
          ? _value.job_site_contact_name
          : job_site_contact_name // ignore: cast_nullable_to_non_nullable
              as String?,
      job_priority_name: freezed == job_priority_name
          ? _value.job_priority_name
          : job_priority_name // ignore: cast_nullable_to_non_nullable
              as String?,
      job_priority_brush_colour_argb: freezed == job_priority_brush_colour_argb
          ? _value.job_priority_brush_colour_argb
          : job_priority_brush_colour_argb // ignore: cast_nullable_to_non_nullable
              as String?,
      job_subscription_id: freezed == job_subscription_id
          ? _value.job_subscription_id
          : job_subscription_id // ignore: cast_nullable_to_non_nullable
              as int?,
      job_subscription_name: freezed == job_subscription_name
          ? _value.job_subscription_name
          : job_subscription_name // ignore: cast_nullable_to_non_nullable
              as String?,
      job_created_date: freezed == job_created_date
          ? _value.job_created_date
          : job_created_date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      job_has_notes: freezed == job_has_notes
          ? _value.job_has_notes
          : job_has_notes // ignore: cast_nullable_to_non_nullable
              as bool?,
      job_has_files: freezed == job_has_files
          ? _value.job_has_files
          : job_has_files // ignore: cast_nullable_to_non_nullable
              as bool?,
      job_has_photos: freezed == job_has_photos
          ? _value.job_has_photos
          : job_has_photos // ignore: cast_nullable_to_non_nullable
              as bool?,
      job_has_scribbles: freezed == job_has_scribbles
          ? _value.job_has_scribbles
          : job_has_scribbles // ignore: cast_nullable_to_non_nullable
              as bool?,
      job_iscomplete: freezed == job_iscomplete
          ? _value.job_iscomplete
          : job_iscomplete // ignore: cast_nullable_to_non_nullable
              as bool?,
      job_istemplate: freezed == job_istemplate
          ? _value.job_istemplate
          : job_istemplate // ignore: cast_nullable_to_non_nullable
              as bool?,
      job_isinternal: freezed == job_isinternal
          ? _value.job_isinternal
          : job_isinternal // ignore: cast_nullable_to_non_nullable
              as bool?,
      job_actual_charges_subtotal: freezed == job_actual_charges_subtotal
          ? _value.job_actual_charges_subtotal
          : job_actual_charges_subtotal // ignore: cast_nullable_to_non_nullable
              as double?,
      job_costs_subtotal: freezed == job_costs_subtotal
          ? _value.job_costs_subtotal
          : job_costs_subtotal // ignore: cast_nullable_to_non_nullable
              as double?,
      job_non_billable_buy_subtotal: freezed == job_non_billable_buy_subtotal
          ? _value.job_non_billable_buy_subtotal
          : job_non_billable_buy_subtotal // ignore: cast_nullable_to_non_nullable
              as double?,
      job_invoiced_subtotal: freezed == job_invoiced_subtotal
          ? _value.job_invoiced_subtotal
          : job_invoiced_subtotal // ignore: cast_nullable_to_non_nullable
              as double?,
      job_margin: freezed == job_margin
          ? _value.job_margin
          : job_margin // ignore: cast_nullable_to_non_nullable
              as double?,
      job_estimated_revenue_subtotal: freezed == job_estimated_revenue_subtotal
          ? _value.job_estimated_revenue_subtotal
          : job_estimated_revenue_subtotal // ignore: cast_nullable_to_non_nullable
              as double?,
      job_estimated_cost_subtotal: freezed == job_estimated_cost_subtotal
          ? _value.job_estimated_cost_subtotal
          : job_estimated_cost_subtotal // ignore: cast_nullable_to_non_nullable
              as double?,
      job_accepted_quote_subtotal: freezed == job_accepted_quote_subtotal
          ? _value.job_accepted_quote_subtotal
          : job_accepted_quote_subtotal // ignore: cast_nullable_to_non_nullable
              as double?,
      jobcont_is_assigned: null == jobcont_is_assigned
          ? _value.jobcont_is_assigned
          : jobcont_is_assigned // ignore: cast_nullable_to_non_nullable
              as bool,
      jobcont_acceptance_status: freezed == jobcont_acceptance_status
          ? _value.jobcont_acceptance_status
          : jobcont_acceptance_status // ignore: cast_nullable_to_non_nullable
              as String?,
      jobcont_acceptance_status_name: freezed == jobcont_acceptance_status_name
          ? _value.jobcont_acceptance_status_name
          : jobcont_acceptance_status_name // ignore: cast_nullable_to_non_nullable
              as String?,
      job_timesheet_must_be_associated_with_task: freezed ==
              job_timesheet_must_be_associated_with_task
          ? _value.job_timesheet_must_be_associated_with_task
          : job_timesheet_must_be_associated_with_task // ignore: cast_nullable_to_non_nullable
              as bool?,
      job_pricingtype_name: freezed == job_pricingtype_name
          ? _value.job_pricingtype_name
          : job_pricingtype_name // ignore: cast_nullable_to_non_nullable
              as String?,
      job_is_displayed_on_timeline: freezed == job_is_displayed_on_timeline
          ? _value.job_is_displayed_on_timeline
          : job_is_displayed_on_timeline // ignore: cast_nullable_to_non_nullable
              as bool?,
      job_start: freezed == job_start
          ? _value.job_start
          : job_start // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      job_end: freezed == job_end
          ? _value.job_end
          : job_end // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      job_isallday: freezed == job_isallday
          ? _value.job_isallday
          : job_isallday // ignore: cast_nullable_to_non_nullable
              as bool?,
      job_progress: freezed == job_progress
          ? _value.job_progress
          : job_progress // ignore: cast_nullable_to_non_nullable
              as double?,
      job_timeline_progress: freezed == job_timeline_progress
          ? _value.job_timeline_progress
          : job_timeline_progress // ignore: cast_nullable_to_non_nullable
              as double?,
      job_jobstatus_id: freezed == job_jobstatus_id
          ? _value.job_jobstatus_id
          : job_jobstatus_id // ignore: cast_nullable_to_non_nullable
              as int?,
      job_jobtype_id: freezed == job_jobtype_id
          ? _value.job_jobtype_id
          : job_jobtype_id // ignore: cast_nullable_to_non_nullable
              as int?,
      job_client_contact_email: freezed == job_client_contact_email
          ? _value.job_client_contact_email
          : job_client_contact_email // ignore: cast_nullable_to_non_nullable
              as String?,
      job_client_contact_phone_mobile: freezed ==
              job_client_contact_phone_mobile
          ? _value.job_client_contact_phone_mobile
          : job_client_contact_phone_mobile // ignore: cast_nullable_to_non_nullable
              as String?,
      job_client_contact_updated: freezed == job_client_contact_updated
          ? _value.job_client_contact_updated
          : job_client_contact_updated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      job_client_users_updated: freezed == job_client_users_updated
          ? _value.job_client_users_updated
          : job_client_users_updated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      job_priority_id: freezed == job_priority_id
          ? _value.job_priority_id
          : job_priority_id // ignore: cast_nullable_to_non_nullable
              as int?,
      job_first_booking: freezed == job_first_booking
          ? _value.job_first_booking
          : job_first_booking // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      job_last_booking: freezed == job_last_booking
          ? _value.job_last_booking
          : job_last_booking // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      job_first_timeline_booking: freezed == job_first_timeline_booking
          ? _value.job_first_timeline_booking
          : job_first_timeline_booking // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      job_last_timeline_booking: freezed == job_last_timeline_booking
          ? _value.job_last_timeline_booking
          : job_last_timeline_booking // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      job_time_zone: freezed == job_time_zone
          ? _value.job_time_zone
          : job_time_zone // ignore: cast_nullable_to_non_nullable
              as String?,
      is_owner: freezed == is_owner
          ? _value.is_owner
          : is_owner // ignore: cast_nullable_to_non_nullable
              as bool?,
      job_created_by_contact_id: freezed == job_created_by_contact_id
          ? _value.job_created_by_contact_id
          : job_created_by_contact_id // ignore: cast_nullable_to_non_nullable
              as int?,
      job_created_by_contact_name_display: freezed ==
              job_created_by_contact_name_display
          ? _value.job_created_by_contact_name_display
          : job_created_by_contact_name_display // ignore: cast_nullable_to_non_nullable
              as String?,
      job_created_by_contact_email: freezed == job_created_by_contact_email
          ? _value.job_created_by_contact_email
          : job_created_by_contact_email // ignore: cast_nullable_to_non_nullable
              as String?,
      job_created_by_contact_phone_mobile: freezed ==
              job_created_by_contact_phone_mobile
          ? _value.job_created_by_contact_phone_mobile
          : job_created_by_contact_phone_mobile // ignore: cast_nullable_to_non_nullable
              as String?,
      job_updated_by_contact_id: freezed == job_updated_by_contact_id
          ? _value.job_updated_by_contact_id
          : job_updated_by_contact_id // ignore: cast_nullable_to_non_nullable
              as int?,
      job_updated_by_contact_name_display: freezed ==
              job_updated_by_contact_name_display
          ? _value.job_updated_by_contact_name_display
          : job_updated_by_contact_name_display // ignore: cast_nullable_to_non_nullable
              as String?,
      job_updated_by_contact_email: freezed == job_updated_by_contact_email
          ? _value.job_updated_by_contact_email
          : job_updated_by_contact_email // ignore: cast_nullable_to_non_nullable
              as String?,
      job_updated_by_contact_phone_mobile: freezed ==
              job_updated_by_contact_phone_mobile
          ? _value.job_updated_by_contact_phone_mobile
          : job_updated_by_contact_phone_mobile // ignore: cast_nullable_to_non_nullable
              as String?,
      job_sheet_content: freezed == job_sheet_content
          ? _value.job_sheet_content
          : job_sheet_content // ignore: cast_nullable_to_non_nullable
              as dynamic,
      job_isdeleted: freezed == job_isdeleted
          ? _value.job_isdeleted
          : job_isdeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      actual_charges_totals: freezed == actual_charges_totals
          ? _value.actual_charges_totals
          : actual_charges_totals // ignore: cast_nullable_to_non_nullable
              as ActualChargesTotals?,
      e_tag: freezed == e_tag
          ? _value.e_tag
          : e_tag // ignore: cast_nullable_to_non_nullable
              as String?,
      job_book_id: freezed == job_book_id
          ? _value.job_book_id
          : job_book_id // ignore: cast_nullable_to_non_nullable
              as int?,
      job_has_book: freezed == job_has_book
          ? _value.job_has_book
          : job_has_book // ignore: cast_nullable_to_non_nullable
              as bool?,
      book_summary: freezed == book_summary
          ? _value.book_summary
          : book_summary // ignore: cast_nullable_to_non_nullable
              as String?,
      book_updated_date: freezed == book_updated_date
          ? _value.book_updated_date
          : book_updated_date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      book_start: freezed == book_start
          ? _value.book_start
          : book_start // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      book_end: freezed == book_end
          ? _value.book_end
          : book_end // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      book_isallday: freezed == book_isallday
          ? _value.book_isallday
          : book_isallday // ignore: cast_nullable_to_non_nullable
              as bool?,
      book_billables: freezed == book_billables
          ? _value.book_billables
          : book_billables // ignore: cast_nullable_to_non_nullable
              as int?,
      job_pricingtype_id: freezed == job_pricingtype_id
          ? _value.job_pricingtype_id
          : job_pricingtype_id // ignore: cast_nullable_to_non_nullable
              as int?,
      job_has_unlinked_bookings: freezed == job_has_unlinked_bookings
          ? _value.job_has_unlinked_bookings
          : job_has_unlinked_bookings // ignore: cast_nullable_to_non_nullable
              as bool?,
      job_has_linked_bookings: freezed == job_has_linked_bookings
          ? _value.job_has_linked_bookings
          : job_has_linked_bookings // ignore: cast_nullable_to_non_nullable
              as bool?,
      cost_summary: freezed == cost_summary
          ? _value.cost_summary
          : cost_summary // ignore: cast_nullable_to_non_nullable
              as CostSummary?,
      job_updated_date: freezed == job_updated_date
          ? _value.job_updated_date
          : job_updated_date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      job_due_isset: freezed == job_due_isset
          ? _value.job_due_isset
          : job_due_isset // ignore: cast_nullable_to_non_nullable
              as bool?,
      job_client_contact_id_specified: freezed ==
              job_client_contact_id_specified
          ? _value.job_client_contact_id_specified
          : job_client_contact_id_specified // ignore: cast_nullable_to_non_nullable
              as bool?,
      job_site_contact_id_specified: freezed == job_site_contact_id_specified
          ? _value.job_site_contact_id_specified
          : job_site_contact_id_specified // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_JobInfoLevelModel implements _JobInfoLevelModel {
  const _$_JobInfoLevelModel(
      {@JsonKey(name: 'JobContacts')
          final List<JobContact> job_contacts = const [],
      this.job_id,
      this.job_name,
      this.job_number,
      this.job_code,
      this.job_description_text,
      this.job_order_number,
      this.job_due,
      this.job_completed_date,
      this.job_address,
      this.job_address_coords,
      this.job_jobstatus_name,
      this.job_jobstatus_brush_colour_argb,
      this.job_jobtype_name,
      this.job_jobtype_brush_colour_argb,
      this.job_client_contact_id,
      this.job_client_contact_name,
      this.job_site_contact_id,
      this.job_site_contact_name,
      this.job_priority_name,
      this.job_priority_brush_colour_argb,
      this.job_subscription_id,
      this.job_subscription_name,
      this.job_created_date,
      this.job_has_notes,
      this.job_has_files,
      this.job_has_photos,
      this.job_has_scribbles,
      this.job_iscomplete,
      this.job_istemplate,
      this.job_isinternal,
      this.job_actual_charges_subtotal,
      this.job_costs_subtotal,
      this.job_non_billable_buy_subtotal,
      this.job_invoiced_subtotal,
      this.job_margin,
      this.job_estimated_revenue_subtotal,
      this.job_estimated_cost_subtotal,
      this.job_accepted_quote_subtotal,
      this.jobcont_is_assigned = false,
      this.jobcont_acceptance_status,
      this.jobcont_acceptance_status_name,
      this.job_timesheet_must_be_associated_with_task,
      this.job_pricingtype_name,
      this.job_is_displayed_on_timeline,
      this.job_start,
      this.job_end,
      this.job_isallday,
      this.job_progress,
      this.job_timeline_progress,
      this.job_jobstatus_id,
      this.job_jobtype_id,
      this.job_client_contact_email,
      this.job_client_contact_phone_mobile,
      this.job_client_contact_updated,
      this.job_client_users_updated,
      this.job_priority_id,
      this.job_first_booking,
      this.job_last_booking,
      this.job_first_timeline_booking,
      this.job_last_timeline_booking,
      this.job_time_zone,
      this.is_owner,
      this.job_created_by_contact_id,
      this.job_created_by_contact_name_display,
      this.job_created_by_contact_email,
      this.job_created_by_contact_phone_mobile,
      this.job_updated_by_contact_id,
      this.job_updated_by_contact_name_display,
      this.job_updated_by_contact_email,
      this.job_updated_by_contact_phone_mobile,
      this.job_sheet_content,
      this.job_isdeleted,
      this.actual_charges_totals = const ActualChargesTotals(),
      @JsonKey(name: 'ETag')
          this.e_tag,
      this.job_book_id,
      this.job_has_book,
      this.book_summary,
      this.book_updated_date,
      this.book_start,
      this.book_end,
      this.book_isallday,
      this.book_billables,
      this.job_pricingtype_id,
      this.job_has_unlinked_bookings,
      this.job_has_linked_bookings,
      this.cost_summary,
      this.job_updated_date,
      this.job_due_isset,
      this.job_client_contact_id_specified,
      this.job_site_contact_id_specified})
      : _job_contacts = job_contacts;

  factory _$_JobInfoLevelModel.fromJson(Map<String, dynamic> json) =>
      _$$_JobInfoLevelModelFromJson(json);

  final List<JobContact> _job_contacts;
  @override
  @JsonKey(name: 'JobContacts')
  List<JobContact> get job_contacts {
    if (_job_contacts is EqualUnmodifiableListView) return _job_contacts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_job_contacts);
  }

  @override
  final int? job_id;
  @override
  final String? job_name;
  @override
  final String? job_number;
  @override
  final String? job_code;
  @override
  final String? job_description_text;
  @override
  final String? job_order_number;
  @override
  final DateTime? job_due;
  @override
  final DateTime? job_completed_date;
  @override
  final String? job_address;
  @override
  final String? job_address_coords;
  @override
  final String? job_jobstatus_name;
  @override
  final String? job_jobstatus_brush_colour_argb;
  @override
  final String? job_jobtype_name;
  @override
  final String? job_jobtype_brush_colour_argb;
  @override
  final int? job_client_contact_id;
  @override
  final String? job_client_contact_name;
  @override
  final int? job_site_contact_id;
  @override
  final String? job_site_contact_name;
  @override
  final String? job_priority_name;
  @override
  final String? job_priority_brush_colour_argb;
  @override
  final int? job_subscription_id;
  @override
  final String? job_subscription_name;
  @override
  final DateTime? job_created_date;
  @override
  final bool? job_has_notes;
  @override
  final bool? job_has_files;
  @override
  final bool? job_has_photos;
  @override
  final bool? job_has_scribbles;
  @override
  final bool? job_iscomplete;
  @override
  final bool? job_istemplate;
  @override
  final bool? job_isinternal;
  @override
  final double? job_actual_charges_subtotal;
  @override
  final double? job_costs_subtotal;
  @override
  final double? job_non_billable_buy_subtotal;
  @override
  final double? job_invoiced_subtotal;
  @override
  final double? job_margin;
  @override
  final double? job_estimated_revenue_subtotal;
  @override
  final double? job_estimated_cost_subtotal;
  @override
  final double? job_accepted_quote_subtotal;
  @override
  @JsonKey()
  final bool jobcont_is_assigned;
  @override
  final String? jobcont_acceptance_status;
  @override
  final String? jobcont_acceptance_status_name;
  @override
  final bool? job_timesheet_must_be_associated_with_task;
  @override
  final String? job_pricingtype_name;
  @override
  final bool? job_is_displayed_on_timeline;
  @override
  final DateTime? job_start;
  @override
  final DateTime? job_end;
  @override
  final bool? job_isallday;
  @override
  final double? job_progress;
  @override
  final double? job_timeline_progress;
  @override
  final int? job_jobstatus_id;
  @override
  final int? job_jobtype_id;
  @override
  final String? job_client_contact_email;
  @override
  final String? job_client_contact_phone_mobile;
  @override
  final DateTime? job_client_contact_updated;
  @override
  final DateTime? job_client_users_updated;
  @override
  final int? job_priority_id;
  @override
  final DateTime? job_first_booking;
  @override
  final DateTime? job_last_booking;
  @override
  final DateTime? job_first_timeline_booking;
  @override
  final DateTime? job_last_timeline_booking;
  @override
  final String? job_time_zone;
  @override
  final bool? is_owner;
  @override
  final int? job_created_by_contact_id;
  @override
  final String? job_created_by_contact_name_display;
  @override
  final String? job_created_by_contact_email;
  @override
  final String? job_created_by_contact_phone_mobile;
  @override
  final int? job_updated_by_contact_id;
  @override
  final String? job_updated_by_contact_name_display;
  @override
  final String? job_updated_by_contact_email;
  @override
  final String? job_updated_by_contact_phone_mobile;
  @override
  final dynamic job_sheet_content;
  @override
  final bool? job_isdeleted;
  @override
  @JsonKey()
  final ActualChargesTotals? actual_charges_totals;
  @override
  @JsonKey(name: 'ETag')
  final String? e_tag;
  @override
  final int? job_book_id;
  @override
  final bool? job_has_book;
  @override
  final String? book_summary;
  @override
  final DateTime? book_updated_date;
  @override
  final DateTime? book_start;
  @override
  final DateTime? book_end;
  @override
  final bool? book_isallday;
  @override
  final int? book_billables;
  @override
  final int? job_pricingtype_id;
  @override
  final bool? job_has_unlinked_bookings;
  @override
  final bool? job_has_linked_bookings;
  @override
  final CostSummary? cost_summary;
  @override
  final DateTime? job_updated_date;
  @override
  final bool? job_due_isset;
  @override
  final bool? job_client_contact_id_specified;
  @override
  final bool? job_site_contact_id_specified;

  @override
  String toString() {
    return 'JobInfoLevelModel(job_contacts: $job_contacts, job_id: $job_id, job_name: $job_name, job_number: $job_number, job_code: $job_code, job_description_text: $job_description_text, job_order_number: $job_order_number, job_due: $job_due, job_completed_date: $job_completed_date, job_address: $job_address, job_address_coords: $job_address_coords, job_jobstatus_name: $job_jobstatus_name, job_jobstatus_brush_colour_argb: $job_jobstatus_brush_colour_argb, job_jobtype_name: $job_jobtype_name, job_jobtype_brush_colour_argb: $job_jobtype_brush_colour_argb, job_client_contact_id: $job_client_contact_id, job_client_contact_name: $job_client_contact_name, job_site_contact_id: $job_site_contact_id, job_site_contact_name: $job_site_contact_name, job_priority_name: $job_priority_name, job_priority_brush_colour_argb: $job_priority_brush_colour_argb, job_subscription_id: $job_subscription_id, job_subscription_name: $job_subscription_name, job_created_date: $job_created_date, job_has_notes: $job_has_notes, job_has_files: $job_has_files, job_has_photos: $job_has_photos, job_has_scribbles: $job_has_scribbles, job_iscomplete: $job_iscomplete, job_istemplate: $job_istemplate, job_isinternal: $job_isinternal, job_actual_charges_subtotal: $job_actual_charges_subtotal, job_costs_subtotal: $job_costs_subtotal, job_non_billable_buy_subtotal: $job_non_billable_buy_subtotal, job_invoiced_subtotal: $job_invoiced_subtotal, job_margin: $job_margin, job_estimated_revenue_subtotal: $job_estimated_revenue_subtotal, job_estimated_cost_subtotal: $job_estimated_cost_subtotal, job_accepted_quote_subtotal: $job_accepted_quote_subtotal, jobcont_is_assigned: $jobcont_is_assigned, jobcont_acceptance_status: $jobcont_acceptance_status, jobcont_acceptance_status_name: $jobcont_acceptance_status_name, job_timesheet_must_be_associated_with_task: $job_timesheet_must_be_associated_with_task, job_pricingtype_name: $job_pricingtype_name, job_is_displayed_on_timeline: $job_is_displayed_on_timeline, job_start: $job_start, job_end: $job_end, job_isallday: $job_isallday, job_progress: $job_progress, job_timeline_progress: $job_timeline_progress, job_jobstatus_id: $job_jobstatus_id, job_jobtype_id: $job_jobtype_id, job_client_contact_email: $job_client_contact_email, job_client_contact_phone_mobile: $job_client_contact_phone_mobile, job_client_contact_updated: $job_client_contact_updated, job_client_users_updated: $job_client_users_updated, job_priority_id: $job_priority_id, job_first_booking: $job_first_booking, job_last_booking: $job_last_booking, job_first_timeline_booking: $job_first_timeline_booking, job_last_timeline_booking: $job_last_timeline_booking, job_time_zone: $job_time_zone, is_owner: $is_owner, job_created_by_contact_id: $job_created_by_contact_id, job_created_by_contact_name_display: $job_created_by_contact_name_display, job_created_by_contact_email: $job_created_by_contact_email, job_created_by_contact_phone_mobile: $job_created_by_contact_phone_mobile, job_updated_by_contact_id: $job_updated_by_contact_id, job_updated_by_contact_name_display: $job_updated_by_contact_name_display, job_updated_by_contact_email: $job_updated_by_contact_email, job_updated_by_contact_phone_mobile: $job_updated_by_contact_phone_mobile, job_sheet_content: $job_sheet_content, job_isdeleted: $job_isdeleted, actual_charges_totals: $actual_charges_totals, e_tag: $e_tag, job_book_id: $job_book_id, job_has_book: $job_has_book, book_summary: $book_summary, book_updated_date: $book_updated_date, book_start: $book_start, book_end: $book_end, book_isallday: $book_isallday, book_billables: $book_billables, job_pricingtype_id: $job_pricingtype_id, job_has_unlinked_bookings: $job_has_unlinked_bookings, job_has_linked_bookings: $job_has_linked_bookings, cost_summary: $cost_summary, job_updated_date: $job_updated_date, job_due_isset: $job_due_isset, job_client_contact_id_specified: $job_client_contact_id_specified, job_site_contact_id_specified: $job_site_contact_id_specified)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_JobInfoLevelModel &&
            const DeepCollectionEquality()
                .equals(other._job_contacts, _job_contacts) &&
            (identical(other.job_id, job_id) || other.job_id == job_id) &&
            (identical(other.job_name, job_name) ||
                other.job_name == job_name) &&
            (identical(other.job_number, job_number) ||
                other.job_number == job_number) &&
            (identical(other.job_code, job_code) ||
                other.job_code == job_code) &&
            (identical(other.job_description_text, job_description_text) ||
                other.job_description_text == job_description_text) &&
            (identical(other.job_order_number, job_order_number) ||
                other.job_order_number == job_order_number) &&
            (identical(other.job_due, job_due) || other.job_due == job_due) &&
            (identical(other.job_completed_date, job_completed_date) ||
                other.job_completed_date == job_completed_date) &&
            (identical(other.job_address, job_address) ||
                other.job_address == job_address) &&
            (identical(other.job_address_coords, job_address_coords) ||
                other.job_address_coords == job_address_coords) &&
            (identical(other.job_jobstatus_name, job_jobstatus_name) ||
                other.job_jobstatus_name == job_jobstatus_name) &&
            (identical(other.job_jobstatus_brush_colour_argb, job_jobstatus_brush_colour_argb) ||
                other.job_jobstatus_brush_colour_argb ==
                    job_jobstatus_brush_colour_argb) &&
            (identical(other.job_jobtype_name, job_jobtype_name) ||
                other.job_jobtype_name == job_jobtype_name) &&
            (identical(other.job_jobtype_brush_colour_argb, job_jobtype_brush_colour_argb) ||
                other.job_jobtype_brush_colour_argb ==
                    job_jobtype_brush_colour_argb) &&
            (identical(other.job_client_contact_id, job_client_contact_id) ||
                other.job_client_contact_id == job_client_contact_id) &&
            (identical(other.job_client_contact_name, job_client_contact_name) ||
                other.job_client_contact_name == job_client_contact_name) &&
            (identical(other.job_site_contact_id, job_site_contact_id) ||
                other.job_site_contact_id == job_site_contact_id) &&
            (identical(other.job_site_contact_name, job_site_contact_name) ||
                other.job_site_contact_name == job_site_contact_name) &&
            (identical(other.job_priority_name, job_priority_name) ||
                other.job_priority_name == job_priority_name) &&
            (identical(other.job_priority_brush_colour_argb, job_priority_brush_colour_argb) ||
                other.job_priority_brush_colour_argb ==
                    job_priority_brush_colour_argb) &&
            (identical(other.job_subscription_id, job_subscription_id) ||
                other.job_subscription_id == job_subscription_id) &&
            (identical(other.job_subscription_name, job_subscription_name) ||
                other.job_subscription_name == job_subscription_name) &&
            (identical(other.job_created_date, job_created_date) ||
                other.job_created_date == job_created_date) &&
            (identical(other.job_has_notes, job_has_notes) ||
                other.job_has_notes == job_has_notes) &&
            (identical(other.job_has_files, job_has_files) ||
                other.job_has_files == job_has_files) &&
            (identical(other.job_has_photos, job_has_photos) ||
                other.job_has_photos == job_has_photos) &&
            (identical(other.job_has_scribbles, job_has_scribbles) ||
                other.job_has_scribbles == job_has_scribbles) &&
            (identical(other.job_iscomplete, job_iscomplete) ||
                other.job_iscomplete == job_iscomplete) &&
            (identical(other.job_istemplate, job_istemplate) || other.job_istemplate == job_istemplate) &&
            (identical(other.job_isinternal, job_isinternal) || other.job_isinternal == job_isinternal) &&
            (identical(other.job_actual_charges_subtotal, job_actual_charges_subtotal) || other.job_actual_charges_subtotal == job_actual_charges_subtotal) &&
            (identical(other.job_costs_subtotal, job_costs_subtotal) || other.job_costs_subtotal == job_costs_subtotal) &&
            (identical(other.job_non_billable_buy_subtotal, job_non_billable_buy_subtotal) || other.job_non_billable_buy_subtotal == job_non_billable_buy_subtotal) &&
            (identical(other.job_invoiced_subtotal, job_invoiced_subtotal) || other.job_invoiced_subtotal == job_invoiced_subtotal) &&
            (identical(other.job_margin, job_margin) || other.job_margin == job_margin) &&
            (identical(other.job_estimated_revenue_subtotal, job_estimated_revenue_subtotal) || other.job_estimated_revenue_subtotal == job_estimated_revenue_subtotal) &&
            (identical(other.job_estimated_cost_subtotal, job_estimated_cost_subtotal) || other.job_estimated_cost_subtotal == job_estimated_cost_subtotal) &&
            (identical(other.job_accepted_quote_subtotal, job_accepted_quote_subtotal) || other.job_accepted_quote_subtotal == job_accepted_quote_subtotal) &&
            (identical(other.jobcont_is_assigned, jobcont_is_assigned) || other.jobcont_is_assigned == jobcont_is_assigned) &&
            (identical(other.jobcont_acceptance_status, jobcont_acceptance_status) || other.jobcont_acceptance_status == jobcont_acceptance_status) &&
            (identical(other.jobcont_acceptance_status_name, jobcont_acceptance_status_name) || other.jobcont_acceptance_status_name == jobcont_acceptance_status_name) &&
            (identical(other.job_timesheet_must_be_associated_with_task, job_timesheet_must_be_associated_with_task) || other.job_timesheet_must_be_associated_with_task == job_timesheet_must_be_associated_with_task) &&
            (identical(other.job_pricingtype_name, job_pricingtype_name) || other.job_pricingtype_name == job_pricingtype_name) &&
            (identical(other.job_is_displayed_on_timeline, job_is_displayed_on_timeline) || other.job_is_displayed_on_timeline == job_is_displayed_on_timeline) &&
            (identical(other.job_start, job_start) || other.job_start == job_start) &&
            (identical(other.job_end, job_end) || other.job_end == job_end) &&
            (identical(other.job_isallday, job_isallday) || other.job_isallday == job_isallday) &&
            (identical(other.job_progress, job_progress) || other.job_progress == job_progress) &&
            (identical(other.job_timeline_progress, job_timeline_progress) || other.job_timeline_progress == job_timeline_progress) &&
            (identical(other.job_jobstatus_id, job_jobstatus_id) || other.job_jobstatus_id == job_jobstatus_id) &&
            (identical(other.job_jobtype_id, job_jobtype_id) || other.job_jobtype_id == job_jobtype_id) &&
            (identical(other.job_client_contact_email, job_client_contact_email) || other.job_client_contact_email == job_client_contact_email) &&
            (identical(other.job_client_contact_phone_mobile, job_client_contact_phone_mobile) || other.job_client_contact_phone_mobile == job_client_contact_phone_mobile) &&
            (identical(other.job_client_contact_updated, job_client_contact_updated) || other.job_client_contact_updated == job_client_contact_updated) &&
            (identical(other.job_client_users_updated, job_client_users_updated) || other.job_client_users_updated == job_client_users_updated) &&
            (identical(other.job_priority_id, job_priority_id) || other.job_priority_id == job_priority_id) &&
            (identical(other.job_first_booking, job_first_booking) || other.job_first_booking == job_first_booking) &&
            (identical(other.job_last_booking, job_last_booking) || other.job_last_booking == job_last_booking) &&
            (identical(other.job_first_timeline_booking, job_first_timeline_booking) || other.job_first_timeline_booking == job_first_timeline_booking) &&
            (identical(other.job_last_timeline_booking, job_last_timeline_booking) || other.job_last_timeline_booking == job_last_timeline_booking) &&
            (identical(other.job_time_zone, job_time_zone) || other.job_time_zone == job_time_zone) &&
            (identical(other.is_owner, is_owner) || other.is_owner == is_owner) &&
            (identical(other.job_created_by_contact_id, job_created_by_contact_id) || other.job_created_by_contact_id == job_created_by_contact_id) &&
            (identical(other.job_created_by_contact_name_display, job_created_by_contact_name_display) || other.job_created_by_contact_name_display == job_created_by_contact_name_display) &&
            (identical(other.job_created_by_contact_email, job_created_by_contact_email) || other.job_created_by_contact_email == job_created_by_contact_email) &&
            (identical(other.job_created_by_contact_phone_mobile, job_created_by_contact_phone_mobile) || other.job_created_by_contact_phone_mobile == job_created_by_contact_phone_mobile) &&
            (identical(other.job_updated_by_contact_id, job_updated_by_contact_id) || other.job_updated_by_contact_id == job_updated_by_contact_id) &&
            (identical(other.job_updated_by_contact_name_display, job_updated_by_contact_name_display) || other.job_updated_by_contact_name_display == job_updated_by_contact_name_display) &&
            (identical(other.job_updated_by_contact_email, job_updated_by_contact_email) || other.job_updated_by_contact_email == job_updated_by_contact_email) &&
            (identical(other.job_updated_by_contact_phone_mobile, job_updated_by_contact_phone_mobile) || other.job_updated_by_contact_phone_mobile == job_updated_by_contact_phone_mobile) &&
            const DeepCollectionEquality().equals(other.job_sheet_content, job_sheet_content) &&
            (identical(other.job_isdeleted, job_isdeleted) || other.job_isdeleted == job_isdeleted) &&
            (identical(other.actual_charges_totals, actual_charges_totals) || other.actual_charges_totals == actual_charges_totals) &&
            (identical(other.e_tag, e_tag) || other.e_tag == e_tag) &&
            (identical(other.job_book_id, job_book_id) || other.job_book_id == job_book_id) &&
            (identical(other.job_has_book, job_has_book) || other.job_has_book == job_has_book) &&
            (identical(other.book_summary, book_summary) || other.book_summary == book_summary) &&
            (identical(other.book_updated_date, book_updated_date) || other.book_updated_date == book_updated_date) &&
            (identical(other.book_start, book_start) || other.book_start == book_start) &&
            (identical(other.book_end, book_end) || other.book_end == book_end) &&
            (identical(other.book_isallday, book_isallday) || other.book_isallday == book_isallday) &&
            (identical(other.book_billables, book_billables) || other.book_billables == book_billables) &&
            (identical(other.job_pricingtype_id, job_pricingtype_id) || other.job_pricingtype_id == job_pricingtype_id) &&
            (identical(other.job_has_unlinked_bookings, job_has_unlinked_bookings) || other.job_has_unlinked_bookings == job_has_unlinked_bookings) &&
            (identical(other.job_has_linked_bookings, job_has_linked_bookings) || other.job_has_linked_bookings == job_has_linked_bookings) &&
            (identical(other.cost_summary, cost_summary) || other.cost_summary == cost_summary) &&
            (identical(other.job_updated_date, job_updated_date) || other.job_updated_date == job_updated_date) &&
            (identical(other.job_due_isset, job_due_isset) || other.job_due_isset == job_due_isset) &&
            (identical(other.job_client_contact_id_specified, job_client_contact_id_specified) || other.job_client_contact_id_specified == job_client_contact_id_specified) &&
            (identical(other.job_site_contact_id_specified, job_site_contact_id_specified) || other.job_site_contact_id_specified == job_site_contact_id_specified));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(_job_contacts),
        job_id,
        job_name,
        job_number,
        job_code,
        job_description_text,
        job_order_number,
        job_due,
        job_completed_date,
        job_address,
        job_address_coords,
        job_jobstatus_name,
        job_jobstatus_brush_colour_argb,
        job_jobtype_name,
        job_jobtype_brush_colour_argb,
        job_client_contact_id,
        job_client_contact_name,
        job_site_contact_id,
        job_site_contact_name,
        job_priority_name,
        job_priority_brush_colour_argb,
        job_subscription_id,
        job_subscription_name,
        job_created_date,
        job_has_notes,
        job_has_files,
        job_has_photos,
        job_has_scribbles,
        job_iscomplete,
        job_istemplate,
        job_isinternal,
        job_actual_charges_subtotal,
        job_costs_subtotal,
        job_non_billable_buy_subtotal,
        job_invoiced_subtotal,
        job_margin,
        job_estimated_revenue_subtotal,
        job_estimated_cost_subtotal,
        job_accepted_quote_subtotal,
        jobcont_is_assigned,
        jobcont_acceptance_status,
        jobcont_acceptance_status_name,
        job_timesheet_must_be_associated_with_task,
        job_pricingtype_name,
        job_is_displayed_on_timeline,
        job_start,
        job_end,
        job_isallday,
        job_progress,
        job_timeline_progress,
        job_jobstatus_id,
        job_jobtype_id,
        job_client_contact_email,
        job_client_contact_phone_mobile,
        job_client_contact_updated,
        job_client_users_updated,
        job_priority_id,
        job_first_booking,
        job_last_booking,
        job_first_timeline_booking,
        job_last_timeline_booking,
        job_time_zone,
        is_owner,
        job_created_by_contact_id,
        job_created_by_contact_name_display,
        job_created_by_contact_email,
        job_created_by_contact_phone_mobile,
        job_updated_by_contact_id,
        job_updated_by_contact_name_display,
        job_updated_by_contact_email,
        job_updated_by_contact_phone_mobile,
        const DeepCollectionEquality().hash(job_sheet_content),
        job_isdeleted,
        actual_charges_totals,
        e_tag,
        job_book_id,
        job_has_book,
        book_summary,
        book_updated_date,
        book_start,
        book_end,
        book_isallday,
        book_billables,
        job_pricingtype_id,
        job_has_unlinked_bookings,
        job_has_linked_bookings,
        cost_summary,
        job_updated_date,
        job_due_isset,
        job_client_contact_id_specified,
        job_site_contact_id_specified
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_JobInfoLevelModelCopyWith<_$_JobInfoLevelModel> get copyWith =>
      __$$_JobInfoLevelModelCopyWithImpl<_$_JobInfoLevelModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_JobInfoLevelModelToJson(
      this,
    );
  }
}

abstract class _JobInfoLevelModel implements JobInfoLevelModel {
  const factory _JobInfoLevelModel(
      {@JsonKey(name: 'JobContacts') final List<JobContact> job_contacts,
      final int? job_id,
      final String? job_name,
      final String? job_number,
      final String? job_code,
      final String? job_description_text,
      final String? job_order_number,
      final DateTime? job_due,
      final DateTime? job_completed_date,
      final String? job_address,
      final String? job_address_coords,
      final String? job_jobstatus_name,
      final String? job_jobstatus_brush_colour_argb,
      final String? job_jobtype_name,
      final String? job_jobtype_brush_colour_argb,
      final int? job_client_contact_id,
      final String? job_client_contact_name,
      final int? job_site_contact_id,
      final String? job_site_contact_name,
      final String? job_priority_name,
      final String? job_priority_brush_colour_argb,
      final int? job_subscription_id,
      final String? job_subscription_name,
      final DateTime? job_created_date,
      final bool? job_has_notes,
      final bool? job_has_files,
      final bool? job_has_photos,
      final bool? job_has_scribbles,
      final bool? job_iscomplete,
      final bool? job_istemplate,
      final bool? job_isinternal,
      final double? job_actual_charges_subtotal,
      final double? job_costs_subtotal,
      final double? job_non_billable_buy_subtotal,
      final double? job_invoiced_subtotal,
      final double? job_margin,
      final double? job_estimated_revenue_subtotal,
      final double? job_estimated_cost_subtotal,
      final double? job_accepted_quote_subtotal,
      final bool jobcont_is_assigned,
      final String? jobcont_acceptance_status,
      final String? jobcont_acceptance_status_name,
      final bool? job_timesheet_must_be_associated_with_task,
      final String? job_pricingtype_name,
      final bool? job_is_displayed_on_timeline,
      final DateTime? job_start,
      final DateTime? job_end,
      final bool? job_isallday,
      final double? job_progress,
      final double? job_timeline_progress,
      final int? job_jobstatus_id,
      final int? job_jobtype_id,
      final String? job_client_contact_email,
      final String? job_client_contact_phone_mobile,
      final DateTime? job_client_contact_updated,
      final DateTime? job_client_users_updated,
      final int? job_priority_id,
      final DateTime? job_first_booking,
      final DateTime? job_last_booking,
      final DateTime? job_first_timeline_booking,
      final DateTime? job_last_timeline_booking,
      final String? job_time_zone,
      final bool? is_owner,
      final int? job_created_by_contact_id,
      final String? job_created_by_contact_name_display,
      final String? job_created_by_contact_email,
      final String? job_created_by_contact_phone_mobile,
      final int? job_updated_by_contact_id,
      final String? job_updated_by_contact_name_display,
      final String? job_updated_by_contact_email,
      final String? job_updated_by_contact_phone_mobile,
      final dynamic job_sheet_content,
      final bool? job_isdeleted,
      final ActualChargesTotals? actual_charges_totals,
      @JsonKey(name: 'ETag') final String? e_tag,
      final int? job_book_id,
      final bool? job_has_book,
      final String? book_summary,
      final DateTime? book_updated_date,
      final DateTime? book_start,
      final DateTime? book_end,
      final bool? book_isallday,
      final int? book_billables,
      final int? job_pricingtype_id,
      final bool? job_has_unlinked_bookings,
      final bool? job_has_linked_bookings,
      final CostSummary? cost_summary,
      final DateTime? job_updated_date,
      final bool? job_due_isset,
      final bool? job_client_contact_id_specified,
      final bool? job_site_contact_id_specified}) = _$_JobInfoLevelModel;

  factory _JobInfoLevelModel.fromJson(Map<String, dynamic> json) =
      _$_JobInfoLevelModel.fromJson;

  @override
  @JsonKey(name: 'JobContacts')
  List<JobContact> get job_contacts;
  @override
  int? get job_id;
  @override
  String? get job_name;
  @override
  String? get job_number;
  @override
  String? get job_code;
  @override
  String? get job_description_text;
  @override
  String? get job_order_number;
  @override
  DateTime? get job_due;
  @override
  DateTime? get job_completed_date;
  @override
  String? get job_address;
  @override
  String? get job_address_coords;
  @override
  String? get job_jobstatus_name;
  @override
  String? get job_jobstatus_brush_colour_argb;
  @override
  String? get job_jobtype_name;
  @override
  String? get job_jobtype_brush_colour_argb;
  @override
  int? get job_client_contact_id;
  @override
  String? get job_client_contact_name;
  @override
  int? get job_site_contact_id;
  @override
  String? get job_site_contact_name;
  @override
  String? get job_priority_name;
  @override
  String? get job_priority_brush_colour_argb;
  @override
  int? get job_subscription_id;
  @override
  String? get job_subscription_name;
  @override
  DateTime? get job_created_date;
  @override
  bool? get job_has_notes;
  @override
  bool? get job_has_files;
  @override
  bool? get job_has_photos;
  @override
  bool? get job_has_scribbles;
  @override
  bool? get job_iscomplete;
  @override
  bool? get job_istemplate;
  @override
  bool? get job_isinternal;
  @override
  double? get job_actual_charges_subtotal;
  @override
  double? get job_costs_subtotal;
  @override
  double? get job_non_billable_buy_subtotal;
  @override
  double? get job_invoiced_subtotal;
  @override
  double? get job_margin;
  @override
  double? get job_estimated_revenue_subtotal;
  @override
  double? get job_estimated_cost_subtotal;
  @override
  double? get job_accepted_quote_subtotal;
  @override
  bool get jobcont_is_assigned;
  @override
  String? get jobcont_acceptance_status;
  @override
  String? get jobcont_acceptance_status_name;
  @override
  bool? get job_timesheet_must_be_associated_with_task;
  @override
  String? get job_pricingtype_name;
  @override
  bool? get job_is_displayed_on_timeline;
  @override
  DateTime? get job_start;
  @override
  DateTime? get job_end;
  @override
  bool? get job_isallday;
  @override
  double? get job_progress;
  @override
  double? get job_timeline_progress;
  @override
  int? get job_jobstatus_id;
  @override
  int? get job_jobtype_id;
  @override
  String? get job_client_contact_email;
  @override
  String? get job_client_contact_phone_mobile;
  @override
  DateTime? get job_client_contact_updated;
  @override
  DateTime? get job_client_users_updated;
  @override
  int? get job_priority_id;
  @override
  DateTime? get job_first_booking;
  @override
  DateTime? get job_last_booking;
  @override
  DateTime? get job_first_timeline_booking;
  @override
  DateTime? get job_last_timeline_booking;
  @override
  String? get job_time_zone;
  @override
  bool? get is_owner;
  @override
  int? get job_created_by_contact_id;
  @override
  String? get job_created_by_contact_name_display;
  @override
  String? get job_created_by_contact_email;
  @override
  String? get job_created_by_contact_phone_mobile;
  @override
  int? get job_updated_by_contact_id;
  @override
  String? get job_updated_by_contact_name_display;
  @override
  String? get job_updated_by_contact_email;
  @override
  String? get job_updated_by_contact_phone_mobile;
  @override
  dynamic get job_sheet_content;
  @override
  bool? get job_isdeleted;
  @override
  ActualChargesTotals? get actual_charges_totals;
  @override
  @JsonKey(name: 'ETag')
  String? get e_tag;
  @override
  int? get job_book_id;
  @override
  bool? get job_has_book;
  @override
  String? get book_summary;
  @override
  DateTime? get book_updated_date;
  @override
  DateTime? get book_start;
  @override
  DateTime? get book_end;
  @override
  bool? get book_isallday;
  @override
  int? get book_billables;
  @override
  int? get job_pricingtype_id;
  @override
  bool? get job_has_unlinked_bookings;
  @override
  bool? get job_has_linked_bookings;
  @override
  CostSummary? get cost_summary;
  @override
  DateTime? get job_updated_date;
  @override
  bool? get job_due_isset;
  @override
  bool? get job_client_contact_id_specified;
  @override
  bool? get job_site_contact_id_specified;
  @override
  @JsonKey(ignore: true)
  _$$_JobInfoLevelModelCopyWith<_$_JobInfoLevelModel> get copyWith =>
      throw _privateConstructorUsedError;
}

JobContact _$JobContactFromJson(Map<String, dynamic> json) {
  return _JobContact.fromJson(json);
}

/// @nodoc
mixin _$JobContact {
  String? get jobcont_contact_initials => throw _privateConstructorUsedError;
  String? get jobcont_contact_brush_colour_argb =>
      throw _privateConstructorUsedError;
  String? get jobcont_contact_name_display =>
      throw _privateConstructorUsedError;
  String? get jobcont_acceptance_status => throw _privateConstructorUsedError;
  int? get jobcont_id => throw _privateConstructorUsedError;
  int? get jobcont_job_id => throw _privateConstructorUsedError;
  int? get jobcont_contact_id => throw _privateConstructorUsedError;
  String? get jobcont_contact_email => throw _privateConstructorUsedError;
  String? get jobcont_contact_phone_mobile =>
      throw _privateConstructorUsedError;
  String? get jobcont_acceptance_status_name =>
      throw _privateConstructorUsedError;
  String? get jobcont_acceptance_comment => throw _privateConstructorUsedError;
  bool? get is_current_subscriber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $JobContactCopyWith<JobContact> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JobContactCopyWith<$Res> {
  factory $JobContactCopyWith(
          JobContact value, $Res Function(JobContact) then) =
      _$JobContactCopyWithImpl<$Res, JobContact>;
  @useResult
  $Res call(
      {String? jobcont_contact_initials,
      String? jobcont_contact_brush_colour_argb,
      String? jobcont_contact_name_display,
      String? jobcont_acceptance_status,
      int? jobcont_id,
      int? jobcont_job_id,
      int? jobcont_contact_id,
      String? jobcont_contact_email,
      String? jobcont_contact_phone_mobile,
      String? jobcont_acceptance_status_name,
      String? jobcont_acceptance_comment,
      bool? is_current_subscriber});
}

/// @nodoc
class _$JobContactCopyWithImpl<$Res, $Val extends JobContact>
    implements $JobContactCopyWith<$Res> {
  _$JobContactCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jobcont_contact_initials = freezed,
    Object? jobcont_contact_brush_colour_argb = freezed,
    Object? jobcont_contact_name_display = freezed,
    Object? jobcont_acceptance_status = freezed,
    Object? jobcont_id = freezed,
    Object? jobcont_job_id = freezed,
    Object? jobcont_contact_id = freezed,
    Object? jobcont_contact_email = freezed,
    Object? jobcont_contact_phone_mobile = freezed,
    Object? jobcont_acceptance_status_name = freezed,
    Object? jobcont_acceptance_comment = freezed,
    Object? is_current_subscriber = freezed,
  }) {
    return _then(_value.copyWith(
      jobcont_contact_initials: freezed == jobcont_contact_initials
          ? _value.jobcont_contact_initials
          : jobcont_contact_initials // ignore: cast_nullable_to_non_nullable
              as String?,
      jobcont_contact_brush_colour_argb: freezed ==
              jobcont_contact_brush_colour_argb
          ? _value.jobcont_contact_brush_colour_argb
          : jobcont_contact_brush_colour_argb // ignore: cast_nullable_to_non_nullable
              as String?,
      jobcont_contact_name_display: freezed == jobcont_contact_name_display
          ? _value.jobcont_contact_name_display
          : jobcont_contact_name_display // ignore: cast_nullable_to_non_nullable
              as String?,
      jobcont_acceptance_status: freezed == jobcont_acceptance_status
          ? _value.jobcont_acceptance_status
          : jobcont_acceptance_status // ignore: cast_nullable_to_non_nullable
              as String?,
      jobcont_id: freezed == jobcont_id
          ? _value.jobcont_id
          : jobcont_id // ignore: cast_nullable_to_non_nullable
              as int?,
      jobcont_job_id: freezed == jobcont_job_id
          ? _value.jobcont_job_id
          : jobcont_job_id // ignore: cast_nullable_to_non_nullable
              as int?,
      jobcont_contact_id: freezed == jobcont_contact_id
          ? _value.jobcont_contact_id
          : jobcont_contact_id // ignore: cast_nullable_to_non_nullable
              as int?,
      jobcont_contact_email: freezed == jobcont_contact_email
          ? _value.jobcont_contact_email
          : jobcont_contact_email // ignore: cast_nullable_to_non_nullable
              as String?,
      jobcont_contact_phone_mobile: freezed == jobcont_contact_phone_mobile
          ? _value.jobcont_contact_phone_mobile
          : jobcont_contact_phone_mobile // ignore: cast_nullable_to_non_nullable
              as String?,
      jobcont_acceptance_status_name: freezed == jobcont_acceptance_status_name
          ? _value.jobcont_acceptance_status_name
          : jobcont_acceptance_status_name // ignore: cast_nullable_to_non_nullable
              as String?,
      jobcont_acceptance_comment: freezed == jobcont_acceptance_comment
          ? _value.jobcont_acceptance_comment
          : jobcont_acceptance_comment // ignore: cast_nullable_to_non_nullable
              as String?,
      is_current_subscriber: freezed == is_current_subscriber
          ? _value.is_current_subscriber
          : is_current_subscriber // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_JobContactCopyWith<$Res>
    implements $JobContactCopyWith<$Res> {
  factory _$$_JobContactCopyWith(
          _$_JobContact value, $Res Function(_$_JobContact) then) =
      __$$_JobContactCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? jobcont_contact_initials,
      String? jobcont_contact_brush_colour_argb,
      String? jobcont_contact_name_display,
      String? jobcont_acceptance_status,
      int? jobcont_id,
      int? jobcont_job_id,
      int? jobcont_contact_id,
      String? jobcont_contact_email,
      String? jobcont_contact_phone_mobile,
      String? jobcont_acceptance_status_name,
      String? jobcont_acceptance_comment,
      bool? is_current_subscriber});
}

/// @nodoc
class __$$_JobContactCopyWithImpl<$Res>
    extends _$JobContactCopyWithImpl<$Res, _$_JobContact>
    implements _$$_JobContactCopyWith<$Res> {
  __$$_JobContactCopyWithImpl(
      _$_JobContact _value, $Res Function(_$_JobContact) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jobcont_contact_initials = freezed,
    Object? jobcont_contact_brush_colour_argb = freezed,
    Object? jobcont_contact_name_display = freezed,
    Object? jobcont_acceptance_status = freezed,
    Object? jobcont_id = freezed,
    Object? jobcont_job_id = freezed,
    Object? jobcont_contact_id = freezed,
    Object? jobcont_contact_email = freezed,
    Object? jobcont_contact_phone_mobile = freezed,
    Object? jobcont_acceptance_status_name = freezed,
    Object? jobcont_acceptance_comment = freezed,
    Object? is_current_subscriber = freezed,
  }) {
    return _then(_$_JobContact(
      jobcont_contact_initials: freezed == jobcont_contact_initials
          ? _value.jobcont_contact_initials
          : jobcont_contact_initials // ignore: cast_nullable_to_non_nullable
              as String?,
      jobcont_contact_brush_colour_argb: freezed ==
              jobcont_contact_brush_colour_argb
          ? _value.jobcont_contact_brush_colour_argb
          : jobcont_contact_brush_colour_argb // ignore: cast_nullable_to_non_nullable
              as String?,
      jobcont_contact_name_display: freezed == jobcont_contact_name_display
          ? _value.jobcont_contact_name_display
          : jobcont_contact_name_display // ignore: cast_nullable_to_non_nullable
              as String?,
      jobcont_acceptance_status: freezed == jobcont_acceptance_status
          ? _value.jobcont_acceptance_status
          : jobcont_acceptance_status // ignore: cast_nullable_to_non_nullable
              as String?,
      jobcont_id: freezed == jobcont_id
          ? _value.jobcont_id
          : jobcont_id // ignore: cast_nullable_to_non_nullable
              as int?,
      jobcont_job_id: freezed == jobcont_job_id
          ? _value.jobcont_job_id
          : jobcont_job_id // ignore: cast_nullable_to_non_nullable
              as int?,
      jobcont_contact_id: freezed == jobcont_contact_id
          ? _value.jobcont_contact_id
          : jobcont_contact_id // ignore: cast_nullable_to_non_nullable
              as int?,
      jobcont_contact_email: freezed == jobcont_contact_email
          ? _value.jobcont_contact_email
          : jobcont_contact_email // ignore: cast_nullable_to_non_nullable
              as String?,
      jobcont_contact_phone_mobile: freezed == jobcont_contact_phone_mobile
          ? _value.jobcont_contact_phone_mobile
          : jobcont_contact_phone_mobile // ignore: cast_nullable_to_non_nullable
              as String?,
      jobcont_acceptance_status_name: freezed == jobcont_acceptance_status_name
          ? _value.jobcont_acceptance_status_name
          : jobcont_acceptance_status_name // ignore: cast_nullable_to_non_nullable
              as String?,
      jobcont_acceptance_comment: freezed == jobcont_acceptance_comment
          ? _value.jobcont_acceptance_comment
          : jobcont_acceptance_comment // ignore: cast_nullable_to_non_nullable
              as String?,
      is_current_subscriber: freezed == is_current_subscriber
          ? _value.is_current_subscriber
          : is_current_subscriber // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_JobContact implements _JobContact {
  const _$_JobContact(
      {this.jobcont_contact_initials,
      this.jobcont_contact_brush_colour_argb,
      this.jobcont_contact_name_display,
      this.jobcont_acceptance_status,
      this.jobcont_id,
      this.jobcont_job_id,
      this.jobcont_contact_id,
      this.jobcont_contact_email,
      this.jobcont_contact_phone_mobile,
      this.jobcont_acceptance_status_name,
      this.jobcont_acceptance_comment,
      this.is_current_subscriber});

  factory _$_JobContact.fromJson(Map<String, dynamic> json) =>
      _$$_JobContactFromJson(json);

  @override
  final String? jobcont_contact_initials;
  @override
  final String? jobcont_contact_brush_colour_argb;
  @override
  final String? jobcont_contact_name_display;
  @override
  final String? jobcont_acceptance_status;
  @override
  final int? jobcont_id;
  @override
  final int? jobcont_job_id;
  @override
  final int? jobcont_contact_id;
  @override
  final String? jobcont_contact_email;
  @override
  final String? jobcont_contact_phone_mobile;
  @override
  final String? jobcont_acceptance_status_name;
  @override
  final String? jobcont_acceptance_comment;
  @override
  final bool? is_current_subscriber;

  @override
  String toString() {
    return 'JobContact(jobcont_contact_initials: $jobcont_contact_initials, jobcont_contact_brush_colour_argb: $jobcont_contact_brush_colour_argb, jobcont_contact_name_display: $jobcont_contact_name_display, jobcont_acceptance_status: $jobcont_acceptance_status, jobcont_id: $jobcont_id, jobcont_job_id: $jobcont_job_id, jobcont_contact_id: $jobcont_contact_id, jobcont_contact_email: $jobcont_contact_email, jobcont_contact_phone_mobile: $jobcont_contact_phone_mobile, jobcont_acceptance_status_name: $jobcont_acceptance_status_name, jobcont_acceptance_comment: $jobcont_acceptance_comment, is_current_subscriber: $is_current_subscriber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_JobContact &&
            (identical(
                    other.jobcont_contact_initials, jobcont_contact_initials) ||
                other.jobcont_contact_initials == jobcont_contact_initials) &&
            (identical(other.jobcont_contact_brush_colour_argb,
                    jobcont_contact_brush_colour_argb) ||
                other.jobcont_contact_brush_colour_argb ==
                    jobcont_contact_brush_colour_argb) &&
            (identical(other.jobcont_contact_name_display, jobcont_contact_name_display) ||
                other.jobcont_contact_name_display ==
                    jobcont_contact_name_display) &&
            (identical(other.jobcont_acceptance_status, jobcont_acceptance_status) ||
                other.jobcont_acceptance_status == jobcont_acceptance_status) &&
            (identical(other.jobcont_id, jobcont_id) ||
                other.jobcont_id == jobcont_id) &&
            (identical(other.jobcont_job_id, jobcont_job_id) ||
                other.jobcont_job_id == jobcont_job_id) &&
            (identical(other.jobcont_contact_id, jobcont_contact_id) ||
                other.jobcont_contact_id == jobcont_contact_id) &&
            (identical(other.jobcont_contact_email, jobcont_contact_email) ||
                other.jobcont_contact_email == jobcont_contact_email) &&
            (identical(other.jobcont_contact_phone_mobile, jobcont_contact_phone_mobile) ||
                other.jobcont_contact_phone_mobile ==
                    jobcont_contact_phone_mobile) &&
            (identical(other.jobcont_acceptance_status_name, jobcont_acceptance_status_name) ||
                other.jobcont_acceptance_status_name ==
                    jobcont_acceptance_status_name) &&
            (identical(other.jobcont_acceptance_comment, jobcont_acceptance_comment) ||
                other.jobcont_acceptance_comment ==
                    jobcont_acceptance_comment) &&
            (identical(other.is_current_subscriber, is_current_subscriber) ||
                other.is_current_subscriber == is_current_subscriber));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      jobcont_contact_initials,
      jobcont_contact_brush_colour_argb,
      jobcont_contact_name_display,
      jobcont_acceptance_status,
      jobcont_id,
      jobcont_job_id,
      jobcont_contact_id,
      jobcont_contact_email,
      jobcont_contact_phone_mobile,
      jobcont_acceptance_status_name,
      jobcont_acceptance_comment,
      is_current_subscriber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_JobContactCopyWith<_$_JobContact> get copyWith =>
      __$$_JobContactCopyWithImpl<_$_JobContact>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_JobContactToJson(
      this,
    );
  }
}

abstract class _JobContact implements JobContact {
  const factory _JobContact(
      {final String? jobcont_contact_initials,
      final String? jobcont_contact_brush_colour_argb,
      final String? jobcont_contact_name_display,
      final String? jobcont_acceptance_status,
      final int? jobcont_id,
      final int? jobcont_job_id,
      final int? jobcont_contact_id,
      final String? jobcont_contact_email,
      final String? jobcont_contact_phone_mobile,
      final String? jobcont_acceptance_status_name,
      final String? jobcont_acceptance_comment,
      final bool? is_current_subscriber}) = _$_JobContact;

  factory _JobContact.fromJson(Map<String, dynamic> json) =
      _$_JobContact.fromJson;

  @override
  String? get jobcont_contact_initials;
  @override
  String? get jobcont_contact_brush_colour_argb;
  @override
  String? get jobcont_contact_name_display;
  @override
  String? get jobcont_acceptance_status;
  @override
  int? get jobcont_id;
  @override
  int? get jobcont_job_id;
  @override
  int? get jobcont_contact_id;
  @override
  String? get jobcont_contact_email;
  @override
  String? get jobcont_contact_phone_mobile;
  @override
  String? get jobcont_acceptance_status_name;
  @override
  String? get jobcont_acceptance_comment;
  @override
  bool? get is_current_subscriber;
  @override
  @JsonKey(ignore: true)
  _$$_JobContactCopyWith<_$_JobContact> get copyWith =>
      throw _privateConstructorUsedError;
}
