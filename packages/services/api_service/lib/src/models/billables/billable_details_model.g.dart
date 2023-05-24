// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'billable_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BillableDetailsModel _$$_BillableDetailsModelFromJson(
        Map<String, dynamic> json) =>
    _$_BillableDetailsModel(
      billable_id: json['billable_id'] as int?,
      billable_subscription_id: json['billable_subscription_id'] as int?,
      billable_subscription_public_name:
          json['billable_subscription_public_name'] as String?,
      billable_type: json['billable_type'] as String?,
      billable_book_id: json['billable_book_id'],
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
      recordlock: json['recordlock'] == null
          ? null
          : Recordlock.fromJson(json['recordlock'] as Map<String, dynamic>),
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
      billable_job_order_number: json['billable_job_order_number'],
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
      billable_date_last_sent: json['billable_date_last_sent'],
      billable_client_contact_id: json['billable_client_contact_id'],
      billable_client_contact_name: json['billable_client_contact_name'],
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
      billable_updatedby_contact_id:
          json['billable_updatedby_contact_id'] as int?,
      billable_is_added_to_charges:
          json['billable_is_added_to_charges'] as bool?,
      billable_has_linked_bookings:
          json['billable_has_linked_bookings'] as bool?,
      billable_job_has_unlinked_bookings:
          json['billable_job_has_unlinked_bookings'] as bool?,
      BillableReferenceMultiLine: json['BillableReferenceMultiLine'] as String?,
      billable_notes: json['billable_notes'],
      billable_header_notes: json['billable_header_notes'] as String?,
      billable_footer_notes: json['billable_footer_notes'] as String?,
      billable_cover_page: json['billable_cover_page'],
      billable_terms_and_conditions_page:
          json['billable_terms_and_conditions_page'],
      billable_date: json['billable_date'] == null
          ? null
          : DateTime.parse(json['billable_date'] as String),
      billable_date_due: json['billable_date_due'] == null
          ? null
          : DateTime.parse(json['billable_date_due'] as String),
      billable_client_contact_address: json['billable_client_contact_address'],
      billable_client_contact_address_coords:
          json['billable_client_contact_address_coords'],
      billable_supplier_billable_number:
          json['billable_supplier_billable_number'],
      billable_order_status: json['billable_order_status'] as int?,
      billable_order_submitted: json['billable_order_submitted'],
      billable_is_modified_after_submit:
          json['billable_is_modified_after_submit'] as bool?,
      billable_delivery_details: json['billable_delivery_details'],
      billable_delivery_vehicletype_id:
          json['billable_delivery_vehicletype_id'] as int?,
      billable_delivery_vehicletype_name:
          json['billable_delivery_vehicletype_name'],
      billable_delivery_time_preference:
          json['billable_delivery_time_preference'],
      billable_job_address: json['billable_job_address'] as String?,
      billable_job_address_coords: json['billable_job_address_coords'],
      billable_acceptance_response_notes:
          json['billable_acceptance_response_notes'],
      billable_acceptance_response_date:
          json['billable_acceptance_response_date'],
      billable_acceptanceby_contact_email:
          json['billable_acceptanceby_contact_email'],
      billable_acceptanceby_contact_id:
          json['billable_acceptanceby_contact_id'],
      billable_acceptanceby_contact_name_display:
          json['billable_acceptanceby_contact_name_display'],
      billable_fully_paidby_contact_name_display:
          json['billable_fully_paidby_contact_name_display'],
      billable_date_fully_paid: json['billable_date_fully_paid'],
      billable_acceptanceby_contact_mobile:
          json['billable_acceptanceby_contact_mobile'],
      billable_sentby_contact_name_display:
          json['billable_sentby_contact_name_display'],
      billable_purchases_provider_account_id:
          json['billable_purchases_provider_account_id'],
      billable_purchases_provider_account_name:
          json['billable_purchases_provider_account_name'],
      billable_source_billable_id: json['billable_source_billable_id'] as int?,
      billable_source_billable_name:
          json['billable_source_billable_name'] as String?,
      billable_source_billable_number:
          json['billable_source_billable_number'] as String?,
      billable_source_billable_type:
          json['billable_source_billable_type'] as String?,
      billable_hardware_provider: json['billable_hardware_provider'],
      suppliers: json['suppliers'] as List<dynamic>? ?? const [],
      billableItems: (json['billableItems'] as List<dynamic>?)
              ?.map((e) =>
                  BillableInfoLevelItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      sections: (json['sections'] as List<dynamic>?)
              ?.map((e) => BillableSection.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      associatedContacts: (json['associatedContacts'] as List<dynamic>?)
              ?.map(
                  (e) => AssociatedContact.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      clientContact: json['clientContact'],
      subscription: json['subscription'] == null
          ? null
          : BillableSubscription.fromJson(
              json['subscription'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_BillableDetailsModelToJson(
        _$_BillableDetailsModel instance) =>
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
      'billable_name': instance.billable_name,
      'billable_number': instance.billable_number,
      'billable_reference': instance.billable_reference,
      'billable_total': instance.billable_total,
      'billable_invoiced_total': instance.billable_invoiced_total,
      'billable_not_billable_total': instance.billable_not_billable_total,
      'billable_invoiced_amount_remaining_total':
          instance.billable_invoiced_amount_remaining_total,
      'billable_issent': instance.billable_issent,
      'billable_date_last_sent': instance.billable_date_last_sent,
      'billable_client_contact_id': instance.billable_client_contact_id,
      'billable_client_contact_name': instance.billable_client_contact_name,
      'billable_isimported': instance.billable_isimported,
      'billable_isaccepted': instance.billable_isaccepted,
      'billable_total_payments': instance.billable_total_payments,
      'billable_total_creditnotes': instance.billable_total_creditnotes,
      'billable_createdby_contact_id': instance.billable_createdby_contact_id,
      'billable_createdby_contact_name':
          instance.billable_createdby_contact_name,
      'billable_updatedby_contact_id': instance.billable_updatedby_contact_id,
      'billable_is_added_to_charges': instance.billable_is_added_to_charges,
      'billable_has_linked_bookings': instance.billable_has_linked_bookings,
      'billable_job_has_unlinked_bookings':
          instance.billable_job_has_unlinked_bookings,
      'BillableReferenceMultiLine': instance.BillableReferenceMultiLine,
      'billable_notes': instance.billable_notes,
      'billable_header_notes': instance.billable_header_notes,
      'billable_footer_notes': instance.billable_footer_notes,
      'billable_cover_page': instance.billable_cover_page,
      'billable_terms_and_conditions_page':
          instance.billable_terms_and_conditions_page,
      'billable_date': instance.billable_date?.toIso8601String(),
      'billable_date_due': instance.billable_date_due?.toIso8601String(),
      'billable_client_contact_address':
          instance.billable_client_contact_address,
      'billable_client_contact_address_coords':
          instance.billable_client_contact_address_coords,
      'billable_supplier_billable_number':
          instance.billable_supplier_billable_number,
      'billable_order_status': instance.billable_order_status,
      'billable_order_submitted': instance.billable_order_submitted,
      'billable_is_modified_after_submit':
          instance.billable_is_modified_after_submit,
      'billable_delivery_details': instance.billable_delivery_details,
      'billable_delivery_vehicletype_id':
          instance.billable_delivery_vehicletype_id,
      'billable_delivery_vehicletype_name':
          instance.billable_delivery_vehicletype_name,
      'billable_delivery_time_preference':
          instance.billable_delivery_time_preference,
      'billable_job_address': instance.billable_job_address,
      'billable_job_address_coords': instance.billable_job_address_coords,
      'billable_acceptance_response_notes':
          instance.billable_acceptance_response_notes,
      'billable_acceptance_response_date':
          instance.billable_acceptance_response_date,
      'billable_acceptanceby_contact_email':
          instance.billable_acceptanceby_contact_email,
      'billable_acceptanceby_contact_id':
          instance.billable_acceptanceby_contact_id,
      'billable_acceptanceby_contact_name_display':
          instance.billable_acceptanceby_contact_name_display,
      'billable_fully_paidby_contact_name_display':
          instance.billable_fully_paidby_contact_name_display,
      'billable_date_fully_paid': instance.billable_date_fully_paid,
      'billable_acceptanceby_contact_mobile':
          instance.billable_acceptanceby_contact_mobile,
      'billable_sentby_contact_name_display':
          instance.billable_sentby_contact_name_display,
      'billable_purchases_provider_account_id':
          instance.billable_purchases_provider_account_id,
      'billable_purchases_provider_account_name':
          instance.billable_purchases_provider_account_name,
      'billable_source_billable_id': instance.billable_source_billable_id,
      'billable_source_billable_name': instance.billable_source_billable_name,
      'billable_source_billable_number':
          instance.billable_source_billable_number,
      'billable_source_billable_type': instance.billable_source_billable_type,
      'billable_hardware_provider': instance.billable_hardware_provider,
      'suppliers': instance.suppliers,
      'billableItems': instance.billableItems,
      'sections': instance.sections,
      'associatedContacts': instance.associatedContacts,
      'clientContact': instance.clientContact,
      'subscription': instance.subscription,
    };

_$_AssociatedContact _$$_AssociatedContactFromJson(Map<String, dynamic> json) =>
    _$_AssociatedContact(
      contact_id: json['contact_id'] as int?,
      contact_email: json['contact_email'] as String?,
      contact_name_display: json['contact_name_display'] as String?,
    );

Map<String, dynamic> _$$_AssociatedContactToJson(
        _$_AssociatedContact instance) =>
    <String, dynamic>{
      'contact_id': instance.contact_id,
      'contact_email': instance.contact_email,
      'contact_name_display': instance.contact_name_display,
    };

_$_Recordlock _$$_RecordlockFromJson(Map<String, dynamic> json) =>
    _$_Recordlock(
      recordlock_id: json['recordlock_id'] as String?,
      recordlock_table: json['recordlock_table'] as String?,
      recordlock_record_id: json['recordlock_record_id'] as int?,
      recordlock_date_locked: json['recordlock_date_locked'] == null
          ? null
          : DateTime.parse(json['recordlock_date_locked'] as String),
      recordlock_lockedby_contact_name_display:
          json['recordlock_lockedby_contact_name_display'] as String?,
      recordlock_is_lockedby_current_user:
          json['recordlock_is_lockedby_current_user'] as bool?,
      recordlock_is_lockedby_another_session:
          json['recordlock_is_lockedby_another_session'] as bool?,
      recordlock_lock_timeout: json['recordlock_lock_timeout'] as String?,
    );

Map<String, dynamic> _$$_RecordlockToJson(_$_Recordlock instance) =>
    <String, dynamic>{
      'recordlock_id': instance.recordlock_id,
      'recordlock_table': instance.recordlock_table,
      'recordlock_record_id': instance.recordlock_record_id,
      'recordlock_date_locked':
          instance.recordlock_date_locked?.toIso8601String(),
      'recordlock_lockedby_contact_name_display':
          instance.recordlock_lockedby_contact_name_display,
      'recordlock_is_lockedby_current_user':
          instance.recordlock_is_lockedby_current_user,
      'recordlock_is_lockedby_another_session':
          instance.recordlock_is_lockedby_another_session,
      'recordlock_lock_timeout': instance.recordlock_lock_timeout,
    };

_$_BillableSection _$$_BillableSectionFromJson(Map<String, dynamic> json) =>
    _$_BillableSection(
      billablesection_id: json['billablesection_id'] as int?,
      billablesection_uid: json['billablesection_uid'] as String?,
      billablesection_special_key: json['billablesection_special_key'],
      billablesection_order: json['billablesection_order'] as int?,
      billablesection_level: json['billablesection_level'] as int?,
      billablesection_name: json['billablesection_name'] as String?,
      billablesection_description: json['billablesection_description'],
      billablesection_keep_together:
          json['billablesection_keep_together'] as bool?,
      billablesection_display_on_new_page:
          json['billablesection_display_on_new_page'] as bool?,
      billablesection_combine_duplicate_items:
          json['billablesection_combine_duplicate_items'] as bool?,
      billablesection_show_totals: json['billablesection_show_totals'] as bool?,
      billablesection_totals_with_subsections:
          json['billablesection_totals_with_subsections'] as bool?,
      billablesection_hide_description:
          json['billablesection_hide_description'] as bool?,
      billablesection_hide_items: json['billablesection_hide_items'] as bool?,
      billablesection_hide_quantity_col:
          json['billablesection_hide_quantity_col'] as bool?,
      billablesection_hide_unit_col:
          json['billablesection_hide_unit_col'] as bool?,
      billablesection_hide_sell_price_col:
          json['billablesection_hide_sell_price_col'] as bool?,
      billablesection_hide_discount_col:
          json['billablesection_hide_discount_col'] as bool?,
      billablesection_hide_amount_col:
          json['billablesection_hide_amount_col'] as bool?,
      billablesection_hide_code_col:
          json['billablesection_hide_code_col'] as bool?,
      billablesection_hide_name_col:
          json['billablesection_hide_name_col'] as bool?,
      billablesection_hide_description_col:
          json['billablesection_hide_description_col'] as bool?,
      billablesection_hide_date_col:
          json['billablesection_hide_date_col'] as bool?,
      billablesection_hide_user_col:
          json['billablesection_hide_user_col'] as bool?,
      billablesection_hide_buy_price_col:
          json['billablesection_hide_buy_price_col'] as bool?,
      billablesection_hide_markup_col:
          json['billablesection_hide_markup_col'] as bool?,
      billablesection_hide_tax_col:
          json['billablesection_hide_tax_col'] as bool?,
      billablesection_iscollapsed: json['billablesection_iscollapsed'] as bool?,
      billablesection_is_linked_to_booking:
          json['billablesection_is_linked_to_booking'] as bool?,
      billablesection_linked_booking_id:
          json['billablesection_linked_booking_id'] as int?,
      billablesection_linked_booking_name:
          json['billablesection_linked_booking_name'] as String?,
      billablesection_linked_booking_number:
          json['billablesection_linked_booking_number'] as String?,
    );

Map<String, dynamic> _$$_BillableSectionToJson(_$_BillableSection instance) =>
    <String, dynamic>{
      'billablesection_id': instance.billablesection_id,
      'billablesection_uid': instance.billablesection_uid,
      'billablesection_special_key': instance.billablesection_special_key,
      'billablesection_order': instance.billablesection_order,
      'billablesection_level': instance.billablesection_level,
      'billablesection_name': instance.billablesection_name,
      'billablesection_description': instance.billablesection_description,
      'billablesection_keep_together': instance.billablesection_keep_together,
      'billablesection_display_on_new_page':
          instance.billablesection_display_on_new_page,
      'billablesection_combine_duplicate_items':
          instance.billablesection_combine_duplicate_items,
      'billablesection_show_totals': instance.billablesection_show_totals,
      'billablesection_totals_with_subsections':
          instance.billablesection_totals_with_subsections,
      'billablesection_hide_description':
          instance.billablesection_hide_description,
      'billablesection_hide_items': instance.billablesection_hide_items,
      'billablesection_hide_quantity_col':
          instance.billablesection_hide_quantity_col,
      'billablesection_hide_unit_col': instance.billablesection_hide_unit_col,
      'billablesection_hide_sell_price_col':
          instance.billablesection_hide_sell_price_col,
      'billablesection_hide_discount_col':
          instance.billablesection_hide_discount_col,
      'billablesection_hide_amount_col':
          instance.billablesection_hide_amount_col,
      'billablesection_hide_code_col': instance.billablesection_hide_code_col,
      'billablesection_hide_name_col': instance.billablesection_hide_name_col,
      'billablesection_hide_description_col':
          instance.billablesection_hide_description_col,
      'billablesection_hide_date_col': instance.billablesection_hide_date_col,
      'billablesection_hide_user_col': instance.billablesection_hide_user_col,
      'billablesection_hide_buy_price_col':
          instance.billablesection_hide_buy_price_col,
      'billablesection_hide_markup_col':
          instance.billablesection_hide_markup_col,
      'billablesection_hide_tax_col': instance.billablesection_hide_tax_col,
      'billablesection_iscollapsed': instance.billablesection_iscollapsed,
      'billablesection_is_linked_to_booking':
          instance.billablesection_is_linked_to_booking,
      'billablesection_linked_booking_id':
          instance.billablesection_linked_booking_id,
      'billablesection_linked_booking_name':
          instance.billablesection_linked_booking_name,
      'billablesection_linked_booking_number':
          instance.billablesection_linked_booking_number,
    };

_$_BillableSubscription _$$_BillableSubscriptionFromJson(
        Map<String, dynamic> json) =>
    _$_BillableSubscription(
      subscription_id: json['subscription_id'] as int?,
      subscription_public_name: json['subscription_public_name'] as String?,
      subscription_logo_uri: json['subscription_logo_uri'] as String?,
      subscription_business_phone:
          json['subscription_business_phone'] as String?,
      subscription_postal_address: json['subscription_postal_address'],
      subscription_tax_registration_name:
          json['subscription_tax_registration_name'] as String?,
      subscription_tax_registration_number:
          json['subscription_tax_registration_number'] as String?,
      subscription_gst_name: json['subscription_gst_name'] as String?,
      subscription_gst_rate:
          (json['subscription_gst_rate'] as num?)?.toDouble(),
      subscription_currency: json['subscription_currency'] as String?,
      subscription_payment_details: json['subscription_payment_details'],
    );

Map<String, dynamic> _$$_BillableSubscriptionToJson(
        _$_BillableSubscription instance) =>
    <String, dynamic>{
      'subscription_id': instance.subscription_id,
      'subscription_public_name': instance.subscription_public_name,
      'subscription_logo_uri': instance.subscription_logo_uri,
      'subscription_business_phone': instance.subscription_business_phone,
      'subscription_postal_address': instance.subscription_postal_address,
      'subscription_tax_registration_name':
          instance.subscription_tax_registration_name,
      'subscription_tax_registration_number':
          instance.subscription_tax_registration_number,
      'subscription_gst_name': instance.subscription_gst_name,
      'subscription_gst_rate': instance.subscription_gst_rate,
      'subscription_currency': instance.subscription_currency,
      'subscription_payment_details': instance.subscription_payment_details,
    };
