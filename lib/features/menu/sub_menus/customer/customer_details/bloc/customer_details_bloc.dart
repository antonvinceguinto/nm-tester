import 'package:api_service/api_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nextminute/features/utils/generic_status_enum.dart';
import 'package:nm_repository/nm_repository.dart';

part 'customer_details_event.dart';
part 'customer_details_state.dart';

class CustomerDetailsBloc
    extends Bloc<CustomerDetailsFetchEvent, CustomerDetailsState> {
  CustomerDetailsBloc({
    required NMRepositoryImpl nmRepositoryImpl,
  })  : _nmRepositoryImpl = nmRepositoryImpl,
        super(const CustomerDetailsState()) {
    on<CustomerDetailsFetchEvent>(_fetchEvent);
  }

  final NMRepositoryImpl _nmRepositoryImpl;

  Future<void> _fetchEvent(
    CustomerDetailsFetchEvent event,
    Emitter<CustomerDetailsState> emit,
  ) async {
    emit(state.copyWith(status: GenericRequestStatusEnum.loading));

    final res = await _nmRepositoryImpl.getContactDetails(contactId: event.id);

    res.fold(
      (l) => emit(state.copyWith(status: GenericRequestStatusEnum.error)),
      (r) => emit(
        state.copyWith(
          status: GenericRequestStatusEnum.success,
          contactDetails: r,
        ),
      ),
    );
  }
}
