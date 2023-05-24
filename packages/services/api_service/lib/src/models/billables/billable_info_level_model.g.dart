// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'billable_info_level_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BillableInfoLevelModel _$$_BillableInfoLevelModelFromJson(
        Map<String, dynamic> json) =>
    _$_BillableInfoLevelModel(
      billable_id: json['billable_id'] as int?,
      billable_subscription_id: json['billable_subscription_id'] as int?,
      billable_subscription_public_name:
          json['billable_subscription_public_name'] as String?,
      billable_type: json['billable_type'] as String?,
      billable_book_id: json['billable_book_id'] as int?,
      billable_job_id: json['billable_job_id'] as int?,
      billable_islocked: json['billable_islocked'] as bool?,
      billable_created: json['billable_created'] == null
          ? null
          : DateTime.parse(json['billable_created'] as String),
      billable_updated: json['billable_updated'] == null
          ? null
          : DateTime.parse(json['billable_updated'] as String),
      billable_isdraft: json['billable_isdraft'] as bool?,
      billable_isfixed: json['billable_isfixed'] as bool?,
      billable_isdeleted: json['billable_isdeleted'] as bool?,
      recordlock: (json['recordlock'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      billable_synced_invoice_number: json['billable_synced_invoice_number'],
      billable_accounting_provider_name:
          json['billable_accounting_provider_name'] as String?,
      billable_accounting_provider_name_display:
          json['billable_accounting_provider_name_display'],
      billable_use_nm_invoice_numbers:
          json['billable_use_nm_invoice_numbers'] as bool?,
      billable_prompt_to_sync_invoices_on_send:
          json['billable_prompt_to_sync_invoices_on_send'] as bool?,
      billable_tax_name: json['billable_tax_name'] as String?,
      billable_hide_billable_totals:
          json['billable_hide_billable_totals'] as bool?,
      billable_associated_record_type:
          json['billable_associated_record_type'] as String?,
      billable_associated_record_id:
          json['billable_associated_record_id'] as int?,
      billable_associated_record_number:
          json['billable_associated_record_number'] as String?,
      billable_associated_record_name:
          json['billable_associated_record_name'] as String?,
      billable_job_number: json['billable_job_number'] as String?,
      billable_job_name: json['billable_job_name'] as String?,
      billable_job_order_number: json['billable_job_order_number'] as String?,
      billable_book_number: json['billable_book_number'] as String?,
      billable_book_summary: json['billable_book_summary'] as String?,
      billable_book_job_id: json['billable_book_job_id'] as int?,
      billable_book_job_order_number:
          json['billable_book_job_order_number'] as String?,
      book_client_contact_id: json['book_client_contact_id'] as int?,
      book_client_contact_name: json['book_client_contact_name'] as String?,
      billableItems: (json['billableItems'] as List<dynamic>?)
              ?.map((e) =>
                  BillableInfoLevelItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_BillableInfoLevelModelToJson(
        _$_BillableInfoLevelModel instance) =>
    <String, dynamic>{
      'billable_id': instance.billable_id,
      'billable_subscription_id': instance.billable_subscription_id,
      'billable_subscription_public_name':
          instance.billable_subscription_public_name,
      'billable_type': instance.billable_type,
      'billable_book_id': instance.billable_book_id,
      'billable_job_id': instance.billable_job_id,
      'billable_islocked': instance.billable_islocked,
      'billable_created': instance.billable_created?.toIso8601String(),
      'billable_updated': instance.billable_updated?.toIso8601String(),
      'billable_isdraft': instance.billable_isdraft,
      'billable_isfixed': instance.billable_isfixed,
      'billable_isdeleted': instance.billable_isdeleted,
      'recordlock': instance.recordlock,
      'billable_synced_invoice_number': instance.billable_synced_invoice_number,
      'billable_accounting_provider_name':
          instance.billable_accounting_provider_name,
      'billable_accounting_provider_name_display':
          instance.billable_accounting_provider_name_display,
      'billable_use_nm_invoice_numbers':
          instance.billable_use_nm_invoice_numbers,
      'billable_prompt_to_sync_invoices_on_send':
          instance.billable_prompt_to_sync_invoices_on_send,
      'billable_tax_name': instance.billable_tax_name,
      'billable_hide_billable_totals': instance.billable_hide_billable_totals,
      'billable_associated_record_type':
          instance.billable_associated_record_type,
      'billable_associated_record_id': instance.billable_associated_record_id,
      'billable_associated_record_number':
          instance.billable_associated_record_number,
      'billable_associated_record_name':
          instance.billable_associated_record_name,
      'billable_job_number': instance.billable_job_number,
      'billable_job_name': instance.billable_job_name,
      'billable_job_order_number': instance.billable_job_order_number,
      'billable_book_number': instance.billable_book_number,
      'billable_book_summary': instance.billable_book_summary,
      'billable_book_job_id': instance.billable_book_job_id,
      'billable_book_job_order_number': instance.billable_book_job_order_number,
      'book_client_contact_id': instance.book_client_contact_id,
      'book_client_contact_name': instance.book_client_contact_name,
      'billableItems': instance.billableItems,
    };

_$_BillableInfoLevelItem _$$_BillableInfoLevelItemFromJson(
        Map<String, dynamic> json) =>
    _$_BillableInfoLevelItem(
      billable_id: json['billable_id'] as int?,
      billable_type: json['billable_type'] as String?,
      billable_subscription_id: json['billable_subscription_id'] as int?,
      billable_subscription_public_name:
          json['billable_subscription_public_name'] as String?,
      billable_created: json['billable_created'] == null
          ? null
          : DateTime.parse(json['billable_created'] as String),
      billable_updated: json['billable_updated'] == null
          ? null
          : DateTime.parse(json['billable_updated'] as String),
      billable_number: json['billable_number'] as String?,
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
      billable_createdby_contact_id:
          json['billable_createdby_contact_id'] as int?,
      billable_createdby_contact_name:
          json['billable_createdby_contact_name'] as String?,
      billable_accounting_provider_name:
          json['billable_accounting_provider_name'] as String?,
      billable_use_nm_invoice_numbers:
          json['billable_use_nm_invoice_numbers'] as bool?,
      billable_date_due: json['billable_date_due'] == null
          ? null
          : DateTime.parse(json['billable_date_due'] as String),
      billable_date: json['billable_date'] == null
          ? null
          : DateTime.parse(json['billable_date'] as String),
      billable_is_added_to_charges:
          json['billable_is_added_to_charges'] as bool?,
      billable_has_files: json['billable_has_files'] as bool?,
      billableitem_id: json['billableitem_id'] as int?,
      billableitem_uid: json['billableitem_uid'],
      billableitem_billable_id: json['billableitem_billable_id'] as int?,
      billableitem_billablesection_id:
          json['billableitem_billablesection_id'] as int?,
      billableitem_subscription_id:
          json['billableitem_subscription_id'] as int?,
      billableitem_order: json['billableitem_order'] as int?,
      billableitem_billable_book_id:
          json['billableitem_billable_book_id'] as int?,
      billableitem_billable_book_number:
          json['billableitem_billable_book_number'] as String?,
      billableitem_billable_book_summary:
          json['billableitem_billable_book_summary'] as String?,
      billableitem_billable_job_id:
          json['billableitem_billable_job_id'] as int?,
      billableitem_billable_job_number:
          json['billableitem_billable_job_number'] as String?,
      billableitem_billable_job_name:
          json['billableitem_billable_job_name'] as String?,
      billableitem_istime: json['billableitem_istime'] as bool?,
      billableitem_isproduct: json['billableitem_isproduct'] as bool?,
      billableitem_isdisbursement: json['billableitem_isdisbursement'] as bool?,
      billableitem_quantity:
          (json['billableitem_quantity'] as num?)?.toDouble(),
      billableitem_saleitem_id: json['billableitem_saleitem_id'] as int?,
      billableitem_name: json['billableitem_name'] as String?,
      billableitem_code: json['billableitem_code'] as String?,
      billableitem_supplier_code: json['billableitem_supplier_code'] as String?,
      billableitem_description: json['billableitem_description'] as String?,
      billableitem_buy_price:
          (json['billableitem_buy_price'] as num?)?.toDouble(),
      billableitem_actual_buy_price:
          (json['billableitem_actual_buy_price'] as num?)?.toDouble(),
      billableitem_sell_price:
          (json['billableitem_sell_price'] as num?)?.toDouble(),
      billableitem_actual_sell_price:
          (json['billableitem_actual_sell_price'] as num?)?.toDouble(),
      billableitem_list_buy_price:
          (json['billableitem_list_buy_price'] as num?)?.toDouble(),
      billableitem_list_sell_price:
          (json['billableitem_list_sell_price'] as num?)?.toDouble(),
      billableitem_list_price_date: json['billableitem_list_price_date'] == null
          ? null
          : DateTime.parse(json['billableitem_list_price_date'] as String),
      billableitem_buy_discount_rate:
          (json['billableitem_buy_discount_rate'] as num?)?.toDouble(),
      billableitem_sell_discount_rate:
          (json['billableitem_sell_discount_rate'] as num?)?.toDouble(),
      billableitem_markup_rate:
          (json['billableitem_markup_rate'] as num?)?.toDouble(),
      billableitem_buy_subtotal:
          (json['billableitem_buy_subtotal'] as num?)?.toDouble(),
      billableitem_sell_subtotal:
          (json['billableitem_sell_subtotal'] as num?)?.toDouble(),
      billableitem_unit_string: json['billableitem_unit_string'] as String?,
      billableitem_currency: json['billableitem_currency'] as String?,
      billableitem_taxrate_id: json['billableitem_taxrate_id'] as int?,
      billableitem_taxrate_rate:
          (json['billableitem_taxrate_rate'] as num?)?.toDouble(),
      billableitem_taxrate_is_valid:
          json['billableitem_taxrate_is_valid'] as bool?,
      billableitem_saleitem_categories:
          json['billableitem_saleitem_categories'] as List<dynamic>?,
      billableitem_supplier_contact_id:
          json['billableitem_supplier_contact_id'] as int?,
      billableitem_supplier_contact_name:
          json['billableitem_supplier_contact_name'] as String?,
      billableitem_is_from_hardware_provider:
          json['billableitem_is_from_hardware_provider'] as bool?,
      billableitem_is_locally_saved_product:
          json['billableitem_is_locally_saved_product'] as bool?,
      billableitem_start: json['billableitem_start'] == null
          ? null
          : DateTime.parse(json['billableitem_start'] as String),
      billableitem_start_address: json['billableitem_start_address'],
      billableitem_start_location: json['billableitem_start_location'],
      billableitem_end: json['billableitem_end'] == null
          ? null
          : DateTime.parse(json['billableitem_end'] as String),
      billableitem_end_address: json['billableitem_end_address'],
      billableitem_end_location: json['billableitem_end_location'],
      billableitem_istime_range: json['billableitem_istime_range'] as bool?,
      billableitem_isactual_times: json['billableitem_isactual_times'] as bool?,
      billableitem_isbillable: json['billableitem_isbillable'] as bool?,
      billableitem_ismanually_invoiced:
          json['billableitem_ismanually_invoiced'] as bool?,
      billableitem_manual_invoice_id: json['billableitem_manual_invoice_id'],
      billableitem_manual_invoice_number:
          json['billableitem_manual_invoice_number'],
      billableitem_manual_invoice_date:
          json['billableitem_manual_invoice_date'] == null
              ? null
              : DateTime.parse(
                  json['billableitem_manual_invoice_date'] as String),
      billableitem_type: json['billableitem_type'] as String?,
      billableitem_islinked: json['billableitem_islinked'] as bool?,
      billableitem_source_billableitem_id:
          json['billableitem_source_billableitem_id'] as int?,
      billableitem_source_billableitem_billable_id:
          json['billableitem_source_billableitem_billable_id'] as int?,
      billableitem_source_billableitem_billable_type:
          json['billableitem_source_billableitem_billable_type'],
      billableitem_source_billableitem_billable_number:
          json['billableitem_source_billableitem_billable_number'],
      billableitem_ordered_total: json['billableitem_ordered_total'],
      billableitem_invoiced_total:
          (json['billableitem_invoiced_total'] as num?)?.toDouble(),
      target_billableitem_summaries:
          (json['target_billableitem_summaries'] as List<dynamic>?)
              ?.map((e) =>
                  TargetBillableitemSummary.fromJson(e as Map<String, dynamic>))
              .toList(),
      billableitem_created_by_contact_name_display:
          json['billableitem_created_by_contact_name_display'] as String?,
      billableitem_created_date: json['billableitem_created_date'] == null
          ? null
          : DateTime.parse(json['billableitem_created_date'] as String),
      billableitem_updated_by_contact_name_display:
          json['billableitem_updated_by_contact_name_display'] as String?,
      billableitem_updated_date: json['billableitem_updated_date'] == null
          ? null
          : DateTime.parse(json['billableitem_updated_date'] as String),
      billableitem_contact_id: json['billableitem_contact_id'] as int?,
      billableitem_contact_name_display:
          json['billableitem_contact_name_display'] as String?,
      billableitem_entry_type: json['billableitem_entry_type'] as String?,
      billableitem_isexcluded_timesheet_entry:
          json['billableitem_isexcluded_timesheet_entry'] as bool?,
      billableitem_is_length_breakdown:
          json['billableitem_is_length_breakdown'],
      lengthBreakdowns: json['lengthBreakdowns'] as List<dynamic>?,
    );

Map<String, dynamic> _$$_BillableInfoLevelItemToJson(
        _$_BillableInfoLevelItem instance) =>
    <String, dynamic>{
      'billable_id': instance.billable_id,
      'billable_type': instance.billable_type,
      'billable_subscription_id': instance.billable_subscription_id,
      'billable_subscription_public_name':
          instance.billable_subscription_public_name,
      'billable_created': instance.billable_created?.toIso8601String(),
      'billable_updated': instance.billable_updated?.toIso8601String(),
      'billable_number': instance.billable_number,
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
      'billable_createdby_contact_id': instance.billable_createdby_contact_id,
      'billable_createdby_contact_name':
          instance.billable_createdby_contact_name,
      'billable_accounting_provider_name':
          instance.billable_accounting_provider_name,
      'billable_use_nm_invoice_numbers':
          instance.billable_use_nm_invoice_numbers,
      'billable_date_due': instance.billable_date_due?.toIso8601String(),
      'billable_date': instance.billable_date?.toIso8601String(),
      'billable_is_added_to_charges': instance.billable_is_added_to_charges,
      'billable_has_files': instance.billable_has_files,
      'billableitem_id': instance.billableitem_id,
      'billableitem_uid': instance.billableitem_uid,
      'billableitem_billable_id': instance.billableitem_billable_id,
      'billableitem_billablesection_id':
          instance.billableitem_billablesection_id,
      'billableitem_subscription_id': instance.billableitem_subscription_id,
      'billableitem_order': instance.billableitem_order,
      'billableitem_billable_book_id': instance.billableitem_billable_book_id,
      'billableitem_billable_book_number':
          instance.billableitem_billable_book_number,
      'billableitem_billable_book_summary':
          instance.billableitem_billable_book_summary,
      'billableitem_billable_job_id': instance.billableitem_billable_job_id,
      'billableitem_billable_job_number':
          instance.billableitem_billable_job_number,
      'billableitem_billable_job_name': instance.billableitem_billable_job_name,
      'billableitem_istime': instance.billableitem_istime,
      'billableitem_isproduct': instance.billableitem_isproduct,
      'billableitem_isdisbursement': instance.billableitem_isdisbursement,
      'billableitem_quantity': instance.billableitem_quantity,
      'billableitem_saleitem_id': instance.billableitem_saleitem_id,
      'billableitem_name': instance.billableitem_name,
      'billableitem_code': instance.billableitem_code,
      'billableitem_supplier_code': instance.billableitem_supplier_code,
      'billableitem_description': instance.billableitem_description,
      'billableitem_buy_price': instance.billableitem_buy_price,
      'billableitem_actual_buy_price': instance.billableitem_actual_buy_price,
      'billableitem_sell_price': instance.billableitem_sell_price,
      'billableitem_actual_sell_price': instance.billableitem_actual_sell_price,
      'billableitem_list_buy_price': instance.billableitem_list_buy_price,
      'billableitem_list_sell_price': instance.billableitem_list_sell_price,
      'billableitem_list_price_date':
          instance.billableitem_list_price_date?.toIso8601String(),
      'billableitem_buy_discount_rate': instance.billableitem_buy_discount_rate,
      'billableitem_sell_discount_rate':
          instance.billableitem_sell_discount_rate,
      'billableitem_markup_rate': instance.billableitem_markup_rate,
      'billableitem_buy_subtotal': instance.billableitem_buy_subtotal,
      'billableitem_sell_subtotal': instance.billableitem_sell_subtotal,
      'billableitem_unit_string': instance.billableitem_unit_string,
      'billableitem_currency': instance.billableitem_currency,
      'billableitem_taxrate_id': instance.billableitem_taxrate_id,
      'billableitem_taxrate_rate': instance.billableitem_taxrate_rate,
      'billableitem_taxrate_is_valid': instance.billableitem_taxrate_is_valid,
      'billableitem_saleitem_categories':
          instance.billableitem_saleitem_categories,
      'billableitem_supplier_contact_id':
          instance.billableitem_supplier_contact_id,
      'billableitem_supplier_contact_name':
          instance.billableitem_supplier_contact_name,
      'billableitem_is_from_hardware_provider':
          instance.billableitem_is_from_hardware_provider,
      'billableitem_is_locally_saved_product':
          instance.billableitem_is_locally_saved_product,
      'billableitem_start': instance.billableitem_start?.toIso8601String(),
      'billableitem_start_address': instance.billableitem_start_address,
      'billableitem_start_location': instance.billableitem_start_location,
      'billableitem_end': instance.billableitem_end?.toIso8601String(),
      'billableitem_end_address': instance.billableitem_end_address,
      'billableitem_end_location': instance.billableitem_end_location,
      'billableitem_istime_range': instance.billableitem_istime_range,
      'billableitem_isactual_times': instance.billableitem_isactual_times,
      'billableitem_isbillable': instance.billableitem_isbillable,
      'billableitem_ismanually_invoiced':
          instance.billableitem_ismanually_invoiced,
      'billableitem_manual_invoice_id': instance.billableitem_manual_invoice_id,
      'billableitem_manual_invoice_number':
          instance.billableitem_manual_invoice_number,
      'billableitem_manual_invoice_date':
          instance.billableitem_manual_invoice_date?.toIso8601String(),
      'billableitem_type': instance.billableitem_type,
      'billableitem_islinked': instance.billableitem_islinked,
      'billableitem_source_billableitem_id':
          instance.billableitem_source_billableitem_id,
      'billableitem_source_billableitem_billable_id':
          instance.billableitem_source_billableitem_billable_id,
      'billableitem_source_billableitem_billable_type':
          instance.billableitem_source_billableitem_billable_type,
      'billableitem_source_billableitem_billable_number':
          instance.billableitem_source_billableitem_billable_number,
      'billableitem_ordered_total': instance.billableitem_ordered_total,
      'billableitem_invoiced_total': instance.billableitem_invoiced_total,
      'target_billableitem_summaries': instance.target_billableitem_summaries,
      'billableitem_created_by_contact_name_display':
          instance.billableitem_created_by_contact_name_display,
      'billableitem_created_date':
          instance.billableitem_created_date?.toIso8601String(),
      'billableitem_updated_by_contact_name_display':
          instance.billableitem_updated_by_contact_name_display,
      'billableitem_updated_date':
          instance.billableitem_updated_date?.toIso8601String(),
      'billableitem_contact_id': instance.billableitem_contact_id,
      'billableitem_contact_name_display':
          instance.billableitem_contact_name_display,
      'billableitem_entry_type': instance.billableitem_entry_type,
      'billableitem_isexcluded_timesheet_entry':
          instance.billableitem_isexcluded_timesheet_entry,
      'billableitem_is_length_breakdown':
          instance.billableitem_is_length_breakdown,
      'lengthBreakdowns': instance.lengthBreakdowns,
    };

_$_TargetBillableitemSummary _$$_TargetBillableitemSummaryFromJson(
        Map<String, dynamic> json) =>
    _$_TargetBillableitemSummary(
      billableitem_id: json['billableitem_id'] as int?,
      billableitem_subtotal:
          (json['billableitem_subtotal'] as num?)?.toDouble(),
      billableitem_billable_id: json['billableitem_billable_id'] as int?,
      billableitem_billable_type: json['billableitem_billable_type'] as String?,
      billableitem_billable_number:
          json['billableitem_billable_number'] as String?,
      billableitem_billable_date: json['billableitem_billable_date'] == null
          ? null
          : DateTime.parse(json['billableitem_billable_date'] as String),
    );

Map<String, dynamic> _$$_TargetBillableitemSummaryToJson(
        _$_TargetBillableitemSummary instance) =>
    <String, dynamic>{
      'billableitem_id': instance.billableitem_id,
      'billableitem_subtotal': instance.billableitem_subtotal,
      'billableitem_billable_id': instance.billableitem_billable_id,
      'billableitem_billable_type': instance.billableitem_billable_type,
      'billableitem_billable_number': instance.billableitem_billable_number,
      'billableitem_billable_date':
          instance.billableitem_billable_date?.toIso8601String(),
    };
