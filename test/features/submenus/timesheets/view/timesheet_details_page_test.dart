import 'package:api_service/api_service.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nextminute/features/menu/sub_menus/timesheet/bloc/timesheet_bloc.dart';
import 'package:nextminute/features/menu/sub_menus/timesheet/view/timesheet_details_page.dart';
import 'package:nm_repository/nm_repository.dart';

import '../../../../helpers/pump_app.dart';

class MockNMRepository extends Mock implements NMRepositoryImpl {}

class MockTimesheetWeeklyBloc
    extends MockBloc<TimesheetEvent, TimesheetWeeklyState>
    implements TimesheetWeeklyBloc {}

class TimesheetWeeklyStateFake extends Fake implements TimesheetWeeklyState {}

class TimesheetEventFake extends Fake implements TimesheetEvent {}

void main() {
  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await Helper.initHive();
  });

  tearDown(() async {
    await Helper.deleteHiveBoxes();
  });

  testWidgets('should render Timesheet page', (tester) async {
    await tester.pumpApp(
      MaterialApp(
        home: TimesheetDetailsPage(
          datum: await getTestSheetModel(),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.byType(TimesheetDetailsPage), findsOneWidget);
  });

  testWidgets('should render empty timesheet', (tester) async {
    await tester.pumpApp(
      const MaterialApp(
        home: TimesheetDetailsPage(
          datum: ListWeeklySummaryModel.empty,
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.byType(TimesheetDetailsPage), findsOneWidget);
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
