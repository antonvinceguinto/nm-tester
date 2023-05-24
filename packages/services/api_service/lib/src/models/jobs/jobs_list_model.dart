import 'package:freezed_annotation/freezed_annotation.dart';

import 'actual_charges.dart';

part 'jobs_list_model.freezed.dart';
part 'jobs_list_model.g.dart';

@freezed
class JobsListModel with _$JobsListModel {
  const factory JobsListModel({
    DateTime? sync_date,
    @Default(0) int total_all,
    @Default(0) int total,
    @Default([]) List<JobInfoLevelModel> data,
  }) = _JobsListModel;

  static const empty = JobsListModel(
    sync_date: null,
    total_all: 0,
    total: 0,
    data: [],
  );

  factory JobsListModel.fromJson(Map<String, Object?> json) =>
      _$JobsListModelFromJson(json);
}

@freezed
class JobInfoLevelModel with _$JobInfoLevelModel {
  const factory JobInfoLevelModel({
    @JsonKey(name: 'JobContacts') @Default([]) List<JobContact> job_contacts,
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
    @Default(false) bool jobcont_is_assigned,
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
    @Default(ActualChargesTotals()) ActualChargesTotals? actual_charges_totals,
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
    bool? job_site_contact_id_specified,
  }) = _JobInfoLevelModel;

  factory JobInfoLevelModel.fromJson(Map<String, Object?> json) =>
      _$JobInfoLevelModelFromJson(json);
}

@freezed
class JobContact with _$JobContact {
  const factory JobContact({
    String? jobcont_contact_initials,
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
    bool? is_current_subscriber,
  }) = _JobContact;

  factory JobContact.fromJson(Map<String, Object?> json) =>
      _$JobContactFromJson(json);
}
