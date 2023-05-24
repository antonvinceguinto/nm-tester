// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CustomerModel _$$_CustomerModelFromJson(Map<String, dynamic> json) =>
    _$_CustomerModel(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => CustomerDatum.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      total: json['total'] as int?,
      total_all: json['total_all'] as int?,
      hardwareProviders: (json['hardwareProviders'] as List<dynamic>?)
              ?.map((e) => HardwareProvider.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_CustomerModelToJson(_$_CustomerModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'total': instance.total,
      'total_all': instance.total_all,
      'hardwareProviders': instance.hardwareProviders,
    };

_$_HardwareProvider _$$_HardwareProviderFromJson(Map<String, dynamic> json) =>
    _$_HardwareProvider(
      is_name: json['is_name'] as String?,
      is_contact_id: json['is_contact_id'] as int?,
      is_tagged_products_contact_id:
          json['is_tagged_products_contact_id'] as int?,
    );

Map<String, dynamic> _$$_HardwareProviderToJson(_$_HardwareProvider instance) =>
    <String, dynamic>{
      'is_name': instance.is_name,
      'is_contact_id': instance.is_contact_id,
      'is_tagged_products_contact_id': instance.is_tagged_products_contact_id,
    };

_$_CustomerDatum _$$_CustomerDatumFromJson(Map<String, dynamic> json) =>
    _$_CustomerDatum(
      contact_is_user: json['contact_is_user'] as bool?,
      contact_is_admin: json['contact_is_admin'] as bool?,
      contact_is_access_disabled: json['contact_is_access_disabled'] as bool?,
      contact_subrole_id: json['contact_subrole_id'] as int?,
      contact_subrole_name: json['contact_subrole_name'] as String?,
      contact_invitation_status: json['contact_invitation_status'] as String?,
      contact_invitation_type: json['contact_invitation_type'] as String?,
      contact_id: json['contact_id'] as int?,
      contact_code: json['contact_code'] as String?,
      contact_initials: json['contact_initials'] as String?,
      contact_name_display: json['contact_name_display'] as String?,
      contact_name_first: json['contact_name_first'] as String?,
      contact_name_last: json['contact_name_last'] as String?,
      contact_name_business: json['contact_name_business'] as String?,
      contact_address: json['contact_address'] as String?,
      contact_address_coords: json['contact_address_coords'] as String?,
      contact_billing_address: json['contact_billing_address'] as String?,
      contact_email: json['contact_email'] as String?,
      contact_email_for_invoices: json['contact_email_for_invoices'] as String?,
      contact_special_notes: json['contact_special_notes'] as String?,
      contact_phone_ddi: json['contact_phone_ddi'] as String?,
      contact_phone_work: json['contact_phone_work'] as String?,
      contact_phone_mobile: json['contact_phone_mobile'] as String?,
      contact_phone_home: json['contact_phone_home'] as String?,
      contact_phone_fax: json['contact_phone_fax'] as String?,
      contact_subscription_id: json['contact_subscription_id'] as int?,
      contact_has_profile_photo: json['contact_has_profile_photo'] as bool?,
      contact_brush_colour_argb: json['contact_brush_colour_argb'] as String?,
      contact_photo_uri: json['contact_photo_uri'] as String?,
      contact_photo_thumb_uri: json['contact_photo_thumb_uri'] as String?,
      contact_logo_uri: json['contact_logo_uri'] as String?,
      contact_web_site: json['contact_web_site'] as String?,
      contact_types: (json['contact_types'] as List<dynamic>?)
              ?.map((e) =>
                  CustomerContactType.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      contact_is_integrated_supplier:
          json['contact_is_integrated_supplier'] as bool?,
      contact_is_supplier_for_tagged_products:
          json['contact_is_supplier_for_tagged_products'] as bool?,
      contact_hardware_provider: json['contact_hardware_provider'] as String?,
      integrated_supplier_name: json['integrated_supplier_name'] as String?,
      contact_isdeleted: json['contact_isdeleted'] as bool?,
      contact_is_archived: json['contact_is_archived'] as bool?,
      contact_invoice_due_rule: json['contact_invoice_due_rule'] as int?,
      contact_invoice_due_days: json['contact_invoice_due_days'],
      contact_quote_expiry_rule: json['contact_quote_expiry_rule'] as int?,
      contact_quote_expiry_days: json['contact_quote_expiry_days'],
      contact_has_saleitems: json['contact_has_saleitems'] as bool?,
      conatct_is_linked_to_related_object:
          json['conatct_is_linked_to_related_object'],
      contact_created_by_contact_name_display:
          json['contact_created_by_contact_name_display'] as String?,
      contact_created_date: json['contact_created_date'] == null
          ? null
          : DateTime.parse(json['contact_created_date'] as String),
      contact_updated_by_contact_name_display:
          json['contact_updated_by_contact_name_display'] as String?,
      contact_updated_date: json['contact_updated_date'] == null
          ? null
          : DateTime.parse(json['contact_updated_date'] as String),
    );

Map<String, dynamic> _$$_CustomerDatumToJson(_$_CustomerDatum instance) =>
    <String, dynamic>{
      'contact_is_user': instance.contact_is_user,
      'contact_is_admin': instance.contact_is_admin,
      'contact_is_access_disabled': instance.contact_is_access_disabled,
      'contact_subrole_id': instance.contact_subrole_id,
      'contact_subrole_name': instance.contact_subrole_name,
      'contact_invitation_status': instance.contact_invitation_status,
      'contact_invitation_type': instance.contact_invitation_type,
      'contact_id': instance.contact_id,
      'contact_code': instance.contact_code,
      'contact_initials': instance.contact_initials,
      'contact_name_display': instance.contact_name_display,
      'contact_name_first': instance.contact_name_first,
      'contact_name_last': instance.contact_name_last,
      'contact_name_business': instance.contact_name_business,
      'contact_address': instance.contact_address,
      'contact_address_coords': instance.contact_address_coords,
      'contact_billing_address': instance.contact_billing_address,
      'contact_email': instance.contact_email,
      'contact_email_for_invoices': instance.contact_email_for_invoices,
      'contact_special_notes': instance.contact_special_notes,
      'contact_phone_ddi': instance.contact_phone_ddi,
      'contact_phone_work': instance.contact_phone_work,
      'contact_phone_mobile': instance.contact_phone_mobile,
      'contact_phone_home': instance.contact_phone_home,
      'contact_phone_fax': instance.contact_phone_fax,
      'contact_subscription_id': instance.contact_subscription_id,
      'contact_has_profile_photo': instance.contact_has_profile_photo,
      'contact_brush_colour_argb': instance.contact_brush_colour_argb,
      'contact_photo_uri': instance.contact_photo_uri,
      'contact_photo_thumb_uri': instance.contact_photo_thumb_uri,
      'contact_logo_uri': instance.contact_logo_uri,
      'contact_web_site': instance.contact_web_site,
      'contact_types': instance.contact_types,
      'contact_is_integrated_supplier': instance.contact_is_integrated_supplier,
      'contact_is_supplier_for_tagged_products':
          instance.contact_is_supplier_for_tagged_products,
      'contact_hardware_provider': instance.contact_hardware_provider,
      'integrated_supplier_name': instance.integrated_supplier_name,
      'contact_isdeleted': instance.contact_isdeleted,
      'contact_is_archived': instance.contact_is_archived,
      'contact_invoice_due_rule': instance.contact_invoice_due_rule,
      'contact_invoice_due_days': instance.contact_invoice_due_days,
      'contact_quote_expiry_rule': instance.contact_quote_expiry_rule,
      'contact_quote_expiry_days': instance.contact_quote_expiry_days,
      'contact_has_saleitems': instance.contact_has_saleitems,
      'conatct_is_linked_to_related_object':
          instance.conatct_is_linked_to_related_object,
      'contact_created_by_contact_name_display':
          instance.contact_created_by_contact_name_display,
      'contact_created_date': instance.contact_created_date?.toIso8601String(),
      'contact_updated_by_contact_name_display':
          instance.contact_updated_by_contact_name_display,
      'contact_updated_date': instance.contact_updated_date?.toIso8601String(),
    };

_$_CustomerContactType _$$_CustomerContactTypeFromJson(
        Map<String, dynamic> json) =>
    _$_CustomerContactType(
      contacttype_id: json['contacttype_id'] as int?,
      contacttype_name: json['contacttype_name'] as String?,
    );

Map<String, dynamic> _$$_CustomerContactTypeToJson(
        _$_CustomerContactType instance) =>
    <String, dynamic>{
      'contacttype_id': instance.contacttype_id,
      'contacttype_name': instance.contacttype_name,
    };
