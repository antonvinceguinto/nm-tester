import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nextminute/features/menu/sub_menus/customer/customer/blocs/add_c_bloc/add_customer_bloc.dart';
import 'package:nextminute/features/utils/generic_status_enum.dart';
import 'package:nm_repository/nm_repository.dart';

class MockNMRepositoryImpl extends Mock implements NMRepositoryImpl {}

void main() {
  late AddCustomerBloc addCustomerBloc;
  late MockNMRepositoryImpl mockNMRepositoryImpl;

  setUp(() {
    mockNMRepositoryImpl = MockNMRepositoryImpl();
    addCustomerBloc = AddCustomerBloc(nmRepositoryImpl: mockNMRepositoryImpl);
  });

  tearDown(() {
    addCustomerBloc.close();
  });

  blocTest<AddCustomerBloc, AddCustomerState>(
    'emits [loading, success] when adding customer is successful',
    build: () {
      when(
        () => mockNMRepositoryImpl.addCustomer(
          contactParentId: any(named: 'contactParentId'),
          contactNameDisplay: any(named: 'contactNameDisplay'),
          contactNameBusiness: any(named: 'contactNameBusiness'),
          contactNameFirst: any(named: 'contactNameFirst'),
          contactNameLast: any(named: 'contactNameLast'),
          contactCode: any(named: 'contactCode'),
          contactAddress: any(named: 'contactAddress'),
          contactBillingAddress: any(named: 'contactBillingAddress'),
          contactSpecialNotes: any(named: 'contactSpecialNotes'),
          contactPhoneHome: any(named: 'contactPhoneHome'),
          contactPhoneWork: any(named: 'contactPhoneWork'),
          contactPhoneDdi: any(named: 'contactPhoneDdi'),
          contactPhoneMobile: any(named: 'contactPhoneMobile'),
          contactPhoneFax: any(named: 'contactPhoneFax'),
          contactEmail: any(named: 'contactEmail'),
          contactEmailForInvoices: any(named: 'contactEmailForInvoices'),
          contactHasInvoiceDueRule: any(named: 'contactHasInvoiceDueRule'),
          contactInvoiceDueRule: any(named: 'contactInvoiceDueRule'),
          contactInvoiceDueDays: any(named: 'contactInvoiceDueDays'),
          contactHasQuoteExpiryRule: any(named: 'contactHasQuoteExpiryRule'),
          contactQuoteExpiryRule: any(named: 'contactQuoteExpiryRule'),
          contactQuoteExpiryDays: any(named: 'contactQuoteExpiryDays'),
          contactWebSite: any(named: 'contactWebSite'),
          contactTypes: any(named: 'contactTypes'),
        ),
      ).thenAnswer((_) async => Right(() {}));

      return addCustomerBloc;
    },
    act: (bloc) => bloc.add(
      const AddCustomerEvent(
        contactParentId: 1,
        contactNameDisplay: 'Anton',
        contactNameBusiness: 'Anton',
        contactNameFirst: 'Anton',
        contactNameLast: 'Anton',
        contactCode: 'Anton',
        contactAddress: 'Anton',
        contactBillingAddress: 'Anton',
        contactSpecialNotes: 'Anton',
        contactPhoneHome: 'Anton',
        contactPhoneWork: 'Anton',
        contactPhoneDdi: 'Anton',
        contactPhoneMobile: 'Anton',
        contactPhoneFax: 'Anton',
        contactEmail: 'Anton',
        contactEmailForInvoices: 'Anton',
        contactInvoiceDueRule: 1,
        contactInvoiceDueDays: 1,
        contactQuoteExpiryRule: 1,
        contactQuoteExpiryDays: 1,
        contactWebSite: 'Anton',
        contactTypes: [1],
      ),
    ),
    expect: () => [
      const AddCustomerState(status: GenericRequestStatusEnum.loading),
      const AddCustomerState(status: GenericRequestStatusEnum.success),
    ],
  );

  blocTest<AddCustomerBloc, AddCustomerState>(
    'emits [loading, error] when adding customer is unsuccessful',
    build: () {
      when(
        () => mockNMRepositoryImpl.addCustomer(
          contactParentId: any(named: 'contactParentId'),
          contactNameDisplay: 'Anton',
          contactNameBusiness: 'Anton',
          contactNameFirst: 'Anton',
          contactNameLast: 'Anton',
          contactCode: 'Anton',
          contactAddress: 'Anton',
          contactBillingAddress: 'Anton',
          contactSpecialNotes: 'Anton',
          contactPhoneHome: 'Anton',
          contactPhoneWork: 'Anton',
          contactPhoneDdi: 'Anton',
          contactPhoneMobile: 'Anton',
          contactPhoneFax: 'Anton',
          contactEmail: 'Anton',
          contactEmailForInvoices: 'Anton',
          contactInvoiceDueRule: 1,
          contactInvoiceDueDays: 1,
          contactQuoteExpiryRule: 1,
          contactQuoteExpiryDays: 1,
          contactWebSite: 'Anton',
          contactHasInvoiceDueRule: false,
          contactHasQuoteExpiryRule: false,
          contactTypes: [1],
        ),
      ).thenAnswer((_) async => Left(Exception('Error')));

      return addCustomerBloc;
    },
    act: (bloc) => bloc.add(
      const AddCustomerEvent(
        contactParentId: 1,
        contactNameDisplay: 'Anton',
        contactNameBusiness: 'Anton',
        contactNameFirst: 'Anton',
        contactNameLast: 'Anton',
        contactCode: 'Anton',
        contactAddress: 'Anton',
        contactBillingAddress: 'Anton',
        contactSpecialNotes: 'Anton',
        contactPhoneHome: 'Anton',
        contactPhoneWork: 'Anton',
        contactPhoneDdi: 'Anton',
        contactPhoneMobile: 'Anton',
        contactPhoneFax: 'Anton',
        contactEmail: 'Anton',
        contactEmailForInvoices: 'Anton',
        contactInvoiceDueRule: 1,
        contactInvoiceDueDays: 1,
        contactQuoteExpiryRule: 1,
        contactQuoteExpiryDays: 1,
        contactWebSite: 'Anton',
        contactTypes: [1],
      ),
    ),
    expect: () => [
      const AddCustomerState(status: GenericRequestStatusEnum.loading),
      const AddCustomerState(status: GenericRequestStatusEnum.error),
    ],
  );
}
