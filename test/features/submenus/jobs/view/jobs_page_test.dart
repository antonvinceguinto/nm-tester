import 'package:api_service/api_service.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nextminute/features/menu/main_menu/bloc/main_menu_bloc.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/jobs_page/bloc/jobs_bloc.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/jobs_page/bloc/jobs_event.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/jobs_page/bloc/jobs_state.dart';
import 'package:nextminute/features/menu/sub_menus/sub_menus.dart';
import 'package:nextminute/features/utils/generic_status_enum.dart';
import 'package:nextminute/features/wigdets/nm_widgets.dart';
import 'package:nm_repository/nm_repository.dart';

import '../../../../helpers/helpers.dart';
import '../../../menu/bloc/main_menu_bloc_test.dart';

class MockNMRepository extends Mock implements NMRepositoryImpl {}

class MockJobsBloc extends MockBloc<JobsEvent, JobsState> implements JobsBloc {}

class MockJobsFilterCubit extends MockCubit<JobsFilterState>
    implements JobsFilterCubit {}

void main() async {
  group('JobsPageView', () {
    late NMRepositoryImpl nmRepositoryImpl;
    late JobsBloc jobsBloc;
    late MainMenuBloc mainMenuBloc;

    late JobsListModel jobListModel;
    late JobsFilterCubit jobsFilterCubit;

    setUpAll(() async {
      TestWidgetsFlutterBinding.ensureInitialized();

      nmRepositoryImpl = MockNMRepository();
      jobsBloc = MockJobsBloc();
      mainMenuBloc = MockMainMenuBloc();
      jobsFilterCubit = MockJobsFilterCubit();

      jobListModel = await getJobsModel();
    });

    setUp(() async {
      await Helper.initHive();

      when(() => nmRepositoryImpl.getUserPermissions()).thenAnswer(
        (_) async => const Right(
          UserPermissionsModel.empty,
        ),
      );

      when(() => mainMenuBloc.state).thenReturn(
        const MainMenuState(
          status: GenericRequestStatusEnum.success,
        ),
      );

      when(() => nmRepositoryImpl.getJobStatusFilterList()).thenAnswer(
        (_) async => const Right([
          FStatusModel(
            id: 1,
            name: 'In Progress',
            color: '#FFFF00',
          ),
        ]),
      );

      when(() => nmRepositoryImpl.getJobTypeFilterList()).thenAnswer(
        (_) async => const Right([
          FTypeModel(
            id: 1,
            name: 'In Progress',
            color: '#FFFF00',
          ),
        ]),
      );

      when(() => nmRepositoryImpl.getPricingTypeFilterList()).thenAnswer(
        (_) async => const Right([
          FPricingTypeModel(
            id: 1,
            name: 'In Progress',
            color: '#FFFF00',
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

      when(() => nmRepositoryImpl.getJobsList()).thenAnswer(
        (_) async => Right(jobListModel),
      );

      when(() => jobsBloc.state).thenReturn(
        JobsState(
          status: GenericRequestStatusEnum.success,
          jobs: jobListModel,
        ),
      );

      when(() => jobsFilterCubit.state).thenReturn(const JobsFilterState());

      whenListen(
        jobsBloc,
        Stream.fromIterable([
          const JobsState(status: GenericRequestStatusEnum.loading),
          JobsState(
            status: GenericRequestStatusEnum.success,
            jobs: jobListModel,
          ),
        ]),
      );

      await expectLater(
        jobsBloc.stream,
        emitsInOrder(
          [
            const JobsState(status: GenericRequestStatusEnum.loading),
            JobsState(
              status: GenericRequestStatusEnum.success,
              jobs: jobListModel,
            ),
          ],
        ),
      );
    });

    Widget makeTestableWidget() {
      return RepositoryProvider.value(
        value: nmRepositoryImpl,
        child: MultiBlocProvider(
          providers: [
            BlocProvider<MainMenuBloc>(
              create: (_) => mainMenuBloc,
            ),
            BlocProvider<JobsBloc>(
              create: (_) => jobsBloc,
            ),
            BlocProvider<JobsFilterCubit>(
              create: (_) => jobsFilterCubit,
            ),
            BlocProvider(
              create: (context) => JobsFilterBloc(
                nmRepositoryImpl: nmRepositoryImpl,
              ),
            ),
          ],
          child: const MaterialApp(
            home: JobsPage(),
          ),
        ),
      );
    }

    testWidgets('should render Jobs page', (tester) async {
      await tester.pumpApp(makeTestableWidget());
      await tester.pumpAndSettle();
      expect(find.byType(JobsView), findsOneWidget);

      final refreshIndicator = find.byKey(const Key('__refresh_indicator__'));
      expect(refreshIndicator, findsOneWidget);

      // Scroll to refresh
      await tester.drag(
        refreshIndicator,
        const Offset(0, 100),
      );
      await tester.pumpAndSettle();

      final searchField = find.byType(NMSearchField);
      expect(searchField, findsOneWidget);
    });

    testWidgets('should search for jobs', (tester) async {
      await tester.pumpApp(makeTestableWidget());
      await tester.pumpAndSettle();
      expect(find.byType(JobsView), findsOneWidget);

      final searchField = find.byType(NMSearchField);
      expect(searchField, findsOneWidget);

      // Search for a job
      await tester.enterText(searchField, 'paint');
      await tester.pump();
    });

    testWidgets('should render empty state', (tester) async {
      await tester.pumpApp(makeTestableWidget());
      await tester.pumpAndSettle();
      expect(find.byType(JobsView), findsOneWidget);
    });

    testWidgets('should tap filter button', (tester) async {
      await tester.pumpApp(makeTestableWidget());
      await tester.pumpAndSettle();
      expect(find.byType(JobsView), findsOneWidget);

      final filterButton = find.byKey(const Key('__filter_button__'));
      expect(filterButton, findsOneWidget);

      await tester.tap(filterButton);
      await tester.pump();
    });

    testWidgets('should tap on maps view', (tester) async {
      await tester.pumpApp(makeTestableWidget());
      await tester.pumpAndSettle();

      expect(find.byType(JobsView), findsOneWidget);

      final bottomMenuActions =
          find.byKey(const ValueKey('__bottom_menu_actions__'));
      expect(bottomMenuActions, findsOneWidget);
      await tester.ensureVisible(bottomMenuActions);
      await tester.tap(bottomMenuActions);
      await tester.pumpAndSettle();

      // final nmActionList = find.byKey(const ValueKey('__action_list__'));
      // expect(nmActionList, findsOneWidget);

      // final actionButton = find.byType(NMBottomActionButton);

      // expect(actionButton, findsOneWidget);

      // await tester.tap(actionButton);
      // await tester.pumpAndSettle();

      // final mapsButton = find.byKey(const ValueKey('__show_maps__'));
      // expect(mapsButton, findsOneWidget);

      // await tester.tap(mapsButton);
      // await tester.pumpAndSettle();
    });
  });
}

Future<JobsListModel> getJobsModel() async {
  // Mock data response from API
  final jsonResponse = await Helper.readJson(
    'test/data/jobs_data.json',
  );

  final res = List<Map<String, dynamic>>.from(
    jsonResponse['data'] as Iterable<dynamic>,
  );

  final data = res.map(JobInfoLevelModel.fromJson).toList();

  final sheetModel = JobsListModel(
    total: 10,
    total_all: 10,
    data: data,
  );

  return sheetModel;
}
