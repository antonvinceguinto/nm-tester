import 'package:api_service/api_service.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nextminute/features/menu/sub_menus/customer/assignee/cubit/assignee_filter_cubit.dart';
import 'package:nextminute/features/menu/sub_menus/sub_menus.dart';
import 'package:nm_repository/nm_repository.dart';

import '../../../../helpers/helpers.dart';
import '../../customer/view/assignee_filter_page_test.dart';
import '../../jobs/sub_menus/add_job/add_job_page_test.dart';

class MockNMRepositoryImpl extends Mock implements NMRepositoryImpl {}

class MockTaskStatusBloc extends MockBloc<TaskEvent, TaskStatusState>
    implements TaskStatusBloc {}

class MockJobsFilterBloc extends MockBloc<JobsFilterEvent, JobsFilterBlocState>
    implements JobsFilterBloc {}

class MockTaskFilterBloc extends MockBloc<TaskFilterEvent, TaskFilterState>
    implements TaskFilterBloc {}

void main() {
  late TaskFilterBloc taskFilterBloc;
  late TaskStatusBloc taskStatusBloc;
  late JobsFilterBloc jobsFilterBloc;
  late JobsFilterCubit jobsFilterCubit;
  late AssigneeFilterCubit assigneeFilterCubit;
  late NMRepositoryImpl nmRepositoryImpl;

  tearDown(Helper.deleteHiveBoxes);

  setUpAll(() {
    nmRepositoryImpl = MockNMRepositoryImpl();
    taskStatusBloc = MockTaskStatusBloc();
    jobsFilterBloc = MockJobsFilterBloc();
    taskFilterBloc = MockTaskFilterBloc();
    jobsFilterCubit = MockJobsFilterCubit();
    assigneeFilterCubit = MockAssigneeFilterCubit();
  });

  setUp(() async {
    await Helper.initHive();
    when(
      () => nmRepositoryImpl.getTaskStatuses(),
    ).thenAnswer(
      (_) async => const Right([
        TaskStatusModel(
          id: 1,
          name: 'test',
          color: '#000000',
        ),
      ]),
    );

    when(
      () => nmRepositoryImpl.getCategoryFilters(),
    ).thenAnswer(
      (_) async => const Right([
        CategoryFilterModel(
          id: 1,
          name: 'test',
          color: '#000000',
        ),
      ]),
    );

    when(() => nmRepositoryImpl.getPriorityFilterList()).thenAnswer(
          (_) async => const Right([
        FPriorityModel(
          id: 1,
          name: 'In Progress',
          color: '#FFFF00',
        ),
      ]),
    );

    when(() => jobsFilterCubit.state).thenReturn(
      const JobsFilterState(),
    );

    when(() => taskFilterBloc.state).thenReturn(
      const TaskFilterState(),
    );

    when(() => assigneeFilterCubit.state).thenReturn(
      const AssigneeFilterState(
        contactTypes: [
          ContactTypeModel(
            contacttype_id: 1,
            contacttype_name: 'Test',
          )
        ],
        selectedContactTypes: [
          ContactTypeModel(
            contacttype_id: 1,
            contacttype_name: 'Test',
          )
        ],
        userRoles: [
          UserRoleModel(
            subrole_id: 1,
            subrole_name: 'Test',
          )
        ],
      ),
    );
  });

  Future<void> pumpTaskFilterPage(WidgetTester tester) async {
    await tester.pumpApp(
      RepositoryProvider.value(
        value: nmRepositoryImpl,
        child: MultiBlocProvider(
          providers: [
            BlocProvider<TaskStatusBloc>(
              create: (context) => taskStatusBloc,
            ),
            BlocProvider<JobsFilterCubit>(
              create: (context) => jobsFilterCubit,
            ),
            BlocProvider<JobsFilterBloc>(
              create: (context) => jobsFilterBloc,
            ),
            BlocProvider<TaskFilterBloc>(
              create: (context) => taskFilterBloc,
            ),
            BlocProvider<AssigneeFilterCubit>(
              create: (context) => assigneeFilterCubit,
            ),
          ],
          child: const MaterialApp(
            home: TaskFilterPage(),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
  }

  group('TaskFilterPage', () {
    testWidgets('renders TaskFilterView', (tester) async {
      await pumpTaskFilterPage(tester);
      expect(find.byType(TaskFilterView), findsOneWidget);
    });
  });

  group(
    'TaskFilterView',
    () {
      testWidgets('renders Scaffold', (tester) async {
        await pumpTaskFilterPage(tester);
        expect(find.byType(TaskFilterView), findsOneWidget);
      });
    },
  );
}
