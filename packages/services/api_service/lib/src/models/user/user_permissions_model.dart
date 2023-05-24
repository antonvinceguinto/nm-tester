import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_permissions_model.freezed.dart';
part 'user_permissions_model.g.dart';

@freezed
class UserPermissionsModel with _$UserPermissionsModel {
  const factory UserPermissionsModel({
    String? username,
    int? subscriber_id,
    String? subscriber_name_display,
    String? subscriber_type,
    bool? subscriber_has_pin,
    List<Subscription>? subscriptions,
    MergedPermissions? mergedPermissions,
    Map<String, bool>? mainMenuVisibility,
    bool? has_expired_subscriptions,
    bool? subscription_collect_wip_data,
  }) = _UserPermissionsModel;

  static const empty = UserPermissionsModel();

  const UserPermissionsModel._();

  bool get isAdmin => subscriptions?.first.is_admin ?? false;

  bool get isJobAccessEnabled =>
      subscriptions?.first.permissions?.JobAccessEnabled ?? false;

  bool get isJobAddEditEnabled =>
      subscriptions?.first.permissions?.JobEditAddEnabled ?? false;

  bool get isBookingAccessEnabled =>
      subscriptions?.first.permissions?.BookingAccessEnabled ?? false;

  bool get isBookingAddEditEnabled =>
      subscriptions?.first.permissions?.BookingEditAddEnabled ?? false;

  bool get bookCanChangeStatus =>
      subscriptions?.first.permissions?.BookingStatusEditable ?? false;

  bool get bookCanAcceptReject =>
      subscriptions?.first.permissions?.BookingCanAcceptReject ?? false;

  bool get isContactAccessEnabled =>
      subscriptions?.first.permissions?.ContactAccessEnabled ?? false;

  bool get isContactAddEditEnabled =>
      subscriptions?.first.permissions?.ContactEditAddEnabled ?? false;

  bool get isUserAccessEnabled => mergedPermissions?.UserAccessEnabled ?? false;

  // *** Charges ***
  // ChargeAccessEnabled
  // ChargeBuyPricesEditable
  // ChargeBuyPricesVisible
  // ChargeEditAddEnabled
  // ChargePricingDetailsVisible
  // ChargeSellPricesEditable
  // ChargeSellPricesVisible
  // ChargesDefaultNavigation
  // ChargesNavigationEnabled
  bool get isChargeBuyPricesVisible =>
      subscriptions?.first.permissions?.ChargeBuyPricesVisible ?? false;

  bool get isChargeSellPricesVisible =>
      subscriptions?.first.permissions?.ChargeSellPricesVisible ?? false;

  bool get isChargeAccessEnabled =>
      subscriptions?.first.permissions?.ChargeAccessEnabled ?? false;

  bool get isChargeAddEditEnabled =>
      (subscriptions?.first.permissions?.ChargeEditAddEnabled ?? false);

  // *** End Charges ***

  bool get jobCanAcceptReject =>
      subscriptions?.first.permissions?.JobCanAcceptReject ?? false;

  bool get jobCanChangeStatus =>
      subscriptions?.first.permissions?.JobStatusEditable ?? false;

  bool get jobTemplatesEnabled =>
      subscriptions?.first.permissions?.JobTemplatesEnabled ?? false;

  bool get jobChargesEnabled =>
      subscriptions?.first.permissions?.JobChargesEnabled ?? false;

  factory UserPermissionsModel.fromJson(Map<String, Object?> json) =>
      _$UserPermissionsModelFromJson(json);
}

@freezed
class MergedPermissions with _$MergedPermissions {
  const factory MergedPermissions({
    bool? BookingAccessEnabled,
    bool? BookingEditAddEnabled,
    bool? JobAccessEnabled,
    bool? JobEditAddEnabled,
    bool? ContactAccessEnabled,
    bool? UserAccessEnabled,
    bool? ContactEditAddEnabled,
    bool? ChargeAccessEnabled,
    bool? ChargeEditAddEnabled,
  }) = _MergedPermissions;

  static const empty = MergedPermissions();

  factory MergedPermissions.fromJson(Map<String, Object?> json) =>
      _$MergedPermissionsFromJson(json);
}

@freezed
class Subscription with _$Subscription {
  const factory Subscription({
    int? subscription_id,
    String? subscription_public_name,
    int? subscription_plan,
    int? subscription_plan_minor,
    String? subscription_plan_name,
    int? contact_id,
    dynamic subrole_id,
    dynamic subrole_name,
    bool? is_admin,
    Permissions? permissions,
    bool? subscription_is_setup_complete,
    bool? subscription_is_trial,
    bool? subscription_is_paying,
    dynamic subscription_accounting_provider,
    bool? subscription_is_messaging_enabled,
    bool? subscription_is_sms_enabled,
    bool? subscription_is_email_enabled,
    bool? subscription_order_is_single_supplier,
    bool? subscription_is_job_and_booking_site,
    Contact? contact,
    AccountingSetup? accounting_setup,
    bool? subscription_is_buy_now_button_visible,
    dynamic subscription_chargify_subscription_id,
    dynamic subscription_chargify_customer_reference,
    bool? subscription_is_new_baas_subscription,
    String? subscription_buy_now_button_text,
    String? subscription_buy_now_button_text2,
    bool? subscription_is_purchasable,
    bool? subscription_is_limited,
    bool? is_basic_setup_complete,
    bool? subscription_job_is_user_defined_number,
    bool? subscription_exclude_manual_timesheet_entries,
    int? subscription_job_planning_job_color_source,
    int? subscription_job_planning_task_color_source,
    int? subscription_job_planning_duration_units,
    bool? subscription_job_planning_display_hover_text,
    int? subscription_job_planning_working_days,
    int? subscription_job_planning_work_start_time,
    int? subscription_job_planning_work_end_time,
    int? subscription_max_attachment_size,
    bool? subscription_collect_wip_data,
    bool? subscription_is_detailed_back_costing_enabled,
    bool? subscription_is_beta_tester,
  }) = _Subscription;

  static const empty = Subscription();

  factory Subscription.fromJson(Map<String, Object?> json) =>
      _$SubscriptionFromJson(json);
}

@freezed
class AccountingSetup with _$AccountingSetup {
  const factory AccountingSetup({
    int? subscription_id,
    String? subscription_currency,
    dynamic subscription_accounting_provider,
    bool? subscription_is_payroll_enabled,
    bool? subscription_is_using_accounting_provider_payroll,
    bool? subscription_is_taxrates_setup_valid,
    DefaultTaxrateFor? default_taxrate_for_sales,
    DefaultTaxrateFor? default_taxrate_for_purchases,
    dynamic subscription_accounting_provider_info,
    Map<String, bool>? subscription_quote_settings,
    Map<String, bool>? subscription_order_settings,
    Map<String, bool>? subscription_invoice_settings,
    Map<String, bool>? subscription_supplier_invoice_settings,
    Map<String, bool>? subscription_template_settings,
    Map<String, bool>? subscription_actuals_settings,
    String? subscription_country_code,
    SubscriptionGpsTrackingPreferences? subscription_gps_tracking_preferences,
    String? subscription_invoice_default_title,
    String? subscription_quote_default_title,
    String? subscription_order_default_title,
  }) = _AccountingSetup;

  static const empty = AccountingSetup();

  factory AccountingSetup.fromJson(Map<String, Object?> json) =>
      _$AccountingSetupFromJson(json);
}

@freezed
class DefaultTaxrateFor with _$DefaultTaxrateFor {
  const factory DefaultTaxrateFor({
    int? taxrate_id,
    double? taxrate_rate,
    String? taxrate_name,
  }) = _DefaultTaxrateFor;

  static const empty = DefaultTaxrateFor();

  factory DefaultTaxrateFor.fromJson(Map<String, Object?> json) =>
      _$DefaultTaxrateForFromJson(json);
}

@freezed
class SubscriptionGpsTrackingPreferences
    with _$SubscriptionGpsTrackingPreferences {
  const factory SubscriptionGpsTrackingPreferences({
    bool? subscription_timesheet_entries_gps_tracking,
    bool? subscription_job_and_booking_status_gps_tracking,
    bool? subscription_job_and_booking_onsite_gps_tracking,
  }) = _SubscriptionGpsTrackingPreferences;

  static const empty = SubscriptionGpsTrackingPreferences();

  factory SubscriptionGpsTrackingPreferences.fromJson(
          Map<String, Object?> json) =>
      _$SubscriptionGpsTrackingPreferencesFromJson(json);
}

@freezed
class Contact with _$Contact {
  const factory Contact({
    int? contact_id,
    String? contact_email,
    String? contact_name_display,
    bool? contact_is_user,
    dynamic contact_phone_mobile,
    String? contact_brush_colour_argb,
  }) = _Contact;

  static const empty = Contact();

  factory Contact.fromJson(Map<String, Object?> json) =>
      _$ContactFromJson(json);
}

@freezed
class Permissions with _$Permissions {
  const factory Permissions({
    bool? DashboardAccessEnabled,
    bool? TimesheetsAccessEnabled,
    bool? TimesheetsCanChangeBillableStatus,
    bool? TimesheetsCanAccessOtherUsers,
    bool? TimesheetsCanReadOnlyAccessOtherUsers,
    bool? TimesheetsDurationEntryTypeEnabled,
    bool? TimesheetsHideViewJobButtonEnabled,
    bool? TimesheetsHideViewTaskButtonEnabled,
    bool? TimesheetsDescriptionMandatoryEnabled,
    bool? JobAddTimesheetEntryEnabled,
    bool? BookingAddTimesheetEntryEnabled,
    bool? CalendarAccessEnabled,
    bool? ActivityLogAccessEnabled,
    bool? TemplateAccessEnabled,
    bool? TemplatesEditable,
    bool? QuoteAccessEnabled,
    bool? QuotesEditable,
    bool? QuotesSendable,
    bool? QuotesAcceptable,
    bool? OrderAccessEnabled,
    bool? OrdersEditable,
    bool? OrdersSendable,
    bool? InvoiceAccessEnabled,
    bool? InvoicesEditable,
    bool? InvoicesSendable,
    bool? InvoicesSyncable,
    bool? PaymentsAndCreditNotesEnabled,
    bool? SiPaymentsAndCreditNotesEnabled,
    bool? SupplierInvoiceAccessEnabled,
    bool? SupplierInvoicesEditable,
    bool? SupplierInvoicesSendable,
    bool? SupplierInvoicesSyncable,
    bool? JobAccessEnabled,
    bool? JobEditAddEnabled,
    bool? JobStatusEditable,
    bool? JobCanComplete,
    String? JobDataVisibility,
    bool? JobCanAcceptReject,
    bool? JobPhotosEnabled,
    bool? JobPhotosEditable,
    bool? JobNotesEnabled,
    bool? JobNotesEditable,
    bool? JobScribblesEnabled,
    bool? JobScribblesEditable,
    bool? JobFilesEnabled,
    bool? JobFilesEditable,
    bool? JobChargesEnabled,
    bool? JobChargesEditable,
    bool? JobChargesAllVisible,
    bool? JobSheetsEnabled,
    bool? JobTemplatesEnabled,
    bool? BookingAccessEnabled,
    bool? BookingEditAddEnabled,
    bool? BookingStatusEditable,
    bool? BookingCanComplete,
    bool? BookingCanAcceptReject,
    String? BookingDataVisibility,
    bool? BookingPhotosEnabled,
    bool? BookingPhotosEditable,
    bool? BookingNotesEnabled,
    bool? BookingNotesEditable,
    bool? BookingScribblesEnabled,
    bool? BookingScribblesEditable,
    bool? BookingFilesEnabled,
    bool? BookingFilesEditable,
    bool? BookingChargesEnabled,
    bool? BookingChargesEditable,
    bool? BookingChargesAllVisible,
    bool? ContactAccessEnabled,
    bool? ContactEditAddEnabled,
    bool? ContactViewContactDetailsWithin,
    bool? ContactNotesEnabled,
    bool? ContactNotesEditable,
    bool? ContactFilesEnabled,
    bool? ContactFilesEditable,
    bool? UserOnlyAccessEnabled,
    bool? LivePriceBookAccessEnabled,
    bool? ChargeAccessEnabled,
    bool? ChargeEditAddEnabled,
    bool? ChargePricingDetailsVisible,
    bool? ChargeBuyPricesVisible,
    bool? ChargeBuyPricesEditable,
    bool? ChargeSellPricesVisible,
    bool? ChargeSellPricesEditable,
    bool? UnbilledChargeTotalsVisible,
    bool? JobFinancialTotalsVisible,
    bool? SectionCostRevenueVisible,
    bool? JobAndBookingCostSummaryVisible,
    bool? CalendarDefaultNavigation,
    bool? TimesheetsDefaultNavigation,
    bool? JobsDefaultNavigation,
    bool? BookingsDefaultNavigation,
    bool? QuotesDefaultNavigation,
    bool? OrdersDefaultNavigation,
    bool? InvoicesDefaultNavigation,
    bool? SupplierInvoicesDefaultNavigation,
    bool? ContactsDefaultNavigation,
    bool? ChargesDefaultNavigation,
    bool? JobPlanningDefaultNavigation,
    bool? JobsNavigationEnabled,
    bool? BookingsNavigationEnabled,
    bool? ChargesNavigationEnabled,
    bool? JobPlanningEnabled,
  }) = _Permissions;

  static const empty = Permissions();

  const Permissions._();

  bool get canViewCostSummary =>
      (ChargePricingDetailsVisible ?? false) &&
      (UnbilledChargeTotalsVisible ?? false);

  factory Permissions.fromJson(Map<String, Object?> json) =>
      _$PermissionsFromJson(json);
}
