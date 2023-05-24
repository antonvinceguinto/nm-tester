part of 'contact_types_bloc.dart';

abstract class ContactTypesEvent extends Equatable {
  const ContactTypesEvent();

  @override
  List<Object> get props => [];
}

class ContactTypesFetchEvent extends ContactTypesEvent {
  const ContactTypesFetchEvent();

  @override
  List<Object> get props => [];
}

class ContactTypesAddEvent extends ContactTypesEvent {
  const ContactTypesAddEvent({
    required this.contactType,
  });

  final ContactTypeModel contactType;

  @override
  List<Object> get props => [contactType];
}

class ContactTypesRemoveEvent extends ContactTypesEvent {
  const ContactTypesRemoveEvent({
    required this.contactType,
  });

  final ContactTypeModel contactType;

  @override
  List<Object> get props => [contactType];
}

class ContactTypesClearEvent extends ContactTypesEvent {
  const ContactTypesClearEvent();

  @override
  List<Object> get props => [];
}

class RequestUpdateContactTypesEvent extends ContactTypesEvent {
  const RequestUpdateContactTypesEvent({
    required this.contactTypes,
  });

  final List<ContactTypeModel> contactTypes;

  @override
  List<Object> get props => [
        contactTypes,
      ];
}

class RemoveContactTypeEvent extends ContactTypesEvent {
  const RemoveContactTypeEvent(this.contactType);

  final ContactTypeModel contactType;

  @override
  List<Object> get props => [contactType];
}

class AddContactTypeEvent extends ContactTypesEvent {
  const AddContactTypeEvent(this.contactType);

  final ContactTypeModel contactType;

  @override
  List<Object> get props => [contactType];
}

class MarkAsDeletedEvent extends ContactTypesEvent {
  const MarkAsDeletedEvent(this.contactType);

  final ContactTypeModel contactType;

  @override
  List<Object> get props => [contactType];
}

class ClearSelectedContactTypes extends ContactTypesEvent {
  const ClearSelectedContactTypes();

  @override
  List<Object> get props => [];
}
