import 'package:api_service/api_service.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nextminute/core/utils/extensions.dart';
import 'package:nextminute/features/menu/sub_menus/timesheet/bloc/timesheet_bloc.dart';
import 'package:nextminute/features/menu/sub_menus/timesheet/view/timesheet_page.dart';
import 'package:nextminute/features/menu/sub_menus/timesheet/widgets/ts_shimmer.dart';
import 'package:nextminute/features/utils/generic_status_enum.dart';
import 'package:nm_repository/nm_repository.dart';

import '../../../../helpers/pump_app.dart';

class MockNMRepository extends Mock implements NMRepositoryImpl {}

class MockTimesheetWeeklyBloc
    extends MockBloc<TimesheetEvent, TimesheetWeeklyState>
    implements TimesheetWeeklyBloc {}

class TimesheetWeeklyStateFake extends Fake implements TimesheetWeeklyState {}

class TimesheetEventFake extends Fake implements TimesheetEvent {}

void main() {
  late NMRepositoryImpl nmRepositoryImpl;
  late TimesheetWeeklyBloc timesheetWeeklyBloc;

  setUp(() async {
    final model = await getTestSheetModel();

    when(() => timesheetWeeklyBloc.state).thenReturn(
      TimesheetWeeklyState(
        status: GenericRequestStatusEnum.success,
        sheetWeeklyModel: model,
      ),
    );

    whenListen(
      timesheetWeeklyBloc,
      Stream.fromIterable([
        const TimesheetWeeklyState(status: GenericRequestStatusEnum.loading),
        TimesheetWeeklyState(
          status: GenericRequestStatusEnum.success,
          sheetWeeklyModel: model,
        ),
      ]),
    );

    await expectLater(
      timesheetWeeklyBloc.stream,
      emitsInOrder(
        [
          const TimesheetWeeklyState(status: GenericRequestStatusEnum.loading),
          TimesheetWeeklyState(
            status: GenericRequestStatusEnum.success,
            sheetWeeklyModel: model,
          ),
        ],
      ),
    );
  });

  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    nmRepositoryImpl = MockNMRepository();
    timesheetWeeklyBloc = MockTimesheetWeeklyBloc();
  });

  setUp(() async {
    await Helper.initHive();
  });

  tearDown(Helper.deleteHiveBoxes);

  testWidgets('should load weekly timesheet data', (tester) async {
    final formattedDateNow = DateTime.now().getSundayThisWeek();

    await tester.pumpApp(
      RepositoryProvider.value(
        value: nmRepositoryImpl,
        child: BlocProvider<TimesheetWeeklyBloc>(
          create: (_) => timesheetWeeklyBloc
            ..add(
              TimesheetFetchEvent(formattedDateNow),
            ),
          child: const TimeSheetView(),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.byType(TimeSheetView), findsOneWidget);

    final refreshIndicator = find.byKey(const Key('__refresh_indicator__'));
    expect(refreshIndicator, findsOneWidget);

    // Scroll to refresh
    await tester.drag(
      refreshIndicator,
      const Offset(0, 100),
    );
    await tester.pumpAndSettle();

    // prev button
    final prevButton = find.byKey(const Key('__prev_button__'));
    expect(prevButton, findsOneWidget);

    // next button
    final nextButton = find.byKey(const Key('__next_button__'));
    expect(nextButton, findsOneWidget);

    // tap prev button
    await tester.tap(prevButton);
    await tester.pumpAndSettle();

    // this week button
    // final thisWeekButton = find.byKey(const Key('__this_week_button__'));
    // expect(thisWeekButton, findsOneWidget);

    // tap this week button
    // await tester.tap(thisWeekButton);
    // await tester.pumpAndSettle();

    // tap next button
    await tester.tap(nextButton);
    await tester.pumpAndSettle();
  });

  testWidgets('should render TS Shimmer', (tester) async {
    await tester.pumpApp(
      RepositoryProvider.value(
        value: nmRepositoryImpl,
        child: BlocProvider(
          create: (context) => timesheetWeeklyBloc,
          child: const MaterialApp(
            home: TSShimmer(),
          ),
        ),
      ),
    );
    await tester.pump();
    expect(find.byType(TSShimmer), findsOneWidget);
  });

  tearDown(() {
    timesheetWeeklyBloc.close();
  });
}

Future<ListWeeklySummaryModel> getTestSheetModel() async {
  // Mock data response from API
  final jsonResponse = await Helper.readJson(
    'test/data/ts_weekly_data.json',
  );

  final res = List<Map<String, dynamic>>.from(
    jsonResponse['data'] as Iterable<dynamic>,
  );

  final data = res.map(WeeklyTimesheetDatum.fromJson).toList();

  final sheetModel = ListWeeklySummaryModel(
    data: data,
  );

  return sheetModel;
}
