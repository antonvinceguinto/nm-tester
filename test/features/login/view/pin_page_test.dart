import 'package:api_service/api_service.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nextminute/app/bloc/app_bloc.dart';
import 'package:nextminute/features/auth/login/cubit/login_cubit.dart';
import 'package:nextminute/features/auth/login/cubit/login_state.dart';
import 'package:nextminute/features/auth/pin/view/pin_page.dart';
import 'package:nextminute/features/utils/generic_status_enum.dart';
import 'package:passcode_screen/passcode_screen.dart';

import '../../../helpers/helpers.dart';
import '../../forgot_password/view/forgot_password_page_test.dart';

class MockLoginCubit extends MockCubit<LoginState> implements LoginCubit {}

class LoginStateFake extends Fake implements LoginState {}

void main() {
  late AuthenticationRepositoryImpl authenticationRepository;
  late LoginCubit cubit;

  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    cubit = MockLoginCubit();
    authenticationRepository = MockAuthenticationRepositoryImpl();

    SharedPreferences.setMockInitialValues(
      {
        'email': 'nmag@me.com',
        'password': 'aaaaaaaa',
      },
    );

    await Helper.initHive();
  });

  tearDown(() async {
    await Helper.deleteHiveBoxes();
  });

  testWidgets('should render PinView', (tester) async {
    await tester.pumpApp(
      RepositoryProvider.value(
        value: authenticationRepository,
        child: BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(
            authenticationRepository:
                context.read<AuthenticationRepositoryImpl>(),
          ),
          child: const PinPage(),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.byType(PinView), findsOneWidget);
  });

  testWidgets('should simulate entering new PIN', (tester) async {
    final sfInstance = await SharedPreferences.getInstance();
    final sharedPrefs = SharedPrefs(sharedPrefs: sfInstance)
      ..subscriberEmail = 'nmag@me.com'
      ..password = 'aaaaaaaa';

    when(
      () => authenticationRepository.login(
        email: 'nmag@me.com',
        password: 'aaaaaaaa',
      ),
    ).thenAnswer((_) async => const Right(UserModel.empty));

    when(
      () => cubit.state,
    ).thenReturn(
      const LoginState(
        status: GenericRequestStatusEnum.success,
      ),
    );

    emits(
      [
        const LoginState(status: GenericRequestStatusEnum.loading),
        const LoginState(status: GenericRequestStatusEnum.success),
      ],
    );

    await tester.pumpApp(
      MultiRepositoryProvider(
        providers: [
          RepositoryProvider.value(
            value: sharedPrefs,
          ),
          RepositoryProvider.value(
            value: authenticationRepository,
          ),
        ],
        child: BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(
            authenticationRepository: authenticationRepository,
          ),
          child: const MaterialApp(
            home: PinPage(isNewPin: true),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byType(PinView), findsOneWidget);

    final passCodeScreen = find.byType(PasscodeScreen);
    expect(passCodeScreen, findsOneWidget);

    // tap on the first digit
    await tester.tap(find.text('1'));
    await tester.pumpAndSettle();

    // tap on the second digit
    await tester.tap(find.text('2'));
    await tester.pumpAndSettle();

    // tap on the third digit
    await tester.tap(find.text('3'));
    await tester.pumpAndSettle();

    // tap on delete
    final deleteButton = find.byKey(const Key('__delete_button__')).first;
    await tester.ensureVisible(deleteButton);
    expect(deleteButton, findsOneWidget);
    await tester.tap(deleteButton, warnIfMissed: false);
    await tester.pumpAndSettle();

    await tester.tap(find.text('3'));
    await tester.pumpAndSettle();

    // tap on the fourth digit again since we deleted the last one
    await tester.tap(find.text('4'));
    await tester.pumpAndSettle();

    // Confirm PIN

    // tap on the first digit
    await tester.tap(find.text('1'));
    await tester.pumpAndSettle();

    // tap on the second digit
    await tester.tap(find.text('2'));
    await tester.pumpAndSettle();

    // tap on the third digit
    await tester.tap(find.text('3'));
    await tester.pumpAndSettle();

    // tap on the fourth digit
    await tester.tap(find.text('5'));
    await tester.pumpAndSettle(const Duration(seconds: 2));

    // Expect alert dialog to show
    expect(find.byType(AlertDialog), findsOneWidget);

    await tester.tapAt(Offset.zero);
    await tester.pumpAndSettle();

    await tester.tap(deleteButton, warnIfMissed: false);
    await tester.pumpAndSettle();

    // tap on the fourth digit
    await tester.tap(find.text('4'));
    await tester.pump();
  });

  testWidgets('should simulate entering OLD PIN - Success', (tester) async {
    final sfInstance = await SharedPreferences.getInstance();
    final sharedPrefs = SharedPrefs(sharedPrefs: sfInstance)
      ..subscriberEmail = 'nmag@me.com'
      ..password = 'aaaaaaaa'
      ..userPin = '1234';

    when(
      () => authenticationRepository.login(
        email: 'nmag@me.com',
        password: 'aaaaaaaa',
      ),
    ).thenAnswer((_) async => const Right(UserModel.empty));

    when(
      () => cubit.state,
    ).thenReturn(
      const LoginState(
        status: GenericRequestStatusEnum.success,
      ),
    );

    emits(
      [
        const LoginState(status: GenericRequestStatusEnum.loading),
        const LoginState(status: GenericRequestStatusEnum.success),
      ],
    );

    await tester.pumpApp(
      MultiRepositoryProvider(
        providers: [
          RepositoryProvider.value(
            value: sharedPrefs,
          ),
          RepositoryProvider.value(
            value: authenticationRepository,
          ),
        ],
        child: BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(
            authenticationRepository:
                context.read<AuthenticationRepositoryImpl>(),
          ),
          child: const MaterialApp(
            home: PinPage(),
          ),
        ),
      ),
    );
    await tester.pump();
    expect(find.byType(PinView), findsOneWidget);

    final passCodeScreen = find.byType(PasscodeScreen);
    expect(passCodeScreen, findsOneWidget);

    // tap on the first digit
    await tester.tap(find.text('1'));
    await tester.pumpAndSettle();

    // tap on the second digit
    await tester.tap(find.text('2'));
    await tester.pumpAndSettle();

    // tap on the third digit
    await tester.tap(find.text('3'));
    await tester.pumpAndSettle();

    // tap on the fourth digit
    await tester.tap(find.text('4'));
    await tester.pumpAndSettle();
  });

  testWidgets('should simulate entering OLD PIN - Invalid', (tester) async {
    final sfInstance = await SharedPreferences.getInstance();
    final sharedPrefs = SharedPrefs(sharedPrefs: sfInstance);

    await tester.pumpApp(
      MultiRepositoryProvider(
        providers: [
          RepositoryProvider.value(
            value: sharedPrefs,
          ),
          RepositoryProvider.value(
            value: authenticationRepository,
          ),
        ],
        child: BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(
            authenticationRepository:
                context.read<AuthenticationRepositoryImpl>(),
          ),
          child: const MaterialApp(
            home: PinPage(),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.byType(PinView), findsOneWidget);

    final passCodeScreen = find.byType(PasscodeScreen);
    expect(passCodeScreen, findsOneWidget);

    sharedPrefs.userPin = '1234';

    // tap on the first digit
    await tester.tap(find.text('1'));
    await tester.pumpAndSettle();

    // tap on the second digit
    await tester.tap(find.text('2'));
    await tester.pumpAndSettle();

    // tap on the third digit
    await tester.tap(find.text('3'));
    await tester.pumpAndSettle();

    // tap on the fourth digit
    await tester.tap(find.text('5'));
    await tester.pumpAndSettle();

    // Expect alert dialog to show
    expect(find.byType(AlertDialog), findsOneWidget);

    await tester.tapAt(Offset.zero);
    await tester.pumpAndSettle();
  });

  testWidgets('should simulate tapping forgot pin', (tester) async {
    final sfInstance = await SharedPreferences.getInstance();
    final sharedPrefs = SharedPrefs(sharedPrefs: sfInstance);

    await tester.pumpApp(
      MultiRepositoryProvider(
        providers: [
          RepositoryProvider.value(
            value: sharedPrefs,
          ),
          RepositoryProvider.value(
            value: authenticationRepository,
          ),
        ],
        child: BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(
            authenticationRepository:
                context.read<AuthenticationRepositoryImpl>(),
          ),
          child: const MaterialApp(
            home: PinPage(),
          ),
        ),
      ),
    );
    await tester.pump();

    final forgotPinButton = find.byKey(const Key('__forgot_pin_button__'));
    expect(forgotPinButton, findsOneWidget);

    await tester.tap(forgotPinButton);
    await tester.pump();
  });

  testWidgets('should tap on fully logout (Switch User)', (tester) async {
    final sfInstance = await SharedPreferences.getInstance();
    final sharedPrefs = SharedPrefs(sharedPrefs: sfInstance);

    await tester.pumpApp(
      MultiRepositoryProvider(
        providers: [
          RepositoryProvider.value(
            value: sharedPrefs,
          ),
          RepositoryProvider.value(
            value: authenticationRepository,
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<LoginCubit>(
              create: (context) => LoginCubit(
                authenticationRepository:
                    context.read<AuthenticationRepositoryImpl>(),
              ),
            ),
            BlocProvider<AppBloc>(
              create: (_) => AppBloc(sharedPrefs: sharedPrefs),
            ),
          ],
          child: const MaterialApp(
            home: PinPage(),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    final switchUserButton = find.byKey(
      const Key('__switch_user__'),
    );
    expect(switchUserButton, findsOneWidget);

    // TODO(anton): Fix this test
    // await tester.tap(switchUserButton);
    // await tester.pumpAndSettle();
  });
}
