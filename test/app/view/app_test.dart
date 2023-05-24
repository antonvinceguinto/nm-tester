import 'package:api_service/api_service.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nextminute/app/bloc/app_bloc.dart';
import 'package:nextminute/app/view/app.dart';
import 'package:nextminute/features/auth/login/cubit/login_cubit.dart';
import 'package:nextminute/features/auth/login/cubit/login_state.dart';
import 'package:nextminute/features/auth/pin/view/pin_page.dart';
import 'package:nextminute/features/menu/main_menu/bloc/main_menu_bloc.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/jobs_page/bloc/jobs_bloc.dart';
import 'package:nextminute/features/tab_manager/cubit/tab_cubit.dart';
import 'package:nm_repository/nm_repository.dart';
import '../../helpers/helpers.dart';

class MockAuthRepository extends Mock implements AuthenticationRepositoryImpl {}

class MockAppBloc extends MockBloc<AppEvent, AppState> implements AppBloc {}

class MockNMRepository extends Mock implements NMRepositoryImpl {}

class MockMenuBloc extends MockBloc<MainMenuEvent, MainMenuState>
    implements MainMenuBloc {}

class MockLoginCubit extends MockCubit<LoginState> implements LoginCubit {}

void main() {
  late AuthenticationRepositoryImpl authRepository;
  late AppBloc appBloc;
  late LoginCubit loginCubit;
  late NMRepositoryImpl nmRepositoryImpl;
  late SharedPrefs sharedPrefsRepository;

  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    authRepository = MockAuthRepository();
    nmRepositoryImpl = MockNMRepository();
    appBloc = MockAppBloc();
    loginCubit = MockLoginCubit();

    SharedPreferences.setMockInitialValues({});

    final sharedPrefs = await SharedPreferences.getInstance();
    sharedPrefsRepository = SharedPrefs(sharedPrefs: sharedPrefs);

    await Helper.initHive();
  });

  tearDown(() async {
    await Helper.deleteHiveBoxes();
  });

  testWidgets('should render AppPage', (tester) async {
    SharedPreferences.setMockInitialValues({});

    await tester.pumpApp(
      RepositoryProvider.value(
        value: () => sharedPrefsRepository,
        child: MultiBlocProvider(
          providers: [
            BlocProvider<MainMenuBloc>(
              create: (context) => MainMenuBloc(
                nmRepositoryImpl: context.read<NMRepositoryImpl>(),
              ),
            ),
            BlocProvider<JobsBloc>(
              create: (context) => JobsBloc(
                nmRepositoryImpl: context.read<NMRepositoryImpl>(),
              ),
            ),
            BlocProvider<TabCubit>(
              create: (_) => TabCubit(sharedPrefs: sharedPrefsRepository),
            ),
          ],
          child: MaterialApp(
            home: App(
              authenticationRepository: authRepository,
              nmRepository: nmRepositoryImpl,
              sharedPrefs: sharedPrefsRepository,
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.byType(AppView), findsOneWidget);
  });

  testWidgets('should render tempauth pin page', (tester) async {
    SharedPreferences.setMockInitialValues({
      'authStatus': AppStatus.temporarilyAuthenticated.name,
    });

    when(() => appBloc.state).thenReturn(
      const AppState.temporarilyAuthenticated(),
    );

    await tester.pumpApp(
      MultiBlocProvider(
        providers: [
          BlocProvider<AppBloc>(
            create: (context) => appBloc,
          ),
          BlocProvider<LoginCubit>(
            create: (context) => loginCubit,
          ),
        ],
        child: const MaterialApp(
          home: PinPage(),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byType(PinView), findsOneWidget);
  });
}
