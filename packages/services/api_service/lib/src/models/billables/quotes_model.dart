import 'package:freezed_annotation/freezed_annotation.dart';

part 'quotes_model.freezed.dart';
part 'quotes_model.g.dart';

@freezed
class QuotesModel with _$QuotesModel {
  const factory QuotesModel({
    int? totalAll,
    int? total,
    List<QuoteItemDatum>? data,
    DateTime? lastModified,
  }) = _QuotesModel;

  factory QuotesModel.fromJson(Map<String, Object?> json) =>
      _$QuotesModelFromJson(json);
}

@freezed
class QuoteItemDatum with _$QuoteItemDatum {
  const factory QuoteItemDatum({
    int? billable_id,
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
    List<dynamic>? suppliers,
  }) = _QuoteItemDatum;

  factory QuoteItemDatum.fromJson(Map<String, Object?> json) =>
      _$QuoteItemDatumFromJson(json);
}
