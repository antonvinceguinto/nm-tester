import 'package:api_service/api_service.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nextminute/features/menu/sub_menus/about/bloc/version_history_bloc.dart';
import 'package:nextminute/features/menu/sub_menus/about/view/version_history_page.dart';
import 'package:nextminute/features/utils/generic_status_enum.dart';
import 'package:nm_repository/nm_repository.dart';

import '../../../../helpers/helpers.dart';

class MockNMRepositoryImpl extends Mock implements NMRepositoryImpl {}

class MockVersionHistoryBloc
    extends MockBloc<VersionHistoryEvent, VersionHistoryState>
    implements VersionHistoryBloc {}

final versionHistory = <VersionHistoryModel>[
  VersionHistoryModel(
    appversion_version: '1.2.3',
    appversion_date: DateTime(2021),
    appversion_html: '<p>test</p>',
  ),
  VersionHistoryModel(
    appversion_version: '1.2.3',
    appversion_date: DateTime(2021),
    appversion_html: '<p>test</p>',
  )
];

void main() {
  late VersionHistoryBloc versionHistoryBloc;
  late NMRepositoryImpl nmRepositoryImpl;

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();

    versionHistoryBloc = MockVersionHistoryBloc();
    nmRepositoryImpl = MockNMRepositoryImpl();
  });

  setUp(() async {
    when(() => nmRepositoryImpl.getVersionHistory(versionId: '22.12.2.1'))
        .thenAnswer((_) async => Right(versionHistory));

    when(() => versionHistoryBloc.state).thenReturn(
      VersionHistoryState(
        status: GenericRequestStatusEnum.success,
        versionHistory: versionHistory,
      ),
    );

    whenListen(
      versionHistoryBloc,
      Stream.fromIterable([
        const VersionHistoryState(status: GenericRequestStatusEnum.loading),
        VersionHistoryState(
          status: GenericRequestStatusEnum.success,
          versionHistory: versionHistory,
        ),
      ]),
    );

    await expectLater(
      versionHistoryBloc.stream,
      emitsInOrder(
        [
          const VersionHistoryState(status: GenericRequestStatusEnum.loading),
          VersionHistoryState(
            status: GenericRequestStatusEnum.success,
            versionHistory: versionHistory,
          ),
        ],
      ),
    );
  });

  testWidgets('should render version history page', (tester) async {
    await tester.pumpApp(
      RepositoryProvider(
        create: (context) => nmRepositoryImpl,
        child: BlocProvider<VersionHistoryBloc>(
          create: (context) =>
              VersionHistoryBloc(nmRepositoryImpl: nmRepositoryImpl)
                ..add(
                  const VersionHistoryEvent(versionId: '22.12.2.1'),
                ),
          child: const MaterialApp(
            home: Scaffold(
              body: VersionHistoryPage(),
            ),
          ),
        ),
      ),
    );

    await tester.pump();
    expect(find.byType(VersionHistoryView), findsOneWidget);
  });
}
