import 'package:api_service/api_service.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nextminute/app/bloc/app_bloc.dart';
import 'package:nextminute/features/menu/main_menu/bloc/main_menu_bloc.dart';
import 'package:nextminute/features/tab_manager/expired_subscription/bloc/expired_subscription_bloc.dart';
import 'package:nextminute/features/tab_manager/expired_subscription/expired_subscription_page.dart';
import 'package:nextminute/features/utils/generic_status_enum.dart';
import 'package:nm_repository/nm_repository.dart';

import '../../../app/bloc/app_bloc_test.dart';
import '../../../helpers/helpers.dart';
import '../../menu/bloc/main_menu_bloc_test.dart';

class MockExpiredSubscriptionBloc extends Mock
    implements ExpiredSubscriptionBloc {}

class MockNMRepositoryImpl extends Mock implements NMRepositoryImpl {}

final userSubs = [
  UserSubscription(
    subscription_id: 1,
    contact_is_access_disabled: false,
    subscription_buy_now_button_text: 'Buy Now',
    subscription_expiration_date: DateTime.now().add(const Duration(days: 20)),
    subscription_has_billing_problem: false,
    subscription_is_buy_now_button_visible: true,
    subscription_is_disabled: false,
    subscription_is_good: true,
    subscription_is_trial: true,
    subscription_public_name: 'Anton',
    subscription_start_date: DateTime.now().subtract(const Duration(days: 1)),
    subscription_status_html: '<p>This trial has now expired.</p>',
    subscription_status_string: 'Trial Expired',
    subscription_type_string: 'Premium Plan - Trial',
  ),
];

const permissions = UserPermissionsModel(
  mainMenuVisibility: {},
  has_expired_subscriptions: false,
  subscriber_name_display: 'Anton',
  subscriptions: [
    Subscription(
      subscription_id: 1,
    ),
  ],
);

void main() {
  group('ExpiredSubscriptionPage', () {
    late ExpiredSubscriptionBloc expiredSubscriptionBloc;
    late NMRepositoryImpl nmRepositoryImpl;
    late MainMenuBloc mainMenuBloc;
    late AppBloc appBloc;
    late SharedPrefs sharedPrefs;

    setUpAll(() async {
      TestWidgetsFlutterBinding.ensureInitialized();
      expiredSubscriptionBloc = MockExpiredSubscriptionBloc();
      nmRepositoryImpl = MockNMRepositoryImpl();
      mainMenuBloc = MockMainMenuBloc();
      appBloc = MockAppBloc();

      SharedPreferences.setMockInitialValues({});
      final sfInstance = await SharedPreferences.getInstance();
      sharedPrefs = SharedPrefs(sharedPrefs: sfInstance);
    });

    Future<void> setupUserSubscription({bool isEmpty = false}) async {
      when(() => nmRepositoryImpl.getUserSubscriptions()).thenAnswer(
        (_) async => Right(isEmpty ? [] : userSubs),
      );

      when(() => expiredSubscriptionBloc.state).thenReturn(
        ExpiredSubscriptionState(
          status: GenericRequestStatusEnum.success,
          userSubscription: isEmpty ? [] : userSubs,
        ),
      );

      whenListen(
        expiredSubscriptionBloc,
        Stream.fromIterable([
          const ExpiredSubscriptionState(),
          ExpiredSubscriptionState(
            status: GenericRequestStatusEnum.success,
            userSubscription: isEmpty ? [] : userSubs,
          ),
        ]),
      );

      await expectLater(
        expiredSubscriptionBloc.stream,
        emitsInOrder(
          [
            const ExpiredSubscriptionState(),
            ExpiredSubscriptionState(
              status: GenericRequestStatusEnum.success,
              userSubscription: isEmpty ? [] : userSubs,
            ),
          ],
        ),
      );
    }

    setUp(() async {
      await Helper.initHive();

      when(() => mainMenuBloc.state).thenReturn(
        const MainMenuState(
          status: GenericRequestStatusEnum.success,
          userPermissions: permissions,
          recordCounts: {
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
          const MainMenuState(
            status: GenericRequestStatusEnum.success,
            userPermissions: permissions,
            recordCounts: {
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
            const MainMenuState(
              status: GenericRequestStatusEnum.success,
              userPermissions: permissions,
              recordCounts: {
                'JobNonArchived': 39,
                'Template': 3,
                'Contact': 153,
              },
            ),
          ],
        ),
      );
    });

    Widget makeTestableWidget() {
      return MultiRepositoryProvider(
        providers: [
          RepositoryProvider.value(
            value: nmRepositoryImpl,
          ),
          RepositoryProvider.value(
            value: sharedPrefs,
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<AppBloc>(create: (_) => appBloc),
            BlocProvider<ExpiredSubscriptionBloc>(
              create: (_) => expiredSubscriptionBloc,
            ),
            BlocProvider<MainMenuBloc>(
              create: (_) => mainMenuBloc,
            ),
          ],
          child: const MaterialApp(
            home: ExpiredSubscriptionPage(),
          ),
        ),
      );
    }

    testWidgets('renders ExpiredSubscriptionView', (WidgetTester tester) async {
      await setupUserSubscription();

      await tester.pumpApp(makeTestableWidget());
      await tester.pumpAndSettle();

      expect(find.byType(ExpiredSubscriptionView), findsOneWidget);
    });

    testWidgets('renders with userSubscription', (WidgetTester tester) async {
      await setupUserSubscription();

      await tester.pumpApp(makeTestableWidget());
      await tester.pumpAndSettle();

      expect(find.byKey(const ValueKey('welcome')), findsOneWidget);
    });

    testWidgets('renders with no subscriptions', (WidgetTester tester) async {
      await setupUserSubscription(isEmpty: true);

      await tester.pumpApp(makeTestableWidget());
      await tester.pumpAndSettle();

      expect(find.text("Can't find any subscription."), findsOneWidget);
    });

    testWidgets('confirm logout', (WidgetTester tester) async {
      await setupUserSubscription();

      await tester.pumpApp(makeTestableWidget());
      await tester.pumpAndSettle();

      final logoutBtn = find.byKey(const ValueKey('logout'));
      expect(logoutBtn, findsOneWidget);
      await tester.tap(logoutBtn);
      await tester.pumpAndSettle();

      expect(find.byType(AlertDialog), findsOneWidget);

      // final logoutAction = find.text('Logout');
      // await tester.ensureVisible(logoutAction);

      // expect(logoutAction, findsOneWidget);
      // await tester.tap(logoutAction);
      // await tester.pumpAndSettle();

      // verify(
      //   () => appBloc.add(
      //     AppLogoutRequested(
      //       AppStatus.temporarilyAuthenticated,
      //       sharedPrefs,
      //     ),
      //   ),
      // ).called(1);

      // Check if the router navigated to the PinRoute
      // expect(find.byType(PinRoute), findsOneWidget);
    });
  });
}
