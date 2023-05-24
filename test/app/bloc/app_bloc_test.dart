import 'dart:io';

import 'package:api_service/api_service.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nextminute/app/bloc/app_bloc.dart';
import 'package:nextminute/core/utils/enums.dart';

class MockAppBloc extends MockBloc<AppEvent, AppState> implements AppBloc {}

void main() {
  late SharedPreferences sfInstance;
  late SharedPrefs sharedPrefs;

  late Box<JobsListModel> box;
  late Box<bool> box2;

  Future<void> initBoxes() async {
    final temp = await Directory.systemTemp.createTemp();
    Hive.init(temp.path);
    box = await Hive.openBox<JobsListModel>(BoxType.boxJobsList.name());
    await box.clear();

    box2 = await Hive.openBox<bool>(BoxType.boxDarkMode.name());
    await box2.clear();
  }

  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.setMockInitialValues({});
    sfInstance = await SharedPreferences.getInstance();
    sharedPrefs = SharedPrefs(sharedPrefs: sfInstance);

    await initBoxes();
  });

  tearDown(() async {
    await box.deleteFromDisk();
    await box2.deleteFromDisk();
  });

  blocTest<AppBloc, AppState>(
    'emits [AppStatus.unauthenticated] state',
    build: () => AppBloc(sharedPrefs: sharedPrefs),
    act: (bloc) => bloc.add(
      AppLogoutRequested(
        AppStatus.unauthenticated,
        sharedPrefs,
      ),
    ),
    wait: const Duration(milliseconds: 500),
    expect: () => <AppState>[
      const AppState.unauthenticated(),
    ],
  );

  blocTest<AppBloc, AppState>(
    'emits [AppStatus.temporarilyAuthenticated] state',
    setUp: () {
      // appBloc = AppBloc(sharedPrefs: sharedPrefs);
      sharedPrefs.authStatus = AppStatus.temporarilyAuthenticated.name;
    },
    build: () => AppBloc(sharedPrefs: sharedPrefs),
    act: (bloc) => bloc.add(
      AppLogoutRequested(
        AppStatus.temporarilyAuthenticated,
        sharedPrefs,
      ),
    ),
    wait: const Duration(milliseconds: 500),
    expect: () => <AppState>[
      const AppState.temporarilyAuthenticated(),
    ],
  );

  // blocTest<TimesheetWeeklyBloc, TimesheetWeeklyState>(
  //   'emits [Error] when TimesheetFetchEvent() is called',
  //   build: () => TimesheetWeeklyBloc(nmRepositoryImpl: nmRepositoryImpl),
  //   act: (bloc) => bloc.add(TimesheetFetchEvent(date)),
  //   expect: () => <TimesheetWeeklyState>[
  //     const TimesheetWeeklyState(status: GenericRequestStatusEnum.loading),
  //     const TimesheetWeeklyState(status: GenericRequestStatusEnum.error),
  //   ],
  // );
}
