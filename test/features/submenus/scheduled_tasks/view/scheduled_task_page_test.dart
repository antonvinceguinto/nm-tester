import 'package:api_service/api_service.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nextminute/features/menu/main_menu/bloc/main_menu_bloc.dart';
import 'package:nextminute/features/menu/sub_menus/sub_menus.dart';
import 'package:nextminute/features/wigdets/nm_search_field.dart';
import 'package:nm_repository/nm_repository.dart';

import '../../../../helpers/helpers.dart';
import '../../../tab_manager/expired_subscription/expired_subscription_page_test.dart';

class MockMainMenuBloc extends MockBloc<MainMenuEvent, MainMenuState>
    implements MainMenuBloc {}

class MockScheduledTaskBloc
    extends MockBloc<ScheduledTaskEvent, ScheduledTaskState>
    implements ScheduledTaskBloc {}

class MockSharedPrefs extends Mock implements SharedPrefs {}

class MockTaskStatusBloc extends MockBloc<TaskEvent, TaskStatusState>
    implements TaskStatusBloc {}

class MockTaskFilterBloc extends MockBloc<TaskFilterEvent, TaskFilterState>
    implements TaskFilterBloc {}

class MockJobsFilterCubit extends MockCubit<JobsFilterState>
    implements JobsFilterCubit {}

void main() {
  late NMRepositoryImpl nmRepositoryImpl;
  late MainMenuBloc mainMenuBloc;
  late ScheduledTaskBloc scheduledTaskBloc;
  late SharedPrefs sharedPrefs;
  late TaskStatusBloc taskStatusBloc;
  late TaskFilterBloc taskFilterBloc;
  late JobsFilterCubit jobsFilterCubit;

  setUp(() async {
    await Helper.initHive();

    nmRepositoryImpl = MockNMRepositoryImpl();
    mainMenuBloc = MockMainMenuBloc();
    scheduledTaskBloc = MockScheduledTaskBloc();
    sharedPrefs = MockSharedPrefs();
    taskStatusBloc = MockTaskStatusBloc();
    taskFilterBloc = MockTaskFilterBloc();
    jobsFilterCubit = MockJobsFilterCubit();
  });

  tearDown(Helper.deleteHiveBoxes);

  testWidgets('Test Task Widget', (WidgetTester tester) async {
    when(() => mainMenuBloc.state).thenReturn(const MainMenuState());
    when(() => scheduledTaskBloc.state).thenReturn(const ScheduledTaskState());
    when(() => sharedPrefs.isTaskSimpleView).thenReturn(true);
    when(() => taskFilterBloc.state).thenReturn(const TaskFilterState());
    when(() => taskStatusBloc.state).thenReturn(const TaskStatusState());
    when(() => jobsFilterCubit.state).thenReturn(const JobsFilterState());
    when(() => nmRepositoryImpl.getTaskStatuses()).thenAnswer(
      (_) async => const Right(<TaskStatusModel>[]),
    );

    await tester.pumpApp(
      RepositoryProvider.value(
        value: nmRepositoryImpl,
        child: MultiBlocProvider(
          providers: [
            BlocProvider<MainMenuBloc>.value(value: mainMenuBloc),
            BlocProvider<ScheduledTaskBloc>.value(value: scheduledTaskBloc),
            BlocProvider<TaskStatusBloc>.value(value: taskStatusBloc),
            BlocProvider<TaskFilterBloc>.value(value: taskFilterBloc),
            BlocProvider<JobsFilterCubit>.value(value: jobsFilterCubit),
          ],
          child: const MaterialApp(
            home: ScheduledTaskPage(
              isFromMenu: true,
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    // Verify the presence of certain widgets
    expect(find.byType(NMSearchField), findsOneWidget);
    expect(find.byType(STDateSelection), findsOneWidget);

    // Add more tests as per your use case
  });
}
