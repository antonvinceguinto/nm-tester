// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quotes_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QuotesModel _$QuotesModelFromJson(Map<String, dynamic> json) {
  return _QuotesModel.fromJson(json);
}

/// @nodoc
mixin _$QuotesModel {
  int? get totalAll => throw _privateConstructorUsedError;
  int? get total => throw _privateConstructorUsedError;
  List<QuoteItemDatum>? get data => throw _privateConstructorUsedError;
  DateTime? get lastModified => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuotesModelCopyWith<QuotesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuotesModelCopyWith<$Res> {
  factory $QuotesModelCopyWith(
          QuotesModel value, $Res Function(QuotesModel) then) =
      _$QuotesModelCopyWithImpl<$Res, QuotesModel>;
  @useResult
  $Res call(
      {int? totalAll,
      int? total,
      List<QuoteItemDatum>? data,
      DateTime? lastModified});
}

/// @nodoc
class _$QuotesModelCopyWithImpl<$Res, $Val extends QuotesModel>
    implements $QuotesModelCopyWith<$Res> {
  _$QuotesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalAll = freezed,
    Object? total = freezed,
    Object? data = freezed,
    Object? lastModified = freezed,
  }) {
    return _then(_value.copyWith(
      totalAll: freezed == totalAll
          ? _value.totalAll
          : totalAll // ignore: cast_nullable_to_non_nullable
              as int?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<QuoteItemDatum>?,
      lastModified: freezed == lastModified
          ? _value.lastModified
          : lastModified // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QuotesModelCopyWith<$Res>
    implements $QuotesModelCopyWith<$Res> {
  factory _$$_QuotesModelCopyWith(
          _$_QuotesModel value, $Res Function(_$_QuotesModel) then) =
      __$$_QuotesModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? totalAll,
      int? total,
      List<QuoteItemDatum>? data,
      DateTime? lastModified});
}

/// @nodoc
class __$$_QuotesModelCopyWithImpl<$Res>
    extends _$QuotesModelCopyWithImpl<$Res, _$_QuotesModel>
    implements _$$_QuotesModelCopyWith<$Res> {
  __$$_QuotesModelCopyWithImpl(
      _$_QuotesModel _value, $Res Function(_$_QuotesModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalAll = freezed,
    Object? total = freezed,
    Object? data = freezed,
    Object? lastModified = freezed,
  }) {
    return _then(_$_QuotesModel(
      totalAll: freezed == totalAll
          ? _value.totalAll
          : totalAll // ignore: cast_nullable_to_non_nullable
              as int?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<QuoteItemDatum>?,
      lastModified: freezed == lastModified
          ? _value.lastModified
          : lastModified // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QuotesModel implements _QuotesModel {
  const _$_QuotesModel(
      {this.totalAll,
      this.total,
      final List<QuoteItemDatum>? data,
      this.lastModified})
      : _data = data;

  factory _$_QuotesModel.fromJson(Map<String, dynamic> json) =>
      _$$_QuotesModelFromJson(json);

  @override
  final int? totalAll;
  @override
  final int? total;
  final List<QuoteItemDatum>? _data;
  @override
  List<QuoteItemDatum>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final DateTime? lastModified;

  @override
  String toString() {
    return 'QuotesModel(totalAll: $totalAll, total: $total, data: $data, lastModified: $lastModified)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QuotesModel &&
            (identical(other.totalAll, totalAll) ||
                other.totalAll == totalAll) &&
            (identical(other.total, total) || other.total == total) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.lastModified, lastModified) ||
                other.lastModified == lastModified));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, totalAll, total,
      const DeepCollectionEquality().hash(_data), lastModified);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuotesModelCopyWith<_$_QuotesModel> get copyWith =>
      __$$_QuotesModelCopyWithImpl<_$_QuotesModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuotesModelToJson(
      this,
    );
  }
}

abstract class _QuotesModel implements QuotesModel {
  const factory _QuotesModel(
      {final int? totalAll,
      final int? total,
      final List<QuoteItemDatum>? data,
      final DateTime? lastModified}) = _$_QuotesModel;

  factory _QuotesModel.fromJson(Map<String, dynamic> json) =
      _$_QuotesModel.fromJson;

  @override
  int? get totalAll;
  @override
  int? get total;
  @override
  List<QuoteItemDatum>? get data;
  @override
  DateTime? get lastModified;
  @override
  @JsonKey(ignore: true)
  _$$_QuotesModelCopyWith<_$_QuotesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

QuoteItemDatum _$QuoteItemDatumFromJson(Map<String, dynamic> json) {
  return _QuoteItemDatum.fromJson(json);
}

/// @nodoc
mixin _$QuoteItemDatum {
  int? get billable_id => throw _privateConstructorUsedError;
  String? get billable_type => throw _privateConstructorUsedError;
  int? get billable_subscription_id => throw _privateConstructorUsedError;
  String? get billable_subscription_public_name =>
      throw _privateConstructorUsedError;
  int? get billable_book_id => throw _privateConstructorUsedError;
  String? get billable_book_number => throw _privateConstructorUsedError;
  String? get billable_book_summary => throw _privateConstructorUsedError;
  int? get billable_book_job_id => throw _privateConstructorUsedError;
  int? get billable_job_id => throw _privateConstructorUsedError;
  String? get billable_job_number => throw _privateConstructorUsedError;
  String? get billable_job_name => throw _privateConstructorUsedError;
  bool? get billable_islocked => throw _privateConstructorUsedError;
  DateTime? get billable_created => throw _privateConstructorUsedError;
  DateTime? get billable_updated => throw _privateConstructorUsedError;
  String? get billable_name => throw _privateConstructorUsedError;
  String? get billable_number => throw _privateConstructorUsedError;
  String? get billable_reference => throw _privateConstructorUsedError;
  double? get billable_total => throw _privateConstructorUsedError;
  double? get billable_invoiced_total => throw _privateConstructorUsedError;
  double? get billable_not_billable_total => throw _privateConstructorUsedError;
  double? get billable_invoiced_amount_remaining_total =>
      throw _privateConstructorUsedError;
  bool? get billable_issent => throw _privateConstructorUsedError;
  DateTime? get billable_date_last_sent => throw _privateConstructorUsedError;
  int? get billable_client_contact_id => throw _privateConstructorUsedError;
  String? get billable_client_contact_name =>
      throw _privateConstructorUsedError;
  String? get billable_hardware_provider => throw _privateConstructorUsedError;
  dynamic get billable_supplier_billable_number =>
      throw _privateConstructorUsedError;
  int? get billable_order_status => throw _privateConstructorUsedError;
  dynamic get billable_order_submitted => throw _privateConstructorUsedError;
  bool? get billable_is_modified_after_submit =>
      throw _privateConstructorUsedError;
  bool? get billable_isimported => throw _privateConstructorUsedError;
  bool? get billable_isaccepted => throw _privateConstructorUsedError;
  double? get billable_total_payments => throw _privateConstructorUsedError;
  double? get billable_total_creditnotes => throw _privateConstructorUsedError;
  int? get billable_createdby_contact_id => throw _privateConstructorUsedError;
  String? get billable_createdby_contact_name =>
      throw _privateConstructorUsedError;
  dynamic get billable_synced_invoice_number =>
      throw _privateConstructorUsedError;
  String? get billable_accounting_provider_name =>
      throw _privateConstructorUsedError;
  String? get billable_synced_accounting_provider =>
      throw _privateConstructorUsedError;
  String? get billable_accounting_provider_name_display =>
      throw _privateConstructorUsedError;
  bool? get billable_use_nm_invoice_numbers =>
      throw _privateConstructorUsedError;
  String? get billable_associated_record_type =>
      throw _privateConstructorUsedError;
  int? get billable_associated_record_id => throw _privateConstructorUsedError;
  String? get billable_associated_record_name =>
      throw _privateConstructorUsedError;
  String? get billable_associated_record_number =>
      throw _privateConstructorUsedError;
  DateTime? get billable_acceptance_response_date =>
      throw _privateConstructorUsedError;
  bool? get billable_isdraft => throw _privateConstructorUsedError;
  bool? get billable_isfixed => throw _privateConstructorUsedError;
  DateTime? get billable_date_due => throw _privateConstructorUsedError;
  DateTime? get billable_date => throw _privateConstructorUsedError;
  Map<String, dynamic>? get recordlock => throw _privateConstructorUsedError;
  bool? get billable_is_added_to_charges => throw _privateConstructorUsedError;
  bool? get billable_has_files => throw _privateConstructorUsedError;
  String? get billable_source_file => throw _privateConstructorUsedError;
  int? get billable_source_billable_id => throw _privateConstructorUsedError;
  String? get billable_source_billable_name =>
      throw _privateConstructorUsedError;
  String? get billable_source_billable_number =>
      throw _privateConstructorUsedError;
  String? get billable_source_billable_type =>
      throw _privateConstructorUsedError;
  int? get billable_last_derived_billable_id =>
      throw _privateConstructorUsedError;
  String? get billable_last_derived_billable_name =>
      throw _privateConstructorUsedError;
  String? get billable_last_derived_billable_number =>
      throw _privateConstructorUsedError;
  String? get billable_last_derived_billable_type =>
      throw _privateConstructorUsedError;
  List<dynamic>? get suppliers => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuoteItemDatumCopyWith<QuoteItemDatum> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuoteItemDatumCopyWith<$Res> {
  factory $QuoteItemDatumCopyWith(
          QuoteItemDatum value, $Res Function(QuoteItemDatum) then) =
      _$QuoteItemDatumCopyWithImpl<$Res, QuoteItemDatum>;
  @useResult
  $Res call(
      {int? billable_id,
      String? billable_type,
      int? billable_subscription_id,
      String? billable_subscription_public_name,
      int? billable_book_id,
      String? billable_book_number,
      String? billable_book_summary,
      int? billable_book_job_id,
      int? billable_job_id,
      String? billable_job_number,
      String? billable_job_name,
      bool? billable_islocked,
      DateTime? billable_created,
      DateTime? billable_updated,
      String? billable_name,
      String? billable_number,
      String? billable_reference,
      double? billable_total,
      double? billable_invoiced_total,
      double? billable_not_billable_total,
      double? billable_invoiced_amount_remaining_total,
      bool? billable_issent,
      DateTime? billable_date_last_sent,
      int? billable_client_contact_id,
      String? billable_client_contact_name,
      String? billable_hardware_provider,
      dynamic billable_supplier_billable_number,
      int? billable_order_status,
      dynamic billable_order_submitted,
      bool? billable_is_modified_after_submit,
      bool? billable_isimported,
      bool? billable_isaccepted,
      double? billable_total_payments,
      double? billable_total_creditnotes,
      int? billable_createdby_contact_id,
      String? billable_createdby_contact_name,
      dynamic billable_synced_invoice_number,
      String? billable_accounting_provider_name,
      String? billable_synced_accounting_provider,
      String? billable_accounting_provider_name_display,
      bool? billable_use_nm_invoice_numbers,
      String? billable_associated_record_type,
      int? billable_associated_record_id,
      String? billable_associated_record_name,
      String? billable_associated_record_number,
      DateTime? billable_acceptance_response_date,
      bool? billable_isdraft,
      bool? billable_isfixed,
      DateTime? billable_date_due,
      DateTime? billable_date,
      Map<String, dynamic>? recordlock,
      bool? billable_is_added_to_charges,
      bool? billable_has_files,
      String? billable_source_file,
      int? billable_source_billable_id,
      String? billable_source_billable_name,
      String? billable_source_billable_number,
      String? billable_source_billable_type,
      int? billable_last_derived_billable_id,
      String? billable_last_derived_billable_name,
      String? billable_last_derived_billable_number,
      String? billable_last_derived_billable_type,
      List<dynamic>? suppliers});
}

/// @nodoc
class _$QuoteItemDatumCopyWithImpl<$Res, $Val extends QuoteItemDatum>
    implements $QuoteItemDatumCopyWith<$Res> {
  _$QuoteItemDatumCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? billable_id = freezed,
    Object? billable_type = freezed,
    Object? billable_subscription_id = freezed,
    Object? billable_subscription_public_name = freezed,
    Object? billable_book_id = freezed,
    Object? billable_book_number = freezed,
    Object? billable_book_summary = freezed,
    Object? billable_book_job_id = freezed,
    Object? billable_job_id = freezed,
    Object? billable_job_number = freezed,
    Object? billable_job_name = freezed,
    Object? billable_islocked = freezed,
    Object? billable_created = freezed,
    Object? billable_updated = freezed,
    Object? billable_name = freezed,
    Object? billable_number = freezed,
    Object? billable_reference = freezed,
    Object? billable_total = freezed,
    Object? billable_invoiced_total = freezed,
    Object? billable_not_billable_total = freezed,
    Object? billable_invoiced_amount_remaining_total = freezed,
    Object? billable_issent = freezed,
    Object? billable_date_last_sent = freezed,
    Object? billable_client_contact_id = freezed,
    Object? billable_client_contact_name = freezed,
    Object? billable_hardware_provider = freezed,
    Object? billable_supplier_billable_number = freezed,
    Object? billable_order_status = freezed,
    Object? billable_order_submitted = freezed,
    Object? billable_is_modified_after_submit = freezed,
    Object? billable_isimported = freezed,
    Object? billable_isaccepted = freezed,
    Object? billable_total_payments = freezed,
    Object? billable_total_creditnotes = freezed,
    Object? billable_createdby_contact_id = freezed,
    Object? billable_createdby_contact_name = freezed,
    Object? billable_synced_invoice_number = freezed,
    Object? billable_accounting_provider_name = freezed,
    Object? billable_synced_accounting_provider = freezed,
    Object? billable_accounting_provider_name_display = freezed,
    Object? billable_use_nm_invoice_numbers = freezed,
    Object? billable_associated_record_type = freezed,
    Object? billable_associated_record_id = freezed,
    Object? billable_associated_record_name = freezed,
    Object? billable_associated_record_number = freezed,
    Object? billable_acceptance_response_date = freezed,
    Object? billable_isdraft = freezed,
    Object? billable_isfixed = freezed,
    Object? billable_date_due = freezed,
    Object? billable_date = freezed,
    Object? recordlock = freezed,
    Object? billable_is_added_to_charges = freezed,
    Object? billable_has_files = freezed,
    Object? billable_source_file = freezed,
    Object? billable_source_billable_id = freezed,
    Object? billable_source_billable_name = freezed,
    Object? billable_source_billable_number = freezed,
    Object? billable_source_billable_type = freezed,
    Object? billable_last_derived_billable_id = freezed,
    Object? billable_last_derived_billable_name = freezed,
    Object? billable_last_derived_billable_number = freezed,
    Object? billable_last_derived_billable_type = freezed,
    Object? suppliers = freezed,
  }) {
    return _then(_value.copyWith(
      billable_id: freezed == billable_id
          ? _value.billable_id
          : billable_id // ignore: cast_nullable_to_non_nullable
              as int?,
      billable_type: freezed == billable_type
          ? _value.billable_type
          : billable_type // ignore: cast_nullable_to_non_nullable
              as String?,
      billable_subscription_id: freezed == billable_subscription_id
          ? _value.billable_subscription_id
          : billable_subscription_id // ignore: cast_nullable_to_non_nullable
              as int?,
      billable_subscription_public_name: freezed ==
              billable_subscription_public_name
          ? _value.billable_subscription_public_name
          : billable_subscription_public_name // ignore: cast_nullable_to_non_nullable
              as String?,
      billable_book_id: freezed == billable_book_id
          ? _value.billable_book_id
          : billable_book_id // ignore: cast_nullable_to_non_nullable
              as int?,
      billable_book_number: freezed == billable_book_number
          ? _value.billable_book_number
          : billable_book_number // ignore: cast_nullable_to_non_nullable
              as String?,
      billable_book_summary: freezed == billable_book_summary
          ? _value.billable_book_summary
          : billable_book_summary // ignore: cast_nullable_to_non_nullable
              as String?,
      billable_book_job_id: freezed == billable_book_job_id
          ? _value.billable_book_job_id
          : billable_book_job_id // ignore: cast_nullable_to_non_nullable
              as int?,
      billable_job_id: freezed == billable_job_id
          ? _value.billable_job_id
          : billable_job_id // ignore: cast_nullable_to_non_nullable
              as int?,
      billable_job_number: freezed == billable_job_number
          ? _value.billable_job_number
          : billable_job_number // ignore: cast_nullable_to_non_nullable
              as String?,
      billable_job_name: freezed == billable_job_name
          ? _value.billable_job_name
          : billable_job_name // ignore: cast_nullable_to_non_nullable
              as String?,
      billable_islocked: freezed == billable_islocked
          ? _value.billable_islocked
          : billable_islocked // ignore: cast_nullable_to_non_nullable
              as bool?,
      billable_created: freezed == billable_created
          ? _value.billable_created
          : billable_created // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      billable_updated: freezed == billable_updated
          ? _value.billable_updated
          : billable_updated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      billable_name: freezed == billable_name
          ? _value.billable_name
          : billable_name // ignore: cast_nullable_to_non_nullable
              as String?,
      billable_number: freezed == billable_number
          ? _value.billable_number
          : billable_number // ignore: cast_nullable_to_non_nullable
              as String?,
      billable_reference: freezed == billable_reference
          ? _value.billable_reference
          : billable_reference // ignore: cast_nullable_to_non_nullable
              as String?,
      billable_total: freezed == billable_total
          ? _value.billable_total
          : billable_total // ignore: cast_nullable_to_non_nullable
              as double?,
      billable_invoiced_total: freezed == billable_invoiced_total
          ? _value.billable_invoiced_total
          : billable_invoiced_total // ignore: cast_nullable_to_non_nullable
              as double?,
      billable_not_billable_total: freezed == billable_not_billable_total
          ? _value.billable_not_billable_total
          : billable_not_billable_total // ignore: cast_nullable_to_non_nullable
              as double?,
      billable_invoiced_amount_remaining_total: freezed ==
              billable_invoiced_amount_remaining_total
          ? _value.billable_invoiced_amount_remaining_total
          : billable_invoiced_amount_remaining_total // ignore: cast_nullable_to_non_nullable
              as double?,
      billable_issent: freezed == billable_issent
          ? _value.billable_issent
          : billable_issent // ignore: cast_nullable_to_non_nullable
              as bool?,
      billable_date_last_sent: freezed == billable_date_last_sent
          ? _value.billable_date_last_sent
          : billable_date_last_sent // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      billable_client_contact_id: freezed == billable_client_contact_id
          ? _value.billable_client_contact_id
          : billable_client_contact_id // ignore: cast_nullable_to_non_nullable
              as int?,
      billable_client_contact_name: freezed == billable_client_contact_name
          ? _value.billable_client_contact_name
          : billable_client_contact_name // ignore: cast_nullable_to_non_nullable
              as String?,
      billable_hardware_provider: freezed == billable_hardware_provider
          ? _value.billable_hardware_provider
          : billable_hardware_provider // ignore: cast_nullable_to_non_nullable
              as String?,
      billable_supplier_billable_number: freezed ==
              billable_supplier_billable_number
          ? _value.billable_supplier_billable_number
          : billable_supplier_billable_number // ignore: cast_nullable_to_non_nullable
              as dynamic,
      billable_order_status: freezed == billable_order_status
          ? _value.billable_order_status
          : billable_order_status // ignore: cast_nullable_to_non_nullable
              as int?,
      billable_order_submitted: freezed == billable_order_submitted
          ? _value.billable_order_submitted
          : billable_order_submitted // ignore: cast_nullable_to_non_nullable
              as dynamic,
      billable_is_modified_after_submit: freezed ==
              billable_is_modified_after_submit
          ? _value.billable_is_modified_after_submit
          : billable_is_modified_after_submit // ignore: cast_nullable_to_non_nullable
              as bool?,
      billable_isimported: freezed == billable_isimported
          ? _value.billable_isimported
          : billable_isimported // ignore: cast_nullable_to_non_nullable
              as bool?,
      billable_isaccepted: freezed == billable_isaccepted
          ? _value.billable_isaccepted
          : billable_isaccepted // ignore: cast_nullable_to_non_nullable
              as bool?,
      billable_total_payments: freezed == billable_total_payments
          ? _value.billable_total_payments
          : billable_total_payments // ignore: cast_nullable_to_non_nullable
              as double?,
      billable_total_creditnotes: freezed == billable_total_creditnotes
          ? _value.billable_total_creditnotes
          : billable_total_creditnotes // ignore: cast_nullable_to_non_nullable
              as double?,
      billable_createdby_contact_id: freezed == billable_createdby_contact_id
          ? _value.billable_createdby_contact_id
          : billable_createdby_contact_id // ignore: cast_nullable_to_non_nullable
              as int?,
      billable_createdby_contact_name: freezed ==
              billable_createdby_contact_name
          ? _value.billable_createdby_contact_name
          : billable_createdby_contact_name // ignore: cast_nullable_to_non_nullable
              as String?,
      billable_synced_invoice_number: freezed == billable_synced_invoice_number
          ? _value.billable_synced_invoice_number
          : billable_synced_invoice_number // ignore: cast_nullable_to_non_nullable
              as dynamic,
      billable_accounting_provider_name: freezed ==
              billable_accounting_provider_name
          ? _value.billable_accounting_provider_name
          : billable_accounting_provider_name // ignore: cast_nullable_to_non_nullable
              as String?,
      billable_synced_accounting_provider: freezed ==
              billable_synced_accounting_provider
          ? _value.billable_synced_accounting_provider
          : billable_synced_accounting_provider // ignore: cast_nullable_to_non_nullable
              as String?,
      billable_accounting_provider_name_display: freezed ==
              billable_accounting_provider_name_display
          ? _value.billable_accounting_provider_name_display
          : billable_accounting_provider_name_display // ignore: cast_nullable_to_non_nullable
              as String?,
      billable_use_nm_invoice_numbers: freezed ==
              billable_use_nm_invoice_numbers
          ? _value.billable_use_nm_invoice_numbers
          : billable_use_nm_invoice_numbers // ignore: cast_nullable_to_non_nullable
              as bool?,
      billable_associated_record_type: freezed ==
              billable_associated_record_type
          ? _value.billable_associated_record_type
          : billable_associated_record_type // ignore: cast_nullable_to_non_nullable
              as String?,
      billable_associated_record_id: freezed == billable_associated_record_id
          ? _value.billable_associated_record_id
          : billable_associated_record_id // ignore: cast_nullable_to_non_nullable
              as int?,
      billable_associated_record_name: freezed ==
              billable_associated_record_name
          ? _value.billable_associated_record_name
          : billable_associated_record_name // ignore: cast_nullable_to_non_nullable
              as String?,
      billable_associated_record_number: freezed ==
              billable_associated_record_number
          ? _value.billable_associated_record_number
          : billable_associated_record_number // ignore: cast_nullable_to_non_nullable
              as String?,
      billable_acceptance_response_date: freezed ==
              billable_acceptance_response_date
          ? _value.billable_acceptance_response_date
          : billable_acceptance_response_date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      billable_isdraft: freezed == billable_isdraft
          ? _value.billable_isdraft
          : billable_isdraft // ignore: cast_nullable_to_non_nullable
              as bool?,
      billable_isfixed: freezed == billable_isfixed
          ? _value.billable_isfixed
          : billable_isfixed // ignore: cast_nullable_to_non_nullable
              as bool?,
      billable_date_due: freezed == billable_date_due
          ? _value.billable_date_due
          : billable_date_due // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      billable_date: freezed == billable_date
          ? _value.billable_date
          : billable_date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      recordlock: freezed == recordlock
          ? _value.recordlock
          : recordlock // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      billable_is_added_to_charges: freezed == billable_is_added_to_charges
          ? _value.billable_is_added_to_charges
          : billable_is_added_to_charges // ignore: cast_nullable_to_non_nullable
              as bool?,
      billable_has_files: freezed == billable_has_files
          ? _value.billable_has_files
          : billable_has_files // ignore: cast_nullable_to_non_nullable
              as bool?,
      billable_source_file: freezed == billable_source_file
          ? _value.billable_source_file
          : billable_source_file // ignore: cast_nullable_to_non_nullable
              as String?,
      billable_source_billable_id: freezed == billable_source_billable_id
          ? _value.billable_source_billable_id
          : billable_source_billable_id // ignore: cast_nullable_to_non_nullable
              as int?,
      billable_source_billable_name: freezed == billable_source_billable_name
          ? _value.billable_source_billable_name
          : billable_source_billable_name // ignore: cast_nullable_to_non_nullable
              as String?,
      billable_source_billable_number: freezed ==
              billable_source_billable_number
          ? _value.billable_source_billable_number
          : billable_source_billable_number // ignore: cast_nullable_to_non_nullable
              as String?,
      billable_source_billable_type: freezed == billable_source_billable_type
          ? _value.billable_source_billable_type
          : billable_source_billable_type // ignore: cast_nullable_to_non_nullable
              as String?,
      billable_last_derived_billable_id: freezed ==
              billable_last_derived_billable_id
          ? _value.billable_last_derived_billable_id
          : billable_last_derived_billable_id // ignore: cast_nullable_to_non_nullable
              as int?,
      billable_last_derived_billable_name: freezed ==
              billable_last_derived_billable_name
          ? _value.billable_last_derived_billable_name
          : billable_last_derived_billable_name // ignore: cast_nullable_to_non_nullable
              as String?,
      billable_last_derived_billable_number: freezed ==
              billable_last_derived_billable_number
          ? _value.billable_last_derived_billable_number
          : billable_last_derived_billable_number // ignore: cast_nullable_to_non_nullable
              as String?,
      billable_last_derived_billable_type: freezed ==
              billable_last_derived_billable_type
          ? _value.billable_last_derived_billable_type
          : billable_last_derived_billable_type // ignore: cast_nullable_to_non_nullable
              as String?,
      suppliers: freezed == suppliers
          ? _value.suppliers
          : suppliers // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QuoteItemDatumCopyWith<$Res>
    implements $QuoteItemDatumCopyWith<$Res> {
  factory _$$_QuoteItemDatumCopyWith(
          _$_QuoteItemDatum value, $Res Function(_$_QuoteItemDatum) then) =
      __$$_QuoteItemDatumCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? billable_id,
      String? billable_type,
      int? billable_subscription_id,
      String? billable_subscription_public_name,
      int? billable_book_id,
      String? billable_book_number,
      String? billable_book_summary,
      int? billable_book_job_id,
      int? billable_job_id,
      String? billable_job_number,
      String? billable_job_name,
      bool? billable_islocked,
      DateTime? billable_created,
      DateTime? billable_updated,
      String? billable_name,
      String? billable_number,
      String? billable_reference,
      double? billable_total,
      double? billable_invoiced_total,
      double? billable_not_billable_total,
      double? billable_invoiced_amount_remaining_total,
      bool? billable_issent,
      DateTime? billable_date_last_sent,
      int? billable_client_contact_id,
      String? billable_client_contact_name,
      String? billable_hardware_provider,
      dynamic billable_supplier_billable_number,
      int? billable_order_status,
      dynamic billable_order_submitted,
      bool? billable_is_modified_after_submit,
      bool? billable_isimported,
      bool? billable_isaccepted,
      double? billable_total_payments,
      double? billable_total_creditnotes,
      int? billable_createdby_contact_id,
      String? billable_createdby_contact_name,
      dynamic billable_synced_invoice_number,
      String? billable_accounting_provider_name,
      String? billable_synced_accounting_provider,
      String? billable_accounting_provider_name_display,
      bool? billable_use_nm_invoice_numbers,
      String? billable_associated_record_type,
      int? billable_associated_record_id,
      String? billable_associated_record_name,
      String? billable_associated_record_number,
      DateTime? billable_acceptance_response_date,
      bool? billable_isdraft,
      bool? billable_isfixed,
      DateTime? billable_date_due,
      DateTime? billable_date,
      Map<String, dynamic>? recordlock,
      bool? billable_is_added_to_charges,
      bool? billable_has_files,
      String? billable_source_file,
      int? billable_source_billable_id,
      String? billable_source_billable_name,
      String? billable_source_billable_number,
      String? billable_source_billable_type,
      int? billable_last_derived_billable_id,
      String? billable_last_derived_billable_name,
      String? billable_last_derived_billable_number,
      String? billable_last_derived_billable_type,
      List<dynamic>? suppliers});
}

/// @nodoc
class __$$_QuoteItemDatumCopyWithImpl<$Res>
    extends _$QuoteItemDatumCopyWithImpl<$Res, _$_QuoteItemDatum>
    implements _$$_QuoteItemDatumCopyWith<$Res> {
  __$$_QuoteItemDatumCopyWithImpl(
      _$_QuoteItemDatum _value, $Res Function(_$_QuoteItemDatum) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? billable_id = freezed,
    Object? billable_type = freezed,
    Object? billable_subscription_id = freezed,
    Object? billable_subscription_public_name = freezed,
    Object? billable_book_id = freezed,
    Object? billable_book_number = freezed,
    Object? billable_book_summary = freezed,
    Object? billable_book_job_id = freezed,
    Object? billable_job_id = freezed,
    Object? billable_job_number = freezed,
    Object? billable_job_name = freezed,
    Object? billable_islocked = freezed,
    Object? billable_created = freezed,
    Object? billable_updated = freezed,
    Object? billable_name = freezed,
    Object? billable_number = freezed,
    Object? billable_reference = freezed,
    Object? billable_total = freezed,
    Object? billable_invoiced_total = freezed,
    Object? billable_not_billable_total = freezed,
    Object? billable_invoiced_amount_remaining_total = freezed,
    Object? billable_issent = freezed,
    Object? billable_date_last_sent = freezed,
    Object? billable_client_contact_id = freezed,
    Object? billable_client_contact_name = freezed,
    Object? billable_hardware_provider = freezed,
    Object? billable_supplier_billable_number = freezed,
    Object? billable_order_status = freezed,
    Object? billable_order_submitted = freezed,
    Object? billable_is_modified_after_submit = freezed,
    Object? billable_isimported = freezed,
    Object? billable_isaccepted = freezed,
    Object? billable_total_payments = freezed,
    Object? billable_total_creditnotes = freezed,
    Object? billable_createdby_contact_id = freezed,
    Object? billable_createdby_contact_name = freezed,
    Object? billable_synced_invoice_number = freezed,
    Object? billable_accounting_provider_name = freezed,
    Object? billable_synced_accounting_provider = freezed,
    Object? billable_accounting_provider_name_display = freezed,
    Object? billable_use_nm_invoice_numbers = freezed,
    Object? billable_associated_record_type = freezed,
    Object? billable_associated_record_id = freezed,
    Object? billable_associated_record_name = freezed,
    Object? billable_associated_record_number = freezed,
    Object? billable_acceptance_response_date = freezed,
    Object? billable_isdraft = freezed,
    Object? billable_isfixed = freezed,
    Object? billable_date_due = freezed,
    Object? billable_date = freezed,
    Object? recordlock = freezed,
    Object? billable_is_added_to_charges = freezed,
    Object? billable_has_files = freezed,
    Object? billable_source_file = freezed,
    Object? billable_source_billable_id = freezed,
    Object? billable_source_billable_name = freezed,
    Object? billable_source_billable_number = freezed,
    Object? billable_source_billable_type = freezed,
    Object? billable_last_derived_billable_id = freezed,
    Object? billable_last_derived_billable_name = freezed,
    Object? billable_last_derived_billable_number = freezed,
    Object? billable_last_derived_billable_type = freezed,
    Object? suppliers = freezed,
  }) {
    return _then(_$_QuoteItemDatum(
      billable_id: freezed == billable_id
          ? _value.billable_id
          : billable_id // ignore: cast_nullable_to_non_nullable
              as int?,
      billable_type: freezed == billable_type
          ? _value.billable_type
          : billable_type // ignore: cast_nullable_to_non_nullable
              as String?,
      billable_subscription_id: freezed == billable_subscription_id
          ? _value.billable_subscription_id
          : billable_subscription_id // ignore: cast_nullable_to_non_nullable
              as int?,
      billable_subscription_public_name: freezed ==
              billable_subscription_public_name
          ? _value.billable_subscription_public_name
          : billable_subscription_public_name // ignore: cast_nullable_to_non_nullable
              as String?,
      billable_book_id: freezed == billable_book_id
          ? _value.billable_book_id
          : billable_book_id // ignore: cast_nullable_to_non_nullable
              as int?,
      billable_book_number: freezed == billable_book_number
          ? _value.billable_book_number
          : billable_book_number // ignore: cast_nullable_to_non_nullable
              as String?,
      billable_book_summary: freezed == billable_book_summary
          ? _value.billable_book_summary
          : billable_book_summary // ignore: cast_nullable_to_non_nullable
              as String?,
      billable_book_job_id: freezed == billable_book_job_id
          ? _value.billable_book_job_id
          : billable_book_job_id // ignore: cast_nullable_to_non_nullable
              as int?,
      billable_job_id: freezed == billable_job_id
          ? _value.billable_job_id
          : billable_job_id // ignore: cast_nullable_to_non_nullable
              as int?,
      billable_job_number: freezed == billable_job_number
          ? _value.billable_job_number
          : billable_job_number // ignore: cast_nullable_to_non_nullable
              as String?,
      billable_job_name: freezed == billable_job_name
          ? _value.billable_job_name
          : billable_job_name // ignore: cast_nullable_to_non_nullable
              as String?,
      billable_islocked: freezed == billable_islocked
          ? _value.billable_islocked
          : billable_islocked // ignore: cast_nullable_to_non_nullable
              as bool?,
      billable_created: freezed == billable_created
          ? _value.billable_created
          : billable_created // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      billable_updated: freezed == billable_updated
          ? _value.billable_updated
          : billable_updated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      billable_name: freezed == billable_name
          ? _value.billable_name
          : billable_name // ignore: cast_nullable_to_non_nullable
              as String?,
      billable_number: freezed == billable_number
          ? _value.billable_number
          : billable_number // ignore: cast_nullable_to_non_nullable
              as String?,
      billable_reference: freezed == billable_reference
          ? _value.billable_reference
          : billable_reference // ignore: cast_nullable_to_non_nullable
              as String?,
      billable_total: freezed == billable_total
          ? _value.billable_total
          : billable_total // ignore: cast_nullable_to_non_nullable
              as double?,
      billable_invoiced_total: freezed == billable_invoiced_total
          ? _value.billable_invoiced_total
          : billable_invoiced_total // ignore: cast_nullable_to_non_nullable
              as double?,
      billable_not_billable_total: freezed == billable_not_billable_total
          ? _value.billable_not_billable_total
          : billable_not_billable_total // ignore: cast_nullable_to_non_nullable
              as double?,
      billable_invoiced_amount_remaining_total: freezed ==
              billable_invoiced_amount_remaining_total
          ? _value.billable_invoiced_amount_remaining_total
          : billable_invoiced_amount_remaining_total // ignore: cast_nullable_to_non_nullable
              as double?,
      billable_issent: freezed == billable_issent
          ? _value.billable_issent
          : billable_issent // ignore: cast_nullable_to_non_nullable
              as bool?,
      billable_date_last_sent: freezed == billable_date_last_sent
          ? _value.billable_date_last_sent
          : billable_date_last_sent // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      billable_client_contact_id: freezed == billable_client_contact_id
          ? _value.billable_client_contact_id
          : billable_client_contact_id // ignore: cast_nullable_to_non_nullable
              as int?,
      billable_client_contact_name: freezed == billable_client_contact_name
          ? _value.billable_client_contact_name
          : billable_client_contact_name // ignore: cast_nullable_to_non_nullable
              as String?,
      billable_hardware_provider: freezed == billable_hardware_provider
          ? _value.billable_hardware_provider
          : billable_hardware_provider // ignore: cast_nullable_to_non_nullable
              as String?,
      billable_supplier_billable_number: freezed ==
              billable_supplier_billable_number
          ? _value.billable_supplier_billable_number
          : billable_supplier_billable_number // ignore: cast_nullable_to_non_nullable
              as dynamic,
      billable_order_status: freezed == billable_order_status
          ? _value.billable_order_status
          : billable_order_status // ignore: cast_nullable_to_non_nullable
              as int?,
      billable_order_submitted: freezed == billable_order_submitted
          ? _value.billable_order_submitted
          : billable_order_submitted // ignore: cast_nullable_to_non_nullable
              as dynamic,
      billable_is_modified_after_submit: freezed ==
              billable_is_modified_after_submit
          ? _value.billable_is_modified_after_submit
          : billable_is_modified_after_submit // ignore: cast_nullable_to_non_nullable
              as bool?,
      billable_isimported: freezed == billable_isimported
          ? _value.billable_isimported
          : billable_isimported // ignore: cast_nullable_to_non_nullable
              as bool?,
      billable_isaccepted: freezed == billable_isaccepted
          ? _value.billable_isaccepted
          : billable_isaccepted // ignore: cast_nullable_to_non_nullable
              as bool?,
      billable_total_payments: freezed == billable_total_payments
          ? _value.billable_total_payments
          : billable_total_payments // ignore: cast_nullable_to_non_nullable
              as double?,
      billable_total_creditnotes: freezed == billable_total_creditnotes
          ? _value.billable_total_creditnotes
          : billable_total_creditnotes // ignore: cast_nullable_to_non_nullable
              as double?,
      billable_createdby_contact_id: freezed == billable_createdby_contact_id
          ? _value.billable_createdby_contact_id
          : billable_createdby_contact_id // ignore: cast_nullable_to_non_nullable
              as int?,
      billable_createdby_contact_name: freezed ==
              billable_createdby_contact_name
          ? _value.billable_createdby_contact_name
          : billable_createdby_contact_name // ignore: cast_nullable_to_non_nullable
              as String?,
      billable_synced_invoice_number: freezed == billable_synced_invoice_number
          ? _value.billable_synced_invoice_number
          : billable_synced_invoice_number // ignore: cast_nullable_to_non_nullable
              as dynamic,
      billable_accounting_provider_name: freezed ==
              billable_accounting_provider_name
          ? _value.billable_accounting_provider_name
          : billable_accounting_provider_name // ignore: cast_nullable_to_non_nullable
              as String?,
      billable_synced_accounting_provider: freezed ==
              billable_synced_accounting_provider
          ? _value.billable_synced_accounting_provider
          : billable_synced_accounting_provider // ignore: cast_nullable_to_non_nullable
              as String?,
      billable_accounting_provider_name_display: freezed ==
              billable_accounting_provider_name_display
          ? _value.billable_accounting_provider_name_display
          : billable_accounting_provider_name_display // ignore: cast_nullable_to_non_nullable
              as String?,
      billable_use_nm_invoice_numbers: freezed ==
              billable_use_nm_invoice_numbers
          ? _value.billable_use_nm_invoice_numbers
          : billable_use_nm_invoice_numbers // ignore: cast_nullable_to_non_nullable
              as bool?,
      billable_associated_record_type: freezed ==
              billable_associated_record_type
          ? _value.billable_associated_record_type
          : billable_associated_record_type // ignore: cast_nullable_to_non_nullable
              as String?,
      billable_associated_record_id: freezed == billable_associated_record_id
          ? _value.billable_associated_record_id
          : billable_associated_record_id // ignore: cast_nullable_to_non_nullable
              as int?,
      billable_associated_record_name: freezed ==
              billable_associated_record_name
          ? _value.billable_associated_record_name
          : billable_associated_record_name // ignore: cast_nullable_to_non_nullable
              as String?,
      billable_associated_record_number: freezed ==
              billable_associated_record_number
          ? _value.billable_associated_record_number
          : billable_associated_record_number // ignore: cast_nullable_to_non_nullable
              as String?,
      billable_acceptance_response_date: freezed ==
              billable_acceptance_response_date
          ? _value.billable_acceptance_response_date
          : billable_acceptance_response_date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      billable_isdraft: freezed == billable_isdraft
          ? _value.billable_isdraft
          : billable_isdraft // ignore: cast_nullable_to_non_nullable
              as bool?,
      billable_isfixed: freezed == billable_isfixed
          ? _value.billable_isfixed
          : billable_isfixed // ignore: cast_nullable_to_non_nullable
              as bool?,
      billable_date_due: freezed == billable_date_due
          ? _value.billable_date_due
          : billable_date_due // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      billable_date: freezed == billable_date
          ? _value.billable_date
          : billable_date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      recordlock: freezed == recordlock
          ? _value._recordlock
          : recordlock // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      billable_is_added_to_charges: freezed == billable_is_added_to_charges
          ? _value.billable_is_added_to_charges
          : billable_is_added_to_charges // ignore: cast_nullable_to_non_nullable
              as bool?,
      billable_has_files: freezed == billable_has_files
          ? _value.billable_has_files
          : billable_has_files // ignore: cast_nullable_to_non_nullable
              as bool?,
      billable_source_file: freezed == billable_source_file
          ? _value.billable_source_file
          : billable_source_file // ignore: cast_nullable_to_non_nullable
              as String?,
      billable_source_billable_id: freezed == billable_source_billable_id
          ? _value.billable_source_billable_id
          : billable_source_billable_id // ignore: cast_nullable_to_non_nullable
              as int?,
      billable_source_billable_name: freezed == billable_source_billable_name
          ? _value.billable_source_billable_name
          : billable_source_billable_name // ignore: cast_nullable_to_non_nullable
              as String?,
      billable_source_billable_number: freezed ==
              billable_source_billable_number
          ? _value.billable_source_billable_number
          : billable_source_billable_number // ignore: cast_nullable_to_non_nullable
              as String?,
      billable_source_billable_type: freezed == billable_source_billable_type
          ? _value.billable_source_billable_type
          : billable_source_billable_type // ignore: cast_nullable_to_non_nullable
              as String?,
      billable_last_derived_billable_id: freezed ==
              billable_last_derived_billable_id
          ? _value.billable_last_derived_billable_id
          : billable_last_derived_billable_id // ignore: cast_nullable_to_non_nullable
              as int?,
      billable_last_derived_billable_name: freezed ==
              billable_last_derived_billable_name
          ? _value.billable_last_derived_billable_name
          : billable_last_derived_billable_name // ignore: cast_nullable_to_non_nullable
              as String?,
      billable_last_derived_billable_number: freezed ==
              billable_last_derived_billable_number
          ? _value.billable_last_derived_billable_number
          : billable_last_derived_billable_number // ignore: cast_nullable_to_non_nullable
              as String?,
      billable_last_derived_billable_type: freezed ==
              billable_last_derived_billable_type
          ? _value.billable_last_derived_billable_type
          : billable_last_derived_billable_type // ignore: cast_nullable_to_non_nullable
              as String?,
      suppliers: freezed == suppliers
          ? _value._suppliers
          : suppliers // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QuoteItemDatum implements _QuoteItemDatum {
  const _$_QuoteItemDatum(
      {this.billable_id,
      this.billable_type,
      this.billable_subscription_id,
      this.billable_subscription_public_name,
      this.billable_book_id,
      this.billable_book_number,
      this.billable_book_summary,
      this.billable_book_job_id,
      this.billable_job_id,
      this.billable_job_number,
      this.billable_job_name,
      this.billable_islocked,
      this.billable_created,
      this.billable_updated,
      this.billable_name,
      this.billable_number,
      this.billable_reference,
      this.billable_total,
      this.billable_invoiced_total,
      this.billable_not_billable_total,
      this.billable_invoiced_amount_remaining_total,
      this.billable_issent,
      this.billable_date_last_sent,
      this.billable_client_contact_id,
      this.billable_client_contact_name,
      this.billable_hardware_provider,
      this.billable_supplier_billable_number,
      this.billable_order_status,
      this.billable_order_submitted,
      this.billable_is_modified_after_submit,
      this.billable_isimported,
      this.billable_isaccepted,
      this.billable_total_payments,
      this.billable_total_creditnotes,
      this.billable_createdby_contact_id,
      this.billable_createdby_contact_name,
      this.billable_synced_invoice_number,
      this.billable_accounting_provider_name,
      this.billable_synced_accounting_provider,
      this.billable_accounting_provider_name_display,
      this.billable_use_nm_invoice_numbers,
      this.billable_associated_record_type,
      this.billable_associated_record_id,
      this.billable_associated_record_name,
      this.billable_associated_record_number,
      this.billable_acceptance_response_date,
      this.billable_isdraft,
      this.billable_isfixed,
      this.billable_date_due,
      this.billable_date,
      final Map<String, dynamic>? recordlock,
      this.billable_is_added_to_charges,
      this.billable_has_files,
      this.billable_source_file,
      this.billable_source_billable_id,
      this.billable_source_billable_name,
      this.billable_source_billable_number,
      this.billable_source_billable_type,
      this.billable_last_derived_billable_id,
      this.billable_last_derived_billable_name,
      this.billable_last_derived_billable_number,
      this.billable_last_derived_billable_type,
      final List<dynamic>? suppliers})
      : _recordlock = recordlock,
        _suppliers = suppliers;

  factory _$_QuoteItemDatum.fromJson(Map<String, dynamic> json) =>
      _$$_QuoteItemDatumFromJson(json);

  @override
  final int? billable_id;
  @override
  final String? billable_type;
  @override
  final int? billable_subscription_id;
  @override
  final String? billable_subscription_public_name;
  @override
  final int? billable_book_id;
  @override
  final String? billable_book_number;
  @override
  final String? billable_book_summary;
  @override
  final int? billable_book_job_id;
  @override
  final int? billable_job_id;
  @override
  final String? billable_job_number;
  @override
  final String? billable_job_name;
  @override
  final bool? billable_islocked;
  @override
  final DateTime? billable_created;
  @override
  final DateTime? billable_updated;
  @override
  final String? billable_name;
  @override
  final String? billable_number;
  @override
  final String? billable_reference;
  @override
  final double? billable_total;
  @override
  final double? billable_invoiced_total;
  @override
  final double? billable_not_billable_total;
  @override
  final double? billable_invoiced_amount_remaining_total;
  @override
  final bool? billable_issent;
  @override
  final DateTime? billable_date_last_sent;
  @override
  final int? billable_client_contact_id;
  @override
  final String? billable_client_contact_name;
  @override
  final String? billable_hardware_provider;
  @override
  final dynamic billable_supplier_billable_number;
  @override
  final int? billable_order_status;
  @override
  final dynamic billable_order_submitted;
  @override
  final bool? billable_is_modified_after_submit;
  @override
  final bool? billable_isimported;
  @override
  final bool? billable_isaccepted;
  @override
  final double? billable_total_payments;
  @override
  final double? billable_total_creditnotes;
  @override
  final int? billable_createdby_contact_id;
  @override
  final String? billable_createdby_contact_name;
  @override
  final dynamic billable_synced_invoice_number;
  @override
  final String? billable_accounting_provider_name;
  @override
  final String? billable_synced_accounting_provider;
  @override
  final String? billable_accounting_provider_name_display;
  @override
  final bool? billable_use_nm_invoice_numbers;
  @override
  final String? billable_associated_record_type;
  @override
  final int? billable_associated_record_id;
  @override
  final String? billable_associated_record_name;
  @override
  final String? billable_associated_record_number;
  @override
  final DateTime? billable_acceptance_response_date;
  @override
  final bool? billable_isdraft;
  @override
  final bool? billable_isfixed;
  @override
  final DateTime? billable_date_due;
  @override
  final DateTime? billable_date;
  final Map<String, dynamic>? _recordlock;
  @override
  Map<String, dynamic>? get recordlock {
    final value = _recordlock;
    if (value == null) return null;
    if (_recordlock is EqualUnmodifiableMapView) return _recordlock;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final bool? billable_is_added_to_charges;
  @override
  final bool? billable_has_files;
  @override
  final String? billable_source_file;
  @override
  final int? billable_source_billable_id;
  @override
  final String? billable_source_billable_name;
  @override
  final String? billable_source_billable_number;
  @override
  final String? billable_source_billable_type;
  @override
  final int? billable_last_derived_billable_id;
  @override
  final String? billable_last_derived_billable_name;
  @override
  final String? billable_last_derived_billable_number;
  @override
  final String? billable_last_derived_billable_type;
  final List<dynamic>? _suppliers;
  @override
  List<dynamic>? get suppliers {
    final value = _suppliers;
    if (value == null) return null;
    if (_suppliers is EqualUnmodifiableListView) return _suppliers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'QuoteItemDatum(billable_id: $billable_id, billable_type: $billable_type, billable_subscription_id: $billable_subscription_id, billable_subscription_public_name: $billable_subscription_public_name, billable_book_id: $billable_book_id, billable_book_number: $billable_book_number, billable_book_summary: $billable_book_summary, billable_book_job_id: $billable_book_job_id, billable_job_id: $billable_job_id, billable_job_number: $billable_job_number, billable_job_name: $billable_job_name, billable_islocked: $billable_islocked, billable_created: $billable_created, billable_updated: $billable_updated, billable_name: $billable_name, billable_number: $billable_number, billable_reference: $billable_reference, billable_total: $billable_total, billable_invoiced_total: $billable_invoiced_total, billable_not_billable_total: $billable_not_billable_total, billable_invoiced_amount_remaining_total: $billable_invoiced_amount_remaining_total, billable_issent: $billable_issent, billable_date_last_sent: $billable_date_last_sent, billable_client_contact_id: $billable_client_contact_id, billable_client_contact_name: $billable_client_contact_name, billable_hardware_provider: $billable_hardware_provider, billable_supplier_billable_number: $billable_supplier_billable_number, billable_order_status: $billable_order_status, billable_order_submitted: $billable_order_submitted, billable_is_modified_after_submit: $billable_is_modified_after_submit, billable_isimported: $billable_isimported, billable_isaccepted: $billable_isaccepted, billable_total_payments: $billable_total_payments, billable_total_creditnotes: $billable_total_creditnotes, billable_createdby_contact_id: $billable_createdby_contact_id, billable_createdby_contact_name: $billable_createdby_contact_name, billable_synced_invoice_number: $billable_synced_invoice_number, billable_accounting_provider_name: $billable_accounting_provider_name, billable_synced_accounting_provider: $billable_synced_accounting_provider, billable_accounting_provider_name_display: $billable_accounting_provider_name_display, billable_use_nm_invoice_numbers: $billable_use_nm_invoice_numbers, billable_associated_record_type: $billable_associated_record_type, billable_associated_record_id: $billable_associated_record_id, billable_associated_record_name: $billable_associated_record_name, billable_associated_record_number: $billable_associated_record_number, billable_acceptance_response_date: $billable_acceptance_response_date, billable_isdraft: $billable_isdraft, billable_isfixed: $billable_isfixed, billable_date_due: $billable_date_due, billable_date: $billable_date, recordlock: $recordlock, billable_is_added_to_charges: $billable_is_added_to_charges, billable_has_files: $billable_has_files, billable_source_file: $billable_source_file, billable_source_billable_id: $billable_source_billable_id, billable_source_billable_name: $billable_source_billable_name, billable_source_billable_number: $billable_source_billable_number, billable_source_billable_type: $billable_source_billable_type, billable_last_derived_billable_id: $billable_last_derived_billable_id, billable_last_derived_billable_name: $billable_last_derived_billable_name, billable_last_derived_billable_number: $billable_last_derived_billable_number, billable_last_derived_billable_type: $billable_last_derived_billable_type, suppliers: $suppliers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QuoteItemDatum &&
            (identical(other.billable_id, billable_id) ||
                other.billable_id == billable_id) &&
            (identical(other.billable_type, billable_type) ||
                other.billable_type == billable_type) &&
            (identical(other.billable_subscription_id, billable_subscription_id) ||
                other.billable_subscription_id == billable_subscription_id) &&
            (identical(other.billable_subscription_public_name, billable_subscription_public_name) ||
                other.billable_subscription_public_name ==
                    billable_subscription_public_name) &&
            (identical(other.billable_book_id, billable_book_id) ||
                other.billable_book_id == billable_book_id) &&
            (identical(other.billable_book_number, billable_book_number) ||
                other.billable_book_number == billable_book_number) &&
            (identical(other.billable_book_summary, billable_book_summary) ||
                other.billable_book_summary == billable_book_summary) &&
            (identical(other.billable_book_job_id, billable_book_job_id) ||
                other.billable_book_job_id == billable_book_job_id) &&
            (identical(other.billable_job_id, billable_job_id) ||
                other.billable_job_id == billable_job_id) &&
            (identical(other.billable_job_number, billable_job_number) ||
                other.billable_job_number == billable_job_number) &&
            (identical(other.billable_job_name, billable_job_name) ||
                other.billable_job_name == billable_job_name) &&
            (identical(other.billable_islocked, billable_islocked) ||
                other.billable_islocked == billable_islocked) &&
            (identical(other.billable_created, billable_created) ||
                other.billable_created == billable_created) &&
            (identical(other.billable_updated, billable_updated) ||
                other.billable_updated == billable_updated) &&
            (identical(other.billable_name, billable_name) ||
                other.billable_name == billable_name) &&
            (identical(other.billable_number, billable_number) ||
                other.billable_number == billable_number) &&
            (identical(other.billable_reference, billable_reference) ||
                other.billable_reference == billable_reference) &&
            (identical(other.billable_total, billable_total) ||
                other.billable_total == billable_total) &&
            (identical(other.billable_invoiced_total, billable_invoiced_total) ||
                other.billable_invoiced_total == billable_invoiced_total) &&
            (identical(other.billable_not_billable_total, billable_not_billable_total) ||
                other.billable_not_billable_total ==
                    billable_not_billable_total) &&
            (identical(other.billable_invoiced_amount_remaining_total, billable_invoiced_amount_remaining_total) ||
                other.billable_invoiced_amount_remaining_total ==
                    billable_invoiced_amount_remaining_total) &&
            (identical(other.billable_issent, billable_issent) ||
                other.billable_issent == billable_issent) &&
            (identical(other.billable_date_last_sent, billable_date_last_sent) ||
                other.billable_date_last_sent == billable_date_last_sent) &&
            (identical(other.billable_client_contact_id, billable_client_contact_id) ||
                other.billable_client_contact_id == billable_client_contact_id) &&
            (identical(other.billable_client_contact_name, billable_client_contact_name) || other.billable_client_contact_name == billable_client_contact_name) &&
            (identical(other.billable_hardware_provider, billable_hardware_provider) || other.billable_hardware_provider == billable_hardware_provider) &&
            const DeepCollectionEquality().equals(other.billable_supplier_billable_number, billable_supplier_billable_number) &&
            (identical(other.billable_order_status, billable_order_status) || other.billable_order_status == billable_order_status) &&
            const DeepCollectionEquality().equals(other.billable_order_submitted, billable_order_submitted) &&
            (identical(other.billable_is_modified_after_submit, billable_is_modified_after_submit) || other.billable_is_modified_after_submit == billable_is_modified_after_submit) &&
            (identical(other.billable_isimported, billable_isimported) || other.billable_isimported == billable_isimported) &&
            (identical(other.billable_isaccepted, billable_isaccepted) || other.billable_isaccepted == billable_isaccepted) &&
            (identical(other.billable_total_payments, billable_total_payments) || other.billable_total_payments == billable_total_payments) &&
            (identical(other.billable_total_creditnotes, billable_total_creditnotes) || other.billable_total_creditnotes == billable_total_creditnotes) &&
            (identical(other.billable_createdby_contact_id, billable_createdby_contact_id) || other.billable_createdby_contact_id == billable_createdby_contact_id) &&
            (identical(other.billable_createdby_contact_name, billable_createdby_contact_name) || other.billable_createdby_contact_name == billable_createdby_contact_name) &&
            const DeepCollectionEquality().equals(other.billable_synced_invoice_number, billable_synced_invoice_number) &&
            (identical(other.billable_accounting_provider_name, billable_accounting_provider_name) || other.billable_accounting_provider_name == billable_accounting_provider_name) &&
            (identical(other.billable_synced_accounting_provider, billable_synced_accounting_provider) || other.billable_synced_accounting_provider == billable_synced_accounting_provider) &&
            (identical(other.billable_accounting_provider_name_display, billable_accounting_provider_name_display) || other.billable_accounting_provider_name_display == billable_accounting_provider_name_display) &&
            (identical(other.billable_use_nm_invoice_numbers, billable_use_nm_invoice_numbers) || other.billable_use_nm_invoice_numbers == billable_use_nm_invoice_numbers) &&
            (identical(other.billable_associated_record_type, billable_associated_record_type) || other.billable_associated_record_type == billable_associated_record_type) &&
            (identical(other.billable_associated_record_id, billable_associated_record_id) || other.billable_associated_record_id == billable_associated_record_id) &&
            (identical(other.billable_associated_record_name, billable_associated_record_name) || other.billable_associated_record_name == billable_associated_record_name) &&
            (identical(other.billable_associated_record_number, billable_associated_record_number) || other.billable_associated_record_number == billable_associated_record_number) &&
            (identical(other.billable_acceptance_response_date, billable_acceptance_response_date) || other.billable_acceptance_response_date == billable_acceptance_response_date) &&
            (identical(other.billable_isdraft, billable_isdraft) || other.billable_isdraft == billable_isdraft) &&
            (identical(other.billable_isfixed, billable_isfixed) || other.billable_isfixed == billable_isfixed) &&
            (identical(other.billable_date_due, billable_date_due) || other.billable_date_due == billable_date_due) &&
            (identical(other.billable_date, billable_date) || other.billable_date == billable_date) &&
            const DeepCollectionEquality().equals(other._recordlock, _recordlock) &&
            (identical(other.billable_is_added_to_charges, billable_is_added_to_charges) || other.billable_is_added_to_charges == billable_is_added_to_charges) &&
            (identical(other.billable_has_files, billable_has_files) || other.billable_has_files == billable_has_files) &&
            (identical(other.billable_source_file, billable_source_file) || other.billable_source_file == billable_source_file) &&
            (identical(other.billable_source_billable_id, billable_source_billable_id) || other.billable_source_billable_id == billable_source_billable_id) &&
            (identical(other.billable_source_billable_name, billable_source_billable_name) || other.billable_source_billable_name == billable_source_billable_name) &&
            (identical(other.billable_source_billable_number, billable_source_billable_number) || other.billable_source_billable_number == billable_source_billable_number) &&
            (identical(other.billable_source_billable_type, billable_source_billable_type) || other.billable_source_billable_type == billable_source_billable_type) &&
            (identical(other.billable_last_derived_billable_id, billable_last_derived_billable_id) || other.billable_last_derived_billable_id == billable_last_derived_billable_id) &&
            (identical(other.billable_last_derived_billable_name, billable_last_derived_billable_name) || other.billable_last_derived_billable_name == billable_last_derived_billable_name) &&
            (identical(other.billable_last_derived_billable_number, billable_last_derived_billable_number) || other.billable_last_derived_billable_number == billable_last_derived_billable_number) &&
            (identical(other.billable_last_derived_billable_type, billable_last_derived_billable_type) || other.billable_last_derived_billable_type == billable_last_derived_billable_type) &&
            const DeepCollectionEquality().equals(other._suppliers, _suppliers));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        billable_id,
        billable_type,
        billable_subscription_id,
        billable_subscription_public_name,
        billable_book_id,
        billable_book_number,
        billable_book_summary,
        billable_book_job_id,
        billable_job_id,
        billable_job_number,
        billable_job_name,
        billable_islocked,
        billable_created,
        billable_updated,
        billable_name,
        billable_number,
        billable_reference,
        billable_total,
        billable_invoiced_total,
        billable_not_billable_total,
        billable_invoiced_amount_remaining_total,
        billable_issent,
        billable_date_last_sent,
        billable_client_contact_id,
        billable_client_contact_name,
        billable_hardware_provider,
        const DeepCollectionEquality().hash(billable_supplier_billable_number),
        billable_order_status,
        const DeepCollectionEquality().hash(billable_order_submitted),
        billable_is_modified_after_submit,
        billable_isimported,
        billable_isaccepted,
        billable_total_payments,
        billable_total_creditnotes,
        billable_createdby_contact_id,
        billable_createdby_contact_name,
        const DeepCollectionEquality().hash(billable_synced_invoice_number),
        billable_accounting_provider_name,
        billable_synced_accounting_provider,
        billable_accounting_provider_name_display,
        billable_use_nm_invoice_numbers,
        billable_associated_record_type,
        billable_associated_record_id,
        billable_associated_record_name,
        billable_associated_record_number,
        billable_acceptance_response_date,
        billable_isdraft,
        billable_isfixed,
        billable_date_due,
        billable_date,
        const DeepCollectionEquality().hash(_recordlock),
        billable_is_added_to_charges,
        billable_has_files,
        billable_source_file,
        billable_source_billable_id,
        billable_source_billable_name,
        billable_source_billable_number,
        billable_source_billable_type,
        billable_last_derived_billable_id,
        billable_last_derived_billable_name,
        billable_last_derived_billable_number,
        billable_last_derived_billable_type,
        const DeepCollectionEquality().hash(_suppliers)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuoteItemDatumCopyWith<_$_QuoteItemDatum> get copyWith =>
      __$$_QuoteItemDatumCopyWithImpl<_$_QuoteItemDatum>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuoteItemDatumToJson(
      this,
    );
  }
}

abstract class _QuoteItemDatum implements QuoteItemDatum {
  const factory _QuoteItemDatum(
      {final int? billable_id,
      final String? billable_type,
      final int? billable_subscription_id,
      final String? billable_subscription_public_name,
      final int? billable_book_id,
      final String? billable_book_number,
      final String? billable_book_summary,
      final int? billable_book_job_id,
      final int? billable_job_id,
      final String? billable_job_number,
      final String? billable_job_name,
      final bool? billable_islocked,
      final DateTime? billable_created,
      final DateTime? billable_updated,
      final String? billable_name,
      final String? billable_number,
      final String? billable_reference,
      final double? billable_total,
      final double? billable_invoiced_total,
      final double? billable_not_billable_total,
      final double? billable_invoiced_amount_remaining_total,
      final bool? billable_issent,
      final DateTime? billable_date_last_sent,
      final int? billable_client_contact_id,
      final String? billable_client_contact_name,
      final String? billable_hardware_provider,
      final dynamic billable_supplier_billable_number,
      final int? billable_order_status,
      final dynamic billable_order_submitted,
      final bool? billable_is_modified_after_submit,
      final bool? billable_isimported,
      final bool? billable_isaccepted,
      final double? billable_total_payments,
      final double? billable_total_creditnotes,
      final int? billable_createdby_contact_id,
      final String? billable_createdby_contact_name,
      final dynamic billable_synced_invoice_number,
      final String? billable_accounting_provider_name,
      final String? billable_synced_accounting_provider,
      final String? billable_accounting_provider_name_display,
      final bool? billable_use_nm_invoice_numbers,
      final String? billable_associated_record_type,
      final int? billable_associated_record_id,
      final String? billable_associated_record_name,
      final String? billable_associated_record_number,
      final DateTime? billable_acceptance_response_date,
      final bool? billable_isdraft,
      final bool? billable_isfixed,
      final DateTime? billable_date_due,
      final DateTime? billable_date,
      final Map<String, dynamic>? recordlock,
      final bool? billable_is_added_to_charges,
      final bool? billable_has_files,
      final String? billable_source_file,
      final int? billable_source_billable_id,
      final String? billable_source_billable_name,
      final String? billable_source_billable_number,
      final String? billable_source_billable_type,
      final int? billable_last_derived_billable_id,
      final String? billable_last_derived_billable_name,
      final String? billable_last_derived_billable_number,
      final String? billable_last_derived_billable_type,
      final List<dynamic>? suppliers}) = _$_QuoteItemDatum;

  factory _QuoteItemDatum.fromJson(Map<String, dynamic> json) =
      _$_QuoteItemDatum.fromJson;

  @override
  int? get billable_id;
  @override
  String? get billable_type;
  @override
  int? get billable_subscription_id;
  @override
  String? get billable_subscription_public_name;
  @override
  int? get billable_book_id;
  @override
  String? get billable_book_number;
  @override
  String? get billable_book_summary;
  @override
  int? get billable_book_job_id;
  @override
  int? get billable_job_id;
  @override
  String? get billable_job_number;
  @override
  String? get billable_job_name;
  @override
  bool? get billable_islocked;
  @override
  DateTime? get billable_created;
  @override
  DateTime? get billable_updated;
  @override
  String? get billable_name;
  @override
  String? get billable_number;
  @override
  String? get billable_reference;
  @override
  double? get billable_total;
  @override
  double? get billable_invoiced_total;
  @override
  double? get billable_not_billable_total;
  @override
  double? get billable_invoiced_amount_remaining_total;
  @override
  bool? get billable_issent;
  @override
  DateTime? get billable_date_last_sent;
  @override
  int? get billable_client_contact_id;
  @override
  String? get billable_client_contact_name;
  @override
  String? get billable_hardware_provider;
  @override
  dynamic get billable_supplier_billable_number;
  @override
  int? get billable_order_status;
  @override
  dynamic get billable_order_submitted;
  @override
  bool? get billable_is_modified_after_submit;
  @override
  bool? get billable_isimported;
  @override
  bool? get billable_isaccepted;
  @override
  double? get billable_total_payments;
  @override
  double? get billable_total_creditnotes;
  @override
  int? get billable_createdby_contact_id;
  @override
  String? get billable_createdby_contact_name;
  @override
  dynamic get billable_synced_invoice_number;
  @override
  String? get billable_accounting_provider_name;
  @override
  String? get billable_synced_accounting_provider;
  @override
  String? get billable_accounting_provider_name_display;
  @override
  bool? get billable_use_nm_invoice_numbers;
  @override
  String? get billable_associated_record_type;
  @override
  int? get billable_associated_record_id;
  @override
  String? get billable_associated_record_name;
  @override
  String? get billable_associated_record_number;
  @override
  DateTime? get billable_acceptance_response_date;
  @override
  bool? get billable_isdraft;
  @override
  bool? get billable_isfixed;
  @override
  DateTime? get billable_date_due;
  @override
  DateTime? get billable_date;
  @override
  Map<String, dynamic>? get recordlock;
  @override
  bool? get billable_is_added_to_charges;
  @override
  bool? get billable_has_files;
  @override
  String? get billable_source_file;
  @override
  int? get billable_source_billable_id;
  @override
  String? get billable_source_billable_name;
  @override
  String? get billable_source_billable_number;
  @override
  String? get billable_source_billable_type;
  @override
  int? get billable_last_derived_billable_id;
  @override
  String? get billable_last_derived_billable_name;
  @override
  String? get billable_last_derived_billable_number;
  @override
  String? get billable_last_derived_billable_type;
  @override
  List<dynamic>? get suppliers;
  @override
  @JsonKey(ignore: true)
  _$$_QuoteItemDatumCopyWith<_$_QuoteItemDatum> get copyWith =>
      throw _privateConstructorUsedError;
}
