import 'package:api_service/api_service.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nextminute/features/menu/main_menu/bloc/main_menu_bloc.dart';
import 'package:nextminute/features/menu/sub_menus/sub_menus.dart';
import 'package:nextminute/features/utils/generic_status_enum.dart';
import 'package:nm_repository/nm_repository.dart';

import '../../../../../helpers/helpers.dart';
import '../../../../menu/view/menu_page_test.dart';

class MockJobStatusCubit extends MockCubit<JobGenericState<FStatusModel>>
    implements JobStatusCubit {}

class MockJobTypeCubit extends MockCubit<JobGenericState<FTypeModel>>
    implements JobTypeCubit {}

class MockPricingTypeCubit extends MockCubit<JobGenericState<FPricingTypeModel>>
    implements PricingTypeCubit {}

class MockPriorityCubit extends MockCubit<JobGenericState<FPriorityModel>>
    implements PriorityCubit {}

class MockNMRepository extends Mock implements NMRepositoryImpl {}

class MockJobsFilterCubit extends MockCubit<JobsFilterState>
    implements JobsFilterCubit {}

class MockAddJobBloc extends MockBloc<AddJobEvent, AddJobState>
    implements AddJobBloc {}

void main() {
  group('AddJobPage', () {
    late NMRepositoryImpl nmRepositoryImpl;
    late JobStatusCubit jobStatusCubit;
    late JobTypeCubit jobTypeCubit;
    late PricingTypeCubit pricingTypeCubit;
    late PriorityCubit priorityCubit;
    late JobsFilterCubit jobsFilterCubit;
    late AddJobBloc addJobBloc;
    late MainMenuBloc mainMenuBloc;

    Widget makeTestableWidget() {
      return MaterialApp(
        home: RepositoryProvider.value(
          value: nmRepositoryImpl,
          child: MultiBlocProvider(
            providers: [
              BlocProvider<AddJobBloc>(
                create: (_) => addJobBloc,
              ),
              BlocProvider<JobsFilterCubit>(
                create: (_) => jobsFilterCubit,
              ),
              BlocProvider<JobStatusCubit>(
                create: (_) => jobStatusCubit,
              ),
              BlocProvider<JobTypeCubit>(
                create: (_) => jobTypeCubit,
              ),
              BlocProvider<PricingTypeCubit>(
                create: (_) => pricingTypeCubit,
              ),
              BlocProvider<PriorityCubit>(
                create: (_) => priorityCubit,
              ),
              BlocProvider<MainMenuBloc>(
                create: (_) => mainMenuBloc,
              ),
            ],
            child: const AddJobPage(),
          ),
        ),
      );
    }

    void addTaskAndCustomer({bool isEmpty = false}) {
      when(() => addJobBloc.state).thenReturn(
        isEmpty
            ? const AddJobState(
                status: GenericRequestStatusEnum.success,
              )
            : AddJobState(
                status: GenericRequestStatusEnum.success,
                selectedTask: TaskInfoLevelModel(
                  book_id: 1,
                  book_summary: 'book_summary',
                  book_start: DateTime(2021),
                  book_end: DateTime(2021),
                ),
              ),
      );
      when(() => jobsFilterCubit.state).thenReturn(
        isEmpty
            ? const JobsFilterState()
            : const JobsFilterState(
                status: GenericRequestStatusEnum.success,
                selectedCustomers: [
                  CustomerDatum(
                    contact_id: 1,
                    contact_name_business: 'contact_name_business',
                    contact_name_display: 'contact_name_display',
                  ),
                ],
                selectedAssignedTos: [
                  CustomerDatum(
                    contact_id: 1,
                    contact_name_business: 'contact_name_business',
                    contact_name_display: 'contact_name_display',
                  ),
                ],
              ),
      );
    }

    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();
      nmRepositoryImpl = MockNMRepository();
      jobStatusCubit = MockJobStatusCubit();
      jobTypeCubit = MockJobTypeCubit();
      pricingTypeCubit = MockPricingTypeCubit();
      priorityCubit = MockPriorityCubit();
      jobsFilterCubit = MockJobsFilterCubit();
      addJobBloc = MockAddJobBloc();
      mainMenuBloc = MockMainMenuBloc();
    });

    setUp(() async {
      await Helper.initHive();

      await sendUserPermissionRequest(nmRepositoryImpl, mainMenuBloc);

      when(() => jobStatusCubit.fetchItems()).thenAnswer((_) async => () {});
      when(() => jobTypeCubit.fetchItems()).thenAnswer((_) async => () {});
      when(() => pricingTypeCubit.fetchItems()).thenAnswer((_) async => () {});
      when(() => priorityCubit.fetchItems()).thenAnswer((_) async => () {});

      when(() => jobStatusCubit.state).thenReturn(
        const JobGenericState(
          status: GenericRequestStatusEnum.success,
          items: [
            FStatusModel(
              id: 1,
              name: 'name',
              color: 'color',
            ),
          ],
        ),
      );
      when(() => jobTypeCubit.state).thenReturn(
        const JobGenericState(
          status: GenericRequestStatusEnum.success,
          items: [
            FTypeModel(
              id: 1,
              name: 'name',
              color: 'color',
            ),
          ],
        ),
      );
      when(() => pricingTypeCubit.state).thenReturn(
        const JobGenericState(
          status: GenericRequestStatusEnum.success,
          items: [
            FPricingTypeModel(
              id: 1,
              name: 'name',
              color: 'color',
            ),
          ],
        ),
      );
      when(() => priorityCubit.state).thenReturn(
        const JobGenericState(
          status: GenericRequestStatusEnum.success,
          items: [
            FPriorityModel(
              id: 1,
              name: 'name',
              color: 'color',
            ),
          ],
        ),
      );
    });

    testWidgets('should render AddJobPage', (tester) async {
      addTaskAndCustomer();
      final nav = GlobalKey<NavigatorState>();

      await tester.pumpApp(
        MaterialApp(
          navigatorKey: nav,
          home: makeTestableWidget(),
        ),
      );

      await tester.pumpAndSettle();
      expect(find.byType(AddJobPage), findsOneWidget);

      final selectCustomerTile = find.byKey(
        const Key('__select_customer__'),
      );

      expect(selectCustomerTile, findsOneWidget);

      await tester.ensureVisible(selectCustomerTile);

      await tester.tap(selectCustomerTile);
      await tester.pumpAndSettle();

      // const page = MaterialPage<void>(child: CustomerDetailsPage(id: 1));
      // await nav.currentState!.push<void>(page.
      // createRoute(nav.currentContext!));
      // await tester.pumpAndSettle();

      // expect(nav.currentState?.canPop(), true);
      // nav.currentState?.pop('add_job_customer');
      // await tester.pumpAndSettle();
    });

    testWidgets('should clear selected customers', (tester) async {
      addTaskAndCustomer();

      await tester.pumpApp(makeTestableWidget());

      await tester.pumpAndSettle();
      expect(find.byType(AddJobPage), findsOneWidget);

      final clearCustButton = find.byKey(
        const Key('__clear_customer_button__'),
      );

      expect(clearCustButton, findsOneWidget);

      await tester.ensureVisible(clearCustButton);

      await tester.tap(clearCustButton);
      await tester.pumpAndSettle();

      final clearAssignedButton = find.byKey(
        const Key('__clear_assigned_button__'),
      );

      expect(clearAssignedButton, findsOneWidget);

      await tester.ensureVisible(clearAssignedButton);

      await tester.tap(clearAssignedButton);
      await tester.pumpAndSettle();
    });

    testWidgets('should render no task and customer/assgined to selected',
        (tester) async {
      addTaskAndCustomer(isEmpty: true);

      await tester.pumpApp(makeTestableWidget());

      await tester.pumpAndSettle();
      expect(find.byType(AddJobPage), findsOneWidget);

      final selectCustomerTile = find.byKey(
        const Key('__select_customer__'),
      );

      expect(selectCustomerTile, findsOneWidget);

      await tester.ensureVisible(selectCustomerTile);

      await tester.tap(selectCustomerTile);
      await tester.pumpAndSettle();
    });

    testWidgets('should save job', (tester) async {
      addTaskAndCustomer();

      await tester.pumpApp(makeTestableWidget());

      await tester.pumpAndSettle();
      expect(find.byType(AddJobPage), findsOneWidget);

      final titleField = find.byKey(
        const Key('add_job_title_field'),
      );
      expect(titleField, findsOneWidget);

      await tester.enterText(titleField, 'title');

      // final smsToggle = find.byKey(
      //   const Key('smsToggle'),
      // );

      // expect(smsToggle, findsOneWidget);
      // await tester.ensureVisible(smsToggle);
      // await tester.tap(smsToggle);

      final addJobSaveButton = find.byKey(
        const Key('add_job_save_button'),
      );

      expect(addJobSaveButton, findsOneWidget);

      await tester.ensureVisible(addJobSaveButton);

      await tester.tap(addJobSaveButton);
      await tester.pumpAndSettle();
    });
  });
}
