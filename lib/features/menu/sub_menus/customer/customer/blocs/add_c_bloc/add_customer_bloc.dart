import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nextminute/features/utils/generic_status_enum.dart';
import 'package:nm_repository/nm_repository.dart';

part 'add_customer_event.dart';
part 'add_customer_state.dart';

class AddCustomerBloc extends Bloc<AddCustomerEvent, AddCustomerState> {
  AddCustomerBloc({required NMRepositoryImpl nmRepositoryImpl})
      : _nmRepositoryImpl = nmRepositoryImpl,
        super(const AddCustomerState()) {
    on<AddCustomerEvent>(_onAddEvent);
  }

  final NMRepositoryImpl _nmRepositoryImpl;

  Future<void> _onAddEvent(
    AddCustomerEvent event,
    Emitter<AddCustomerState> emit,
  ) async {
    emit(state.copyWith(status: GenericRequestStatusEnum.loading));

    final res = await _nmRepositoryImpl.addCustomer(
      contactNameDisplay: event.contactNameDisplay,
      contactNameBusiness: event.contactNameBusiness,
      contactNameFirst: event.contactNameFirst,
      contactNameLast: event.contactNameLast,
      contactCode: event.contactCode,
      contactAddress: event.contactAddress,
      contactBillingAddress: event.contactBillingAddress,
      contactSpecialNotes: event.contactSpecialNotes,
      contactPhoneHome: event.contactPhoneHome,
      contactPhoneWork: event.contactPhoneWork,
      contactPhoneDdi: event.contactPhoneDdi,
      contactPhoneMobile: event.contactPhoneMobile,
      contactPhoneFax: event.contactPhoneFax,
      contactEmail: event.contactEmail,
      contactEmailForInvoices: event.contactEmailForInvoices,
      contactHasInvoiceDueRule: event.contactHasInvoiceDueRule,
      contactInvoiceDueRule: event.contactInvoiceDueRule,
      contactInvoiceDueDays: event.contactInvoiceDueDays,
      contactHasQuoteExpiryRule: event.contactHasQuoteExpiryRule,
      contactQuoteExpiryRule: event.contactQuoteExpiryRule,
      contactQuoteExpiryDays: event.contactQuoteExpiryDays,
      contactWebSite: event.contactWebSite,
      contactTypes: event.contactTypes,
      contactParentId: event.contactParentId,
    );

    if (res.isRight()) {
      emit(state.copyWith(status: GenericRequestStatusEnum.success));
    } else {
      emit(state.copyWith(status: GenericRequestStatusEnum.error));
    }
  }
}
