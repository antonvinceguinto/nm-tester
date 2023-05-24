// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_permissions_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserPermissionsModel _$$_UserPermissionsModelFromJson(
        Map<String, dynamic> json) =>
    _$_UserPermissionsModel(
      username: json['username'] as String?,
      subscriber_id: json['subscriber_id'] as int?,
      subscriber_name_display: json['subscriber_name_display'] as String?,
      subscriber_type: json['subscriber_type'] as String?,
      subscriber_has_pin: json['subscriber_has_pin'] as bool?,
      subscriptions: (json['subscriptions'] as List<dynamic>?)
          ?.map((e) => Subscription.fromJson(e as Map<String, dynamic>))
          .toList(),
      mergedPermissions: json['mergedPermissions'] == null
          ? null
          : MergedPermissions.fromJson(
              json['mergedPermissions'] as Map<String, dynamic>),
      mainMenuVisibility:
          (json['mainMenuVisibility'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as bool),
      ),
      has_expired_subscriptions: json['has_expired_subscriptions'] as bool?,
      subscription_collect_wip_data:
          json['subscription_collect_wip_data'] as bool?,
    );

Map<String, dynamic> _$$_UserPermissionsModelToJson(
        _$_UserPermissionsModel instance) =>
    <String, dynamic>{
      'username': instance.username,
      'subscriber_id': instance.subscriber_id,
      'subscriber_name_display': instance.subscriber_name_display,
      'subscriber_type': instance.subscriber_type,
      'subscriber_has_pin': instance.subscriber_has_pin,
      'subscriptions': instance.subscriptions,
      'mergedPermissions': instance.mergedPermissions,
      'mainMenuVisibility': instance.mainMenuVisibility,
      'has_expired_subscriptions': instance.has_expired_subscriptions,
      'subscription_collect_wip_data': instance.subscription_collect_wip_data,
    };

_$_MergedPermissions _$$_MergedPermissionsFromJson(Map<String, dynamic> json) =>
    _$_MergedPermissions(
      BookingAccessEnabled: json['BookingAccessEnabled'] as bool?,
      BookingEditAddEnabled: json['BookingEditAddEnabled'] as bool?,
      JobAccessEnabled: json['JobAccessEnabled'] as bool?,
      JobEditAddEnabled: json['JobEditAddEnabled'] as bool?,
      ContactAccessEnabled: json['ContactAccessEnabled'] as bool?,
      UserAccessEnabled: json['UserAccessEnabled'] as bool?,
      ContactEditAddEnabled: json['ContactEditAddEnabled'] as bool?,
      ChargeAccessEnabled: json['ChargeAccessEnabled'] as bool?,
      ChargeEditAddEnabled: json['ChargeEditAddEnabled'] as bool?,
    );

Map<String, dynamic> _$$_MergedPermissionsToJson(
        _$_MergedPermissions instance) =>
    <String, dynamic>{
      'BookingAccessEnabled': instance.BookingAccessEnabled,
      'BookingEditAddEnabled': instance.BookingEditAddEnabled,
      'JobAccessEnabled': instance.JobAccessEnabled,
      'JobEditAddEnabled': instance.JobEditAddEnabled,
      'ContactAccessEnabled': instance.ContactAccessEnabled,
      'UserAccessEnabled': instance.UserAccessEnabled,
      'ContactEditAddEnabled': instance.ContactEditAddEnabled,
      'ChargeAccessEnabled': instance.ChargeAccessEnabled,
      'ChargeEditAddEnabled': instance.ChargeEditAddEnabled,
    };

_$_Subscription _$$_SubscriptionFromJson(Map<String, dynamic> json) =>
    _$_Subscription(
      subscription_id: json['subscription_id'] as int?,
      subscription_public_name: json['subscription_public_name'] as String?,
      subscription_plan: json['subscription_plan'] as int?,
      subscription_plan_minor: json['subscription_plan_minor'] as int?,
      subscription_plan_name: json['subscription_plan_name'] as String?,
      contact_id: json['contact_id'] as int?,
      subrole_id: json['subrole_id'],
      subrole_name: json['subrole_name'],
      is_admin: json['is_admin'] as bool?,
      permissions: json['permissions'] == null
          ? null
          : Permissions.fromJson(json['permissions'] as Map<String, dynamic>),
      subscription_is_setup_complete:
          json['subscription_is_setup_complete'] as bool?,
      subscription_is_trial: json['subscription_is_trial'] as bool?,
      subscription_is_paying: json['subscription_is_paying'] as bool?,
      subscription_accounting_provider:
          json['subscription_accounting_provider'],
      subscription_is_messaging_enabled:
          json['subscription_is_messaging_enabled'] as bool?,
      subscription_is_sms_enabled: json['subscription_is_sms_enabled'] as bool?,
      subscription_is_email_enabled:
          json['subscription_is_email_enabled'] as bool?,
      subscription_order_is_single_supplier:
          json['subscription_order_is_single_supplier'] as bool?,
      subscription_is_job_and_booking_site:
          json['subscription_is_job_and_booking_site'] as bool?,
      contact: json['contact'] == null
          ? null
          : Contact.fromJson(json['contact'] as Map<String, dynamic>),
      accounting_setup: json['accounting_setup'] == null
          ? null
          : AccountingSetup.fromJson(
              json['accounting_setup'] as Map<String, dynamic>),
      subscription_is_buy_now_button_visible:
          json['subscription_is_buy_now_button_visible'] as bool?,
      subscription_chargify_subscription_id:
          json['subscription_chargify_subscription_id'],
      subscription_chargify_customer_reference:
          json['subscription_chargify_customer_reference'],
      subscription_is_new_baas_subscription:
          json['subscription_is_new_baas_subscription'] as bool?,
      subscription_buy_now_button_text:
          json['subscription_buy_now_button_text'] as String?,
      subscription_buy_now_button_text2:
          json['subscription_buy_now_button_text2'] as String?,
      subscription_is_purchasable: json['subscription_is_purchasable'] as bool?,
      subscription_is_limited: json['subscription_is_limited'] as bool?,
      is_basic_setup_complete: json['is_basic_setup_complete'] as bool?,
      subscription_job_is_user_defined_number:
          json['subscription_job_is_user_defined_number'] as bool?,
      subscription_exclude_manual_timesheet_entries:
          json['subscription_exclude_manual_timesheet_entries'] as bool?,
      subscription_job_planning_job_color_source:
          json['subscription_job_planning_job_color_source'] as int?,
      subscription_job_planning_task_color_source:
          json['subscription_job_planning_task_color_source'] as int?,
      subscription_job_planning_duration_units:
          json['subscription_job_planning_duration_units'] as int?,
      subscription_job_planning_display_hover_text:
          json['subscription_job_planning_display_hover_text'] as bool?,
      subscription_job_planning_working_days:
          json['subscription_job_planning_working_days'] as int?,
      subscription_job_planning_work_start_time:
          json['subscription_job_planning_work_start_time'] as int?,
      subscription_job_planning_work_end_time:
          json['subscription_job_planning_work_end_time'] as int?,
      subscription_max_attachment_size:
          json['subscription_max_attachment_size'] as int?,
      subscription_collect_wip_data:
          json['subscription_collect_wip_data'] as bool?,
      subscription_is_detailed_back_costing_enabled:
          json['subscription_is_detailed_back_costing_enabled'] as bool?,
      subscription_is_beta_tester: json['subscription_is_beta_tester'] as bool?,
    );

Map<String, dynamic> _$$_SubscriptionToJson(_$_Subscription instance) =>
    <String, dynamic>{
      'subscription_id': instance.subscription_id,
      'subscription_public_name': instance.subscription_public_name,
      'subscription_plan': instance.subscription_plan,
      'subscription_plan_minor': instance.subscription_plan_minor,
      'subscription_plan_name': instance.subscription_plan_name,
      'contact_id': instance.contact_id,
      'subrole_id': instance.subrole_id,
      'subrole_name': instance.subrole_name,
      'is_admin': instance.is_admin,
      'permissions': instance.permissions,
      'subscription_is_setup_complete': instance.subscription_is_setup_complete,
      'subscription_is_trial': instance.subscription_is_trial,
      'subscription_is_paying': instance.subscription_is_paying,
      'subscription_accounting_provider':
          instance.subscription_accounting_provider,
      'subscription_is_messaging_enabled':
          instance.subscription_is_messaging_enabled,
      'subscription_is_sms_enabled': instance.subscription_is_sms_enabled,
      'subscription_is_email_enabled': instance.subscription_is_email_enabled,
      'subscription_order_is_single_supplier':
          instance.subscription_order_is_single_supplier,
      'subscription_is_job_and_booking_site':
          instance.subscription_is_job_and_booking_site,
      'contact': instance.contact,
      'accounting_setup': instance.accounting_setup,
      'subscription_is_buy_now_button_visible':
          instance.subscription_is_buy_now_button_visible,
      'subscription_chargify_subscription_id':
          instance.subscription_chargify_subscription_id,
      'subscription_chargify_customer_reference':
          instance.subscription_chargify_customer_reference,
      'subscription_is_new_baas_subscription':
          instance.subscription_is_new_baas_subscription,
      'subscription_buy_now_button_text':
          instance.subscription_buy_now_button_text,
      'subscription_buy_now_button_text2':
          instance.subscription_buy_now_button_text2,
      'subscription_is_purchasable': instance.subscription_is_purchasable,
      'subscription_is_limited': instance.subscription_is_limited,
      'is_basic_setup_complete': instance.is_basic_setup_complete,
      'subscription_job_is_user_defined_number':
          instance.subscription_job_is_user_defined_number,
      'subscription_exclude_manual_timesheet_entries':
          instance.subscription_exclude_manual_timesheet_entries,
      'subscription_job_planning_job_color_source':
          instance.subscription_job_planning_job_color_source,
      'subscription_job_planning_task_color_source':
          instance.subscription_job_planning_task_color_source,
      'subscription_job_planning_duration_units':
          instance.subscription_job_planning_duration_units,
      'subscription_job_planning_display_hover_text':
          instance.subscription_job_planning_display_hover_text,
      'subscription_job_planning_working_days':
          instance.subscription_job_planning_working_days,
      'subscription_job_planning_work_start_time':
          instance.subscription_job_planning_work_start_time,
      'subscription_job_planning_work_end_time':
          instance.subscription_job_planning_work_end_time,
      'subscription_max_attachment_size':
          instance.subscription_max_attachment_size,
      'subscription_collect_wip_data': instance.subscription_collect_wip_data,
      'subscription_is_detailed_back_costing_enabled':
          instance.subscription_is_detailed_back_costing_enabled,
      'subscription_is_beta_tester': instance.subscription_is_beta_tester,
    };

_$_AccountingSetup _$$_AccountingSetupFromJson(Map<String, dynamic> json) =>
    _$_AccountingSetup(
      subscription_id: json['subscription_id'] as int?,
      subscription_currency: json['subscription_currency'] as String?,
      subscription_accounting_provider:
          json['subscription_accounting_provider'],
      subscription_is_payroll_enabled:
          json['subscription_is_payroll_enabled'] as bool?,
      subscription_is_using_accounting_provider_payroll:
          json['subscription_is_using_accounting_provider_payroll'] as bool?,
      subscription_is_taxrates_setup_valid:
          json['subscription_is_taxrates_setup_valid'] as bool?,
      default_taxrate_for_sales: json['default_taxrate_for_sales'] == null
          ? null
          : DefaultTaxrateFor.fromJson(
              json['default_taxrate_for_sales'] as Map<String, dynamic>),
      default_taxrate_for_purchases: json['default_taxrate_for_purchases'] ==
              null
          ? null
          : DefaultTaxrateFor.fromJson(
              json['default_taxrate_for_purchases'] as Map<String, dynamic>),
      subscription_accounting_provider_info:
          json['subscription_accounting_provider_info'],
      subscription_quote_settings:
          (json['subscription_quote_settings'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as bool),
      ),
      subscription_order_settings:
          (json['subscription_order_settings'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as bool),
      ),
      subscription_invoice_settings:
          (json['subscription_invoice_settings'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as bool),
      ),
      subscription_supplier_invoice_settings:
          (json['subscription_supplier_invoice_settings']
                  as Map<String, dynamic>?)
              ?.map(
        (k, e) => MapEntry(k, e as bool),
      ),
      subscription_template_settings:
          (json['subscription_template_settings'] as Map<String, dynamic>?)
              ?.map(
        (k, e) => MapEntry(k, e as bool),
      ),
      subscription_actuals_settings:
          (json['subscription_actuals_settings'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as bool),
      ),
      subscription_country_code: json['subscription_country_code'] as String?,
      subscription_gps_tracking_preferences:
          json['subscription_gps_tracking_preferences'] == null
              ? null
              : SubscriptionGpsTrackingPreferences.fromJson(
                  json['subscription_gps_tracking_preferences']
                      as Map<String, dynamic>),
      subscription_invoice_default_title:
          json['subscription_invoice_default_title'] as String?,
      subscription_quote_default_title:
          json['subscription_quote_default_title'] as String?,
      subscription_order_default_title:
          json['subscription_order_default_title'] as String?,
    );

Map<String, dynamic> _$$_AccountingSetupToJson(_$_AccountingSetup instance) =>
    <String, dynamic>{
      'subscription_id': instance.subscription_id,
      'subscription_currency': instance.subscription_currency,
      'subscription_accounting_provider':
          instance.subscription_accounting_provider,
      'subscription_is_payroll_enabled':
          instance.subscription_is_payroll_enabled,
      'subscription_is_using_accounting_provider_payroll':
          instance.subscription_is_using_accounting_provider_payroll,
      'subscription_is_taxrates_setup_valid':
          instance.subscription_is_taxrates_setup_valid,
      'default_taxrate_for_sales': instance.default_taxrate_for_sales,
      'default_taxrate_for_purchases': instance.default_taxrate_for_purchases,
      'subscription_accounting_provider_info':
          instance.subscription_accounting_provider_info,
      'subscription_quote_settings': instance.subscription_quote_settings,
      'subscription_order_settings': instance.subscription_order_settings,
      'subscription_invoice_settings': instance.subscription_invoice_settings,
      'subscription_supplier_invoice_settings':
          instance.subscription_supplier_invoice_settings,
      'subscription_template_settings': instance.subscription_template_settings,
      'subscription_actuals_settings': instance.subscription_actuals_settings,
      'subscription_country_code': instance.subscription_country_code,
      'subscription_gps_tracking_preferences':
          instance.subscription_gps_tracking_preferences,
      'subscription_invoice_default_title':
          instance.subscription_invoice_default_title,
      'subscription_quote_default_title':
          instance.subscription_quote_default_title,
      'subscription_order_default_title':
          instance.subscription_order_default_title,
    };

_$_DefaultTaxrateFor _$$_DefaultTaxrateForFromJson(Map<String, dynamic> json) =>
    _$_DefaultTaxrateFor(
      taxrate_id: json['taxrate_id'] as int?,
      taxrate_rate: (json['taxrate_rate'] as num?)?.toDouble(),
      taxrate_name: json['taxrate_name'] as String?,
    );

Map<String, dynamic> _$$_DefaultTaxrateForToJson(
        _$_DefaultTaxrateFor instance) =>
    <String, dynamic>{
      'taxrate_id': instance.taxrate_id,
      'taxrate_rate': instance.taxrate_rate,
      'taxrate_name': instance.taxrate_name,
    };

_$_SubscriptionGpsTrackingPreferences
    _$$_SubscriptionGpsTrackingPreferencesFromJson(Map<String, dynamic> json) =>
        _$_SubscriptionGpsTrackingPreferences(
          subscription_timesheet_entries_gps_tracking:
              json['subscription_timesheet_entries_gps_tracking'] as bool?,
          subscription_job_and_booking_status_gps_tracking:
              json['subscription_job_and_booking_status_gps_tracking'] as bool?,
          subscription_job_and_booking_onsite_gps_tracking:
              json['subscription_job_and_booking_onsite_gps_tracking'] as bool?,
        );

Map<String, dynamic> _$$_SubscriptionGpsTrackingPreferencesToJson(
        _$_SubscriptionGpsTrackingPreferences instance) =>
    <String, dynamic>{
      'subscription_timesheet_entries_gps_tracking':
          instance.subscription_timesheet_entries_gps_tracking,
      'subscription_job_and_booking_status_gps_tracking':
          instance.subscription_job_and_booking_status_gps_tracking,
      'subscription_job_and_booking_onsite_gps_tracking':
          instance.subscription_job_and_booking_onsite_gps_tracking,
    };

_$_Contact _$$_ContactFromJson(Map<String, dynamic> json) => _$_Contact(
      contact_id: json['contact_id'] as int?,
      contact_email: json['contact_email'] as String?,
      contact_name_display: json['contact_name_display'] as String?,
      contact_is_user: json['contact_is_user'] as bool?,
      contact_phone_mobile: json['contact_phone_mobile'],
      contact_brush_colour_argb: json['contact_brush_colour_argb'] as String?,
    );

Map<String, dynamic> _$$_ContactToJson(_$_Contact instance) =>
    <String, dynamic>{
      'contact_id': instance.contact_id,
      'contact_email': instance.contact_email,
      'contact_name_display': instance.contact_name_display,
      'contact_is_user': instance.contact_is_user,
      'contact_phone_mobile': instance.contact_phone_mobile,
      'contact_brush_colour_argb': instance.contact_brush_colour_argb,
    };

_$_Permissions _$$_PermissionsFromJson(Map<String, dynamic> json) =>
    _$_Permissions(
      DashboardAccessEnabled: json['DashboardAccessEnabled'] as bool?,
      TimesheetsAccessEnabled: json['TimesheetsAccessEnabled'] as bool?,
      TimesheetsCanChangeBillableStatus:
          json['TimesheetsCanChangeBillableStatus'] as bool?,
      TimesheetsCanAccessOtherUsers:
          json['TimesheetsCanAccessOtherUsers'] as bool?,
      TimesheetsCanReadOnlyAccessOtherUsers:
          json['TimesheetsCanReadOnlyAccessOtherUsers'] as bool?,
      TimesheetsDurationEntryTypeEnabled:
          json['TimesheetsDurationEntryTypeEnabled'] as bool?,
      TimesheetsHideViewJobButtonEnabled:
          json['TimesheetsHideViewJobButtonEnabled'] as bool?,
      TimesheetsHideViewTaskButtonEnabled:
          json['TimesheetsHideViewTaskButtonEnabled'] as bool?,
      TimesheetsDescriptionMandatoryEnabled:
          json['TimesheetsDescriptionMandatoryEnabled'] as bool?,
      JobAddTimesheetEntryEnabled: json['JobAddTimesheetEntryEnabled'] as bool?,
      BookingAddTimesheetEntryEnabled:
          json['BookingAddTimesheetEntryEnabled'] as bool?,
      CalendarAccessEnabled: json['CalendarAccessEnabled'] as bool?,
      ActivityLogAccessEnabled: json['ActivityLogAccessEnabled'] as bool?,
      TemplateAccessEnabled: json['TemplateAccessEnabled'] as bool?,
      TemplatesEditable: json['TemplatesEditable'] as bool?,
      QuoteAccessEnabled: json['QuoteAccessEnabled'] as bool?,
      QuotesEditable: json['QuotesEditable'] as bool?,
      QuotesSendable: json['QuotesSendable'] as bool?,
      QuotesAcceptable: json['QuotesAcceptable'] as bool?,
      OrderAccessEnabled: json['OrderAccessEnabled'] as bool?,
      OrdersEditable: json['OrdersEditable'] as bool?,
      OrdersSendable: json['OrdersSendable'] as bool?,
      InvoiceAccessEnabled: json['InvoiceAccessEnabled'] as bool?,
      InvoicesEditable: json['InvoicesEditable'] as bool?,
      InvoicesSendable: json['InvoicesSendable'] as bool?,
      InvoicesSyncable: json['InvoicesSyncable'] as bool?,
      PaymentsAndCreditNotesEnabled:
          json['PaymentsAndCreditNotesEnabled'] as bool?,
      SiPaymentsAndCreditNotesEnabled:
          json['SiPaymentsAndCreditNotesEnabled'] as bool?,
      SupplierInvoiceAccessEnabled:
          json['SupplierInvoiceAccessEnabled'] as bool?,
      SupplierInvoicesEditable: json['SupplierInvoicesEditable'] as bool?,
      SupplierInvoicesSendable: json['SupplierInvoicesSendable'] as bool?,
      SupplierInvoicesSyncable: json['SupplierInvoicesSyncable'] as bool?,
      JobAccessEnabled: json['JobAccessEnabled'] as bool?,
      JobEditAddEnabled: json['JobEditAddEnabled'] as bool?,
      JobStatusEditable: json['JobStatusEditable'] as bool?,
      JobCanComplete: json['JobCanComplete'] as bool?,
      JobDataVisibility: json['JobDataVisibility'] as String?,
      JobCanAcceptReject: json['JobCanAcceptReject'] as bool?,
      JobPhotosEnabled: json['JobPhotosEnabled'] as bool?,
      JobPhotosEditable: json['JobPhotosEditable'] as bool?,
      JobNotesEnabled: json['JobNotesEnabled'] as bool?,
      JobNotesEditable: json['JobNotesEditable'] as bool?,
      JobScribblesEnabled: json['JobScribblesEnabled'] as bool?,
      JobScribblesEditable: json['JobScribblesEditable'] as bool?,
      JobFilesEnabled: json['JobFilesEnabled'] as bool?,
      JobFilesEditable: json['JobFilesEditable'] as bool?,
      JobChargesEnabled: json['JobChargesEnabled'] as bool?,
      JobChargesEditable: json['JobChargesEditable'] as bool?,
      JobChargesAllVisible: json['JobChargesAllVisible'] as bool?,
      JobSheetsEnabled: json['JobSheetsEnabled'] as bool?,
      JobTemplatesEnabled: json['JobTemplatesEnabled'] as bool?,
      BookingAccessEnabled: json['BookingAccessEnabled'] as bool?,
      BookingEditAddEnabled: json['BookingEditAddEnabled'] as bool?,
      BookingStatusEditable: json['BookingStatusEditable'] as bool?,
      BookingCanComplete: json['BookingCanComplete'] as bool?,
      BookingCanAcceptReject: json['BookingCanAcceptReject'] as bool?,
      BookingDataVisibility: json['BookingDataVisibility'] as String?,
      BookingPhotosEnabled: json['BookingPhotosEnabled'] as bool?,
      BookingPhotosEditable: json['BookingPhotosEditable'] as bool?,
      BookingNotesEnabled: json['BookingNotesEnabled'] as bool?,
      BookingNotesEditable: json['BookingNotesEditable'] as bool?,
      BookingScribblesEnabled: json['BookingScribblesEnabled'] as bool?,
      BookingScribblesEditable: json['BookingScribblesEditable'] as bool?,
      BookingFilesEnabled: json['BookingFilesEnabled'] as bool?,
      BookingFilesEditable: json['BookingFilesEditable'] as bool?,
      BookingChargesEnabled: json['BookingChargesEnabled'] as bool?,
      BookingChargesEditable: json['BookingChargesEditable'] as bool?,
      BookingChargesAllVisible: json['BookingChargesAllVisible'] as bool?,
      ContactAccessEnabled: json['ContactAccessEnabled'] as bool?,
      ContactEditAddEnabled: json['ContactEditAddEnabled'] as bool?,
      ContactViewContactDetailsWithin:
          json['ContactViewContactDetailsWithin'] as bool?,
      ContactNotesEnabled: json['ContactNotesEnabled'] as bool?,
      ContactNotesEditable: json['ContactNotesEditable'] as bool?,
      ContactFilesEnabled: json['ContactFilesEnabled'] as bool?,
      ContactFilesEditable: json['ContactFilesEditable'] as bool?,
      UserOnlyAccessEnabled: json['UserOnlyAccessEnabled'] as bool?,
      LivePriceBookAccessEnabled: json['LivePriceBookAccessEnabled'] as bool?,
      ChargeAccessEnabled: json['ChargeAccessEnabled'] as bool?,
      ChargeEditAddEnabled: json['ChargeEditAddEnabled'] as bool?,
      ChargePricingDetailsVisible: json['ChargePricingDetailsVisible'] as bool?,
      ChargeBuyPricesVisible: json['ChargeBuyPricesVisible'] as bool?,
      ChargeBuyPricesEditable: json['ChargeBuyPricesEditable'] as bool?,
      ChargeSellPricesVisible: json['ChargeSellPricesVisible'] as bool?,
      ChargeSellPricesEditable: json['ChargeSellPricesEditable'] as bool?,
      UnbilledChargeTotalsVisible: json['UnbilledChargeTotalsVisible'] as bool?,
      JobFinancialTotalsVisible: json['JobFinancialTotalsVisible'] as bool?,
      SectionCostRevenueVisible: json['SectionCostRevenueVisible'] as bool?,
      JobAndBookingCostSummaryVisible:
          json['JobAndBookingCostSummaryVisible'] as bool?,
      CalendarDefaultNavigation: json['CalendarDefaultNavigation'] as bool?,
      TimesheetsDefaultNavigation: json['TimesheetsDefaultNavigation'] as bool?,
      JobsDefaultNavigation: json['JobsDefaultNavigation'] as bool?,
      BookingsDefaultNavigation: json['BookingsDefaultNavigation'] as bool?,
      QuotesDefaultNavigation: json['QuotesDefaultNavigation'] as bool?,
      OrdersDefaultNavigation: json['OrdersDefaultNavigation'] as bool?,
      InvoicesDefaultNavigation: json['InvoicesDefaultNavigation'] as bool?,
      SupplierInvoicesDefaultNavigation:
          json['SupplierInvoicesDefaultNavigation'] as bool?,
      ContactsDefaultNavigation: json['ContactsDefaultNavigation'] as bool?,
      ChargesDefaultNavigation: json['ChargesDefaultNavigation'] as bool?,
      JobPlanningDefaultNavigation:
          json['JobPlanningDefaultNavigation'] as bool?,
      JobsNavigationEnabled: json['JobsNavigationEnabled'] as bool?,
      BookingsNavigationEnabled: json['BookingsNavigationEnabled'] as bool?,
      ChargesNavigationEnabled: json['ChargesNavigationEnabled'] as bool?,
      JobPlanningEnabled: json['JobPlanningEnabled'] as bool?,
    );

Map<String, dynamic> _$$_PermissionsToJson(_$_Permissions instance) =>
    <String, dynamic>{
      'DashboardAccessEnabled': instance.DashboardAccessEnabled,
      'TimesheetsAccessEnabled': instance.TimesheetsAccessEnabled,
      'TimesheetsCanChangeBillableStatus':
          instance.TimesheetsCanChangeBillableStatus,
      'TimesheetsCanAccessOtherUsers': instance.TimesheetsCanAccessOtherUsers,
      'TimesheetsCanReadOnlyAccessOtherUsers':
          instance.TimesheetsCanReadOnlyAccessOtherUsers,
      'TimesheetsDurationEntryTypeEnabled':
          instance.TimesheetsDurationEntryTypeEnabled,
      'TimesheetsHideViewJobButtonEnabled':
          instance.TimesheetsHideViewJobButtonEnabled,
      'TimesheetsHideViewTaskButtonEnabled':
          instance.TimesheetsHideViewTaskButtonEnabled,
      'TimesheetsDescriptionMandatoryEnabled':
          instance.TimesheetsDescriptionMandatoryEnabled,
      'JobAddTimesheetEntryEnabled': instance.JobAddTimesheetEntryEnabled,
      'BookingAddTimesheetEntryEnabled':
          instance.BookingAddTimesheetEntryEnabled,
      'CalendarAccessEnabled': instance.CalendarAccessEnabled,
      'ActivityLogAccessEnabled': instance.ActivityLogAccessEnabled,
      'TemplateAccessEnabled': instance.TemplateAccessEnabled,
      'TemplatesEditable': instance.TemplatesEditable,
      'QuoteAccessEnabled': instance.QuoteAccessEnabled,
      'QuotesEditable': instance.QuotesEditable,
      'QuotesSendable': instance.QuotesSendable,
      'QuotesAcceptable': instance.QuotesAcceptable,
      'OrderAccessEnabled': instance.OrderAccessEnabled,
      'OrdersEditable': instance.OrdersEditable,
      'OrdersSendable': instance.OrdersSendable,
      'InvoiceAccessEnabled': instance.InvoiceAccessEnabled,
      'InvoicesEditable': instance.InvoicesEditable,
      'InvoicesSendable': instance.InvoicesSendable,
      'InvoicesSyncable': instance.InvoicesSyncable,
      'PaymentsAndCreditNotesEnabled': instance.PaymentsAndCreditNotesEnabled,
      'SiPaymentsAndCreditNotesEnabled':
          instance.SiPaymentsAndCreditNotesEnabled,
      'SupplierInvoiceAccessEnabled': instance.SupplierInvoiceAccessEnabled,
      'SupplierInvoicesEditable': instance.SupplierInvoicesEditable,
      'SupplierInvoicesSendable': instance.SupplierInvoicesSendable,
      'SupplierInvoicesSyncable': instance.SupplierInvoicesSyncable,
      'JobAccessEnabled': instance.JobAccessEnabled,
      'JobEditAddEnabled': instance.JobEditAddEnabled,
      'JobStatusEditable': instance.JobStatusEditable,
      'JobCanComplete': instance.JobCanComplete,
      'JobDataVisibility': instance.JobDataVisibility,
      'JobCanAcceptReject': instance.JobCanAcceptReject,
      'JobPhotosEnabled': instance.JobPhotosEnabled,
      'JobPhotosEditable': instance.JobPhotosEditable,
      'JobNotesEnabled': instance.JobNotesEnabled,
      'JobNotesEditable': instance.JobNotesEditable,
      'JobScribblesEnabled': instance.JobScribblesEnabled,
      'JobScribblesEditable': instance.JobScribblesEditable,
      'JobFilesEnabled': instance.JobFilesEnabled,
      'JobFilesEditable': instance.JobFilesEditable,
      'JobChargesEnabled': instance.JobChargesEnabled,
      'JobChargesEditable': instance.JobChargesEditable,
      'JobChargesAllVisible': instance.JobChargesAllVisible,
      'JobSheetsEnabled': instance.JobSheetsEnabled,
      'JobTemplatesEnabled': instance.JobTemplatesEnabled,
      'BookingAccessEnabled': instance.BookingAccessEnabled,
      'BookingEditAddEnabled': instance.BookingEditAddEnabled,
      'BookingStatusEditable': instance.BookingStatusEditable,
      'BookingCanComplete': instance.BookingCanComplete,
      'BookingCanAcceptReject': instance.BookingCanAcceptReject,
      'BookingDataVisibility': instance.BookingDataVisibility,
      'BookingPhotosEnabled': instance.BookingPhotosEnabled,
      'BookingPhotosEditable': instance.BookingPhotosEditable,
      'BookingNotesEnabled': instance.BookingNotesEnabled,
      'BookingNotesEditable': instance.BookingNotesEditable,
      'BookingScribblesEnabled': instance.BookingScribblesEnabled,
      'BookingScribblesEditable': instance.BookingScribblesEditable,
      'BookingFilesEnabled': instance.BookingFilesEnabled,
      'BookingFilesEditable': instance.BookingFilesEditable,
      'BookingChargesEnabled': instance.BookingChargesEnabled,
      'BookingChargesEditable': instance.BookingChargesEditable,
      'BookingChargesAllVisible': instance.BookingChargesAllVisible,
      'ContactAccessEnabled': instance.ContactAccessEnabled,
      'ContactEditAddEnabled': instance.ContactEditAddEnabled,
      'ContactViewContactDetailsWithin':
          instance.ContactViewContactDetailsWithin,
      'ContactNotesEnabled': instance.ContactNotesEnabled,
      'ContactNotesEditable': instance.ContactNotesEditable,
      'ContactFilesEnabled': instance.ContactFilesEnabled,
      'ContactFilesEditable': instance.ContactFilesEditable,
      'UserOnlyAccessEnabled': instance.UserOnlyAccessEnabled,
      'LivePriceBookAccessEnabled': instance.LivePriceBookAccessEnabled,
      'ChargeAccessEnabled': instance.ChargeAccessEnabled,
      'ChargeEditAddEnabled': instance.ChargeEditAddEnabled,
      'ChargePricingDetailsVisible': instance.ChargePricingDetailsVisible,
      'ChargeBuyPricesVisible': instance.ChargeBuyPricesVisible,
      'ChargeBuyPricesEditable': instance.ChargeBuyPricesEditable,
      'ChargeSellPricesVisible': instance.ChargeSellPricesVisible,
      'ChargeSellPricesEditable': instance.ChargeSellPricesEditable,
      'UnbilledChargeTotalsVisible': instance.UnbilledChargeTotalsVisible,
      'JobFinancialTotalsVisible': instance.JobFinancialTotalsVisible,
      'SectionCostRevenueVisible': instance.SectionCostRevenueVisible,
      'JobAndBookingCostSummaryVisible':
          instance.JobAndBookingCostSummaryVisible,
      'CalendarDefaultNavigation': instance.CalendarDefaultNavigation,
      'TimesheetsDefaultNavigation': instance.TimesheetsDefaultNavigation,
      'JobsDefaultNavigation': instance.JobsDefaultNavigation,
      'BookingsDefaultNavigation': instance.BookingsDefaultNavigation,
      'QuotesDefaultNavigation': instance.QuotesDefaultNavigation,
      'OrdersDefaultNavigation': instance.OrdersDefaultNavigation,
      'InvoicesDefaultNavigation': instance.InvoicesDefaultNavigation,
      'SupplierInvoicesDefaultNavigation':
          instance.SupplierInvoicesDefaultNavigation,
      'ContactsDefaultNavigation': instance.ContactsDefaultNavigation,
      'ChargesDefaultNavigation': instance.ChargesDefaultNavigation,
      'JobPlanningDefaultNavigation': instance.JobPlanningDefaultNavigation,
      'JobsNavigationEnabled': instance.JobsNavigationEnabled,
      'BookingsNavigationEnabled': instance.BookingsNavigationEnabled,
      'ChargesNavigationEnabled': instance.ChargesNavigationEnabled,
      'JobPlanningEnabled': instance.JobPlanningEnabled,
    };
