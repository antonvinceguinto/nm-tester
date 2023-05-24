import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nextminute/features/menu/sub_menus/customer/customer/blocs/add_c_bloc/add_customer_bloc.dart';
import 'package:nextminute/features/menu/sub_menus/customer/customer/contact_type/bloc/contact_types_bloc.dart';
import 'package:nextminute/features/menu/sub_menus/sub_menus.dart';

class MockContactTypesBloc
    extends MockBloc<ContactTypesEvent, ContactTypesState>
    implements ContactTypesBloc {}

class MockAddCustomerBloc extends MockBloc<AddCustomerEvent, AddCustomerState>
    implements AddCustomerBloc {}

class MockBuildContext extends Mock implements BuildContext {}

void main() {
  late ContactTypesBloc contactTypesBloc;
  late AddCustomerBloc addCustomerBloc;

  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();

    contactTypesBloc = MockContactTypesBloc();
    addCustomerBloc = MockAddCustomerBloc();

    registerFallbackValue(MockBuildContext());
    registerFallbackValue(Mode);
  });

  setUp(() {
    when(() => contactTypesBloc.state).thenReturn(const ContactTypesState());
    when(() => addCustomerBloc.state).thenReturn(const AddCustomerState());
  });

  testWidgets('JobsAddCustomerPage renders correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider.value(value: contactTypesBloc),
          BlocProvider.value(value: addCustomerBloc),
        ],
        child: const MaterialApp(
          home: JobsAddCustomerPage(),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byType(JobsAddCustomerView), findsOneWidget);

    final sameAsPhysicalCheckbox = find.byKey(
      const ValueKey('same_as_physical'),
    );
    expect(sameAsPhysicalCheckbox, findsOneWidget);
    await tester.ensureVisible(sameAsPhysicalCheckbox);
    await tester.tap(sameAsPhysicalCheckbox);
    await tester.pumpAndSettle();
  });
}
