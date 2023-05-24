import 'package:api_service/api_service.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nextminute/features/menu/main_menu/bloc/main_menu_bloc.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/sub_menus/job_details/bloc/job_details_bloc.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/sub_menus/job_details/view/job_details_page.dart';
import 'package:nextminute/features/utils/generic_status_enum.dart';
import 'package:nm_repository/nm_repository.dart';

import '../../../../../helpers/helpers.dart';
import '../../../../menu/view/menu_page_test.dart';

class MockNMRepository extends Mock implements NMRepositoryImpl {}

class MockJobsBloc extends MockBloc<JobDetailsEvent, JobDetailsState>
    implements JobDetailsBloc {}

const relatedBlobCounts = {
  'statusHistory': [
    {
      'status_name': 'New',
      'status_change_date': '2022-12-09T02:09:10.113',
      'status_changed_by_contact_name_display': 'Joe Bloggs',
      'status_changed_by_contact_initials': 'JB',
      'status_changed_by_contact_brush_colour_argb': '#FFD42A',
      'status_change_location': null,
      'status_change_address': null
    }
  ],
  'onSiteHistory': [
    {
      'job_id': 4482858,
      'book_id': null,
      'book_key': null,
      'location': {'longitude': 174.72448, 'latitude': -36.7611716},
      'contact_name_display': 'Joe Bloggs',
      'contact_initials': 'JB',
      'contact_color': '#FFD42A',
      'location_address': '5B Trias Road\r\nAuckland\r\n0629\r\nNew Zealand',
      'created': '2022-11-17T19:22:21.623'
    }
  ],
};

void main() {
  late NMRepositoryImpl nmRepositoryImpl;
  late JobDetailsBloc jdBloc;
  late MainMenuBloc mainMenuBloc;
  late SharedPrefs sharedPrefsRepository;

  late JobsListModel jobsListModel;

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await Helper.initHive();

    nmRepositoryImpl = MockNMRepository();
    jdBloc = MockJobsBloc();
    mainMenuBloc = MockMainMenuBloc();

    SharedPreferences.setMockInitialValues({
      'contactId': '1',
    });

    final sharedPrefs = await SharedPreferences.getInstance();
    sharedPrefsRepository = SharedPrefs(sharedPrefs: sharedPrefs);

    jobsListModel = await getJobsModel();
  });

  setUp(() async {
    final jobId = jobsListModel.data.first.job_id!;

    when(() => nmRepositoryImpl.getJobsList())
        .thenAnswer((_) async => Right(jobsListModel));

    when(() => nmRepositoryImpl.getRelatedBlobCounts(jobId))
        .thenAnswer((_) async => const Right(relatedBlobCounts));

    when(() => nmRepositoryImpl.getJobInfoLevel(jobId, 'Details ChargesTotals'))
        .thenAnswer((_) async => Right(jobsListModel.data.first));

    await sendUserPermissionRequest(nmRepositoryImpl, mainMenuBloc);

    when(() => jdBloc.state).thenReturn(
      JobDetailsState(
        status: GenericRequestStatusEnum.success,
        jobInfoLevel: jobsListModel.data.first,
        relatedBlobCounts: relatedBlobCounts,
      ),
    );

    whenListen(
      jdBloc,
      Stream.fromIterable([
        const JobDetailsState(status: GenericRequestStatusEnum.loading),
        JobDetailsState(
          status: GenericRequestStatusEnum.success,
          jobInfoLevel: jobsListModel.data.first,
          relatedBlobCounts: relatedBlobCounts,
        ),
      ]),
    );
  });

  testWidgets('renders JobDetailsPage with data', (tester) async {
    final jobsDatumModel = jobsListModel.data.first;
    await tester.pumpApp(
      MultiRepositoryProvider(
        providers: [
          RepositoryProvider.value(
            value: nmRepositoryImpl,
          ),
          RepositoryProvider.value(
            value: sharedPrefsRepository,
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider.value(value: jdBloc),
            BlocProvider.value(value: mainMenuBloc),
          ],
          child: JobDetailsPage(job: jobsDatumModel),
        ),
      ),
    );

    await tester.pumpAndSettle();
    expect(find.byType(JobDetailsPage), findsOneWidget);

    final refreshIndicator =
        find.byKey(const ValueKey('__refresh_indicator__'));
    await tester.ensureVisible(refreshIndicator);
    expect(refreshIndicator, findsOneWidget);

    // scroll to refresh
    await tester.drag(
      refreshIndicator,
      const Offset(
        0,
        300,
      ),
    );
    await tester.pumpAndSettle();

    final inviteButton = find.byKey(const Key('__invite_button__'));
    expect(inviteButton, findsOneWidget);

    // tap invite button
    await tester.tap(inviteButton);
    await tester.pumpAndSettle();
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

  final model = JobsListModel(
    data: data,
    total: 8,
    total_all: 8,
  );

  return model;
}
