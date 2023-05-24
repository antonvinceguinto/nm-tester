import 'package:freezed_annotation/freezed_annotation.dart';

import 'billable_info_level_model.dart';

part 'billable_details_model.freezed.dart';
part 'billable_details_model.g.dart';

@freezed
class BillableDetailsModel with _$BillableDetailsModel {
  const factory BillableDetailsModel({
    int? billable_id,
    int? billable_subscription_id,
    String? billable_subscription_public_name,
    String? billable_type,
    dynamic billable_book_id,
    int? billable_job_id,
    bool? billable_islocked,
    DateTime? billable_created,
    DateTime? billable_updated,
    bool? billable_isdraft,
    bool? billable_isfixed,
    bool? billable_isdeleted,
    Recordlock? recordlock,
    dynamic billable_synced_invoice_number,
    String? billable_accounting_provider_name,
    dynamic billable_accounting_provider_name_display,
    bool? billable_use_nm_invoice_numbers,
    bool? billable_prompt_to_sync_invoices_on_send,
    String? billable_tax_name,
    bool? billable_hide_billable_totals,
    String? billable_associated_record_type,
    int? billable_associated_record_id,
    String? billable_associated_record_number,
    String? billable_associated_record_name,
    String? billable_job_number,
    String? billable_job_name,
    dynamic billable_job_order_number,
    String? billable_name,
    String? billable_number,
    String? billable_reference,
    double? billable_total,
    double? billable_invoiced_total,
    double? billable_not_billable_total,
    double? billable_invoiced_amount_remaining_total,
    bool? billable_issent,
    dynamic billable_date_last_sent,
    dynamic billable_client_contact_id,
    dynamic billable_client_contact_name,
    bool? billable_isimported,
    bool? billable_isaccepted,
    double? billable_total_payments,
    double? billable_total_creditnotes,
    int? billable_createdby_contact_id,
    String? billable_createdby_contact_name,
    int? billable_updatedby_contact_id,
    bool? billable_is_added_to_charges,
    bool? billable_has_linked_bookings,
    bool? billable_job_has_unlinked_bookings,
    String? BillableReferenceMultiLine,
    dynamic billable_notes,
    String? billable_header_notes,
    String? billable_footer_notes,
    dynamic billable_cover_page,
    dynamic billable_terms_and_conditions_page,
    DateTime? billable_date,
    DateTime? billable_date_due,
    dynamic billable_client_contact_address,
    dynamic billable_client_contact_address_coords,
    dynamic billable_supplier_billable_number,
    int? billable_order_status,
    dynamic billable_order_submitted,
    bool? billable_is_modified_after_submit,
    dynamic billable_delivery_details,
    int? billable_delivery_vehicletype_id,
    dynamic billable_delivery_vehicletype_name,
    dynamic billable_delivery_time_preference,
    String? billable_job_address,
    dynamic billable_job_address_coords,
    dynamic billable_acceptance_response_notes,
    dynamic billable_acceptance_response_date,
    dynamic billable_acceptanceby_contact_email,
    dynamic billable_acceptanceby_contact_id,
    dynamic billable_acceptanceby_contact_name_display,
    dynamic billable_fully_paidby_contact_name_display,
    dynamic billable_date_fully_paid,
    dynamic billable_acceptanceby_contact_mobile,
    dynamic billable_sentby_contact_name_display,
    dynamic billable_purchases_provider_account_id,
    dynamic billable_purchases_provider_account_name,
    int? billable_source_billable_id,
    String? billable_source_billable_name,
    String? billable_source_billable_number,
    String? billable_source_billable_type,
    dynamic billable_hardware_provider,
    @Default([]) List<dynamic> suppliers,
    @Default([]) List<BillableInfoLevelItem> billableItems,
    @Default([]) List<BillableSection> sections,
    @Default([]) List<AssociatedContact> associatedContacts,
    dynamic clientContact,
    BillableSubscription? subscription,
  }) = _BillableDetailsModel;

  factory BillableDetailsModel.fromJson(Map<String, Object?> json) =>
      _$BillableDetailsModelFromJson(json);
}

@freezed
class AssociatedContact with _$AssociatedContact {
  const factory AssociatedContact({
    int? contact_id,
    String? contact_email,
    String? contact_name_display,
  }) = _AssociatedContact;

  factory AssociatedContact.fromJson(Map<String, Object?> json) =>
      _$AssociatedContactFromJson(json);
}

// @freezed
// class BillableItemModel with _$BillableItemModel {
//   const factory BillableItemModel({
//     int? billableitem_id,
//     String? billableitem_uid,
//     int? billableitem_billable_id,
//     int? billableitem_billablesection_id,
//     int? billableitem_subscription_id,
//     int? billableitem_order,
//     dynamic billableitem_billable_book_id,
//     dynamic billableitem_billable_book_number,
//     dynamic billableitem_billable_book_summary,
//     int? billableitem_billable_job_id,
//     String? billableitem_billable_job_number,
//     String? billableitem_billable_job_name,
//     bool? billableitem_istime,
//     bool? billableitem_isproduct,
//     bool? billableitem_isdisbursement,
//     double? billableitem_quantity,
//     int? billableitem_saleitem_id,
//     String? billableitem_name,
//     String? billableitem_code,
//     dynamic billableitem_supplier_code,
//     dynamic billableitem_description,
//     double? billableitem_buy_price,
//     double? billableitem_actual_buy_price,
//     double? billableitem_sell_price,
//     double? billableitem_actual_sell_price,
//     double? billableitem_list_buy_price,
//     double? billableitem_list_sell_price,
//     DateTime? billableitem_list_price_date,
//     double? billableitem_buy_discount_rate,
//     double? billableitem_sell_discount_rate,
//     double? billableitem_markup_rate,
//     double? billableitem_buy_subtotal,
//     double? billableitem_sell_subtotal,
//     String? billableitem_unit_string,
//     String? billableitem_currency,
//     int? billableitem_taxrate_id,
//     double? billableitem_taxrate_rate,
//     bool? billableitem_taxrate_is_valid,
//     @Default([]) List<dynamic> billableitem_saleitem_categories,
//     dynamic billableitem_supplier_contact_id,
//     dynamic billableitem_supplier_contact_name,
//     bool? billableitem_is_from_hardware_provider,
//     bool? billableitem_is_locally_saved_product,
//     DateTime? billableitem_start,
//     dynamic billableitem_start_address,
//     dynamic billableitem_start_location,
//     DateTime? billableitem_end,
//     dynamic billableitem_end_address,
//     dynamic billableitem_end_location,
//     bool? billableitem_istime_range,
//     bool? billableitem_isactual_times,
//     bool? billableitem_isbillable,
//     bool? billableitem_ismanually_invoiced,
//     dynamic billableitem_manual_invoice_id,
//     dynamic billableitem_manual_invoice_number,
//     dynamic billableitem_manual_invoice_date,
//     String? billableitem_type,
//     bool? billableitem_islinked,
//     int? billableitem_source_billableitem_id,
//     int? billableitem_source_billableitem_billable_id,
//     String? billableitem_source_billableitem_billable_type,
//     String? billableitem_source_billableitem_billable_number,
//     dynamic billableitem_ordered_total,
//     double? billableitem_invoiced_total,
//     List<dynamic>? target_billableitem_summaries,
//     String? billableitem_created_by_contact_name_display,
//     DateTime? billableitem_created_date,
//     String? billableitem_updated_by_contact_name_display,
//     DateTime? billableitem_updated_date,
//     int? billableitem_contact_id,
//     String? billableitem_contact_name_display,
//     String? billableitem_entry_type,
//     bool? billableitem_isexcluded_timesheet_entry,
//     dynamic billableitem_is_length_breakdown,
//     @Default([]) List<dynamic> length_breakdowns,
//   }) = _BillableItemModel;

//   factory BillableItemModel.fromJson(Map<String, Object?> json) =>
//       _$BillableItemModelFromJson(json);
// }

@freezed
class Recordlock with _$Recordlock {
  const factory Recordlock({
    String? recordlock_id,
    String? recordlock_table,
    int? recordlock_record_id,
    DateTime? recordlock_date_locked,
    String? recordlock_lockedby_contact_name_display,
    bool? recordlock_is_lockedby_current_user,
    bool? recordlock_is_lockedby_another_session,
    String? recordlock_lock_timeout,
  }) = _Recordlock;

  factory Recordlock.fromJson(Map<String, Object?> json) =>
      _$RecordlockFromJson(json);
}

@freezed
class BillableSection with _$BillableSection {
  const factory BillableSection({
    int? billablesection_id,
    String? billablesection_uid,
    dynamic billablesection_special_key,
    int? billablesection_order,
    int? billablesection_level,
    String? billablesection_name,
    dynamic billablesection_description,
    bool? billablesection_keep_together,
    bool? billablesection_display_on_new_page,
    bool? billablesection_combine_duplicate_items,
    bool? billablesection_show_totals,
    bool? billablesection_totals_with_subsections,
    bool? billablesection_hide_description,
    bool? billablesection_hide_items,
    bool? billablesection_hide_quantity_col,
    bool? billablesection_hide_unit_col,
    bool? billablesection_hide_sell_price_col,
    bool? billablesection_hide_discount_col,
    bool? billablesection_hide_amount_col,
    bool? billablesection_hide_code_col,
    bool? billablesection_hide_name_col,
    bool? billablesection_hide_description_col,
    bool? billablesection_hide_date_col,
    bool? billablesection_hide_user_col,
    bool? billablesection_hide_buy_price_col,
    bool? billablesection_hide_markup_col,
    bool? billablesection_hide_tax_col,
    bool? billablesection_iscollapsed,
    bool? billablesection_is_linked_to_booking,
    int? billablesection_linked_booking_id,
    String? billablesection_linked_booking_name,
    String? billablesection_linked_booking_number,
  }) = _BillableSection;

  factory BillableSection.fromJson(Map<String, Object?> json) =>
      _$BillableSectionFromJson(json);
}

@freezed
class BillableSubscription with _$BillableSubscription {
  const factory BillableSubscription({
    int? subscription_id,
    String? subscription_public_name,
    String? subscription_logo_uri,
    String? subscription_business_phone,
    dynamic subscription_postal_address,
    String? subscription_tax_registration_name,
    String? subscription_tax_registration_number,
    String? subscription_gst_name,
    double? subscription_gst_rate,
    String? subscription_currency,
    dynamic subscription_payment_details,
  }) = _BillableSubscription;

  factory BillableSubscription.fromJson(Map<String, Object?> json) =>
      _$BillableSubscriptionFromJson(json);
}
