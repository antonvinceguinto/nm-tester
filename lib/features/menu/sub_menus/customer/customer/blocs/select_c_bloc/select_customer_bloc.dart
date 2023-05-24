import 'package:api_service/api_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nextminute/features/menu/sub_menus/sub_menus.dart';
import 'package:nextminute/features/utils/generic_status_enum.dart';
import 'package:nm_repository/nm_repository.dart';

part 'select_customer_event.dart';
part 'select_customer_state.dart';

class SelectCustomerBloc
    extends Bloc<SelectCustomerEvent, SelectCustomerState> {
  SelectCustomerBloc({
    required NMRepositoryImpl nmRepositoryImpl,
  })  : _nmRepositoryImpl = nmRepositoryImpl,
        super(const SelectCustomerState()) {
    on<SelectCustomerFetchEvent>(_onFetchEvent);
    on<SelectAllCustomerEvent>(_onSelectAllCustomerEvent);
  }

  final NMRepositoryImpl _nmRepositoryImpl;

  Future<void> _onSelectAllCustomerEvent(
    SelectAllCustomerEvent event,
    Emitter<SelectCustomerState> emit,
  ) async {
    final totalCustomers = state.customerModel?.total ?? 0;
    final roundedTotalCustomers = (totalCustomers / 20).floor() * 20;

    for (var i = 1; i <= roundedTotalCustomers / 20; i++) {
      await _onFetchEvent(
        SelectCustomerFetchEvent(
          currPage: i,
          search: event.search,
          isCustomer: event.isCustomer,
          isUser: event.isUser,
          isSite: event.isSite,
          isSupplier: event.isSupplier,
          parentContactId: event.parentContactId,
          excludeArchived: event.excludeArchived,
          excludeDisabled: event.excludeDisabled,
          includeDeleted: event.includeDeleted,
          selectedRoleIds: event.selectedRoleIds,
          isAllAdministrators: event.isAllAdministrators,
          isAllUsers: event.isAllUsers,
          selectedContactTypeIds: event.selectedContactTypeIds,
        ),
        emit,
      );
    }

    event.jfc.selectAllAssignedCustomers(state.customerList ?? []);
  }

  Future<void> _onFetchEvent(
    SelectCustomerFetchEvent event,
    Emitter<SelectCustomerState> emit,
  ) async {
    emit(state.copyWith(status: GenericRequestStatusEnum.loading));

    final fetchRes = await _nmRepositoryImpl.getCustomerList(
      event.currPage,
      search: event.search,
      isCustomer: event.isCustomer,
      isUser: event.isUser,
      isSite: event.isSite,
      isSupplier: event.isSupplier,
      parentContactId: event.parentContactId,
      excludeArchived: event.excludeArchived,
      excludeDisabled: event.excludeDisabled,
      includeDeleted: event.includeDeleted,
      roleIds: event.selectedRoleIds,
      includeAdmins: event.isAllAdministrators,
      includeUsers: event.isAllUsers,
      contactTypeIds: event.selectedContactTypeIds,
      separateHardwareSuppliers: event.separateHardwareSuppliers,
    );

    fetchRes.fold(
      (l) => emit(
        state.copyWith(
          status: GenericRequestStatusEnum.error,
          errorMessage: l.toString(),
        ),
      ),
      (r) {
        final tempList = state.customerList ?? [];
        if (event.currPage == 1) tempList.clear();
        tempList.addAll(r.data);

        emit(
          state.copyWith(
            status: GenericRequestStatusEnum.success,
            customerList: tempList,
            customerModel: r,
            currPage: event.currPage,
            search: event.search,
          ),
        );
      },
    );
  }
}
