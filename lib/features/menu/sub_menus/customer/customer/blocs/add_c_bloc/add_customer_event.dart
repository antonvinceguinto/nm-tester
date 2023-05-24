part of 'add_customer_bloc.dart';

class AddCustomerEvent extends Equatable {
  const AddCustomerEvent({
    required this.contactNameDisplay,
    this.contactNameBusiness,
    this.contactNameFirst,
    this.contactNameLast,
    this.contactCode,
    this.contactAddress,
    this.contactBillingAddress,
    this.contactSpecialNotes,
    this.contactPhoneHome,
    this.contactPhoneWork,
    this.contactPhoneDdi,
    this.contactPhoneMobile,
    this.contactPhoneFax,
    this.contactEmail,
    this.contactEmailForInvoices,
    this.contactHasInvoiceDueRule = false,
    this.contactInvoiceDueRule,
    this.contactInvoiceDueDays,
    this.contactHasQuoteExpiryRule = false,
    this.contactQuoteExpiryRule,
    this.contactQuoteExpiryDays,
    this.contactWebSite,
    this.contactTypes = const [],
    this.contactParentId,
  });

  final String contactNameDisplay;
  final String? contactNameBusiness;
  final String? contactNameFirst;
  final String? contactNameLast;
  final String? contactCode;
  final String? contactAddress;
  final String? contactBillingAddress;
  final String? contactSpecialNotes;
  final String? contactPhoneHome;
  final String? contactPhoneWork;
  final String? contactPhoneDdi;
  final String? contactPhoneMobile;
  final String? contactPhoneFax;
  final String? contactEmail;
  final String? contactEmailForInvoices;
  final bool contactHasInvoiceDueRule;
  final int? contactInvoiceDueRule;
  final int? contactInvoiceDueDays;
  final bool contactHasQuoteExpiryRule;
  final int? contactQuoteExpiryRule;
  final int? contactQuoteExpiryDays;
  final String? contactWebSite;
  final List<int> contactTypes;
  final int? contactParentId;

  @override
  List<Object> get props => [
        contactNameDisplay,
        contactNameBusiness ?? '',
        contactNameFirst ?? '',
        contactNameLast ?? '',
        contactCode ?? '',
        contactAddress ?? '',
        contactBillingAddress ?? '',
        contactSpecialNotes ?? '',
        contactPhoneHome ?? '',
        contactPhoneWork ?? '',
        contactPhoneDdi ?? '',
        contactPhoneMobile ?? '',
        contactPhoneFax ?? '',
        contactEmail ?? '',
        contactEmailForInvoices ?? '',
        contactHasInvoiceDueRule,
        contactInvoiceDueRule ?? '',
        contactInvoiceDueDays ?? '',
        contactHasQuoteExpiryRule,
        contactQuoteExpiryRule ?? '',
        contactQuoteExpiryDays ?? '',
        contactWebSite ?? '',
        contactTypes,
        contactParentId ?? '',
      ];
}
