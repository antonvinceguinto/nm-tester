import 'package:api_service/api_service.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/jobs_page/bloc/jobs_bloc.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/jobs_page/bloc/jobs_event.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/jobs_page/bloc/jobs_state.dart';
import 'package:nextminute/features/utils/generic_status_enum.dart';
import 'package:nm_repository/nm_repository.dart';

import '../../../../helpers/helpers.dart';
import '../../../tab_manager/expired_subscription/expired_subscription_page_test.dart';

// class MockNMRepositoryImpl extends Mock implements NMRepositoryImpl {}
class MockJobsBloc extends MockBloc<JobsEvent, JobsState> implements JobsBloc {}

void main() {
  late JobsBloc jobsBloc;
  late NMRepositoryImpl nmRepositoryImpl;
  late JobsListModel jobsModel;

  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();

    nmRepositoryImpl = MockNMRepositoryImpl();
    jobsBloc = JobsBloc(nmRepositoryImpl: nmRepositoryImpl);

    final jsonResponse = await Helper.readJson(
      'test/data/jobs_data.json',
    );

    final res = List<Map<String, dynamic>>.from(
      jsonResponse['data'] as Iterable<dynamic>,
    );

    final data = res.map(JobInfoLevelModel.fromJson).toList();

    jobsModel = JobsListModel(
      data: data,
      total: 8,
      total_all: 8,
    );
  });

  tearDown(() {
    jobsBloc.close();
  });

  test('initial state is correct', () {
    expect(jobsBloc.state, const JobsState());
  });

  blocTest<JobsBloc, JobsState>(
    'emits correct state on successful fetch',
    build: () {
      when(() => nmRepositoryImpl.getJobsList(any(), any(), any(), any()))
          .thenAnswer(
        (_) async => Right(jobsModel),
      );
      return jobsBloc;
    },
    act: (bloc) => bloc.add(
      const JobsFetchEvent(take: 10),
    ),
    expect: () => [
      const JobsState(status: GenericRequestStatusEnum.loading),
      JobsState(
        status: GenericRequestStatusEnum.success,
        currentSkip: 10,
        jobs: jobsModel,
        jobsList: jobsModel.data,
      ),
    ],
  );

  blocTest<JobsBloc, JobsState>(
    'emits correct state on failed fetch',
    build: () {
      when(() => nmRepositoryImpl.getJobsList(any(), any(), any(), any()))
          .thenAnswer((_) async => Left(Exception('Error')));
      return jobsBloc;
    },
    act: (bloc) => bloc.add(
      const JobsFetchEvent(take: 10),
    ),
    expect: () => [
      const JobsState(status: GenericRequestStatusEnum.loading),
      const JobsState(
        status: GenericRequestStatusEnum.error,
        errorMessage: 'Exception: Error',
      ),
    ],
  );
}



// import 'package:api_service/api_service.dart';
// import 'package:bloc_test/bloc_test.dart';
// import 'package:dartz/dartz.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:nextminute/features/menu/sub_menus/jobs/jobs_page/bloc/index.dart';
// import 'package:nextminute/features/utils/generic_status_enum.dart';
// import 'package:nm_repository/nm_repository.dart';

// import '../../../../helpers/helpers.dart';


// void main() {
//   late NMRepositoryImpl nmRepositoryImpl;
//   late JobsListModel jobsModel;

//   setUp(() async {
//     TestWidgetsFlutterBinding.ensureInitialized();
//     nmRepositoryImpl = MockNMRepository();

//     final jsonResponse = await Helper.readJson(
//       'test/data/jobs_data.json',
//     );

//     final res = List<Map<String, dynamic>>.from(
//       jsonResponse['data'] as Iterable<dynamic>,
//     );

//     final data = res.map(JobInfoLevelModel.fromJson).toList();

//     jobsModel = JobsListModel(
//       data: data,
//       total: 8,
//       total_all: 8,
//     );
//   });

//   blocTest<JobsBloc, JobsState>(
//     'emits [Loading, Success] when JobsFetchEvent() is called',
//     setUp: () {
//       when(() => nmRepositoryImpl.getJobsList())
//           .thenAnswer((_) async => Right(jobsModel));
//     },
//     build: () => JobsBloc(nmRepositoryImpl: nmRepositoryImpl),
//     act: (bloc) => bloc.add(const JobsFetchEvent()),
//     wait: const Duration(milliseconds: 500),
//     expect: () => <JobsState>[
//       const JobsState(status: GenericRequestStatusEnum.loading),
//       JobsState(
//         status: GenericRequestStatusEnum.success,
//         jobs: jobsModel,
//       ),
//     ],
//   );

//   blocTest<JobsBloc, JobsState>(
//     'emits [Error] when JobsFetchEvent() is called',
//     setUp: () {
//       when(() => nmRepositoryImpl.getJobsList())
//           .thenAnswer((_) async => Left(Exception('error')));
//     },
//     build: () => JobsBloc(nmRepositoryImpl: nmRepositoryImpl),
//     act: (bloc) => bloc.add(const JobsFetchEvent()),
//     wait: const Duration(milliseconds: 500),
//     expect: () => <JobsState>[
//       const JobsState(status: GenericRequestStatusEnum.loading),
//       const JobsState(
//         status: GenericRequestStatusEnum.error,
//         errorMessage: 'Exception: error',
//       ),
//     ],
//   );
// }
