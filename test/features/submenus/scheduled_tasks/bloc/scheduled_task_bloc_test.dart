import 'package:api_service/api_service.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nextminute/features/menu/sub_menus/sub_menus.dart';
import 'package:nextminute/features/utils/generic_status_enum.dart';
import 'package:nm_repository/nm_repository.dart';

import '../../../../helpers/pump_app.dart';


void main() {
  late NMRepositoryImpl nmRepositoryImpl;
  late TaskListModel taskListModel;
  late ScheduledTaskBloc bloc;

  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();

    nmRepositoryImpl = MockNMRepository();
    bloc = ScheduledTaskBloc(nmRepositoryImpl: nmRepositoryImpl);

    taskListModel = await _getTaskModel();
  });

  tearDown(() {
    bloc.close();
  });

  test('initial state is correct', () {
    expect(bloc.state, const ScheduledTaskState());
  });

  blocTest<ScheduledTaskBloc, ScheduledTaskState>(
    'emits [loading, success] when tasks are fetched successfully',
    build: () {
      when(
        () => nmRepositoryImpl.getExistingTasks(
          currPage: any(named: 'currPage'),
          search: any(named: 'search'),
          bookingStatus: any(named: 'bookingStatus'),
          acceptanceStatus: any(named: 'acceptanceStatus'),
          priorityIds: any(named: 'priorityIds'),
          taskCategoryIds: any(named: 'taskCategoryIds'),
          isExcludeArchive: any(named: 'isExcludeArchive'),
          bookingClient: any(named: 'bookingClient'),
          bookingContacts: any(named: 'bookingContacts'),
          bookingCreatedByContacts: any(named: 'bookingCreatedByContacts'),
          isFromJobs: any(named: 'isFromJobs'),
          jobId: any(named: 'jobId'),
        ),
      ).thenAnswer((_) async => Right(taskListModel));
      return bloc;
    },
    act: (bloc) => bloc.add(const ScheduledTaskFetchEvent()),
    expect: () => [
      const ScheduledTaskState(status: GenericRequestStatusEnum.loading),
      ScheduledTaskState(
        status: GenericRequestStatusEnum.success,
        taskListModel: taskListModel,
      ),
    ],
  );

  blocTest<ScheduledTaskBloc, ScheduledTaskState>(
    'emits [loading, error] when tasks fetching fails',
    build: () {
      when(
        () => nmRepositoryImpl.getExistingTasks(
          currPage: any(named: 'currPage'),
          search: any(named: 'search'),
          bookingStatus: any(named: 'bookingStatus'),
          acceptanceStatus: any(named: 'acceptanceStatus'),
          priorityIds: any(named: 'priorityIds'),
          taskCategoryIds: any(named: 'taskCategoryIds'),
          isExcludeArchive: any(named: 'isExcludeArchive'),
          bookingClient: any(named: 'bookingClient'),
          bookingContacts: any(named: 'bookingContacts'),
          bookingCreatedByContacts: any(named: 'bookingCreatedByContacts'),
          isFromJobs: any(named: 'isFromJobs'),
          jobId: any(named: 'jobId'),
        ),
      ).thenAnswer((_) async => Left(Exception('Error')));
      return bloc;
    },
    act: (bloc) => bloc.add(const ScheduledTaskFetchEvent()),
    expect: () => [
      const ScheduledTaskState(status: GenericRequestStatusEnum.loading),
      const ScheduledTaskState(
        status: GenericRequestStatusEnum.error,
        errorMessage: 'Exception: Error',
      ),
    ],
  );
}

Future<TaskListModel> _getTaskModel() async {
  final jsonResponse = await Helper.readJson(
    'test/data/task_data.json',
  );

  final res = List<Map<String, dynamic>>.from(
    jsonResponse['data'] as Iterable<dynamic>,
  );

  final data = res.map(TaskInfoLevelModel.fromJson).toList();

  final sheetModel = TaskListModel(
    total: 10,
    total_all: 10,
    data: data,
  );

  return sheetModel;
}
