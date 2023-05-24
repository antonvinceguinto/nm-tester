import 'package:api_service/api_service.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nextminute/features/menu/main_menu/bloc/main_menu_bloc.dart';
import 'package:nextminute/features/menu/sub_menus/customer/assignee/cubit/assignee_filter_cubit.dart';
import 'package:nextminute/features/menu/sub_menus/customer/customer/blocs/select_c_bloc/select_customer_bloc.dart';
import 'package:nextminute/features/menu/sub_menus/customer/customer/contact_type/bloc/contact_types_bloc.dart';
import 'package:nextminute/features/menu/sub_menus/sub_menus.dart';
import 'package:nextminute/features/utils/generic_status_enum.dart';
import 'package:nextminute/features/wigdets/bottom_action_panel/nm_bottom_action_button.dart';
import 'package:nextminute/features/wigdets/nm_widgets.dart';
import 'package:nm_repository/nm_repository.dart';

import '../../../../helpers/helpers.dart';
import '../../../menu/view/menu_page_test.dart';
import '../../../tab_manager/expired_subscription/expired_subscription_page_test.dart';
import 'assignee_filter_page_test.dart';

class MockSelectCustomerBloc
    extends MockBloc<SelectCustomerEvent, SelectCustomerState>
    implements SelectCustomerBloc {}

class MockJobsFilterCubit extends Mock implements JobsFilterCubit {}

class MockContactTypesBloc extends Mock implements ContactTypesBloc {}

void main() {
  group('JobsAssignCustomerPage', () {
    late NMRepositoryImpl nmRepositoryImpl;

    late SelectCustomerBloc selectCustomerBloc;
    late AssigneeFilterCubit assigneeFilterCubit;
    late JobsFilterCubit jobsFilterCubit;
    late ContactTypesBloc contactTypesBloc;
    late MainMenuBloc mainMenuBloc;

    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();
      nmRepositoryImpl = MockNMRepositoryImpl();
      selectCustomerBloc = MockSelectCustomerBloc();
      assigneeFilterCubit = MockAssigneeFilterCubit();
      jobsFilterCubit = MockJobsFilterCubit();
      contactTypesBloc = MockContactTypesBloc();
      mainMenuBloc = MockMainMenuBloc();
    });

    Future<void> initData({bool isCreatedBy = false}) async {
      when(
        () => nmRepositoryImpl.getCustomerList(
          1,
          isCustomer: false,
          isUser: false,
          isSite: false,
          isSupplier: false,
        ),
      ).thenAnswer(
        (_) async => const Right(
          CustomerModel(
            total: 3,
            total_all: 3,
            data: [
              CustomerDatum(
                contact_id: 1,
                contact_name_display: 'Anton',
              )
            ],
          ),
        ),
      );

      when(() => selectCustomerBloc.state).thenReturn(
        const SelectCustomerState(
          status: GenericRequestStatusEnum.success,
          customerModel: CustomerModel(
            total: 3,
            total_all: 3,
            data: [
              CustomerDatum(
                contact_id: 1,
                contact_name_display: 'Anton',
              )
            ],
          ),
          customerList: [
            CustomerDatum(
              contact_id: 1,
              contact_name_display: 'Anton',
            )
          ],
        ),
      );
    }

    setUp(() async {
      await Helper.initHive();

      final contTypes = [
        const ContactTypeModel(
          contacttype_id: 1,
          contacttype_name: 'site',
        ),
        const ContactTypeModel(
          contacttype_id: 2,
          contacttype_name: 'customer',
        ),
        const ContactTypeModel(
          contacttype_id: 3,
          contacttype_name: 'supplier',
        )
      ];

      when(() => assigneeFilterCubit.fetchUserRoles())
          .thenAnswer((_) async => () {});

      when(() => nmRepositoryImpl.getContactTypes()).thenAnswer(
        (_) async => Right(contTypes),
      );

      when(() => assigneeFilterCubit.state).thenReturn(
        AssigneeFilterState(
          contactTypes: contTypes,
          selectedContactTypes: const [
            ContactTypeModel(
              contacttype_id: 1,
              contacttype_name: 'customer',
            )
          ],
        ),
      );

      when(() => mainMenuBloc.state).thenReturn(
        MainMenuState(
          status: GenericRequestStatusEnum.success,
          userPermissions: UserPermissionsModel(
            mainMenuVisibility: menuVisibility,
          ),
        ),
      );
    });

    Widget makeTestableWidget({bool isFromMenu = false}) {
      return RepositoryProvider.value(
        value: nmRepositoryImpl,
        child: MultiBlocProvider(
          providers: [
            BlocProvider<SelectCustomerBloc>.value(value: selectCustomerBloc),
            BlocProvider<AssigneeFilterCubit>.value(value: assigneeFilterCubit),
            BlocProvider<JobsFilterCubit>.value(value: jobsFilterCubit),
            BlocProvider<ContactTypesBloc>.value(value: contactTypesBloc),
            BlocProvider<MainMenuBloc>.value(value: mainMenuBloc),
          ],
          child: MaterialApp(
            home: JobsAssignCustomerPage(
              onCustomerSelect: (_) {},
              isFromMenu: isFromMenu,
            ),
          ),
        ),
      );
    }

    testWidgets('renders JobsAssignCustomerView from menu',
        (WidgetTester tester) async {
      await initData();

      await tester.pumpApp(makeTestableWidget(isFromMenu: true));
      await tester.pumpAndSettle();

      expect(find.byType(JobsAssignCustomerView), findsOneWidget);

      final list = find.byKey(const ValueKey('customer_list'));
      await tester.ensureVisible(list);

      expect(list, findsOneWidget);

      // scroll list to the end
      await tester.drag(list, const Offset(0, -800));
      await tester.pumpAndSettle();

      final actions = find.widgetWithText(
        NMBottomActionButton,
        'Actions',
      );
      await tester.ensureVisible(actions);
      expect(actions, findsOneWidget);

      await tester.tap(actions);
      await tester.pumpAndSettle();

      // final actionList = find.byKey(const ValueKey('action_list'));
      // await tester.ensureVisible(actionList);
      // expect(actionList, findsOneWidget);

      // final showOnMap = find.byKey(const Key('show_on_map'));
      // await tester.ensureVisible(showOnMap);
      // expect(showOnMap, findsOneWidget);

      // await tester.tap(showOnMap);
      // await tester.pumpAndSettle();
    });

    testWidgets('taps on popup menu', (tester) async {
      await initData();

      await tester.pumpApp(makeTestableWidget(isFromMenu: true));
      await tester.pumpAndSettle();

      expect(find.byType(JobsAssignCustomerView), findsOneWidget);
      final popupMenu = find.byKey(const ValueKey('popup_menu'));
      await tester.ensureVisible(popupMenu);
      expect(popupMenu, findsOneWidget);

      await tester.tap(popupMenu);
      await tester.pumpAndSettle();

      // final clearFilter = find.byKey(const ValueKey('clear_filter'));
      // await tester.ensureVisible(clearFilter);
      // expect(clearFilter, findsOneWidget);

      // await tester.tap(clearFilter);
      // await tester.pumpAndSettle();
    });

    testWidgets('NMBottomMenuActions widget displays action items',
        (WidgetTester tester) async {
      await initData();

      await tester.pumpApp(makeTestableWidget(isFromMenu: true));
      await tester.pumpAndSettle();

      expect(find.byType(NMBottomMenuActions), findsOneWidget);

      final actionButton = find.text('Actions');
      await tester.ensureVisible(actionButton);
      expect(actionButton, findsOneWidget);
      await tester.tap(actionButton);
      await tester.pumpAndSettle();

      // final actionList = find.byType(NMActionList);

      // final listOfActions = find.descendant(
      //   of: actionList,
      //   matching: find.byType(ListView),
      // );

      // expect(listOfActions, findsOneWidget);

      // expect(find.byType(NMActionItem), findsNWidgets(2));

      // expect(find.byKey(const ValueKey('action_list')), findsOneWidget);
      // final showMapButton = find.byKey(const ValueKey('show_on_map'));
      // await tester.ensureVisible(showMapButton);
      // expect(showMapButton, findsOneWidget);
      // await tester.tap(showMapButton);
      // await tester.pumpAndSettle();
    });

    // testWidgets('renders isCreatedBy', (WidgetTester tester) async {
    //   initState(isCreatedBy: true);

    //   await tester.pumpApp(
    //     RepositoryProvider.value(
    //       value: nmRepositoryImpl,
    //       child: MultiBlocProvider(
    //         providers: [
    //           BlocProvider<SelectCustomerBloc>(
    //             create: (context) => selectCustomerBloc,
    //           ),
    //           BlocProvider<AssigneeFilterCubit>(
    //             create: (context) => assigneeFilterCubit,
    //           ),
    //         ],
    //         child: MaterialApp(
    //           home: JobsAssignCustomerPage(
    //             onCustomerSelect: (_) {},
    //             isOnMenu: true,
    //             isCreatedBy: true,
    //           ),
    //         ),
    //       ),
    //     ),
    //   );
    //   await tester.pumpAndSettle();

    //   expect(find.byType(JobsAssignCustomerView), findsOneWidget);

    //   final list = find.byKey(const ValueKey('customer_list'));
    //   await tester.ensureVisible(list);
    // });
  });
}
