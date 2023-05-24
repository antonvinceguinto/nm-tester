part of 'contact_types_bloc.dart';

class ContactTypesState extends Equatable {
  const ContactTypesState({
    this.status = GenericRequestStatusEnum.initial,
    this.contactTypes = const [],
    this.editableContactTypes,
    this.selectedContactTypes = const [],
  });

  final GenericRequestStatusEnum status;
  final List<ContactTypeModel> contactTypes;
  final List<ContactTypeModel>? editableContactTypes;
  final List<ContactTypeModel> selectedContactTypes;

  ContactTypesState copyWith({
    GenericRequestStatusEnum? status,
    List<ContactTypeModel>? contactTypes,
    List<ContactTypeModel>? editableContactTypes,
    List<ContactTypeModel>? selectedContactTypes,
  }) {
    return ContactTypesState(
      status: status ?? this.status,
      contactTypes: contactTypes ?? this.contactTypes,
      editableContactTypes: editableContactTypes ?? this.editableContactTypes,
      selectedContactTypes: selectedContactTypes ?? this.selectedContactTypes,
    );
  }

  @override
  List<Object> get props => [
        status,
        contactTypes,
        editableContactTypes ?? [],
        selectedContactTypes,
      ];
}
