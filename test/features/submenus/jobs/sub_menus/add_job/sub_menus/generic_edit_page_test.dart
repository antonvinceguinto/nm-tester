import 'package:api_service/api_service.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/sub_menus/add_job/sub_menus/generic_edit_screen/generic_edit_page.dart';
import 'package:nextminute/features/menu/sub_menus/sub_menus.dart';
import 'package:nextminute/features/utils/generic_status_enum.dart';
import 'package:nm_repository/nm_repository.dart';

import '../../../../../../helpers/helpers.dart';

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

void main() {
  group('AddJobPage', () {
    late NMRepositoryImpl nmRepositoryImpl;
    late JobStatusCubit jobStatusCubit;
    late JobTypeCubit jobTypeCubit;
    late PricingTypeCubit pricingTypeCubit;
    late PriorityCubit priorityCubit;
    late JobsFilterCubit jobsFilterCubit;

    Widget makeTestableWidget<C extends StateStreamable<S>, S, T>() {
      return MaterialApp(
        home: RepositoryProvider.value(
          value: nmRepositoryImpl,
          child: MultiBlocProvider(
            providers: [
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
            ],
            child: GenericEditPage<C, S, T>(),
          ),
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
    });

    setUp(() async {
      await Helper.initHive();

      when(() => jobStatusCubit.fetchItems()).thenAnswer((_) async => () {});
      when(() => jobStatusCubit.updateitems()).thenAnswer((_) async => () {});

      when(() => jobTypeCubit.fetchItems()).thenAnswer((_) async => () {});
      when(() => jobTypeCubit.updateitems()).thenAnswer((_) async => () {});

      when(() => pricingTypeCubit.fetchItems()).thenAnswer((_) async => () {});
      when(() => pricingTypeCubit.updateitems()).thenAnswer((_) async => () {});

      when(() => priorityCubit.fetchItems()).thenAnswer((_) async => () {});
      when(() => priorityCubit.updateitems()).thenAnswer((_) async => () {});

      when(() => jobStatusCubit.state).thenReturn(
        const JobGenericState(
          status: GenericRequestStatusEnum.success,
          items: [
            FStatusModel(
              id: 1,
              name: 'name',
              color: '#FFFFFF',
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
              color: '#FFFFFF',
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
              color: '#FFFFFF',
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
              color: '#FFFFFF',
            ),
          ],
        ),
      );

      expect(jobStatusCubit.state, isA<JobGenericState<FStatusModel>>());
    });

    testWidgets('should render GenericEditPage', (tester) async {
      await tester.pumpApp(
        makeTestableWidget<JobStatusCubit, JobGenericState<FStatusModel>,
            FStatusModel>(),
      );
      await tester.pumpAndSettle();
      final saveButton = find.byKey(const Key('saveButton'));

      expect(saveButton, findsOneWidget);
      await tester.tap(saveButton);
      await tester.pumpAndSettle();
    });
  });
}
