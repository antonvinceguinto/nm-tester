// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quotes_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_QuotesModel _$$_QuotesModelFromJson(Map<String, dynamic> json) =>
    _$_QuotesModel(
      totalAll: json['totalAll'] as int?,
      total: json['total'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => QuoteItemDatum.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastModified: json['lastModified'] == null
          ? null
          : DateTime.parse(json['lastModified'] as String),
    );

Map<String, dynamic> _$$_QuotesModelToJson(_$_QuotesModel instance) =>
    <String, dynamic>{
      'totalAll': instance.totalAll,
      'total': instance.total,
      'data': instance.data,
      'lastModified': instance.lastModified?.toIso8601String(),
    };

_$_QuoteItemDatum _$$_QuoteItemDatumFromJson(Map<String, dynamic> json) =>
    _$_QuoteItemDatum(
      billable_id: json['billable_id'] as int?,
      billable_type: json['billable_type'] as String?,
      billable_subscription_id: json['billable_subscription_id'] as int?,
      billable_subscription_public_name:
          json['billable_subscription_public_name'] as String?,
      billable_book_id: json['billable_book_id'] as int?,
      billable_book_number: json['billable_book_number'] as String?,
      billable_book_summary: json['billable_book_summary'] as String?,
      billable_book_job_id: json['billable_book_job_id'] as int?,
      billable_job_id: json['billable_job_id'] as int?,
      billable_job_number: json['billable_job_number'] as String?,
      billable_job_name: json['billable_job_name'] as String?,
      billable_islocked: json['billable_islocked'] as bool?,
      billable_created: json['billable_created'] == null
          ? null
          : DateTime.parse(json['billable_created'] as String),
      billable_updated: json['billable_updated'] == null
          ? null
          : DateTime.parse(json['billable_updated'] as String),
      billable_name: json['billable_name'] as String?,
      billable_number: json['billable_number'] as String?,
      billable_reference: json['billable_reference'] as String?,
      billable_total: (json['billable_total'] as num?)?.toDouble(),
      billable_invoiced_total:
          (json['billable_invoiced_total'] as num?)?.toDouble(),
      billable_not_billable_total:
          (json['billable_not_billable_total'] as num?)?.toDouble(),
      billable_invoiced_amount_remaining_total:
          (json['billable_invoiced_amount_remaining_total'] as num?)
              ?.toDouble(),
      billable_issent: json['billable_issent'] as bool?,
      billable_date_last_sent: json['billable_date_last_sent'] == null
          ? null
          : DateTime.parse(json['billable_date_last_sent'] as String),
      billable_client_contact_id: json['billable_client_contact_id'] as int?,
      billable_client_contact_name:
          json['billable_client_contact_name'] as String?,
      billable_hardware_provider: json['billable_hardware_provider'] as String?,
      billable_supplier_billable_number:
          json['billable_supplier_billable_number'],
      billable_order_status: json['billable_order_status'] as int?,
      billable_order_submitted: json['billable_order_submitted'],
      billable_is_modified_after_submit:
          json['billable_is_modified_after_submit'] as bool?,
      billable_isimported: json['billable_isimported'] as bool?,
      billable_isaccepted: json['billable_isaccepted'] as bool?,
      billable_total_payments:
          (json['billable_total_payments'] as num?)?.toDouble(),
      billable_total_creditnotes:
          (json['billable_total_creditnotes'] as num?)?.toDouble(),
      billable_createdby_contact_id:
          json['billable_createdby_contact_id'] as int?,
      billable_createdby_contact_name:
          json['billable_createdby_contact_name'] as String?,
      billable_synced_invoice_number: json['billable_synced_invoice_number'],
      billable_accounting_provider_name:
          json['billable_accounting_provider_name'] as String?,
      billable_synced_accounting_provider:
          json['billable_synced_accounting_provider'] as String?,
      billable_accounting_provider_name_display:
          json['billable_accounting_provider_name_display'] as String?,
      billable_use_nm_invoice_numbers:
          json['billable_use_nm_invoice_numbers'] as bool?,
      billable_associated_record_type:
          json['billable_associated_record_type'] as String?,
      billable_associated_record_id:
          json['billable_associated_record_id'] as int?,
      billable_associated_record_name:
          json['billable_associated_record_name'] as String?,
      billable_associated_record_number:
          json['billable_associated_record_number'] as String?,
      billable_acceptance_response_date:
          json['billable_acceptance_response_date'] == null
              ? null
              : DateTime.parse(
                  json['billable_acceptance_response_date'] as String),
      billable_isdraft: json['billable_isdraft'] as bool?,
      billable_isfixed: json['billable_isfixed'] as bool?,
      billable_date_due: json['billable_date_due'] == null
          ? null
          : DateTime.parse(json['billable_date_due'] as String),
      billable_date: json['billable_date'] == null
          ? null
          : DateTime.parse(json['billable_date'] as String),
      recordlock: json['recordlock'] as Map<String, dynamic>?,
      billable_is_added_to_charges:
          json['billable_is_added_to_charges'] as bool?,
      billable_has_files: json['billable_has_files'] as bool?,
      billable_source_file: json['billable_source_file'] as String?,
      billable_source_billable_id: json['billable_source_billable_id'] as int?,
      billable_source_billable_name:
          json['billable_source_billable_name'] as String?,
      billable_source_billable_number:
          json['billable_source_billable_number'] as String?,
      billable_source_billable_type:
          json['billable_source_billable_type'] as String?,
      billable_last_derived_billable_id:
          json['billable_last_derived_billable_id'] as int?,
      billable_last_derived_billable_name:
          json['billable_last_derived_billable_name'] as String?,
      billable_last_derived_billable_number:
          json['billable_last_derived_billable_number'] as String?,
      billable_last_derived_billable_type:
          json['billable_last_derived_billable_type'] as String?,
      suppliers: json['suppliers'] as List<dynamic>?,
    );

Map<String, dynamic> _$$_QuoteItemDatumToJson(_$_QuoteItemDatum instance) =>
    <String, dynamic>{
      'billable_id': instance.billable_id,
      'billable_type': instance.billable_type,
      'billable_subscription_id': instance.billable_subscription_id,
      'billable_subscription_public_name':
          instance.billable_subscription_public_name,
      'billable_book_id': instance.billable_book_id,
      'billable_book_number': instance.billable_book_number,
      'billable_book_summary': instance.billable_book_summary,
      'billable_book_job_id': instance.billable_book_job_id,
      'billable_job_id': instance.billable_job_id,
      'billable_job_number': instance.billable_job_number,
      'billable_job_name': instance.billable_job_name,
      'billable_islocked': instance.billable_islocked,
      'billable_created': instance.billable_created?.toIso8601String(),
      'billable_updated': instance.billable_updated?.toIso8601String(),
      'billable_name': instance.billable_name,
      'billable_number': instance.billable_number,
      'billable_reference': instance.billable_reference,
      'billable_total': instance.billable_total,
      'billable_invoiced_total': instance.billable_invoiced_total,
      'billable_not_billable_total': instance.billable_not_billable_total,
      'billable_invoiced_amount_remaining_total':
          instance.billable_invoiced_amount_remaining_total,
      'billable_issent': instance.billable_issent,
      'billable_date_last_sent':
          instance.billable_date_last_sent?.toIso8601String(),
      'billable_client_contact_id': instance.billable_client_contact_id,
      'billable_client_contact_name': instance.billable_client_contact_name,
      'billable_hardware_provider': instance.billable_hardware_provider,
      'billable_supplier_billable_number':
          instance.billable_supplier_billable_number,
      'billable_order_status': instance.billable_order_status,
      'billable_order_submitted': instance.billable_order_submitted,
      'billable_is_modified_after_submit':
          instance.billable_is_modified_after_submit,
      'billable_isimported': instance.billable_isimported,
      'billable_isaccepted': instance.billable_isaccepted,
      'billable_total_payments': instance.billable_total_payments,
      'billable_total_creditnotes': instance.billable_total_creditnotes,
      'billable_createdby_contact_id': instance.billable_createdby_contact_id,
      'billable_createdby_contact_name':
          instance.billable_createdby_contact_name,
      'billable_synced_invoice_number': instance.billable_synced_invoice_number,
      'billable_accounting_provider_name':
          instance.billable_accounting_provider_name,
      'billable_synced_accounting_provider':
          instance.billable_synced_accounting_provider,
      'billable_accounting_provider_name_display':
          instance.billable_accounting_provider_name_display,
      'billable_use_nm_invoice_numbers':
          instance.billable_use_nm_invoice_numbers,
      'billable_associated_record_type':
          instance.billable_associated_record_type,
      'billable_associated_record_id': instance.billable_associated_record_id,
      'billable_associated_record_name':
          instance.billable_associated_record_name,
      'billable_associated_record_number':
          instance.billable_associated_record_number,
      'billable_acceptance_response_date':
          instance.billable_acceptance_response_date?.toIso8601String(),
      'billable_isdraft': instance.billable_isdraft,
      'billable_isfixed': instance.billable_isfixed,
      'billable_date_due': instance.billable_date_due?.toIso8601String(),
      'billable_date': instance.billable_date?.toIso8601String(),
      'recordlock': instance.recordlock,
      'billable_is_added_to_charges': instance.billable_is_added_to_charges,
      'billable_has_files': instance.billable_has_files,
      'billable_source_file': instance.billable_source_file,
      'billable_source_billable_id': instance.billable_source_billable_id,
      'billable_source_billable_name': instance.billable_source_billable_name,
      'billable_source_billable_number':
          instance.billable_source_billable_number,
      'billable_source_billable_type': instance.billable_source_billable_type,
      'billable_last_derived_billable_id':
          instance.billable_last_derived_billable_id,
      'billable_last_derived_billable_name':
          instance.billable_last_derived_billable_name,
      'billable_last_derived_billable_number':
          instance.billable_last_derived_billable_number,
      'billable_last_derived_billable_type':
          instance.billable_last_derived_billable_type,
      'suppliers': instance.suppliers,
    };
