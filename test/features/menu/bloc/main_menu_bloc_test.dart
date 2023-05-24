import 'package:api_service/api_service.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nextminute/features/menu/main_menu/bloc/main_menu_bloc.dart';
import 'package:nextminute/features/utils/generic_status_enum.dart';
import 'package:nm_repository/nm_repository.dart';

class MockMainMenuBloc extends MockBloc<MainMenuEvent, MainMenuState>
    implements MainMenuBloc {}

class MockNMRepository extends Mock implements NMRepositoryImpl {}

void main() {
  late NMRepositoryImpl nmRepositoryImpl;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();

    nmRepositoryImpl = MockNMRepository();
  });

  blocTest<MainMenuBloc, MainMenuState>(
    'emits [Success] state and load data',
    setUp: () {
      when(() => nmRepositoryImpl.getUserPermissions()).thenAnswer(
        (_) async => const Right(
          UserPermissionsModel.empty,
        ),
      );
      when(() => nmRepositoryImpl.getVisibleRecordCounts()).thenAnswer(
        (_) async => const Right(
          {
            'JobNonArchived': 39,
            'Template': 3,
            'Contact': 153,
          },
        ),
      );
    },
    build: () => MainMenuBloc(nmRepositoryImpl: nmRepositoryImpl),
    act: (bloc) => bloc.add(
      const MainMenuFetchEvent(),
    ),
    wait: const Duration(milliseconds: 500),
    expect: () => <MainMenuState>[
      const MainMenuState(),
      const MainMenuState(
        status: GenericRequestStatusEnum.success,
      ),
      const MainMenuState(),
      const MainMenuState(
        status: GenericRequestStatusEnum.success,
        recordCounts: {
          'JobNonArchived': 39,
          'Template': 3,
          'Contact': 153,
        },
      ),
    ],
  );

  blocTest<MainMenuBloc, MainMenuState>(
    'emits [Success] on visible record counts',
    setUp: () {
      when(() => nmRepositoryImpl.getVisibleRecordCounts()).thenAnswer(
        (_) async => const Right(
          {
            'JobNonArchived': 39,
            'Template': 3,
            'Contact': 153,
          },
        ),
      );
    },
    build: () => MainMenuBloc(nmRepositoryImpl: nmRepositoryImpl),
    act: (bloc) => bloc.add(
      const MainMenuRecordsFetchEvent(),
    ),
    wait: const Duration(milliseconds: 500),
    expect: () => <MainMenuState>[
      const MainMenuState(),
      const MainMenuState(
        status: GenericRequestStatusEnum.success,
        recordCounts: {
          'JobNonArchived': 39,
          'Template': 3,
          'Contact': 153,
        },
      ),
    ],
  );

  blocTest<MainMenuBloc, MainMenuState>(
    'emits [Error] state',
    setUp: () {
      when(() => nmRepositoryImpl.getUserPermissions()).thenAnswer(
        (_) async => Left(
          Exception('Error'),
        ),
      );
      when(() => nmRepositoryImpl.getVisibleRecordCounts()).thenAnswer(
        (_) async => Left(
          Exception('Error'),
        ),
      );
    },
    build: () => MainMenuBloc(nmRepositoryImpl: nmRepositoryImpl),
    act: (bloc) => bloc.add(
      const MainMenuFetchEvent(),
    ),
    wait: const Duration(milliseconds: 500),
    expect: () => <MainMenuState>[
      const MainMenuState(),
      const MainMenuState(
        status: GenericRequestStatusEnum.error,
        errorMessage: 'Exception: Error',
      ),
      const MainMenuState(
        errorMessage: 'Exception: Error',
      ),
      const MainMenuState(
        status: GenericRequestStatusEnum.error,
        errorMessage: 'Exception: Error',
      ),
    ],
  );

  blocTest<MainMenuBloc, MainMenuState>(
    'emits [loading, success] states when fetching unread messages count successfully',
    build: () => MainMenuBloc(nmRepositoryImpl: nmRepositoryImpl),
    act: (bloc) {
      when(() => nmRepositoryImpl.getUnreadMessagesCount())
          .thenAnswer((_) async => const Right({'i': 42}));
      bloc.add(const FetchUnreadMessagesCountEvent());
    },
    expect: () => [
      const MainMenuState(),
      const MainMenuState(
        status: GenericRequestStatusEnum.success,
        unreadMessagesCount: 42,
      ),
    ],
  );

  blocTest<MainMenuBloc, MainMenuState>(
    'emits [loading, error] states when fetching unread messages count fails',
    build: () => MainMenuBloc(nmRepositoryImpl: nmRepositoryImpl),
    act: (bloc) {
      when(() => nmRepositoryImpl.getUnreadMessagesCount()).thenAnswer(
        (_) async => Left(Exception('Error')),
      );
      bloc.add(const FetchUnreadMessagesCountEvent());
    },
    expect: () => [
      const MainMenuState(),
      const MainMenuState(
        status: GenericRequestStatusEnum.error,
        errorMessage: 'Exception: Error',
      ),
    ],
  );
}
