// import 'package:api_service/api_service.dart';
// import 'package:bloc_test/bloc_test.dart';
// import 'package:dartz/dartz.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:nextminute/features/menu/sub_menus/customer/customer/contact_type/bloc/contact_types_bloc.dart';
// import 'package:nextminute/features/utils/generic_status_enum.dart';
// import 'package:nm_repository/nm_repository.dart';

// class MockNMRepositoryImpl extends Mock implements NMRepositoryImpl {}

// void main() {
//   late ContactTypesBloc contactTypesBloc;
//   late NMRepositoryImpl mockNMRepositoryImpl;

//   setUp(() {
//     mockNMRepositoryImpl = MockNMRepositoryImpl();
//     contactTypesBloc = ContactTypesBloc(nmRepositoryImpl: mockNMRepositoryImpl);
//   });

//   tearDown(() {
//     contactTypesBloc.close();
//   });

//   group('ContactTypesBloc', () {
//     const contactType1 = ContactTypeModel(
//       contacttype_id: 1,
//       contacttype_name: 'ContactType1',
//     );
//     const contactType2 = ContactTypeModel(
//       contacttype_id: 2,
//       contacttype_name: 'ContactType2',
//     );

//     final contactTypes = [contactType1, contactType2];

//     test('initial state is correct', () {
//       expect(contactTypesBloc.state, const ContactTypesState());
//     });

//     blocTest<ContactTypesBloc, ContactTypesState>(
//       'emits [loading, success] when fetch succeeds',
//       build: () {
//         when(
//           () => mockNMRepositoryImpl.getContactTypes(),
//         ).thenAnswer((_) async => Right(contactTypes));
//         return contactTypesBloc;
//       },
//       act: (bloc) => bloc.add(const ContactTypesFetchEvent()),
//       expect: () => [
//         const ContactTypesState(status: GenericRequestStatusEnum.loading),
//         ContactTypesState(
//           status: GenericRequestStatusEnum.success,
//           contactTypes: contactTypes,
//           editableContactTypes: contactTypes,
//         ),
//       ],
//     );

//     blocTest<ContactTypesBloc, ContactTypesState>(
//       'emits [loading, error] when fetch fails',
//       build: () {
//         when(() => mockNMRepositoryImpl.getContactTypes())
//             .thenAnswer((_) async => Left(Exception('Failed')));
//         return contactTypesBloc;
//       },
//       act: (bloc) => bloc.add(const ContactTypesFetchEvent()),
//       expect: () => [
//         const ContactTypesState(status: GenericRequestStatusEnum.loading),
//         const ContactTypesState(status: GenericRequestStatusEnum.error),
//       ],
//     );

//     blocTest<ContactTypesBloc, ContactTypesState>(
//       'emits correct state when contact type is added to selection',
//       build: () => contactTypesBloc,
//       act: (bloc) =>
//           bloc.add(const ContactTypesAddEvent(contactType: contactType1)),
//       expect: () => [
//         const ContactTypesState(selectedContactTypes: [contactType1]),
//       ],
//     );

//     blocTest<ContactTypesBloc, ContactTypesState>(
//       'emits correct state when contact type is removed from selection',
//       build: () => contactTypesBloc,
//       seed: () => const ContactTypesState(selectedContactTypes: [contactType1]),
//       act: (bloc) =>
//           bloc.add(const ContactTypesRemoveEvent(contactType: contactType1)),
//       expect: () => [
//         const ContactTypesState(),
//       ],
//     );

//     blocTest<ContactTypesBloc, ContactTypesState>(
//       'emits correct state when selection is cleared',
//       build: () => contactTypesBloc,
//       seed: () => const ContactTypesState(selectedContactTypes: [contactType1]),
//       act: (bloc) => bloc.add(const ContactTypesClearEvent()),
//       expect: () => [
//         const ContactTypesState(),
//       ],
//     );

//     blocTest<ContactTypesBloc, ContactTypesState>(
//       'emits correct state when selected contactType is cleared',
//       build: () => contactTypesBloc,
//       seed: () => const ContactTypesState(selectedContactTypes: [contactType1]),
//       act: (bloc) => bloc.add(const ClearSelectedContactTypes()),
//       expect: () => [
//         const ContactTypesState(),
//       ],
//     );

//     blocTest<ContactTypesBloc, ContactTypesState>(
//       'emits correct state when a contact type is marked as deleted',
//       build: () => contactTypesBloc,
//       seed: () => const ContactTypesState(
//         editableContactTypes: [contactType1, contactType2],
//       ),
//       act: (bloc) {
//         bloc.add(const MarkAsDeletedEvent(contactType1));
//       },
//       expect: () => [
//         ContactTypesState(
//           editableContactTypes: [
//             contactType2,
//             contactType1.copyWith(isdeleted: true)
//           ],
//         ),
//       ],
//     );

//     const newContactType = ContactTypeModel(
//       contacttype_id: 3,
//       contacttype_name: 'ContactType3',
//     );

//     blocTest<ContactTypesBloc, ContactTypesState>(
//       'emits correct state when contact type is added',
//       build: () => contactTypesBloc,
//       seed: () => const ContactTypesState(
//         editableContactTypes: [contactType1, contactType2],
//       ),
//       act: (bloc) {
//         bloc.add(const AddContactTypeEvent(newContactType));
//       },
//       wait: const Duration(milliseconds: 500),
//       expect: () => [
//         const ContactTypesState(
//           editableContactTypes: [
//             contactType1,
//             contactType2,
//             newContactType,
//           ],
//         ),
//       ],
//     );

//     // blocTest<ContactTypesBloc, ContactTypesState>(
//     //   'removes the contact type from editableContactTypes',
//     //   build: () => contactTypesBloc,
//     //   seed: () => const ContactTypesState(
//     //     editableContactTypes: [contactType1, contactType2],
//     //   ),
//     //   act: (bloc) => bloc.add(const RemoveContactTypeEvent(contactType1)),
//     //   expect: () => [
//     //     const ContactTypesState(
//     //       editableContactTypes: [contactType2],
//     //     ),
//     //   ],
//     // );

//     // blocTest<ContactTypesBloc, ContactTypesState>(
//     //   'emits correct state when contact type is updated',
//     //   build: () {
//     //     when(
//     //       () => mockNMRepositoryImpl.updateContactTypes(
//     //         contactTypes: [
//     //           contactType1,
//     //           contactType2,
//     //         ],
//     //       ),
//     //     ).thenAnswer((_) async => Right(contactTypes));

//     //     return contactTypesBloc;
//     //   },
//     //   seed: () => ContactTypesState(
//     //     contactTypes: contactTypes,
//     //     selectedContactTypes: const [contactType1],
//     //   ),
//     //   act: (bloc) {
//     //     final updatedContactType1 =
//     //         contactType1.copyWith(contacttype_name: 'UpdatedContactType1');
//     //     final updatedContactTypes = [updatedContactType1, contactType2];

//     //     // Mock the repository's `updateContactTypes` method to return
//     //     // the updated contact types
//     //     when(
//     //       () => mockNMRepositoryImpl.updateContactTypes(
//     //         contactTypes: updatedContactTypes,
//     //       ),
//     //     ).thenAnswer((_) async => Right(updatedContactTypes));

//     //     bloc.add(
//     //       RequestUpdateContactTypesEvent(contactTypes: updatedContactTypes),
//     //     );
//     //   },
//     //   expect: () => [
//     //     const ContactTypesState(status: GenericRequestStatusEnum.loading),
//     //     const ContactTypesState(
//     //       selectedContactTypes: [contactType1],
//     //       status: GenericRequestStatusEnum.success,
//     //       contactTypes: [
//     //         ContactTypeModel(
//     //           contacttype_id: 1,
//     //           contacttype_name: 'ContactType1',
//     //         ),
//     //         ContactTypeModel(
//     //           contacttype_id: 2,
//     //           contacttype_name: 'ContactType2',
//     //         ),
//     //       ],
//     //       editableContactTypes: [
//     //         ContactTypeModel(
//     //           contacttype_id: 1,
//     //           contacttype_name: 'UpdatedContactType1',
//     //         ),
//     //         ContactTypeModel(
//     //           contacttype_id: 2,
//     //           contacttype_name: 'UpdatedContactType2',
//     //         ),
//     //       ],
//     //     ),
//     //   ],
//     // );
//   });

//   const contactType1 = ContactTypeModel(
//     contacttype_id: 1,
//     contacttype_name: 'ContactType1',
//   );
//   const contactType2 = ContactTypeModel(
//     contacttype_id: 2,
//     contacttype_name: 'ContactType2',
//   );

//   final contactTypes = [contactType1, contactType2];

//   test('initial state is correct', () {
//     expect(contactTypesBloc.state, const ContactTypesState());
//   });

//   blocTest<ContactTypesBloc, ContactTypesState>(
//     'emits [loading, success] when fetch succeeds',
//     build: () {
//       when(() => mockNMRepositoryImpl.getContactTypes())
//           .thenAnswer((_) async => Right(contactTypes));
//       return contactTypesBloc;
//     },
//     act: (bloc) => bloc.add(const ContactTypesFetchEvent()),
//     expect: () => [
//       const ContactTypesState(status: GenericRequestStatusEnum.loading),
//       ContactTypesState(
//         status: GenericRequestStatusEnum.success,
//         contactTypes: contactTypes,
//         editableContactTypes: contactTypes,
//       ),
//     ],
//   );

//   blocTest<ContactTypesBloc, ContactTypesState>(
//     'emits [loading, error] when fetch fails',
//     build: () {
//       when(() => mockNMRepositoryImpl.getContactTypes())
//           .thenAnswer((_) async => Left(Exception('Failed')));
//       return contactTypesBloc;
//     },
//     act: (bloc) => bloc.add(const ContactTypesFetchEvent()),
//     expect: () => [
//       const ContactTypesState(status: GenericRequestStatusEnum.loading),
//       const ContactTypesState(status: GenericRequestStatusEnum.error),
//     ],
//   );

//   blocTest<ContactTypesBloc, ContactTypesState>(
//     'emits correct state when contact type is added to selection',
//     build: () => contactTypesBloc,
//     act: (bloc) =>
//         bloc.add(const ContactTypesAddEvent(contactType: contactType1)),
//     expect: () => [
//       const ContactTypesState(selectedContactTypes: [contactType1]),
//     ],
//   );

//   blocTest<ContactTypesBloc, ContactTypesState>(
//     'emits correct state when contact type is removed from selection',
//     build: () => contactTypesBloc,
//     seed: () => const ContactTypesState(selectedContactTypes: [contactType1]),
//     act: (bloc) =>
//         bloc.add(const ContactTypesRemoveEvent(contactType: contactType1)),
//     expect: () => [
//       const ContactTypesState(),
//     ],
//   );

//   blocTest<ContactTypesBloc, ContactTypesState>(
//     'emits correct state when selection is cleared',
//     build: () => contactTypesBloc,
//     seed: () => const ContactTypesState(selectedContactTypes: [contactType1]),
//     act: (bloc) => bloc.add(const ContactTypesClearEvent()),
//     expect: () => [
//       const ContactTypesState(),
//     ],
//   );
// }

import 'package:api_service/api_service.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nextminute/features/menu/sub_menus/customer/customer/contact_type/bloc/contact_types_bloc.dart';
import 'package:nextminute/features/utils/generic_status_enum.dart';
import 'package:nm_repository/nm_repository.dart';

class MockNMRepositoryImpl extends Mock implements NMRepositoryImpl {}

void main() {
  late ContactTypesBloc contactTypesBloc;
  late NMRepositoryImpl nmRepositoryImpl;

  setUp(() {
    nmRepositoryImpl = MockNMRepositoryImpl();
    contactTypesBloc = ContactTypesBloc(nmRepositoryImpl: nmRepositoryImpl);
  });

  tearDown(() {
    contactTypesBloc.close();
  });

  blocTest<ContactTypesBloc, ContactTypesState>(
    'Fetch event should set the state to success with fetched contact types',
    build: () => contactTypesBloc,
    act: (bloc) {
      when(() => nmRepositoryImpl.getContactTypes()).thenAnswer(
        (_) async => const Right(<ContactTypeModel>[]),
      );
      bloc.add(const ContactTypesFetchEvent());
    },
    expect: () => [
      const ContactTypesState(status: GenericRequestStatusEnum.loading),
      const ContactTypesState(
        status: GenericRequestStatusEnum.success,
        editableContactTypes: [],
      ),
    ],
  );

  blocTest<ContactTypesBloc, ContactTypesState>(
    'AddSelection event should add a contact type to selectedContactTypes',
    build: () => contactTypesBloc,
    act: (bloc) {
      const contactType = ContactTypeModel.empty;
      bloc.add(const ContactTypesAddEvent(contactType: contactType));
    },
    expect: () => [
      const ContactTypesState(selectedContactTypes: [ContactTypeModel.empty]),
    ],
  );

  blocTest<ContactTypesBloc, ContactTypesState>(
    'RemoveSelection event should remove a contact type from selectedContactTypes',
    build: () => contactTypesBloc,
    act: (bloc) {
      const contactType = ContactTypeModel.empty;
      bloc
        ..add(const ContactTypesAddEvent(contactType: contactType))
        ..add(const ContactTypesRemoveEvent(contactType: contactType));
    },
    expect: () => [
      const ContactTypesState(selectedContactTypes: [ContactTypeModel.empty]),
      const ContactTypesState(),
    ],
  );

  blocTest<ContactTypesBloc, ContactTypesState>(
    'ClearSelectedContactTypes event should clear the selectedContactTypes list',
    build: () => contactTypesBloc,
    act: (bloc) {
      const contactType = ContactTypeModel.empty;
      bloc
        ..add(const ContactTypesAddEvent(contactType: contactType))
        ..add(const ClearSelectedContactTypes());
    },
    expect: () => [
      const ContactTypesState(selectedContactTypes: [ContactTypeModel.empty]),
      const ContactTypesState(),
    ],
  );

  blocTest<ContactTypesBloc, ContactTypesState>(
    'MarkAsDeleted event should mark a contact type as deleted',
    build: () {
      final nmRepositoryImpl = MockNMRepositoryImpl();
      return ContactTypesBloc(nmRepositoryImpl: nmRepositoryImpl);
    },
    seed: () => const ContactTypesState(
      editableContactTypes: [
        ContactTypeModel(
          contacttype_id: 1,
          contacttype_name: 'test',
        ),
      ],
    ),
    act: (bloc) => bloc.add(
      const MarkAsDeletedEvent(
        ContactTypeModel(
          contacttype_id: 1,
          contacttype_name: 'test',
        ),
      ),
    ),
    expect: () => [
      ContactTypesState(
        editableContactTypes: [
          const ContactTypeModel(
            contacttype_id: 1,
            contacttype_name: 'test',
          ).copyWith(isdeleted: true),
        ],
      ),
    ],
  );

  blocTest<ContactTypesBloc, ContactTypesState>(
    'RemoveContactType event should remove a contact type from editableContactTypes',
    build: () {
      final nmRepositoryImpl = MockNMRepositoryImpl();
      return ContactTypesBloc(nmRepositoryImpl: nmRepositoryImpl);
    },
    seed: () => const ContactTypesState(
      editableContactTypes: [
        ContactTypeModel(
          contacttype_id: 1,
          contacttype_name: 'test',
        ),
      ],
    ),
    act: (bloc) => bloc.add(
      const RemoveContactTypeEvent(
        ContactTypeModel(
          contacttype_id: 1,
          contacttype_name: 'test',
        ),
      ),
    ),
    expect: () => [
      const ContactTypesState(
        editableContactTypes: [],
      ),
    ],
  );

  blocTest<ContactTypesBloc, ContactTypesState>(
    'AddContactType event should add a contact type to editableContactTypes',
    build: () {
      final nmRepositoryImpl = MockNMRepositoryImpl();
      return ContactTypesBloc(nmRepositoryImpl: nmRepositoryImpl);
    },
    seed: () => const ContactTypesState(editableContactTypes: []),
    act: (bloc) => bloc.add(const AddContactTypeEvent(ContactTypeModel.empty)),
    expect: () => [
      const ContactTypesState(
        editableContactTypes: [
          ContactTypeModel.empty,
        ],
      ),
    ],
  );

  blocTest<ContactTypesBloc, ContactTypesState>(
    'RequestUpdateContactTypes event should update contact types and remove deleted contact types from selectedContactTypes',
    build: () {
      final nmRepositoryImpl = MockNMRepositoryImpl();
      when(
        () => nmRepositoryImpl.updateContactTypes(
          contactTypes: any(named: 'contactTypes'),
        ),
      ).thenAnswer((_) async => () {});
      return ContactTypesBloc(nmRepositoryImpl: nmRepositoryImpl);
    },
    seed: () => const ContactTypesState(
      selectedContactTypes: [ContactTypeModel.empty],
    ),
    act: (bloc) =>
        bloc.add(const RequestUpdateContactTypesEvent(contactTypes: [])),
    expect: () => [
      const ContactTypesState(
        status: GenericRequestStatusEnum.loading,
        selectedContactTypes: [ContactTypeModel.empty],
      ),
      const ContactTypesState(
        status: GenericRequestStatusEnum.success,
      ),
    ],
  );

  blocTest<ContactTypesBloc, ContactTypesState>(
    'Clear event should clear the selectedContactTypes list',
    build: () => contactTypesBloc,
    act: (bloc) {
      const contactType = ContactTypeModel.empty;
      bloc
        ..add(const ContactTypesAddEvent(contactType: contactType))
        ..add(const ContactTypesClearEvent());
    },
    expect: () => [
      const ContactTypesState(selectedContactTypes: [ContactTypeModel.empty]),
      const ContactTypesState(),
    ],
  );
}
