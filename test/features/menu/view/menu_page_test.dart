import 'package:api_service/api_service.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nextminute/features/menu/main_menu/bloc/main_menu_bloc.dart';
import 'package:nextminute/features/menu/main_menu/view/menu_page.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/jobs_page/bloc/index.dart';
import 'package:nextminute/features/tab_manager/cubit/tab_cubit.dart';
import 'package:nextminute/features/utils/generic_status_enum.dart';
import 'package:nm_repository/nm_repository.dart';
import '../../../../test/helpers/helpers.dart';
import '../../submenus/about/view/version_history_page_test.dart';
import '../../submenus/jobs/bloc/jobs_bloc_test.dart';

class MockMainMenuBloc extends MockBloc<MainMenuEvent, MainMenuState>
    implements MainMenuBloc {}

Map<String, bool> menuVisibility = {
  'TimesheetsVisible': true,
  'JobsVisible': true,
  'BookingsVisible': true,
  'QuotesVisible': true,
  'InvoicesVisible': true,
  'OrdersVisible': true,
  'SupplierInvoicesVisible': true,
  'TemplatesVisible': true,
  'ContactsVisible': true,
  'LivePriceBookVisible': true,
  'SaleItemsVisible': true,
  'DashboardVisible': true,
  'ReportsVisible': true,
  'ActivityLogVisible': true,
  'AdminVisible': true,
};

Future<void> sendUserPermissionRequest(
  NMRepositoryImpl nmRepository,
  MainMenuBloc mainMenuBloc,
) async {
  final permissions = UserPermissionsModel(
    mainMenuVisibility: menuVisibility,
    has_expired_subscriptions: false,
    subscriptions: [
      const Subscription(
        subscription_id: 1,
        permissions: Permissions(
          ActivityLogAccessEnabled: true,
          BookingAccessEnabled: true,
          BookingAddTimesheetEntryEnabled: true,
          BookingCanAcceptReject: true,
          BookingCanComplete: true,
          BookingChargesAllVisible: true,
          BookingChargesEditable: true,
          BookingChargesEnabled: true,
          BookingDataVisibility: 'all',
          BookingEditAddEnabled: true,
          BookingFilesEditable: true,
          BookingFilesEnabled: true,
          BookingNotesEditable: true,
          BookingNotesEnabled: true,
          BookingPhotosEditable: true,
          BookingPhotosEnabled: true,
          BookingScribblesEditable: true,
          BookingScribblesEnabled: true,
          BookingStatusEditable: true,
          BookingsDefaultNavigation: false,
          BookingsNavigationEnabled: true,
          CalendarAccessEnabled: true,
          CalendarDefaultNavigation: false,
          ChargeAccessEnabled: true,
          ChargeBuyPricesEditable: true,
          ChargeBuyPricesVisible: true,
          ChargeEditAddEnabled: true,
          ChargePricingDetailsVisible: true,
          ChargeSellPricesEditable: true,
          ChargeSellPricesVisible: true,
          ChargesDefaultNavigation: false,
          ChargesNavigationEnabled: true,
          ContactAccessEnabled: true,
          ContactEditAddEnabled: true,
          ContactFilesEditable: true,
          ContactFilesEnabled: true,
          ContactNotesEditable: true,
          ContactNotesEnabled: true,
          ContactViewContactDetailsWithin: true,
          ContactsDefaultNavigation: false,
          DashboardAccessEnabled: true,
          InvoiceAccessEnabled: true,
          InvoicesDefaultNavigation: false,
          InvoicesEditable: true,
          InvoicesSendable: true,
          InvoicesSyncable: true,
          JobAccessEnabled: true,
          JobAddTimesheetEntryEnabled: true,
          JobAndBookingCostSummaryVisible: true,
          JobCanAcceptReject: true,
          JobCanComplete: true,
          JobChargesAllVisible: true,
          JobChargesEditable: true,
          JobChargesEnabled: true,
          JobDataVisibility: 'all',
          JobEditAddEnabled: true,
          JobFilesEditable: true,
          JobFilesEnabled: true,
          JobFinancialTotalsVisible: true,
          JobNotesEditable: true,
          JobNotesEnabled: true,
          JobPhotosEditable: true,
          JobPhotosEnabled: true,
          JobPlanningDefaultNavigation: false,
          JobPlanningEnabled: true,
          JobScribblesEditable: true,
          JobScribblesEnabled: true,
          JobSheetsEnabled: true,
          JobStatusEditable: true,
          JobTemplatesEnabled: true,
          JobsDefaultNavigation: false,
          JobsNavigationEnabled: true,
          LivePriceBookAccessEnabled: true,
          OrderAccessEnabled: true,
          OrdersDefaultNavigation: false,
          OrdersEditable: true,
          OrdersSendable: true,
          PaymentsAndCreditNotesEnabled: true,
          QuoteAccessEnabled: true,
          QuotesAcceptable: true,
          QuotesDefaultNavigation: false,
          QuotesEditable: true,
          QuotesSendable: true,
// SIPaymentsAndCreditNotesEnabled
// :
// true,
          SectionCostRevenueVisible: true,
          SupplierInvoiceAccessEnabled: true,
          SupplierInvoicesDefaultNavigation: false,
          SupplierInvoicesEditable: true,
          SupplierInvoicesSendable: true,
          SupplierInvoicesSyncable: true,
          TemplateAccessEnabled: true,
          TemplatesEditable: true,
          TimesheetsAccessEnabled: true,
          TimesheetsCanAccessOtherUsers: true,
          TimesheetsCanChangeBillableStatus: true,
          TimesheetsCanReadOnlyAccessOtherUsers: true,
          TimesheetsDefaultNavigation: false,
          TimesheetsDescriptionMandatoryEnabled: false,
          TimesheetsDurationEntryTypeEnabled: true,
          TimesheetsHideViewJobButtonEnabled: false,
          TimesheetsHideViewTaskButtonEnabled: false,
          UnbilledChargeTotalsVisible: true,
          UserOnlyAccessEnabled: false,
        ),
      )
    ],
  );

  when(() => mainMenuBloc.state).thenReturn(
    MainMenuState(
      status: GenericRequestStatusEnum.success,
      userPermissions: permissions,
      recordCounts: const {
        'JobNonArchived': 39,
        'Template': 3,
        'Contact': 153,
      },
    ),
  );

  whenListen(
    mainMenuBloc,
    Stream.fromIterable([
      const MainMenuState(),
      MainMenuState(
        status: GenericRequestStatusEnum.success,
        userPermissions: permissions,
        recordCounts: const {
          'JobNonArchived': 39,
          'Template': 3,
          'Contact': 153,
        },
      ),
    ]),
  );

  await expectLater(
    mainMenuBloc.stream,
    emitsInOrder(
      [
        const MainMenuState(),
        MainMenuState(
          status: GenericRequestStatusEnum.success,
          userPermissions: permissions,
          recordCounts: const {
            'JobNonArchived': 39,
            'Template': 3,
            'Contact': 153,
          },
        ),
      ],
    ),
  );
}

void main() {
  late SharedPrefs sharedPrefs;
  late MainMenuBloc mainMenuBloc;
  late JobsBloc jobsBloc;
  late NMRepositoryImpl nmRepository;

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.setMockInitialValues({});
    final sfInstance = await SharedPreferences.getInstance();
    sharedPrefs = SharedPrefs(sharedPrefs: sfInstance);
    mainMenuBloc = MockMainMenuBloc();
    jobsBloc = MockJobsBloc();
    nmRepository = MockNMRepositoryImpl();
  });

  setUp(() async {
    await Helper.initHive();
    await sendUserPermissionRequest(nmRepository, mainMenuBloc);
  });

  tearDown(Helper.deleteHiveBoxes);

  Widget testableWidget() {
    return RepositoryProvider.value(
      value: sharedPrefs,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<TabCubit>(
            create: (_) => TabCubit(sharedPrefs: sharedPrefs),
          ),
          BlocProvider<MainMenuBloc>(
            create: (context) => mainMenuBloc..add(const MainMenuFetchEvent()),
          ),
          BlocProvider<JobsBloc>(
            create: (context) => jobsBloc..add(const JobsFetchEvent()),
          ),
        ],
        child: const MaterialApp(
          home: Scaffold(
            body: MenuPage(),
          ),
        ),
      ),
    );
  }

  testWidgets('should render MenuPage', (tester) async {
    await tester.pumpApp(testableWidget());

    await tester.pumpAndSettle();

    expect(find.byType(MenuView), findsOneWidget);

    final refreshIndicator =
        find.byKey(const Key('__menu_refresh_indicator__'));

    expect(refreshIndicator, findsOneWidget);

    // Scroll refresh indicator to trigger refresh
    await tester.drag(refreshIndicator, const Offset(0, 200));

    await tester.pumpAndSettle();
  });

  testWidgets('should go to timesheet - old menu', (tester) async {
    await tester.pumpApp(testableWidget());

    await tester.pumpAndSettle();

    expect(find.byType(MenuView), findsOneWidget);

    final menuList = find.byKey(const Key('__menu_list__'));
    final timesheetTile = find.byKey(const Key('Timesheets'));

    await tester.ensureVisible(menuList);
    expect(menuList, findsOneWidget);

    expect(timesheetTile, findsOneWidget);
    await tester.tap(timesheetTile);
    await tester.pumpAndSettle();
  });

  testWidgets('should go to jobs page', (tester) async {
    await tester.pumpApp(
      testableWidget(),
    );
    await tester.pumpAndSettle();
    expect(find.byType(MenuView), findsOneWidget);

    final menuList = find.byKey(const Key('__menu_list__'));
    final tile = find.byKey(const Key('Jobs'));

    await tester.ensureVisible(menuList);
    expect(menuList, findsOneWidget);

    expect(tile, findsOneWidget);
    await tester.tap(tile);
    await tester.pumpAndSettle();
  });

  testWidgets('should go to User profile page', (tester) async {
    await tester.pumpApp(
      testableWidget(),
    );
    await tester.pumpAndSettle();
    expect(find.byType(MenuView), findsOneWidget);

    final menuList = find.byKey(const Key('__menu_list__'));

    expect(menuList, findsOneWidget);
    await tester.ensureVisible(menuList);
    await tester.drag(menuList, const Offset(0, -500));
    await tester.pumpAndSettle();

    final tile = find.byKey(const Key('User Profile'));
    expect(tile, findsOneWidget);
    await tester.ensureVisible(tile);

    await tester.tap(tile);
    await tester.pumpAndSettle();
  });

  testWidgets('should go to about page', (tester) async {
    await tester.pumpApp(
      testableWidget(),
    );
    await tester.pumpAndSettle();

    final menuList = find.byKey(const Key('__menu_list__'));
    expect(menuList, findsOneWidget);
    await tester.ensureVisible(menuList);
    await tester.drag(menuList, const Offset(0, -500));
    await tester.pumpAndSettle();

    final tile = find.byKey(const Key('About'));
    expect(tile, findsOneWidget);
    await tester.ensureVisible(tile);

    expect(tile, findsOneWidget);
    await tester.tap(tile);
    await tester.pumpAndSettle();
  });

  testWidgets('should logout', (tester) async {
    await tester.pumpApp(testableWidget());
    await tester.pumpAndSettle();

    expect(find.byType(MenuView), findsOneWidget);

    final menuList = find.byKey(const Key('__menu_list__'));
    final logoutTile = find.byKey(const Key('Logout'));

    await tester.ensureVisible(menuList);
    expect(menuList, findsOneWidget);

    // Drag till bottom and find logout tile
    await tester.dragUntilVisible(
      logoutTile, // what you want to find
      menuList,
      const Offset(0, 500),
      duration: const Duration(seconds: 2),
    );
    await tester.pump();

    expect(logoutTile, findsOneWidget);

    // Simulate tap on logout tile
    await tester.tap(logoutTile);
    await tester.pumpAndSettle();

    // Should show the logout dialog after tapping on logout tile`
    final alertDialog = find.byType(AlertDialog);
    expect(alertDialog, findsOneWidget);

    // final logoutButton = find.descendant(
    //   of: alertDialog,
    //   matching: find.text('Logout'),
    // );

    // expect(
    //   logoutButton,
    //   findsOneWidget,
    // );

    // // Simulate tap on logout button
    // await tester.tap(logoutButton);
    // await tester.pumpAndSettle();
  });

  testWidgets('should render gridview menu', (tester) async {
    sharedPrefs.isNewMenu = true;

    await tester.pumpApp(testableWidget());
    await tester.pumpAndSettle();

    expect(find.byType(GridView), findsOneWidget);
  });
}
