import 'package:api_service/api_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nextminute/features/utils/generic_status_enum.dart';
import 'package:nm_repository/nm_repository.dart';

part 'contact_types_event.dart';
part 'contact_types_state.dart';

class ContactTypesBloc extends Bloc<ContactTypesEvent, ContactTypesState> {
  ContactTypesBloc({
    required NMRepositoryImpl nmRepositoryImpl,
  })  : _nmRepositoryImpl = nmRepositoryImpl,
        super(const ContactTypesState()) {
    on<ContactTypesFetchEvent>(_onFetch);
    on<ContactTypesAddEvent>(_onAddSelection);
    on<ContactTypesRemoveEvent>(_onRemoveSelection);
    on<ContactTypesClearEvent>(_onClear);
    on<RequestUpdateContactTypesEvent>(_onRequestUpdateContactTypes);
    on<RemoveContactTypeEvent>(_onRemoveContactType);
    on<AddContactTypeEvent>(_onAddContactType);
    on<MarkAsDeletedEvent>(_onMarkAsDeleted);
    on<ClearSelectedContactTypes>(_onClearSelectedContactTypes);
  }

  final NMRepositoryImpl _nmRepositoryImpl;

  Future<void> _onClearSelectedContactTypes(
    ClearSelectedContactTypes event,
    Emitter<ContactTypesState> emit,
  ) async {
    emit(
      state.copyWith(
        selectedContactTypes: [],
      ),
    );
  }

  Future<void> _onMarkAsDeleted(
    MarkAsDeletedEvent event,
    Emitter<ContactTypesState> emit,
  ) async {
    final contactType = event.contactType;
    final newList = state.editableContactTypes?.toList()
      ?..remove(contactType)
      ..add(contactType.copyWith(isdeleted: true));

    emit(
      state.copyWith(
        editableContactTypes: newList,
      ),
    );
  }

  Future<void> _onRemoveContactType(
    RemoveContactTypeEvent event,
    Emitter<ContactTypesState> emit,
  ) async {
    final newList = state.editableContactTypes!
        .where((element) => element != event.contactType)
        .toList();

    emit(
      state.copyWith(
        editableContactTypes: newList,
      ),
    );
  }

  Future<void> _onAddContactType(
    AddContactTypeEvent event,
    Emitter<ContactTypesState> emit,
  ) async {
    final newList = state.editableContactTypes?.toList()
      ?..add(event.contactType);

    emit(
      state.copyWith(
        editableContactTypes: newList,
      ),
    );
  }

  // Future<void> _onRequestUpdateContactTypes(
  //   RequestUpdateContactTypesEvent event,
  //   Emitter<ContactTypesState> emit,
  // ) async {
  //   emit(state.copyWith(status: GenericRequestStatusEnum.loading));

  //   final selectedContactTypes = state.selectedContactTypes;

  //   await _nmRepositoryImpl.updateContactTypes(
  //     contactTypes: event.contactTypes,
  //   );

  //   // Removes the contact type that was previously selected
  //   // but is deleted now.
  //   selectedContactTypes.removeWhere(
  //     (element) => !event.contactTypes.contains(element),
  //   );

  //   emit(
  //     state.copyWith(
  //       status: GenericRequestStatusEnum.success,
  //       selectedContactTypes: selectedContactTypes
  //         ..removeWhere((element) => element.isdeleted ?? false),
  //     ),
  //   );
  // }
  Future<void> _onRequestUpdateContactTypes(
    RequestUpdateContactTypesEvent event,
    Emitter<ContactTypesState> emit,
  ) async {
    emit(state.copyWith(status: GenericRequestStatusEnum.loading));

    final selectedContactTypes = state.selectedContactTypes;

    await _nmRepositoryImpl.updateContactTypes(
      contactTypes: event.contactTypes,
    );

    // Removes the contact type that was previously selected
    // but is deleted now.
    final updatedSelectedContactTypes = selectedContactTypes
        .where((element) => event.contactTypes.contains(element))
        .toList();

    // Removes the deleted contact types
    final filteredSelectedContactTypes = updatedSelectedContactTypes
        .where((element) => !(element.isdeleted ?? false))
        .toList();

    emit(
      state.copyWith(
        status: GenericRequestStatusEnum.success,
        selectedContactTypes: filteredSelectedContactTypes,
      ),
    );
  }

  Future<void> _onClear(
    ContactTypesClearEvent event,
    Emitter<ContactTypesState> emit,
  ) async {
    emit(
      state.copyWith(
        selectedContactTypes: [],
      ),
    );
  }

  Future<void> _onAddSelection(
    ContactTypesAddEvent event,
    Emitter<ContactTypesState> emit,
  ) async {
    final contactType = event.contactType;
    final temp = state.selectedContactTypes.toList()..add(contactType);

    emit(
      state.copyWith(
        selectedContactTypes: temp,
      ),
    );
  }

  Future<void> _onRemoveSelection(
    ContactTypesRemoveEvent event,
    Emitter<ContactTypesState> emit,
  ) async {
    final contactType = event.contactType;
    final temp = state.selectedContactTypes.toList()
      ..removeWhere((element) => element == contactType);

    emit(
      state.copyWith(
        selectedContactTypes: temp,
      ),
    );
  }

  Future<void> _onFetch(
    ContactTypesFetchEvent event,
    Emitter<ContactTypesState> emit,
  ) async {
    emit(state.copyWith(status: GenericRequestStatusEnum.loading));

    final res = await _nmRepositoryImpl.getContactTypes();

    res.fold(
      (l) => emit(
        state.copyWith(
          status: GenericRequestStatusEnum.error,
        ),
      ),
      (r) => emit(
        state.copyWith(
          status: GenericRequestStatusEnum.success,
          contactTypes: r,
          editableContactTypes: r,
        ),
      ),
    );
  }
}
