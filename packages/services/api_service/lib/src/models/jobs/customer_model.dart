import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_model.freezed.dart';
part 'customer_model.g.dart';

@freezed
class CustomerModel with _$CustomerModel {
  const factory CustomerModel({
    @Default([]) List<CustomerDatum> data,
    int? total,
    int? total_all,
    @Default([]) List<HardwareProvider> hardwareProviders,
  }) = _CustomerModel;

  static const empty = CustomerModel(
    data: [],
    total: 0,
    total_all: 0,
    hardwareProviders: [],
  );

  factory CustomerModel.fromJson(Map<String, Object?> json) =>
      _$CustomerModelFromJson(json);
}

@freezed
class HardwareProvider with _$HardwareProvider {
  const factory HardwareProvider({
    String? is_name,
    int? is_contact_id,
    int? is_tagged_products_contact_id,
  }) = _HardwareProvider;

  static const empty = HardwareProvider(
    is_name: '',
    is_contact_id: 0,
    is_tagged_products_contact_id: 0,
  );

  factory HardwareProvider.fromJson(Map<String, Object?> json) =>
      _$HardwareProviderFromJson(json);
}

@freezed
class CustomerDatum with _$CustomerDatum {
  const factory CustomerDatum({
    bool? contact_is_user,
    bool? contact_is_admin,
    bool? contact_is_access_disabled,
    int? contact_subrole_id,
    String? contact_subrole_name,
    String? contact_invitation_status,
    String? contact_invitation_type,
    int? contact_id,
    String? contact_code,
    String? contact_initials,
    String? contact_name_display,
    String? contact_name_first,
    String? contact_name_last,
    String? contact_name_business,
    String? contact_address,
    String? contact_address_coords,
    String? contact_billing_address,
    String? contact_email,
    String? contact_email_for_invoices,
    String? contact_special_notes,
    String? contact_phone_ddi,
    String? contact_phone_work,
    String? contact_phone_mobile,
    String? contact_phone_home,
    String? contact_phone_fax,
    int? contact_subscription_id,
    bool? contact_has_profile_photo,
    String? contact_brush_colour_argb,
    String? contact_photo_uri,
    String? contact_photo_thumb_uri,
    String? contact_logo_uri,
    String? contact_web_site,
    @Default([]) List<CustomerContactType> contact_types,
    bool? contact_is_integrated_supplier,
    bool? contact_is_supplier_for_tagged_products,
    String? contact_hardware_provider,
    String? integrated_supplier_name,
    bool? contact_isdeleted,
    bool? contact_is_archived,
    int? contact_invoice_due_rule,
    dynamic contact_invoice_due_days,
    int? contact_quote_expiry_rule,
    dynamic contact_quote_expiry_days,
    bool? contact_has_saleitems,
    dynamic conatct_is_linked_to_related_object,
    String? contact_created_by_contact_name_display,
    DateTime? contact_created_date,
    String? contact_updated_by_contact_name_display,
    DateTime? contact_updated_date,
  }) = _CustomerDatum;

  factory CustomerDatum.fromJson(Map<String, Object?> json) =>
      _$CustomerDatumFromJson(json);
}

@freezed
class CustomerContactType with _$CustomerContactType {
  const factory CustomerContactType({
    int? contacttype_id,
    String? contacttype_name,
  }) = _CustomerContactType;

  factory CustomerContactType.fromJson(Map<String, Object?> json) =>
      _$CustomerContactTypeFromJson(json);
}
