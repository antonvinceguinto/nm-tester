import 'package:api_service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nextminute/features/menu/main_menu/bloc/main_menu_bloc.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/jobs_page/bloc/index.dart';
import 'package:nextminute/features/tab_manager/cubit/tab_cubit.dart';
import 'package:nextminute/features/tab_manager/view/tab_manager_page.dart';
import 'package:nm_repository/nm_repository.dart';

import '../../../helpers/helpers.dart';
import '../../menu/view/menu_page_test.dart';
import '../../submenus/about/view/version_history_page_test.dart';
import '../../submenus/jobs/bloc/jobs_bloc_test.dart';

class MockSharedPrefs extends Mock implements SharedPrefs {}

void main() {
  group('TabManagerPage', () {
    late MainMenuBloc mainMenuBloc;
    late SharedPrefs sharedPrefs;
    late JobsBloc jobsBloc;
    late NMRepositoryImpl nmRepository;

    setUp(() async {
      TestWidgetsFlutterBinding.ensureInitialized();
      await Helper.initHive();
    });

    setUpAll(() async {
      TestWidgetsFlutterBinding.ensureInitialized();
      mainMenuBloc = MockMainMenuBloc();
      sharedPrefs = MockSharedPrefs();
      jobsBloc = MockJobsBloc();
      nmRepository = MockNMRepositoryImpl();
      SharedPreferences.setMockInitialValues({});
    });

    setUp(() async {
      TestWidgetsFlutterBinding.ensureInitialized();
      await Helper.initHive();

      await sendUserPermissionRequest(nmRepository, mainMenuBloc);
    });

    tearDown(() async {
      await Helper.deleteHiveBoxes();
    });

    Widget createTabManagerPage() => RepositoryProvider(
          create: (context) => RepositoryProvider.value(
            value: nmRepository,
          ),
          child: MultiBlocProvider(
            providers: [
              BlocProvider<IndexCubit>(
                create: (_) => IndexCubit(),
              ),
              BlocProvider<TabCubit>(
                create: (_) => TabCubit(sharedPrefs: sharedPrefs),
              ),
              BlocProvider<MainMenuBloc>(
                create: (_) => mainMenuBloc,
              ),
              BlocProvider<JobsBloc>(
                create: (context) => jobsBloc,
              ),
            ],
            child: const MaterialApp(
              home: Scaffold(
                body: TabManagerView(),
              ),
            ),
          ),
        );

    testWidgets('should render TabManagerView', (tester) async {
      await tester.pumpApp(createTabManagerPage());
      await tester.pumpAndSettle();

      expect(find.byType(TabManagerView), findsOneWidget);
    });

    testWidgets('should tap on timesheet via old menu', (tester) async {
      await tester.pumpApp(createTabManagerPage());
      await tester.pumpAndSettle();

      expect(find.byType(TabManagerView), findsOneWidget);

      final timesheetTile = find.byKey(const Key('Timesheets'));

      expect(timesheetTile, findsOneWidget);
      await tester.tap(timesheetTile);
      await tester.pumpAndSettle();
    });
  });
}
