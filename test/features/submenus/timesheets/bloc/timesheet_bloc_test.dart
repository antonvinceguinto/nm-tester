import 'package:api_service/api_service.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nextminute/core/utils/extensions.dart';
import 'package:nextminute/features/menu/sub_menus/timesheet/bloc/timesheet_bloc.dart';
import 'package:nextminute/features/utils/generic_status_enum.dart';
import 'package:nm_repository/nm_repository.dart';

import '../../../../helpers/helpers.dart';

class MockTimesheetWeeklyBloc
    extends MockBloc<TimesheetEvent, TimesheetWeeklyState>
    implements TimesheetWeeklyBloc {}

class TimesheetWeeklyStateFake extends Fake implements TimesheetWeeklyState {}

class TimesheetEventFake extends Fake implements TimesheetEvent {}

class MockNMRepository extends Mock implements NMRepositoryImpl {}

void main() {
  late NMRepositoryImpl nmRepositoryImpl;
  late ListWeeklySummaryModel sheetModel;

  late DateTime date;

  setUpAll(() {
    registerFallbackValue(TimesheetWeeklyStateFake());
    registerFallbackValue(TimesheetEventFake());
  });

  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    nmRepositoryImpl = MockNMRepository();
    date = DateTime.now().getSundayThisWeek();

    final jsonResponse = await Helper.readJson(
      'test/data/ts_weekly_data.json',
    );

    final res = List<Map<String, dynamic>>.from(
      jsonResponse['data'] as Iterable<dynamic>,
    );

    final data = res.map(WeeklyTimesheetDatum.fromJson).toList();

    sheetModel = ListWeeklySummaryModel(
      data: data,
    );
  });

  blocTest<TimesheetWeeklyBloc, TimesheetWeeklyState>(
    'emits [Loading, Success] when TimesheetFetchEvent() is called',
    setUp: () {
      when(() => nmRepositoryImpl.getSheetWeeklyResults(date))
          .thenAnswer((_) async => Right(sheetModel));
    },
    build: () => TimesheetWeeklyBloc(nmRepositoryImpl: nmRepositoryImpl),
    act: (bloc) => bloc.add(TimesheetFetchEvent(date)),
    wait: const Duration(milliseconds: 500),
    expect: () => <TimesheetWeeklyState>[
      const TimesheetWeeklyState(status: GenericRequestStatusEnum.loading),
      TimesheetWeeklyState(
        status: GenericRequestStatusEnum.success,
        sheetWeeklyModel: sheetModel,
      ),
    ],
  );

  blocTest<TimesheetWeeklyBloc, TimesheetWeeklyState>(
    'emits [Error] when TimesheetFetchEvent() is called',
    setUp: () {
      when(() => nmRepositoryImpl.getSheetWeeklyResults(date))
          .thenAnswer((_) async => Left(Exception('error')));
    },
    build: () => TimesheetWeeklyBloc(nmRepositoryImpl: nmRepositoryImpl),
    act: (bloc) => bloc.add(TimesheetFetchEvent(date)),
    expect: () => <TimesheetWeeklyState>[
      const TimesheetWeeklyState(status: GenericRequestStatusEnum.loading),
      const TimesheetWeeklyState(
        status: GenericRequestStatusEnum.error,
        errorMessage: 'Exception: error',
      ),
    ],
  );
}
