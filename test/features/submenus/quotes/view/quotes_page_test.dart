import 'package:api_service/api_service.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nextminute/features/menu/main_menu/bloc/main_menu_bloc.dart';
import 'package:nextminute/features/menu/sub_menus/quotes/bloc/quotes_bloc.dart';
import 'package:nextminute/features/menu/sub_menus/quotes/cubit/quotes_filters_cubit.dart';
import 'package:nextminute/features/menu/sub_menus/quotes/view/quotes_page.dart';
import 'package:nextminute/features/utils/generic_status_enum.dart';
import 'package:nm_repository/nm_repository.dart';

import '../../../../helpers/helpers.dart';
import '../../../menu/view/menu_page_test.dart';
import '../../../tab_manager/expired_subscription/expired_subscription_page_test.dart';

class MockQuotesBloc extends MockBloc<QuotesEvent, QuotesState>
    implements QuotesBloc {}

class MockQuotesFiltersCubit extends MockCubit<QuotesFiltersState>
    implements QuotesFiltersCubit {}

void main() {
  late QuotesBloc mockQuotesBloc;
  late QuotesFiltersCubit mockQuotesFiltersCubit;
  late MainMenuBloc mainMenuBloc;
  late NMRepositoryImpl nmRepositoryImpl;

  final quotesModel = QuotesModel(
    data: [
      QuoteItemDatum(
        billable_id: 1,
        billable_name: 'Test',
        billable_date: DateTime(2021, 10, 10),
        billable_date_due: DateTime(2021, 10, 10),
        billable_client_contact_name: 'Test',
        billable_associated_record_number: 'Test',
        billable_number: 'Test',
        billable_reference: 'Test',
      )
    ],
  );

  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();

    mockQuotesBloc = MockQuotesBloc();
    mockQuotesFiltersCubit = MockQuotesFiltersCubit();
    mainMenuBloc = MockMainMenuBloc();
    nmRepositoryImpl = MockNMRepositoryImpl();
  });

  setUp(() async {
    await Helper.initHive();

    await sendUserPermissionRequest(nmRepositoryImpl, mainMenuBloc);

    when(() => nmRepositoryImpl.getQuotes(type: 'Quote')).thenAnswer(
      (_) async => Right(quotesModel),
    );

    when(() => mockQuotesBloc.state).thenReturn(
      QuotesState(
        status: GenericRequestStatusEnum.success,
        quotesModel: quotesModel,
      ),
    );
    when(() => mockQuotesFiltersCubit.state)
        .thenReturn(const QuotesFiltersState());
  });

  tearDown(Helper.deleteHiveBoxes);

  testWidgets('QuotesPage renders correctly and triggers RefreshIndicator',
      (WidgetTester tester) async {
    await tester.pumpApp(
      RepositoryProvider.value(
        value: nmRepositoryImpl,
        child: MultiBlocProvider(
          providers: [
            BlocProvider<QuotesBloc>.value(value: mockQuotesBloc),
            BlocProvider<MainMenuBloc>.value(value: mainMenuBloc),
            BlocProvider<QuotesFiltersCubit>.value(
              value: mockQuotesFiltersCubit,
            ),
          ],
          child: const MaterialApp(
            home: QuotesPage(type: 'Quote'),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.byType(QuotesView), findsOneWidget);

    // Verify the widget renders correctly
    expect(find.text('Quotes'), findsOneWidget);
    expect(find.byKey(const Key('__filter_button__')), findsOneWidget);
    expect(find.byKey(const Key('__search_field__')), findsOneWidget);

    final refreshIndicator = find.byKey(const ValueKey('quotes_list_view'));
    await tester.ensureVisible(refreshIndicator);
    expect(refreshIndicator, findsOneWidget);

    // Scroll refresh indicator to trigger refresh
    // TODO(anton): Fix this test, doesnt trigger refresh
    await tester.dragUntilVisible(
      refreshIndicator,
      find.byType(QuotesView),
      const Offset(0, -150),
    );
    await tester.pumpAndSettle();
  });
}

class FakeQuotesEvent extends Fake implements QuotesEvent {}

class FakeQuotesState extends Fake implements QuotesState {}

class FakeQuotesFiltersState extends Fake implements QuotesFiltersState {}
