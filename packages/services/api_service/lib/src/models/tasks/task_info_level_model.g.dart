// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_info_level_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TaskInfoLevelModel _$$_TaskInfoLevelModelFromJson(
        Map<String, dynamic> json) =>
    _$_TaskInfoLevelModel(
      e_tag: json['ETag'] as String?,
      book_id: json['book_id'] as int?,
      book_key: json['book_key'] as String?,
      book_number: json['book_number'] as String?,
      book_summary: json['book_summary'] as String?,
      book_details: json['book_details'] as String?,
      book_start: json['book_start'] == null
          ? null
          : DateTime.parse(json['book_start'] as String),
      book_end: json['book_end'] == null
          ? null
          : DateTime.parse(json['book_end'] as String),
      book_isallday: json['book_isallday'] as bool?,
      book_isactual_times: json['book_isactual_times'] as bool?,
      book_address: json['book_address'] as String?,
      bookcont_is_assigned: json['bookcont_is_assigned'] as bool?,
      book_address_coords: json['book_address_coords'],
      book_islocked: json['book_islocked'] as bool?,
      book_importance: json['book_importance'] as int?,
      book_importance_name: json['book_importance_name'] as String?,
      book_priority_id: json['book_priority_id'] as int?,
      book_priority_name: json['book_priority_name'] as String?,
      book_priority_brush_colour_argb:
          json['book_priority_brush_colour_argb'] as String?,
      book_usercategory_id: json['book_usercategory_id'] as int?,
      book_usercategory_name: json['book_usercategory_name'] as String?,
      book_usercategory_brush_colour_argb:
          json['book_usercategory_brush_colour_argb'] as String?,
      book_job_id: json['book_job_id'] as int?,
      book_job_code: json['book_job_code'],
      book_job_number: json['book_job_number'] as String?,
      book_job_order_number: json['book_job_order_number'] as String?,
      book_job_name: json['book_job_name'] as String?,
      book_job_is_internal: json['book_job_is_internal'] as bool?,
      book_job_client_contact_id: json['book_job_client_contact_id'] as int?,
      book_job_client_contact_name:
          json['book_job_client_contact_name'] as String?,
      book_job_client_contact_email:
          json['book_job_client_contact_email'] as String?,
      book_job_client_contact_phone_mobile:
          json['book_job_client_contact_phone_mobile'] as String?,
      book_client_contact_id: json['book_client_contact_id'] as int?,
      book_client_contact_name: json['book_client_contact_name'] as String?,
      book_client_contact_email: json['book_client_contact_email'] as String?,
      book_client_contact_phone_mobile:
          json['book_client_contact_phone_mobile'] as String?,
      book_site_contact_id: json['book_site_contact_id'] as int?,
      book_site_contact_name: json['book_site_contact_name'] as String?,
      book_subscription_id: json['book_subscription_id'] as int?,
      book_subscription_name: json['book_subscription_name'] as String?,
      book_is_recurring: json['book_is_recurring'] as bool?,
      book_is_exception: json['book_is_exception'] as bool?,
      book_isrecurring: json['book_isrecurring'] as bool?,
      book_isexception: json['book_isexception'] as bool?,
      book_isoccurrence: json['book_isoccurrence'] as bool?,
      book_recurrence_pattern: json['book_recurrence_pattern'] as String?,
      book_recurrence_text: json['book_recurrence_text'] as String?,
      book_recurrence_start: json['book_recurrence_start'] == null
          ? null
          : DateTime.parse(json['book_recurrence_start'] as String),
      book_recurrence_end: json['book_recurrence_end'] == null
          ? null
          : DateTime.parse(json['book_recurrence_end'] as String),
      book_time_zone: json['book_time_zone'] as String?,
      book_master_book_id: json['book_master_book_id'] as int?,
      book_first_occurrence_key: json['book_first_occurrence_key'],
      book_bookingstatus_id: json['book_bookingstatus_id'] as int?,
      book_bookingstatus_name: json['book_bookingstatus_name'] as String?,
      book_bookingstatus_brush_colour_argb:
          json['book_bookingstatus_brush_colour_argb'] as String?,
      is_owner: json['is_owner'] as bool?,
      bookingContacts: (json['BookingContacts'] as List<dynamic>?)
              ?.map((e) => BookingContact.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      book_created_by_contact_id: json['book_created_by_contact_id'] as int?,
      book_created_by_contact_name_display:
          json['book_created_by_contact_name_display'] as String?,
      book_created_by_contact_email:
          json['book_created_by_contact_email'] as String?,
      book_created_by_contact_phone_mobile:
          json['book_created_by_contact_phone_mobile'] as String?,
      book_created_date: json['book_created_date'] == null
          ? null
          : DateTime.parse(json['book_created_date'] as String),
      book_updated_by_contact_id: json['book_updated_by_contact_id'] as int?,
      book_updated_by_contact_name_display:
          json['book_updated_by_contact_name_display'] as String?,
      book_updated_by_contact_email:
          json['book_updated_by_contact_email'] as String?,
      book_updated_by_contact_phone_mobile:
          json['book_updated_by_contact_phone_mobile'] as String?,
      book_updated_date: json['book_updated_date'] == null
          ? null
          : DateTime.parse(json['book_updated_date'] as String),
      book_isdeleted: json['book_isdeleted'] as bool?,
      actual_charges_totals: json['actual_charges_totals'] == null
          ? null
          : ActualChargesTotals.fromJson(
              json['actual_charges_totals'] as Map<String, dynamic>),
      book_actual_charges_subtotal:
          (json['book_actual_charges_subtotal'] as num?)?.toDouble(),
      book_istemplate: json['book_istemplate'] as bool?,
      book_iscomplete: json['book_iscomplete'] as bool?,
      book_is_displayed_on_timeline:
          json['book_is_displayed_on_timeline'] as bool?,
      book_progress: (json['book_progress'] as num?)?.toDouble(),
      book_has_back_costing_link: json['book_has_back_costing_link'] as bool?,
      book_linked_quote_id: json['book_linked_quote_id'],
      book_linked_quote_name: json['book_linked_quote_name'] as String?,
      book_linked_quote_number: json['book_linked_quote_number'],
      book_linked_quote_section_id: json['book_linked_quote_section_id'],
      book_linked_quote_section_name:
          json['book_linked_quote_section_name'] as String?,
      book_is_linked_quote_declined:
          json['book_is_linked_quote_declined'] as bool?,
      book_is_back_costing_link_available:
          json['book_is_back_costing_link_available'] as bool?,
      cost_summary: json['cost_summary'] == null
          ? null
          : CostSummary.fromJson(json['cost_summary'] as Map<String, dynamic>),
      bookcont_acceptance_status_name:
          json['bookcont_acceptance_status_name'] as String?,
      book_client_contact_id_specified:
          json['book_client_contact_id_specified'] as bool? ?? true,
      book_job_id_specified: json['book_job_id_specified'] as bool? ?? true,
      book_site_contact_id_specified:
          json['book_site_contact_id_specified'] as bool? ?? true,
      book_recurrence_pattern_specified:
          json['book_recurrence_pattern_specified'] as bool? ?? true,
      book_has_files: json['book_has_files'] as bool? ?? false,
      book_has_notes: json['book_has_notes'] as bool? ?? false,
      book_has_photos: json['book_has_photos'] as bool? ?? false,
      book_has_scribbles: json['book_has_scribbles'] as bool? ?? false,
      book_bookingstatus_change_location:
          json['book_bookingstatus_change_location'] as String?,
    );

Map<String, dynamic> _$$_TaskInfoLevelModelToJson(
        _$_TaskInfoLevelModel instance) =>
    <String, dynamic>{
      'ETag': instance.e_tag,
      'book_id': instance.book_id,
      'book_key': instance.book_key,
      'book_number': instance.book_number,
      'book_summary': instance.book_summary,
      'book_details': instance.book_details,
      'book_start': instance.book_start?.toIso8601String(),
      'book_end': instance.book_end?.toIso8601String(),
      'book_isallday': instance.book_isallday,
      'book_isactual_times': instance.book_isactual_times,
      'book_address': instance.book_address,
      'bookcont_is_assigned': instance.bookcont_is_assigned,
      'book_address_coords': instance.book_address_coords,
      'book_islocked': instance.book_islocked,
      'book_importance': instance.book_importance,
      'book_importance_name': instance.book_importance_name,
      'book_priority_id': instance.book_priority_id,
      'book_priority_name': instance.book_priority_name,
      'book_priority_brush_colour_argb':
          instance.book_priority_brush_colour_argb,
      'book_usercategory_id': instance.book_usercategory_id,
      'book_usercategory_name': instance.book_usercategory_name,
      'book_usercategory_brush_colour_argb':
          instance.book_usercategory_brush_colour_argb,
      'book_job_id': instance.book_job_id,
      'book_job_code': instance.book_job_code,
      'book_job_number': instance.book_job_number,
      'book_job_order_number': instance.book_job_order_number,
      'book_job_name': instance.book_job_name,
      'book_job_is_internal': instance.book_job_is_internal,
      'book_job_client_contact_id': instance.book_job_client_contact_id,
      'book_job_client_contact_name': instance.book_job_client_contact_name,
      'book_job_client_contact_email': instance.book_job_client_contact_email,
      'book_job_client_contact_phone_mobile':
          instance.book_job_client_contact_phone_mobile,
      'book_client_contact_id': instance.book_client_contact_id,
      'book_client_contact_name': instance.book_client_contact_name,
      'book_client_contact_email': instance.book_client_contact_email,
      'book_client_contact_phone_mobile':
          instance.book_client_contact_phone_mobile,
      'book_site_contact_id': instance.book_site_contact_id,
      'book_site_contact_name': instance.book_site_contact_name,
      'book_subscription_id': instance.book_subscription_id,
      'book_subscription_name': instance.book_subscription_name,
      'book_is_recurring': instance.book_is_recurring,
      'book_is_exception': instance.book_is_exception,
      'book_isrecurring': instance.book_isrecurring,
      'book_isexception': instance.book_isexception,
      'book_isoccurrence': instance.book_isoccurrence,
      'book_recurrence_pattern': instance.book_recurrence_pattern,
      'book_recurrence_text': instance.book_recurrence_text,
      'book_recurrence_start':
          instance.book_recurrence_start?.toIso8601String(),
      'book_recurrence_end': instance.book_recurrence_end?.toIso8601String(),
      'book_time_zone': instance.book_time_zone,
      'book_master_book_id': instance.book_master_book_id,
      'book_first_occurrence_key': instance.book_first_occurrence_key,
      'book_bookingstatus_id': instance.book_bookingstatus_id,
      'book_bookingstatus_name': instance.book_bookingstatus_name,
      'book_bookingstatus_brush_colour_argb':
          instance.book_bookingstatus_brush_colour_argb,
      'is_owner': instance.is_owner,
      'BookingContacts': instance.bookingContacts,
      'book_created_by_contact_id': instance.book_created_by_contact_id,
      'book_created_by_contact_name_display':
          instance.book_created_by_contact_name_display,
      'book_created_by_contact_email': instance.book_created_by_contact_email,
      'book_created_by_contact_phone_mobile':
          instance.book_created_by_contact_phone_mobile,
      'book_created_date': instance.book_created_date?.toIso8601String(),
      'book_updated_by_contact_id': instance.book_updated_by_contact_id,
      'book_updated_by_contact_name_display':
          instance.book_updated_by_contact_name_display,
      'book_updated_by_contact_email': instance.book_updated_by_contact_email,
      'book_updated_by_contact_phone_mobile':
          instance.book_updated_by_contact_phone_mobile,
      'book_updated_date': instance.book_updated_date?.toIso8601String(),
      'book_isdeleted': instance.book_isdeleted,
      'actual_charges_totals': instance.actual_charges_totals,
      'book_actual_charges_subtotal': instance.book_actual_charges_subtotal,
      'book_istemplate': instance.book_istemplate,
      'book_iscomplete': instance.book_iscomplete,
      'book_is_displayed_on_timeline': instance.book_is_displayed_on_timeline,
      'book_progress': instance.book_progress,
      'book_has_back_costing_link': instance.book_has_back_costing_link,
      'book_linked_quote_id': instance.book_linked_quote_id,
      'book_linked_quote_name': instance.book_linked_quote_name,
      'book_linked_quote_number': instance.book_linked_quote_number,
      'book_linked_quote_section_id': instance.book_linked_quote_section_id,
      'book_linked_quote_section_name': instance.book_linked_quote_section_name,
      'book_is_linked_quote_declined': instance.book_is_linked_quote_declined,
      'book_is_back_costing_link_available':
          instance.book_is_back_costing_link_available,
      'cost_summary': instance.cost_summary,
      'bookcont_acceptance_status_name':
          instance.bookcont_acceptance_status_name,
      'book_client_contact_id_specified':
          instance.book_client_contact_id_specified,
      'book_job_id_specified': instance.book_job_id_specified,
      'book_site_contact_id_specified': instance.book_site_contact_id_specified,
      'book_recurrence_pattern_specified':
          instance.book_recurrence_pattern_specified,
      'book_has_files': instance.book_has_files,
      'book_has_notes': instance.book_has_notes,
      'book_has_photos': instance.book_has_photos,
      'book_has_scribbles': instance.book_has_scribbles,
      'book_bookingstatus_change_location':
          instance.book_bookingstatus_change_location,
    };

_$_BookingContact _$$_BookingContactFromJson(Map<String, dynamic> json) =>
    _$_BookingContact(
      bookcont_id: json['bookcont_id'] as int?,
      bookcont_book_id: json['bookcont_book_id'] as int?,
      bookcont_contact_id: json['bookcont_contact_id'] as int?,
      bookcont_contact_initials: json['bookcont_contact_initials'] as String?,
      bookcont_contact_name_display:
          json['bookcont_contact_name_display'] as String?,
      bookcont_contact_name_business:
          json['bookcont_contact_name_business'] as String?,
      bookcont_contact_is_access_disabled:
          json['bookcont_contact_is_access_disabled'] as bool?,
      bookcont_contact_brush_colour_argb:
          json['bookcont_contact_brush_colour_argb'] as String?,
      bookcont_contact_email: json['bookcont_contact_email'] as String?,
      bookcont_contact_phone_mobile: json['bookcont_contact_phone_mobile'],
      bookcont_acceptance_status: json['bookcont_acceptance_status'] as String?,
      bookcont_acceptance_status_name:
          json['bookcont_acceptance_status_name'] as String?,
      bookcont_acceptance_comment:
          json['bookcont_acceptance_comment'] as String?,
      bookcont_bookingstatus_id: json['bookcont_bookingstatus_id'],
      bookcont_bookingstatus_name:
          json['bookcont_bookingstatus_name'] as String?,
      bookcont_contacttype_name: json['bookcont_contacttype_name'] as String?,
      bookcont_bookingstatus_brush_colour_argb:
          json['bookcont_bookingstatus_brush_colour_argb'] as String?,
      is_current_subscriber: json['is_current_subscriber'] as bool?,
      bookcont_contact_is_user: json['bookcont_contact_is_user'] as bool?,
    );

Map<String, dynamic> _$$_BookingContactToJson(_$_BookingContact instance) =>
    <String, dynamic>{
      'bookcont_id': instance.bookcont_id,
      'bookcont_book_id': instance.bookcont_book_id,
      'bookcont_contact_id': instance.bookcont_contact_id,
      'bookcont_contact_initials': instance.bookcont_contact_initials,
      'bookcont_contact_name_display': instance.bookcont_contact_name_display,
      'bookcont_contact_name_business': instance.bookcont_contact_name_business,
      'bookcont_contact_is_access_disabled':
          instance.bookcont_contact_is_access_disabled,
      'bookcont_contact_brush_colour_argb':
          instance.bookcont_contact_brush_colour_argb,
      'bookcont_contact_email': instance.bookcont_contact_email,
      'bookcont_contact_phone_mobile': instance.bookcont_contact_phone_mobile,
      'bookcont_acceptance_status': instance.bookcont_acceptance_status,
      'bookcont_acceptance_status_name':
          instance.bookcont_acceptance_status_name,
      'bookcont_acceptance_comment': instance.bookcont_acceptance_comment,
      'bookcont_bookingstatus_id': instance.bookcont_bookingstatus_id,
      'bookcont_bookingstatus_name': instance.bookcont_bookingstatus_name,
      'bookcont_contacttype_name': instance.bookcont_contacttype_name,
      'bookcont_bookingstatus_brush_colour_argb':
          instance.bookcont_bookingstatus_brush_colour_argb,
      'is_current_subscriber': instance.is_current_subscriber,
      'bookcont_contact_is_user': instance.bookcont_contact_is_user,
    };
