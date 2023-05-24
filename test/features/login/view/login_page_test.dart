import 'package:api_service/api_service.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nextminute/app/view/app.dart';
import 'package:nextminute/features/auth/login/cubit/login_cubit.dart';
import 'package:nextminute/features/auth/login/cubit/login_state.dart';
import 'package:nextminute/features/auth/login/login.dart';
import 'package:nextminute/features/menu/main_menu/bloc/main_menu_bloc.dart';
import 'package:nextminute/features/tab_manager/cubit/tab_cubit.dart';
import 'package:nextminute/features/utils/generic_status_enum.dart';
import 'package:nm_repository/nm_repository.dart';

import '../../../helpers/helpers.dart';
import '../../forgot_password/view/forgot_password_page_test.dart';
import '../../menu/view/menu_page_test.dart';

class MockLoginCubit extends MockCubit<LoginState> implements LoginCubit {}

class MockNMRepository extends Mock implements NMRepositoryImpl {}

class MockTabCubit extends MockCubit<TabState> implements TabCubit {}

void main() {
  group('LoginPage', () {
    late AuthenticationRepositoryImpl authenticationRepositoryImpl;
    late NMRepositoryImpl nmRepositoryImpl;
    late LoginState state;

    late SharedPreferences sfInstance;
    late SharedPrefs sharedPrefs;

    late MainMenuBloc mainMenuBloc;

    setUp(() async {
      TestWidgetsFlutterBinding.ensureInitialized();
      await Helper.initHive();
    });

    setUpAll(() async {
      authenticationRepositoryImpl = MockAuthenticationRepositoryImpl();
      nmRepositoryImpl = MockNMRepository();
      state = const LoginState();
      mainMenuBloc = MockMainMenuBloc();

      SharedPreferences.setMockInitialValues({});
      sfInstance = await SharedPreferences.getInstance();
      sharedPrefs = SharedPrefs(sharedPrefs: sfInstance);
    });

    tearDown(() async {
      await Helper.deleteHiveBoxes();
    });

    testWidgets('should render LoginView and test forgot password button',
        (tester) async {
      final sfInstance = await SharedPreferences.getInstance();
      final sharedPrefs = SharedPrefs(sharedPrefs: sfInstance);

      await tester.pumpApp(
        App(
          authenticationRepository: authenticationRepositoryImpl,
          nmRepository: nmRepositoryImpl,
          sharedPrefs: sharedPrefs,
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(LoginView), findsOneWidget);

      final forgotPasswordButton =
          find.byKey(const Key('__forgot_password_button__'));

      await tester.tap(forgotPasswordButton);
      await tester.pumpAndSettle();
    });

    testWidgets('should test login button (Error)', (tester) async {
      final sfInstance = await SharedPreferences.getInstance();
      final sharedPrefs = SharedPrefs(sharedPrefs: sfInstance);

      await tester.pumpApp(
        App(
          authenticationRepository: authenticationRepositoryImpl,
          nmRepository: nmRepositoryImpl,
          sharedPrefs: sharedPrefs,
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(LoginView), findsOneWidget);

      final loginButton = find.byKey(const Key('__login_button__'));
      final emailField = find.byKey(const Key('__email_field__'));
      final passwordField = find.byKey(const Key('__pw_field__'));

      expect(loginButton, findsOneWidget);
      expect(emailField, findsOneWidget);
      expect(passwordField, findsOneWidget);

      const email = 'nmag@me.com';
      const password = 'invalid_password';

      await tester.enterText(emailField, email);
      await tester.enterText(passwordField, password);

      when(
        () => authenticationRepositoryImpl.login(
          email: email,
          password: password,
        ),
      ).thenAnswer((_) async => Left(BadRequestException('Error')));

      emits(
        [
          state.copyWith(status: GenericRequestStatusEnum.loading),
          state.copyWith(
            status: GenericRequestStatusEnum.error,
            message: 'BadRequestException: Error',
          ),
        ],
      );

      await tester.pump();

      await tester.tap(loginButton);
      await tester.pumpAndSettle();

      expect(find.byType(AlertDialog), findsOneWidget);

      // Tap outside the dialog
      await tester.tapAt(Offset.zero);
      await tester.pumpAndSettle();
    });

    testWidgets('should test login button (Success - NEW PIN)', (tester) async {
      final sfInstance = await SharedPreferences.getInstance();
      final sharedPrefs = SharedPrefs(sharedPrefs: sfInstance);

      await tester.pumpApp(
        App(
          authenticationRepository: authenticationRepositoryImpl,
          nmRepository: nmRepositoryImpl,
          sharedPrefs: sharedPrefs,
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(LoginView), findsOneWidget);

      final loginButton = find.byKey(const Key('__login_button__'));
      final emailField = find.byKey(const Key('__email_field__'));
      final passwordField = find.byKey(const Key('__pw_field__'));

      expect(loginButton, findsOneWidget);
      expect(emailField, findsOneWidget);
      expect(passwordField, findsOneWidget);

      const email = 'nmag@me.com';
      const password = 'aaaaaaaa';

      await tester.enterText(emailField, email);
      await tester.enterText(passwordField, password);

      final emailPref = sharedPrefs.subscriberEmail;
      final pinPref = sharedPrefs.userPin;

      expect(emailPref, '');
      expect(pinPref, '');

      when(
        () => authenticationRepositoryImpl.login(
          email: 'nmag@me.com',
          password: 'aaaaaaaa',
        ),
      ).thenAnswer(
        (_) async => const Right(UserModel.empty),
      );

      await tester.tap(loginButton);
      await tester.pumpAndSettle();
    });

    testWidgets('should test login button (Success - OLD PIN)', (tester) async {
      when(() => mainMenuBloc.state).thenReturn(
        MainMenuState(
          status: GenericRequestStatusEnum.success,
          userPermissions: UserPermissionsModel(
            mainMenuVisibility: menuVisibility,
          ),
        ),
      );

      whenListen(
        mainMenuBloc,
        Stream.fromIterable([
          const MainMenuState(),
          MainMenuState(
            status: GenericRequestStatusEnum.success,
            userPermissions: UserPermissionsModel(
              mainMenuVisibility: menuVisibility,
            ),
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
              userPermissions: UserPermissionsModel(
                mainMenuVisibility: menuVisibility,
              ),
            ),
          ],
        ),
      );

      await tester.pumpApp(
        App(
          authenticationRepository: authenticationRepositoryImpl,
          nmRepository: nmRepositoryImpl,
          sharedPrefs: sharedPrefs,
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(LoginView), findsOneWidget);

      final loginButton = find.byKey(const Key('__login_button__'));
      final emailField = find.byKey(const Key('__email_field__'));
      final passwordField = find.byKey(const Key('__pw_field__'));

      expect(loginButton, findsOneWidget);
      expect(emailField, findsOneWidget);
      expect(passwordField, findsOneWidget);

      const email = 'nmag@me.com';
      const password = 'aaaaaaaa';

      sharedPrefs
        ..subscriberEmail = email
        ..userPin = '1234';

      final emailPref = sharedPrefs.subscriberEmail;
      final pinPref = sharedPrefs.userPin;

      expect(emailPref, email);
      expect(pinPref, '1234');

      when(
        () => authenticationRepositoryImpl.login(
          email: email,
          password: password,
        ),
      ).thenAnswer(
        (_) async => const Right(UserModel.empty),
      );

      await tester.enterText(emailField, email);
      await tester.enterText(passwordField, password);

      // await tester.tap(loginButton);
      // await tester.pumpAndSettle();
    });
  });
}
