import 'package:api_service/api_service.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nextminute/features/menu/sub_menus/customer/assignee/cubit/assignee_filter_cubit.dart';
import 'package:nextminute/features/menu/sub_menus/customer/assignee/view/assignee_filter_page.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/sub_menus/job_filters/cubit/jobs_filter_cubit.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/sub_menus/job_filters/wigdets/jobs_toggle_filter_item.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/widgets/selection_filter_expansion_item.dart';
import 'package:nm_repository/nm_repository.dart';

import '../../../../helpers/helpers.dart';
import '../../about/view/version_history_page_test.dart';
import '../../jobs/sub_menus/add_job/add_job_page_test.dart';

class MockAssigneeFilterCubit extends MockCubit<AssigneeFilterState>
    implements AssigneeFilterCubit {}

void main() {
  group('AssigneeFilterView', () {
    late AssigneeFilterCubit assigneeFilterCubit;
    late JobsFilterCubit jobsFilterCubit;
    late NMRepositoryImpl nmRepositoryImpl;

    setUpAll(() {
      nmRepositoryImpl = MockNMRepositoryImpl();
      jobsFilterCubit = MockJobsFilterCubit();
      assigneeFilterCubit = MockAssigneeFilterCubit();
    });

    setUp(() {
      when(() => assigneeFilterCubit.fetchUserRoles())
          .thenAnswer((_) async => () {});

      when(() => nmRepositoryImpl.getContactTypes()).thenAnswer(
        (_) async => const Right([
          ContactTypeModel(
            contacttype_id: 1,
            contacttype_name: 'Test',
          )
        ]),
      );

      // when(() => nmRepositoryImpl.getUserRoles()).thenAnswer(
      //   (_) async => const Right([
      //     UserRoleModel(
      //       subrole_id: 1,
      //       subrole_name: 'Test',
      //     )
      //   ]),
      // );

      when(() => assigneeFilterCubit.state).thenReturn(
        const AssigneeFilterState(
          contactTypes: [
            ContactTypeModel(
              contacttype_id: 1,
              contacttype_name: 'Test',
            )
          ],
          selectedContactTypes: [
            ContactTypeModel(
              contacttype_id: 1,
              contacttype_name: 'Test',
            )
          ],
          userRoles: [
            UserRoleModel(
              subrole_id: 1,
              subrole_name: 'Test',
            )
          ],
        ),
      );

      when(() => jobsFilterCubit.state).thenReturn(
        const JobsFilterState(),
      );
    });

    testWidgets('should show correct elements', (WidgetTester tester) async {
      await tester.pumpApp(
        RepositoryProvider.value(
          value: nmRepositoryImpl,
          child: MultiBlocProvider(
            providers: [
              BlocProvider<AssigneeFilterCubit>(
                create: (_) => assigneeFilterCubit,
              ),
              BlocProvider<JobsFilterCubit>(
                create: (_) => jobsFilterCubit,
              ),
            ],
            child: const MaterialApp(
              home: Scaffold(
                body: AssigneeFilterPage(),
              ),
            ),
          ),
        ),
      );

      // Check if the app bar has the correct title
      expect(find.text('Filter Assignee'), findsOneWidget);

      // Check if Exclude Archived Contacts toggle filter item is present
      expect(
        find.byWidgetPredicate((widget) {
          if (widget is JobsToggleFilterItem) {
            return widget.label == 'Exclude Archived Contacts';
          }
          return false;
        }),
        findsOneWidget,
      );

      // Check if Exclude Disabled Users toggle filter item is present
      expect(
        find.byWidgetPredicate((widget) {
          if (widget is JobsToggleFilterItem) {
            return widget.label == 'Exclude Disabled Users';
          }
          return false;
        }),
        findsOneWidget,
      );

      // Check if User Roles selection filter expansion item is present
      expect(
        find.byWidgetPredicate((widget) {
          if (widget is SelectionFilterExpansionItem) {
            return widget.label == 'User Roles';
          }
          return false;
        }),
        findsOneWidget,
      );

      // Check if Contact Types selection filter expansion item is present
      expect(
        find.byWidgetPredicate((widget) {
          if (widget is SelectionFilterExpansionItem) {
            return widget.label == 'Contact Types';
          }
          return false;
        }),
        findsOneWidget,
      );

      // Check if Include Deleted toggle filter item is present
      expect(
        find.byWidgetPredicate((widget) {
          if (widget is JobsToggleFilterItem) {
            return widget.label == 'Include Deleted';
          }
          return false;
        }),
        findsOneWidget,
      );

      // Check if Apply button is present in the app bar
      expect(find.text('Apply'), findsOneWidget);
    });
  });
}
