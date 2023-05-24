import 'package:api_service/api_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nextminute/features/utils/generic_status_enum.dart';
import 'package:nm_repository/nm_repository.dart';

part 'assignee_filter_state.dart';

class AssigneeFilterCubit extends Cubit<AssigneeFilterState> {
  AssigneeFilterCubit({required NMRepositoryImpl nmRepositoryImpl})
      : _nmRepository = nmRepositoryImpl,
        super(const AssigneeFilterState());

  final NMRepositoryImpl _nmRepository;

  Future<void> fetchUserRoles() async {
    emit(state.copyWith(status: GenericRequestStatusEnum.loading));

    final contactRes = await _nmRepository.getContactTypes();
    // final userRoleRes = await _nmRepository.getUserRoles();

    String? error;
    var contactTypes = <ContactTypeModel>[];
    final userRoles = <UserRoleModel>[];

    contactRes.fold(
      (l) => error = l.toString(),
      (r) => contactTypes = r,
    );

    // userRoleRes.fold(
    //   (l) => error = l.toString(),
    //   (r) => userRoles = r,
    // );

    if (error != null) {
      emit(
        state.copyWith(
          status: GenericRequestStatusEnum.error,
        ),
      );
    } else {
      emit(
        state.copyWith(
          status: GenericRequestStatusEnum.success,
          contactTypes: contactTypes,
          userRoles: userRoles,
        ),
      );
    }
  }

  void addToUserRole(UserRoleModel userRole) {
    final selectedUserRoles = List.of(state.selectedUserRoles);

    if (selectedUserRoles.contains(userRole)) {
      selectedUserRoles.remove(userRole);
    } else {
      selectedUserRoles.add(userRole);
    }

    emit(state.copyWith(selectedUserRoles: selectedUserRoles));
  }

  void toggleUserRoles({required bool val}) {
    if (!val) {
      emit(
        state.copyWith(
          selectedUserRoles: [],
          isAllAdministrators: false,
          isAllUsers: false,
        ),
      );
    }
    emit(
      state.copyWith(
        isUserRolesTurnedOn: val,
      ),
    );
  }

  void toggleContactTypes({required bool val}) {
    if (!val) {
      emit(state.copyWith(selectedContactTypes: []));
    }
    emit(
      state.copyWith(
        isContactTypesTurnedOn: val,
      ),
    );
  }

  void clearSelectedUserRoles() {
    emit(state.copyWith(selectedUserRoles: []));
  }

  void clearSelectedContactTypes() {
    emit(state.copyWith(selectedContactTypes: []));
  }

  void addToCustomerTypes(ContactTypeModel cType) {
    final selectedContactTypes = List.of(state.selectedContactTypes);

    if (selectedContactTypes.contains(cType)) {
      selectedContactTypes.remove(cType);
    } else {
      selectedContactTypes.add(cType);
    }

    emit(state.copyWith(selectedContactTypes: selectedContactTypes));
  }

  void excludeArchivedContacts() {
    emit(
      state.copyWith(
        isExcludeArchivedContacts: !state.isExcludeArchivedContacts,
      ),
    );
  }

  void excludeDisabledUsers() {
    emit(
      state.copyWith(
        isExcludeDisabledUsers: !state.isExcludeDisabledUsers,
      ),
    );
  }

  void includeDeleted() {
    emit(state.copyWith(includeDeleted: !state.includeDeleted));
  }

  void allAdministrators({required bool val}) =>
      emit(state.copyWith(isAllAdministrators: val));

  void allUsers({required bool val}) => emit(state.copyWith(isAllUsers: val));

  void clearFilters() {
    emit(const AssigneeFilterState());
  }
}
