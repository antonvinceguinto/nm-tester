part of 'select_customer_bloc.dart';

abstract class SelectCustomerEvent extends Equatable {
  const SelectCustomerEvent();
}

class SelectCustomerFetchEvent extends SelectCustomerEvent {
  const SelectCustomerFetchEvent({
    this.currPage = 1,
    this.search,
    this.isCustomer = false,
    this.isUser = false,
    this.isSite = false,
    this.isSupplier = false,
    this.parentContactId,
    this.excludeArchived = false,
    this.excludeDisabled = false,
    this.includeDeleted = false,
    this.selectedRoleIds,
    this.selectedContactTypeIds,
    this.isAllAdministrators = false,
    this.isAllUsers = false,
    this.separateHardwareSuppliers = false,
  });

  final int currPage;
  final String? search;

  // ---- Assignee filter
  final bool isCustomer;
  final bool isUser;
  final bool isSite;
  final bool isSupplier;
  final int? parentContactId;
  final bool excludeArchived;
  final bool excludeDisabled;
  final bool includeDeleted;
  final bool isAllAdministrators;
  final bool isAllUsers;
  final bool separateHardwareSuppliers;

  final List<int>? selectedRoleIds;
  final List<int>? selectedContactTypeIds;

  @override
  List<Object> get props => [
        currPage,
        search ?? '',
        isCustomer,
        isUser,
        isSite,
        isSupplier,
        parentContactId ?? 0,
        excludeArchived,
        excludeDisabled,
        includeDeleted,
        isAllAdministrators,
        isAllUsers,
        selectedRoleIds ?? [],
        selectedContactTypeIds ?? [],
        separateHardwareSuppliers,
      ];
}

class SelectAllCustomerEvent extends SelectCustomerEvent {
  const SelectAllCustomerEvent({
    required this.jfc,
    this.currPage = 1,
    this.search,
    this.isCustomer = false,
    this.isUser = false,
    this.isSite = false,
    this.isSupplier = false,
    this.parentContactId,
    this.excludeArchived = false,
    this.excludeDisabled = false,
    this.includeDeleted = false,
    this.selectedRoleIds,
    this.selectedContactTypeIds,
    this.isAllAdministrators = false,
    this.isAllUsers = false,
  });

  final JobsFilterCubit jfc;

  final int currPage;
  final String? search;

  // ---- Assignee filter
  final bool isCustomer;
  final bool isUser;
  final bool isSite;
  final bool isSupplier;
  final int? parentContactId;
  final bool excludeArchived;
  final bool excludeDisabled;
  final bool includeDeleted;
  final bool isAllAdministrators;
  final bool isAllUsers;

  final List<int>? selectedRoleIds;
  final List<int>? selectedContactTypeIds;

  @override
  List<Object> get props => [
        jfc,
        currPage,
        search ?? '',
        isCustomer,
        isUser,
        isSite,
        isSupplier,
        parentContactId ?? 0,
        excludeArchived,
        excludeDisabled,
        includeDeleted,
        isAllAdministrators,
        isAllUsers,
        selectedRoleIds ?? [],
        selectedContactTypeIds ?? [],
      ];
}

// class SelectAllCustomerEvent extends SelectCustomerEvent {
//   const SelectAllCustomerEvent({
//     required this.jfc,
//   });

//   final JobsFilterCubit jfc;

//   @override
//   List<Object> get props => [
//         jfc,
//       ];
// }
