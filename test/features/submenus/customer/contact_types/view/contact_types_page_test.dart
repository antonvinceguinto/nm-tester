import 'package:api_service/api_service.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nextminute/features/menu/main_menu/bloc/main_menu_bloc.dart';
import 'package:nextminute/features/menu/sub_menus/customer/customer/contact_type/bloc/contact_types_bloc.dart';
import 'package:nextminute/features/menu/sub_menus/sub_menus.dart';
import 'package:nextminute/features/utils/generic_status_enum.dart';

import '../../../../../helpers/helpers.dart';
import '../../../../menu/view/menu_page_test.dart';

class MockContactTypesBloc
    extends MockBloc<ContactTypesEvent, ContactTypesState>
    implements ContactTypesBloc {}

class MockMainMenuBloc extends MockBloc<MainMenuEvent, MainMenuState>
    implements MainMenuBloc {}

void main() {
  late MockContactTypesBloc contactTypesBloc;
  late MockMainMenuBloc mainMenuBloc;

  setUpAll(() {
    contactTypesBloc = MockContactTypesBloc();
    mainMenuBloc = MockMainMenuBloc();

    registerFallbackValue(FakeContactTypesEvent());
    registerFallbackValue(FakeContactTypesState());
    registerFallbackValue(FakeMainMenuEvent());
    registerFallbackValue(FakeMainMenuState());
  });

  setUp(() {
    when(() => contactTypesBloc.state).thenReturn(
      const ContactTypesState(
        status: GenericRequestStatusEnum.success,
        contactTypes: [
          ContactTypeModel(
            contacttype_id: 1,
            contacttype_name: 'Admin',
            contacttype_isdefault: true,
          ),
          ContactTypeModel(
            contacttype_id: 2,
            contacttype_name: 'Customer',
          ),
        ],
      ),
    );
    when(() => mainMenuBloc.state).thenReturn(
      MainMenuState(
        status: GenericRequestStatusEnum.success,
        userPermissions: UserPermissionsModel(
          mainMenuVisibility: menuVisibility,
          subscriptions: [
            const Subscription(
              is_admin: true,
            )
          ],
        ),
      ),
    );
  });

  testWidgets('renders ContactTypesPage correctly',
      (WidgetTester tester) async {
    await tester.pumpApp(
      MultiBlocProvider(
        providers: [
          BlocProvider<ContactTypesBloc>.value(value: contactTypesBloc),
          BlocProvider<MainMenuBloc>.value(value: mainMenuBloc),
        ],
        child: const MaterialApp(
          home: ContactTypesPage(),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byType(ContactTypesView), findsOneWidget);

    final editButton =
        find.byKey(const ValueKey('contactTypesPage_editButton'));
    expect(editButton, findsOneWidget);
    await tester.ensureVisible(editButton);
    await tester.tap(editButton);
    await tester.pumpAndSettle();
  });
}

class FakeContactTypesEvent extends Fake implements ContactTypesEvent {}

class FakeContactTypesState extends Fake implements ContactTypesState {}

class FakeMainMenuEvent extends Fake implements MainMenuEvent {}

class FakeMainMenuState extends Fake implements MainMenuState {}
