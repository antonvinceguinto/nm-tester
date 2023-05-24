part of 'assignee_filter_cubit.dart';

class AssigneeFilterState extends Equatable {
  const AssigneeFilterState({
    this.status = GenericRequestStatusEnum.initial,
    this.isExcludeArchivedContacts = false,
    this.isExcludeDisabledUsers = false,
    this.includeDeleted = false,
    this.isAllAdministrators = false,
    this.isAllUsers = false,
    this.userRoles,
    this.selectedUserRoles = const [],
    this.contactTypes,
    this.selectedContactTypes = const [],
    this.isUserRolesTurnedOn = false,
    this.isContactTypesTurnedOn = false,
  });

  final GenericRequestStatusEnum status;

  final bool isExcludeArchivedContacts;
  final bool isExcludeDisabledUsers;
  final bool includeDeleted;
  final bool isAllAdministrators;
  final bool isAllUsers;

  final bool isUserRolesTurnedOn;
  final bool isContactTypesTurnedOn;

  final List<UserRoleModel>? userRoles;
  final List<UserRoleModel> selectedUserRoles;
  final List<ContactTypeModel>? contactTypes;
  final List<ContactTypeModel> selectedContactTypes;

  AssigneeFilterState copyWith({
    GenericRequestStatusEnum? status,
    bool? isExcludeArchivedContacts,
    bool? isExcludeDisabledUsers,
    bool? includeDeleted,
    bool? isAllAdministrators,
    bool? isAllUsers,
    List<UserRoleModel>? userRoles,
    List<UserRoleModel>? selectedUserRoles,
    List<ContactTypeModel>? contactTypes,
    List<ContactTypeModel>? selectedContactTypes,
    bool? isUserRolesTurnedOn,
    bool? isContactTypesTurnedOn,
  }) {
    return AssigneeFilterState(
      status: status ?? this.status,
      isExcludeArchivedContacts:
          isExcludeArchivedContacts ?? this.isExcludeArchivedContacts,
      isExcludeDisabledUsers:
          isExcludeDisabledUsers ?? this.isExcludeDisabledUsers,
      includeDeleted: includeDeleted ?? this.includeDeleted,
      isAllAdministrators: isAllAdministrators ?? this.isAllAdministrators,
      isAllUsers: isAllUsers ?? this.isAllUsers,
      userRoles: userRoles ?? this.userRoles,
      selectedUserRoles: selectedUserRoles ?? this.selectedUserRoles,
      contactTypes: contactTypes ?? this.contactTypes,
      selectedContactTypes: selectedContactTypes ?? this.selectedContactTypes,
      isUserRolesTurnedOn: isUserRolesTurnedOn ?? this.isUserRolesTurnedOn,
      isContactTypesTurnedOn:
          isContactTypesTurnedOn ?? this.isContactTypesTurnedOn,
    );
  }

  @override
  List<Object> get props => [
        status,
        isExcludeArchivedContacts,
        isExcludeDisabledUsers,
        includeDeleted,
        isAllAdministrators,
        isAllUsers,
        userRoles ?? [],
        selectedUserRoles,
        contactTypes ?? [],
        selectedContactTypes,
        isUserRolesTurnedOn,
        isContactTypesTurnedOn,
      ];
}
