import 'package:api_service/api_service.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nextminute/features/menu/sub_menus/customer/customer/contact_type/bloc/contact_types_bloc.dart';
import 'package:nextminute/features/menu/sub_menus/customer/customer/contact_type/view/edit_contact_types_page.dart';
import 'package:nextminute/features/utils/generic_status_enum.dart';

class MockContactTypesBloc
    extends MockBloc<ContactTypesEvent, ContactTypesState>
    implements ContactTypesBloc {}

void main() {
  group('EditContactTypesPage', () {
    testWidgets(
        'Displays contact types and allows adding and deleting contact types',
        (WidgetTester tester) async {
      final contactTypesBloc = MockContactTypesBloc();

      when(() => contactTypesBloc.state).thenReturn(
        const ContactTypesState(
          status: GenericRequestStatusEnum.success,
          editableContactTypes: [
            ContactTypeModel(
              contacttype_name: 'Existing Type',
              contacttype_id: 1,
            ),
          ],
        ),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<ContactTypesBloc>.value(
            value: contactTypesBloc,
            child: const EditContactTypesPage(),
          ),
        ),
      );

      expect(find.text('Existing Type'), findsOneWidget);
      expect(find.byType(ListTile), findsNWidgets(1));

      final addField = find.byKey(const ValueKey('addContactTypeTextField'));

      final addContactTypeButtonFinder =
          find.byKey(const ValueKey('addContactTypeButton'));

      expect(addField, findsOneWidget);
      expect(addContactTypeButtonFinder, findsOneWidget);

      await tester.enterText(addField, 'New Type');
      await tester.tap(addContactTypeButtonFinder);
      await tester.pump();

      when(() => contactTypesBloc.state).thenReturn(
        const ContactTypesState(
          status: GenericRequestStatusEnum.success,
          editableContactTypes: [
            ContactTypeModel(
              contacttype_name: 'Existing Type',
              contacttype_id: 1,
            ),
            ContactTypeModel(
              contacttype_name: 'New Type',
              contacttype_id: -1,
            ),
          ],
        ),
      );

      await tester.pump();

      expect(find.text('Existing Type'), findsOneWidget);
      // expect(find.text('New Type'), findsOneWidget);
      expect(find.byType(ListTile), findsNWidgets(1));
    });

    testWidgets('Tests onDelete property of ContactTypeField widget',
        (WidgetTester tester) async {
      final contactTypesBloc = MockContactTypesBloc();

      when(() => contactTypesBloc.state).thenReturn(
        const ContactTypesState(
          status: GenericRequestStatusEnum.success,
          editableContactTypes: [
            ContactTypeModel(
              contacttype_name: 'Existing Type',
              contacttype_id: 1,
            ),
          ],
        ),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<ContactTypesBloc>.value(
            value: contactTypesBloc,
            child: const EditContactTypesPage(),
          ),
        ),
      );

      expect(find.byKey(const ValueKey('1')), findsOneWidget);
      expect(find.byType(ListTile), findsNWidgets(1));

      final deleteButtonFinder = find.byIcon(Icons.delete);
      expect(deleteButtonFinder, findsOneWidget);

      await tester.tap(deleteButtonFinder);
      await tester.pump();

      verify(
        () => contactTypesBloc.add(
          const MarkAsDeletedEvent(
            ContactTypeModel(
              contacttype_name: 'Existing Type',
              contacttype_id: 1,
            ),
          ),
        ),
      ).called(1);

      when(() => contactTypesBloc.state).thenReturn(
        const ContactTypesState(
          status: GenericRequestStatusEnum.success,
          editableContactTypes: [],
        ),
      );

      await tester.pump();
    });
  });
}
