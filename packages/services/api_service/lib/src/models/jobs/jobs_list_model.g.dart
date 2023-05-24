// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jobs_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_JobsListModel _$$_JobsListModelFromJson(Map<String, dynamic> json) =>
    _$_JobsListModel(
      sync_date: json['sync_date'] == null
          ? null
          : DateTime.parse(json['sync_date'] as String),
      total_all: json['total_all'] as int? ?? 0,
      total: json['total'] as int? ?? 0,
      data: (json['data'] as List<dynamic>?)
              ?.map(
                  (e) => JobInfoLevelModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_JobsListModelToJson(_$_JobsListModel instance) =>
    <String, dynamic>{
      'sync_date': instance.sync_date?.toIso8601String(),
      'total_all': instance.total_all,
      'total': instance.total,
      'data': instance.data,
    };

_$_JobInfoLevelModel _$$_JobInfoLevelModelFromJson(Map<String, dynamic> json) =>
    _$_JobInfoLevelModel(
      job_contacts: (json['JobContacts'] as List<dynamic>?)
              ?.map((e) => JobContact.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      job_id: json['job_id'] as int?,
      job_name: json['job_name'] as String?,
      job_number: json['job_number'] as String?,
      job_code: json['job_code'] as String?,
      job_description_text: json['job_description_text'] as String?,
      job_order_number: json['job_order_number'] as String?,
      job_due: json['job_due'] == null
          ? null
          : DateTime.parse(json['job_due'] as String),
      job_completed_date: json['job_completed_date'] == null
          ? null
          : DateTime.parse(json['job_completed_date'] as String),
      job_address: json['job_address'] as String?,
      job_address_coords: json['job_address_coords'] as String?,
      job_jobstatus_name: json['job_jobstatus_name'] as String?,
      job_jobstatus_brush_colour_argb:
          json['job_jobstatus_brush_colour_argb'] as String?,
      job_jobtype_name: json['job_jobtype_name'] as String?,
      job_jobtype_brush_colour_argb:
          json['job_jobtype_brush_colour_argb'] as String?,
      job_client_contact_id: json['job_client_contact_id'] as int?,
      job_client_contact_name: json['job_client_contact_name'] as String?,
      job_site_contact_id: json['job_site_contact_id'] as int?,
      job_site_contact_name: json['job_site_contact_name'] as String?,
      job_priority_name: json['job_priority_name'] as String?,
      job_priority_brush_colour_argb:
          json['job_priority_brush_colour_argb'] as String?,
      job_subscription_id: json['job_subscription_id'] as int?,
      job_subscription_name: json['job_subscription_name'] as String?,
      job_created_date: json['job_created_date'] == null
          ? null
          : DateTime.parse(json['job_created_date'] as String),
      job_has_notes: json['job_has_notes'] as bool?,
      job_has_files: json['job_has_files'] as bool?,
      job_has_photos: json['job_has_photos'] as bool?,
      job_has_scribbles: json['job_has_scribbles'] as bool?,
      job_iscomplete: json['job_iscomplete'] as bool?,
      job_istemplate: json['job_istemplate'] as bool?,
      job_isinternal: json['job_isinternal'] as bool?,
      job_actual_charges_subtotal:
          (json['job_actual_charges_subtotal'] as num?)?.toDouble(),
      job_costs_subtotal: (json['job_costs_subtotal'] as num?)?.toDouble(),
      job_non_billable_buy_subtotal:
          (json['job_non_billable_buy_subtotal'] as num?)?.toDouble(),
      job_invoiced_subtotal:
          (json['job_invoiced_subtotal'] as num?)?.toDouble(),
      job_margin: (json['job_margin'] as num?)?.toDouble(),
      job_estimated_revenue_subtotal:
          (json['job_estimated_revenue_subtotal'] as num?)?.toDouble(),
      job_estimated_cost_subtotal:
          (json['job_estimated_cost_subtotal'] as num?)?.toDouble(),
      job_accepted_quote_subtotal:
          (json['job_accepted_quote_subtotal'] as num?)?.toDouble(),
      jobcont_is_assigned: json['jobcont_is_assigned'] as bool? ?? false,
      jobcont_acceptance_status: json['jobcont_acceptance_status'] as String?,
      jobcont_acceptance_status_name:
          json['jobcont_acceptance_status_name'] as String?,
      job_timesheet_must_be_associated_with_task:
          json['job_timesheet_must_be_associated_with_task'] as bool?,
      job_pricingtype_name: json['job_pricingtype_name'] as String?,
      job_is_displayed_on_timeline:
          json['job_is_displayed_on_timeline'] as bool?,
      job_start: json['job_start'] == null
          ? null
          : DateTime.parse(json['job_start'] as String),
      job_end: json['job_end'] == null
          ? null
          : DateTime.parse(json['job_end'] as String),
      job_isallday: json['job_isallday'] as bool?,
      job_progress: (json['job_progress'] as num?)?.toDouble(),
      job_timeline_progress:
          (json['job_timeline_progress'] as num?)?.toDouble(),
      job_jobstatus_id: json['job_jobstatus_id'] as int?,
      job_jobtype_id: json['job_jobtype_id'] as int?,
      job_client_contact_email: json['job_client_contact_email'] as String?,
      job_client_contact_phone_mobile:
          json['job_client_contact_phone_mobile'] as String?,
      job_client_contact_updated: json['job_client_contact_updated'] == null
          ? null
          : DateTime.parse(json['job_client_contact_updated'] as String),
      job_client_users_updated: json['job_client_users_updated'] == null
          ? null
          : DateTime.parse(json['job_client_users_updated'] as String),
      job_priority_id: json['job_priority_id'] as int?,
      job_first_booking: json['job_first_booking'] == null
          ? null
          : DateTime.parse(json['job_first_booking'] as String),
      job_last_booking: json['job_last_booking'] == null
          ? null
          : DateTime.parse(json['job_last_booking'] as String),
      job_first_timeline_booking: json['job_first_timeline_booking'] == null
          ? null
          : DateTime.parse(json['job_first_timeline_booking'] as String),
      job_last_timeline_booking: json['job_last_timeline_booking'] == null
          ? null
          : DateTime.parse(json['job_last_timeline_booking'] as String),
      job_time_zone: json['job_time_zone'] as String?,
      is_owner: json['is_owner'] as bool?,
      job_created_by_contact_id: json['job_created_by_contact_id'] as int?,
      job_created_by_contact_name_display:
          json['job_created_by_contact_name_display'] as String?,
      job_created_by_contact_email:
          json['job_created_by_contact_email'] as String?,
      job_created_by_contact_phone_mobile:
          json['job_created_by_contact_phone_mobile'] as String?,
      job_updated_by_contact_id: json['job_updated_by_contact_id'] as int?,
      job_updated_by_contact_name_display:
          json['job_updated_by_contact_name_display'] as String?,
      job_updated_by_contact_email:
          json['job_updated_by_contact_email'] as String?,
      job_updated_by_contact_phone_mobile:
          json['job_updated_by_contact_phone_mobile'] as String?,
      job_sheet_content: json['job_sheet_content'],
      job_isdeleted: json['job_isdeleted'] as bool?,
      actual_charges_totals: json['actual_charges_totals'] == null
          ? const ActualChargesTotals()
          : ActualChargesTotals.fromJson(
              json['actual_charges_totals'] as Map<String, dynamic>),
      e_tag: json['ETag'] as String?,
      job_book_id: json['job_book_id'] as int?,
      job_has_book: json['job_has_book'] as bool?,
      book_summary: json['book_summary'] as String?,
      book_updated_date: json['book_updated_date'] == null
          ? null
          : DateTime.parse(json['book_updated_date'] as String),
      book_start: json['book_start'] == null
          ? null
          : DateTime.parse(json['book_start'] as String),
      book_end: json['book_end'] == null
          ? null
          : DateTime.parse(json['book_end'] as String),
      book_isallday: json['book_isallday'] as bool?,
      book_billables: json['book_billables'] as int?,
      job_pricingtype_id: json['job_pricingtype_id'] as int?,
      job_has_unlinked_bookings: json['job_has_unlinked_bookings'] as bool?,
      job_has_linked_bookings: json['job_has_linked_bookings'] as bool?,
      cost_summary: json['cost_summary'] == null
          ? null
          : CostSummary.fromJson(json['cost_summary'] as Map<String, dynamic>),
      job_updated_date: json['job_updated_date'] == null
          ? null
          : DateTime.parse(json['job_updated_date'] as String),
      job_due_isset: json['job_due_isset'] as bool?,
      job_client_contact_id_specified:
          json['job_client_contact_id_specified'] as bool?,
      job_site_contact_id_specified:
          json['job_site_contact_id_specified'] as bool?,
    );

Map<String, dynamic> _$$_JobInfoLevelModelToJson(
        _$_JobInfoLevelModel instance) =>
    <String, dynamic>{
      'JobContacts': instance.job_contacts,
      'job_id': instance.job_id,
      'job_name': instance.job_name,
      'job_number': instance.job_number,
      'job_code': instance.job_code,
      'job_description_text': instance.job_description_text,
      'job_order_number': instance.job_order_number,
      'job_due': instance.job_due?.toIso8601String(),
      'job_completed_date': instance.job_completed_date?.toIso8601String(),
      'job_address': instance.job_address,
      'job_address_coords': instance.job_address_coords,
      'job_jobstatus_name': instance.job_jobstatus_name,
      'job_jobstatus_brush_colour_argb':
          instance.job_jobstatus_brush_colour_argb,
      'job_jobtype_name': instance.job_jobtype_name,
      'job_jobtype_brush_colour_argb': instance.job_jobtype_brush_colour_argb,
      'job_client_contact_id': instance.job_client_contact_id,
      'job_client_contact_name': instance.job_client_contact_name,
      'job_site_contact_id': instance.job_site_contact_id,
      'job_site_contact_name': instance.job_site_contact_name,
      'job_priority_name': instance.job_priority_name,
      'job_priority_brush_colour_argb': instance.job_priority_brush_colour_argb,
      'job_subscription_id': instance.job_subscription_id,
      'job_subscription_name': instance.job_subscription_name,
      'job_created_date': instance.job_created_date?.toIso8601String(),
      'job_has_notes': instance.job_has_notes,
      'job_has_files': instance.job_has_files,
      'job_has_photos': instance.job_has_photos,
      'job_has_scribbles': instance.job_has_scribbles,
      'job_iscomplete': instance.job_iscomplete,
      'job_istemplate': instance.job_istemplate,
      'job_isinternal': instance.job_isinternal,
      'job_actual_charges_subtotal': instance.job_actual_charges_subtotal,
      'job_costs_subtotal': instance.job_costs_subtotal,
      'job_non_billable_buy_subtotal': instance.job_non_billable_buy_subtotal,
      'job_invoiced_subtotal': instance.job_invoiced_subtotal,
      'job_margin': instance.job_margin,
      'job_estimated_revenue_subtotal': instance.job_estimated_revenue_subtotal,
      'job_estimated_cost_subtotal': instance.job_estimated_cost_subtotal,
      'job_accepted_quote_subtotal': instance.job_accepted_quote_subtotal,
      'jobcont_is_assigned': instance.jobcont_is_assigned,
      'jobcont_acceptance_status': instance.jobcont_acceptance_status,
      'jobcont_acceptance_status_name': instance.jobcont_acceptance_status_name,
      'job_timesheet_must_be_associated_with_task':
          instance.job_timesheet_must_be_associated_with_task,
      'job_pricingtype_name': instance.job_pricingtype_name,
      'job_is_displayed_on_timeline': instance.job_is_displayed_on_timeline,
      'job_start': instance.job_start?.toIso8601String(),
      'job_end': instance.job_end?.toIso8601String(),
      'job_isallday': instance.job_isallday,
      'job_progress': instance.job_progress,
      'job_timeline_progress': instance.job_timeline_progress,
      'job_jobstatus_id': instance.job_jobstatus_id,
      'job_jobtype_id': instance.job_jobtype_id,
      'job_client_contact_email': instance.job_client_contact_email,
      'job_client_contact_phone_mobile':
          instance.job_client_contact_phone_mobile,
      'job_client_contact_updated':
          instance.job_client_contact_updated?.toIso8601String(),
      'job_client_users_updated':
          instance.job_client_users_updated?.toIso8601String(),
      'job_priority_id': instance.job_priority_id,
      'job_first_booking': instance.job_first_booking?.toIso8601String(),
      'job_last_booking': instance.job_last_booking?.toIso8601String(),
      'job_first_timeline_booking':
          instance.job_first_timeline_booking?.toIso8601String(),
      'job_last_timeline_booking':
          instance.job_last_timeline_booking?.toIso8601String(),
      'job_time_zone': instance.job_time_zone,
      'is_owner': instance.is_owner,
      'job_created_by_contact_id': instance.job_created_by_contact_id,
      'job_created_by_contact_name_display':
          instance.job_created_by_contact_name_display,
      'job_created_by_contact_email': instance.job_created_by_contact_email,
      'job_created_by_contact_phone_mobile':
          instance.job_created_by_contact_phone_mobile,
      'job_updated_by_contact_id': instance.job_updated_by_contact_id,
      'job_updated_by_contact_name_display':
          instance.job_updated_by_contact_name_display,
      'job_updated_by_contact_email': instance.job_updated_by_contact_email,
      'job_updated_by_contact_phone_mobile':
          instance.job_updated_by_contact_phone_mobile,
      'job_sheet_content': instance.job_sheet_content,
      'job_isdeleted': instance.job_isdeleted,
      'actual_charges_totals': instance.actual_charges_totals,
      'ETag': instance.e_tag,
      'job_book_id': instance.job_book_id,
      'job_has_book': instance.job_has_book,
      'book_summary': instance.book_summary,
      'book_updated_date': instance.book_updated_date?.toIso8601String(),
      'book_start': instance.book_start?.toIso8601String(),
      'book_end': instance.book_end?.toIso8601String(),
      'book_isallday': instance.book_isallday,
      'book_billables': instance.book_billables,
      'job_pricingtype_id': instance.job_pricingtype_id,
      'job_has_unlinked_bookings': instance.job_has_unlinked_bookings,
      'job_has_linked_bookings': instance.job_has_linked_bookings,
      'cost_summary': instance.cost_summary,
      'job_updated_date': instance.job_updated_date?.toIso8601String(),
      'job_due_isset': instance.job_due_isset,
      'job_client_contact_id_specified':
          instance.job_client_contact_id_specified,
      'job_site_contact_id_specified': instance.job_site_contact_id_specified,
    };

_$_JobContact _$$_JobContactFromJson(Map<String, dynamic> json) =>
    _$_JobContact(
      jobcont_contact_initials: json['jobcont_contact_initials'] as String?,
      jobcont_contact_brush_colour_argb:
          json['jobcont_contact_brush_colour_argb'] as String?,
      jobcont_contact_name_display:
          json['jobcont_contact_name_display'] as String?,
      jobcont_acceptance_status: json['jobcont_acceptance_status'] as String?,
      jobcont_id: json['jobcont_id'] as int?,
      jobcont_job_id: json['jobcont_job_id'] as int?,
      jobcont_contact_id: json['jobcont_contact_id'] as int?,
      jobcont_contact_email: json['jobcont_contact_email'] as String?,
      jobcont_contact_phone_mobile:
          json['jobcont_contact_phone_mobile'] as String?,
      jobcont_acceptance_status_name:
          json['jobcont_acceptance_status_name'] as String?,
      jobcont_acceptance_comment: json['jobcont_acceptance_comment'] as String?,
      is_current_subscriber: json['is_current_subscriber'] as bool?,
    );

Map<String, dynamic> _$$_JobContactToJson(_$_JobContact instance) =>
    <String, dynamic>{
      'jobcont_contact_initials': instance.jobcont_contact_initials,
      'jobcont_contact_brush_colour_argb':
          instance.jobcont_contact_brush_colour_argb,
      'jobcont_contact_name_display': instance.jobcont_contact_name_display,
      'jobcont_acceptance_status': instance.jobcont_acceptance_status,
      'jobcont_id': instance.jobcont_id,
      'jobcont_job_id': instance.jobcont_job_id,
      'jobcont_contact_id': instance.jobcont_contact_id,
      'jobcont_contact_email': instance.jobcont_contact_email,
      'jobcont_contact_phone_mobile': instance.jobcont_contact_phone_mobile,
      'jobcont_acceptance_status_name': instance.jobcont_acceptance_status_name,
      'jobcont_acceptance_comment': instance.jobcont_acceptance_comment,
      'is_current_subscriber': instance.is_current_subscriber,
    };
