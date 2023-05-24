import 'package:api_service/api_service.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nextminute/features/menu/main_menu/bloc/main_menu_bloc.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/sub_menus/add_job/sub_menus/generic_cubits/job_status_cubit.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/sub_menus/add_job/sub_menus/generic_edit_screen/generic_items_page.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/sub_menus/add_job/sub_menus/job_generic_state.dart';
import 'package:nextminute/features/utils/generic_status_enum.dart';
import 'package:nm_repository/nm_repository.dart';

import '../../../../../helpers/helpers.dart';
import '../../../../menu/view/menu_page_test.dart';

class MockNMRepository extends Mock implements NMRepositoryImpl {}

class MockFPWCubit extends MockCubit<JobGenericState<FStatusModel>>
    implements JobStatusCubit {}

void main() {
  late NMRepositoryImpl nmRepositoryImpl;
  late JobStatusCubit jCubit;
  late MainMenuBloc mainMenuBloc;
  late List<FStatusModel> jobs;

  setUpAll(() async {
    nmRepositoryImpl = MockNMRepository();
    jCubit = MockFPWCubit();
    mainMenuBloc = MockMainMenuBloc();

    final jsonResponse = await Helper.readJson(
      'test/data/job_status_data.json',
    );

    final res = List<Map<String, dynamic>>.from(
      jsonResponse['data'] as Iterable<dynamic>,
    );

    jobs = res.map(FStatusModel.fromJson).toList();
  });

  setUp(() async {
    await Helper.initHive();

    when(() => nmRepositoryImpl.getJobStatusFilterList()).thenAnswer(
      (_) async => const Right([
        FStatusModel(
          id: 1,
          name: 'In Progress',
          color: '#FFFF00',
        ),
      ]),
    );

    when(() => mainMenuBloc.state).thenReturn(
      const MainMenuState(
        userPermissions: UserPermissionsModel(
          subscriptions: [
            Subscription(
              is_admin: true,
            )
          ],
        ),
      ),
    );
  });

  testWidgets('should render JobStatusPage with data', (tester) async {
    when(() => jCubit.state).thenReturn(
      JobGenericState<FStatusModel>(
        status: GenericRequestStatusEnum.success,
        items: jobs,
      ),
    );

    whenListen(
      jCubit,
      Stream.fromIterable([
        const JobGenericState<FStatusModel>(
          status: GenericRequestStatusEnum.loading,
        ),
        JobGenericState<FStatusModel>(
          status: GenericRequestStatusEnum.success,
          items: jobs,
        ),
      ]),
    );

    await tester.pumpApp(
      RepositoryProvider.value(
        value: nmRepositoryImpl,
        child: MultiBlocProvider(
          providers: [
            BlocProvider<JobStatusCubit>(
              create: (_) => JobStatusCubit(
                nmRepositoryImpl: nmRepositoryImpl,
              ),
            ),
            BlocProvider<MainMenuBloc>(
              create: (context) => mainMenuBloc,
            ),
          ],
          child: const MaterialApp(
            home: GenericItemsPage<JobStatusCubit,
                JobGenericState<FStatusModel>, FStatusModel>(),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    final editButton = find.byKey(const Key('__editButton__'));
    expect(editButton, findsOneWidget);
  });
}
