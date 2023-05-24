import 'package:api_service/api_service.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/sub_menus/job_details/bloc/job_details_bloc.dart';
import 'package:nextminute/features/utils/generic_status_enum.dart';
import 'package:nm_repository/nm_repository.dart';

class MockNMRepositoryImpl extends Mock implements NMRepositoryImpl {}

class MockPosition extends Mock implements Position {}

class BuildContextFake extends Fake implements BuildContext {}

void main() {
  group('JobDetailsBloc', () {
    late JobDetailsBloc jobDetailsBloc;
    late NMRepositoryImpl mockNMRepositoryImpl;

    setUpAll(() {});

    setUp(() {
      TestWidgetsFlutterBinding.ensureInitialized();

      mockNMRepositoryImpl = MockNMRepositoryImpl();
      jobDetailsBloc = JobDetailsBloc(nmRepositoryImpl: mockNMRepositoryImpl);
    });

    tearDown(() {
      jobDetailsBloc.close();
    });

    test('initial state is correct', () {
      expect(jobDetailsBloc.state, const JobDetailsState());
    });

    group('JobDetailsFetchEvent', () {
      blocTest<JobDetailsBloc, JobDetailsState>(
        'emits [loading, success] when JobDetailsFetchEvent succeeds',
        build: () => jobDetailsBloc,
        act: (bloc) {
          const jobId = 1;
          const infoLevel = 'testInfoLevel';

          when(
            () => mockNMRepositoryImpl.getRelatedBlobCounts(jobId),
          ).thenAnswer(
            (_) async => const Right(
              {'test': 'test'},
            ),
          );

          when(
            () => mockNMRepositoryImpl.getJobInfoLevel(jobId, infoLevel),
          ).thenAnswer(
            (_) async => const Right(
              JobInfoLevelModel(),
            ),
          );

          bloc.add(
            const JobDetailsFetchEvent(
              jobId: jobId,
              infoLevel: infoLevel,
            ),
          );
        },
        expect: () => [
          const JobDetailsState(status: GenericRequestStatusEnum.loading),
          const JobDetailsState(
            status: GenericRequestStatusEnum.success,
            relatedBlobCounts: {'test': 'test'},
          ),
        ],
      );

      blocTest<JobDetailsBloc, JobDetailsState>(
        'emits [loading, error] when error occurs in _onFetchEvent',
        build: () {
          when(() => mockNMRepositoryImpl.getRelatedBlobCounts(any()))
              .thenAnswer((_) async => Left(Exception('error')));
          when(() => mockNMRepositoryImpl.getJobInfoLevel(any(), any()))
              .thenAnswer((_) async => Left(Exception('error')));
          return jobDetailsBloc;
        },
        act: (bloc) => bloc.add(
          const JobDetailsFetchEvent(
            jobId: 1,
            infoLevel: 'test',
          ),
        ),
        expect: () => [
          const JobDetailsState(
            status: GenericRequestStatusEnum.loading,
          ),
          const JobDetailsState(
            status: GenericRequestStatusEnum.error,
            errorMessage: 'Exception: error',
          ),
        ],
      );

      blocTest<JobDetailsBloc, JobDetailsState>(
        'emits [loading, success] when removing linked task is successful',
        build: () => jobDetailsBloc,
        act: (bloc) {
          when(
            () => mockNMRepositoryImpl.removeLinkedTask(
              jobId: any(named: 'jobId'),
              isDeleteBooking: any(named: 'isDeleteBooking'),
            ),
          ).thenAnswer((_) async => const Right(null));
          bloc.add(
            const RemoveLinkedTaskEvent(jobId: 1, isDeleteBooking: true),
          );
        },
        expect: () => [
          const JobDetailsState(status: GenericRequestStatusEnum.loading),
          const JobDetailsState(status: GenericRequestStatusEnum.success),
        ],
      );

      blocTest<JobDetailsBloc, JobDetailsState>(
        'emits [loading, error] when removing linked task fails',
        build: () => jobDetailsBloc,
        act: (bloc) {
          when(
            () => mockNMRepositoryImpl.removeLinkedTask(
              jobId: any(named: 'jobId'),
              isDeleteBooking: any(named: 'isDeleteBooking'),
            ),
          ).thenAnswer(
            (_) async => Left(Exception('Error removing linked task')),
          );
          bloc.add(
            const RemoveLinkedTaskEvent(jobId: 1, isDeleteBooking: true),
          );
        },
        expect: () => [
          const JobDetailsState(status: GenericRequestStatusEnum.loading),
          const JobDetailsState(
            status: GenericRequestStatusEnum.error,
            errorMessage: 'Exception: Error removing linked task',
          ),
        ],
      );

      blocTest<JobDetailsBloc, JobDetailsState>(
        'emits [loading, success] when deleting job is successful',
        build: () => jobDetailsBloc,
        act: (bloc) {
          when(
            () => mockNMRepositoryImpl.deleteJob(
              jobId: any(named: 'jobId'),
              deleteTask: any(named: 'deleteTask'),
            ),
          ).thenAnswer((_) async => const Right(null));
          bloc.add(const DeleteJobEvent(jobId: 1, isDeleteTask: true));
        },
        expect: () => [
          const JobDetailsState(status: GenericRequestStatusEnum.loading),
          const JobDetailsState(status: GenericRequestStatusEnum.success),
        ],
      );

      blocTest<JobDetailsBloc, JobDetailsState>(
        'emits [loading, error] when deleting job fails',
        build: () => jobDetailsBloc,
        act: (bloc) {
          when(
            () => mockNMRepositoryImpl.deleteJob(
              jobId: any(named: 'jobId'),
              deleteTask: any(named: 'deleteTask'),
            ),
          ).thenAnswer((_) async => Left(Exception('Error deleting job')));
          bloc.add(const DeleteJobEvent(jobId: 1, isDeleteTask: true));
        },
        expect: () => [
          const JobDetailsState(status: GenericRequestStatusEnum.loading),
          const JobDetailsState(
            status: GenericRequestStatusEnum.error,
            errorMessage: 'Exception: Error deleting job',
          ),
        ],
      );

      // blocTest<JobDetailsBloc, JobDetailsState>(
      //   'emits [loading, success] when updating job status is successful',
      //   build: () {
      //     when(
      //       () => mockNMRepositoryImpl.updateJobStatus(
      //         jobId: any(named: 'jobId'),
      //         jobStatusId: any(named: 'jobStatusId'),
      //         latitude: any(named: 'latitude'),
      //         longitude: any(named: 'longitude'),
      //       ),
      //     ).thenAnswer((_) async => const Right(null));
      //     return jobDetailsBloc;
      //   },
      //   act: (bloc) => bloc.add(
      //     const UpdateJobStatusEvent(
      //       jobId: 1,
      //       jobStatusId: 2,
      //     ),
      //   ),
      //   expect: () => [
      //     const JobDetailsState(status: GenericRequestStatusEnum.loading),
      //     // const JobDetailsState(status: GenericRequestStatusEnum.success),
      //   ],
      // );

      // blocTest<JobDetailsBloc, JobDetailsState>(
      //   'emits [loading, error] when updating job status fails',
      //   build: () => jobDetailsBloc,
      //   act: (bloc) {
      //     when(
      //       () => mockNMRepositoryImpl.updateJobStatus(
      //         jobId: any(named: 'jobId'),
      //         jobStatusId: any(named: 'jobStatusId'),
      //         latitude: any(named: 'latitude'),
      //         longitude: any(named: 'longitude'),
      //       ),
      //     ).thenAnswer((_) async => Left(Exception('error')));
      //     bloc.add(const UpdateJobStatusEvent(jobId: 1, jobStatusId: 2));
      //   },
      //   expect: () => [
      //     const JobDetailsState(status: GenericRequestStatusEnum.loading),
      //     const JobDetailsState(
      //       status: GenericRequestStatusEnum.error,
      //       errorMessage: 'Exception: error',
      //     ),
      //   ],
      // );
    });
  });
}
