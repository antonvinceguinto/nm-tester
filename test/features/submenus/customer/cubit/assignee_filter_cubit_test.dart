import 'package:api_service/api_service.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nextminute/features/menu/sub_menus/customer/assignee/cubit/assignee_filter_cubit.dart';
import 'package:nextminute/features/utils/generic_status_enum.dart';
import 'package:nm_repository/nm_repository.dart';

class MockNMRepositoryImpl extends Mock implements NMRepositoryImpl {}

void main() {
  late NMRepositoryImpl nmRepository;
  late AssigneeFilterCubit assigneeFilterCubit;

  setUp(() {
    nmRepository = MockNMRepositoryImpl();
    assigneeFilterCubit = AssigneeFilterCubit(nmRepositoryImpl: nmRepository);
  });

  group('AssigneeFilterCubit', () {
    final tUserRoleModelList = [
      const UserRoleModel(
        subrole_id: 1,
        subrole_name: 'Admin',
      ),
      const UserRoleModel(
        subrole_id: 2,
        subrole_name: 'User',
      ),
    ];

    final tContactTypeModelList = [
      const ContactTypeModel(
        contacttype_id: 1,
        contacttype_name: 'Test',
      ),
      const ContactTypeModel(
        contacttype_id: 2,
        contacttype_name: 'Test 2',
      ),
    ];

    test('initial state is correct', () {
      expect(
        assigneeFilterCubit.state,
        const AssigneeFilterState(),
      );
    });

    blocTest<AssigneeFilterCubit, AssigneeFilterState>(
      'fetchUserRoles should emit success',
      build: () {
        when(() => nmRepository.getContactTypes())
            .thenAnswer((_) async => Right(tContactTypeModelList));
        // when(() => nmRepository.getUserRoles())
        //     .thenAnswer((_) async => Right(tUserRoleModelList));
        return assigneeFilterCubit;
      },
      act: (cubit) => cubit.fetchUserRoles(),
      expect: () => [
        const AssigneeFilterState(
          status: GenericRequestStatusEnum.loading,
        ),
        AssigneeFilterState(
          status: GenericRequestStatusEnum.success,
          contactTypes: tContactTypeModelList,
          // userRoles: tUserRoleModelList,
        ),
      ],
    );

    blocTest<AssigneeFilterCubit, AssigneeFilterState>(
      'fetchUserRoles should emit error',
      build: () {
        // when(() => nmRepository.getUserRoles())
        //     .thenAnswer((_) async => Left(Exception('Error')));
        when(() => nmRepository.getContactTypes())
            .thenAnswer((_) async => Left(Exception('Error')));
        return assigneeFilterCubit;
      },
      act: (cubit) => cubit.fetchUserRoles(),
      expect: () => [
        const AssigneeFilterState(
          status: GenericRequestStatusEnum.loading,
        ),
        const AssigneeFilterState(
          status: GenericRequestStatusEnum.error,
        ),
      ],
    );

    blocTest<AssigneeFilterCubit, AssigneeFilterState>(
      'addToUserRole should add/remove user role',
      build: () => assigneeFilterCubit,
      act: (cubit) => cubit.addToUserRole(tUserRoleModelList.first),
      expect: () => [
        AssigneeFilterState(
          selectedUserRoles: [tUserRoleModelList.first],
        ),
      ],
    );

    blocTest<AssigneeFilterCubit, AssigneeFilterState>(
      'clearSelectedcontactTypes should clear selected contact types',
      build: () => assigneeFilterCubit,
      seed: () => AssigneeFilterState(
        selectedContactTypes: [tContactTypeModelList.first],
      ),
      act: (cubit) => cubit.clearSelectedContactTypes(),
      expect: () => [
        const AssigneeFilterState(),
      ],
    );

    blocTest<AssigneeFilterCubit, AssigneeFilterState>(
      'addToCustomerTypes',
      build: () => assigneeFilterCubit,
      act: (cubit) => cubit.addToCustomerTypes(tContactTypeModelList.first),
      expect: () => [
        AssigneeFilterState(
          selectedContactTypes: [tContactTypeModelList.first],
        ),
      ],
    );

    blocTest<AssigneeFilterCubit, AssigneeFilterState>(
      'excludeArchivedContacts',
      build: () => assigneeFilterCubit,
      act: (cubit) => cubit.excludeArchivedContacts(),
      expect: () => [
        const AssigneeFilterState(
          isExcludeArchivedContacts: true,
        ),
      ],
    );

    blocTest<AssigneeFilterCubit, AssigneeFilterState>(
      'excludeDisabledUsers',
      build: () => assigneeFilterCubit,
      act: (cubit) => cubit.excludeDisabledUsers(),
      expect: () => [
        const AssigneeFilterState(
          isExcludeDisabledUsers: true,
        ),
      ],
    );

    blocTest<AssigneeFilterCubit, AssigneeFilterState>(
      'includeDeleted',
      build: () => assigneeFilterCubit,
      act: (cubit) => cubit.includeDeleted(),
      expect: () => [
        const AssigneeFilterState(
          includeDeleted: true,
        ),
      ],
    );

    blocTest<AssigneeFilterCubit, AssigneeFilterState>(
      'allAdministrators',
      build: () => assigneeFilterCubit,
      act: (cubit) => cubit.allAdministrators(val: true),
      expect: () => [
        const AssigneeFilterState(
          isAllAdministrators: true,
        ),
      ],
    );

    blocTest<AssigneeFilterCubit, AssigneeFilterState>(
      'allUsers',
      build: () => assigneeFilterCubit,
      act: (cubit) => cubit.allUsers(val: true),
      expect: () => [
        const AssigneeFilterState(
          isAllUsers: true,
        ),
      ],
    );

    blocTest<AssigneeFilterCubit, AssigneeFilterState>(
      'clearFilters',
      build: () => assigneeFilterCubit,
      act: (cubit) => cubit.clearFilters(),
      expect: () => [
        const AssigneeFilterState(),
      ],
    );

    // blocTest<AssigneeFilterCubit, AssigneeFilterState>(
    //   'toggleSelectAllContactTypes should select/deselect all contact types',
    //   build: () => assigneeFilterCubit,
    //   act: (cubit) => cubit.toggleSelectAllContactTypes(),
    //   expect: () => [
    //     const AssigneeFilterState(),
    //     AssigneeFilterState(
    //       selectedContactTypes: tContactTypeModelList,
    //     ),
    //     const AssigneeFilterState(),
    //   ],
    // );
  });
}
