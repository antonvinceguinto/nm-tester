import 'package:api_service/api_service.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nextminute/features/menu/sub_menus/user_profile/cubit/user_profile_cubit.dart';
import 'package:nextminute/features/menu/sub_menus/user_profile/view/change_password_page.dart';

import '../../../app/view/app_test.dart';
import '../../../helpers/helpers.dart';

void main() {
  late AuthenticationRepositoryImpl authenticationRepository;

  setUp(() {
    authenticationRepository = MockAuthRepository();
  });

  Widget createChangePasswordPage() => RepositoryProvider.value(
        value: authenticationRepository,
        child: BlocProvider<UserProfileCubit>(
          create: (context) => UserProfileCubit(
            authenticationRepository: authenticationRepository,
          ),
          child: const MaterialApp(
            home: ChangePasswordPage(),
          ),
        ),
      );

  testWidgets('should render change password page', (tester) async {
    await tester.pumpApp(createChangePasswordPage());
    await tester.pumpAndSettle();

    expect(find.byType(ChangePasswordView), findsOneWidget);
  });

  testWidgets('should check for field validations', (tester) async {
    await tester.pumpApp(createChangePasswordPage());
    await tester.pumpAndSettle();

    final changePwButton = find.byKey(const Key('__change_pw_button__'));
    expect(changePwButton, findsOneWidget);

    await tester.tap(changePwButton);
    await tester.pumpAndSettle();

    final oldPwField = find.byKey(const Key('__old_pw_field__'));
    expect(oldPwField, findsOneWidget);

    final newPwField = find.byKey(const Key('__new_pw_field__'));
    expect(newPwField, findsOneWidget);

    final confirmPwField = find.byKey(const Key('__confirm_pw_field__'));
    expect(confirmPwField, findsOneWidget);

    // enter text in old password field
    await tester.enterText(oldPwField, '123456');

    // checks for character length validation
    await tester.tap(changePwButton);
    await tester.pumpAndSettle();

    await tester.enterText(oldPwField, '12345678');
    await tester.enterText(newPwField, '123456787');
    await tester.enterText(confirmPwField, '12345678');

    // checks for password mismatch validation
    await tester.tap(changePwButton);
    await tester.pumpAndSettle();
  });

  testWidgets('should tap on Change Password Button - Success', (tester) async {
    await tester.pumpApp(createChangePasswordPage());
    await tester.pumpAndSettle();

    final changePwButton = find.byKey(const Key('__change_pw_button__'));
    expect(changePwButton, findsOneWidget);

    await tester.tap(changePwButton);
    await tester.pumpAndSettle();

    final oldPwField = find.byKey(const Key('__old_pw_field__'));
    final newPwField = find.byKey(const Key('__new_pw_field__'));
    final confirmPwField = find.byKey(const Key('__confirm_pw_field__'));

    expect(oldPwField, findsOneWidget);
    expect(newPwField, findsOneWidget);
    expect(confirmPwField, findsOneWidget);

    const oldPwTxt = '123456789';
    const newPwTxt = '12345678';
    const confirmPwTxt = '12345678';

    await tester.enterText(oldPwField, oldPwTxt);
    await tester.enterText(newPwField, newPwTxt);
    await tester.enterText(confirmPwField, confirmPwTxt);

    when(
      () => authenticationRepository.changePassword(
        oldPassword: oldPwTxt,
        newPassword: newPwTxt,
      ),
    ).thenAnswer(
      (_) async => const Right(
        PasswordResetModel(
          Success: true,
          Message: 'Password changed successfully',
          MessageTitle: 'Success',
        ),
      ),
    );

    await tester.tap(changePwButton);
    await tester.pumpAndSettle();

    expect(find.byType(AlertDialog), findsOneWidget);

    // Tap on the dialog outside to dismiss it
    await tester.tapAt(Offset.zero);
    await tester.pumpAndSettle();

    expect(find.byType(AlertDialog), findsNothing);
  });

  testWidgets('should tap on Change Password Button - Error', (tester) async {
    await tester.pumpApp(createChangePasswordPage());
    await tester.pumpAndSettle();

    final changePwButton = find.byKey(const Key('__change_pw_button__'));
    expect(changePwButton, findsOneWidget);

    await tester.tap(changePwButton);
    await tester.pumpAndSettle();

    final oldPwField = find.byKey(const Key('__old_pw_field__'));
    final newPwField = find.byKey(const Key('__new_pw_field__'));
    final confirmPwField = find.byKey(const Key('__confirm_pw_field__'));

    expect(oldPwField, findsOneWidget);
    expect(newPwField, findsOneWidget);
    expect(confirmPwField, findsOneWidget);

    const oldPwTxt = '123456789';
    const newPwTxt = '12345678';
    const confirmPwTxt = '12345678';

    await tester.enterText(oldPwField, oldPwTxt);
    await tester.enterText(newPwField, newPwTxt);
    await tester.enterText(confirmPwField, confirmPwTxt);

    when(
      () => authenticationRepository.changePassword(
        oldPassword: oldPwTxt,
        newPassword: newPwTxt,
      ),
    ).thenAnswer(
      (_) async => const Right(
        PasswordResetModel(
          Success: false,
          Message: 'Something went wrong',
          MessageTitle: 'Error',
        ),
      ),
    );

    await tester.tap(changePwButton);
    await tester.pumpAndSettle();
  });
}
