import 'package:api_service/api_service.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nextminute/features/menu/sub_menus/about/bloc/version_history_bloc.dart';
import 'package:nextminute/features/utils/generic_status_enum.dart';
import 'package:nm_repository/nm_repository.dart';

class MockVersionHistoryBloc
    extends MockBloc<VersionHistoryEvent, VersionHistoryState>
    implements VersionHistoryBloc {}

class MockNMRepository extends Mock implements NMRepositoryImpl {}

void main() {
  late NMRepositoryImpl nmRepositoryImpl;

  final versionHistory = <VersionHistoryModel>[
    VersionHistoryModel(
      appversion_version: '1.2.3',
      appversion_date: DateTime(2021),
      appversion_html: '<p>test</p>',
    )
  ];

  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();

    nmRepositoryImpl = MockNMRepository();
  });

  blocTest<VersionHistoryBloc, VersionHistoryState>(
    'emits [Success] state and load data',
    setUp: () {
      when(
        () => nmRepositoryImpl.getVersionHistory(versionId: '22.12.2.1'),
      ).thenAnswer(
        (_) async => Right(versionHistory),
      );
    },
    build: () => VersionHistoryBloc(nmRepositoryImpl: nmRepositoryImpl),
    act: (bloc) => bloc.add(
      const VersionHistoryEvent(
        versionId: '22.12.2.1',
      ),
    ),
    wait: const Duration(milliseconds: 500),
    expect: () => <VersionHistoryState>[
      const VersionHistoryState(status: GenericRequestStatusEnum.loading),
      VersionHistoryState(
        status: GenericRequestStatusEnum.success,
        versionHistory: versionHistory,
      ),
    ],
  );

  blocTest<VersionHistoryBloc, VersionHistoryState>(
    'emits [Error] state',
    setUp: () {
      when(
        () => nmRepositoryImpl.getVersionHistory(versionId: '22.12.2.1'),
      ).thenAnswer(
        (_) async => left(Exception('error')),
      );
    },
    build: () => VersionHistoryBloc(nmRepositoryImpl: nmRepositoryImpl),
    act: (bloc) => bloc.add(
      const VersionHistoryEvent(
        versionId: '22.12.2.1',
      ),
    ),
    wait: const Duration(milliseconds: 500),
    expect: () => <VersionHistoryState>[
      const VersionHistoryState(status: GenericRequestStatusEnum.loading),
      const VersionHistoryState(status: GenericRequestStatusEnum.error),
    ],
  );
}
