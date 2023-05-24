import 'package:api_service/api_service.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nextminute/features/auth/forgot_password/cubit/forgot_pw_cubit.dart';
import 'package:nextminute/features/auth/forgot_password/cubit/forgot_pw_state.dart';
import 'package:nextminute/features/auth/forgot_password/view/forgot_password_page.dart';
import 'package:nextminute/features/utils/generic_status_enum.dart';
import '../../../helpers/helpers.dart';

class MockAuthenticationRepositoryImpl extends Mock
    implements AuthenticationRepositoryImpl {}

class MockApiService extends Mock implements ApiService {}

class MockFPWCubit extends MockCubit<FPWState> implements ForgotPWCubit {}

void main() {
  group('ForgotPasswordPage', () {
    late AuthenticationRepositoryImpl authenticationRepositoryImpl;
    late FPWState state;

    setUp(() async {
      authenticationRepositoryImpl = MockAuthenticationRepositoryImpl();
      state = const FPWState(status: GenericRequestStatusEnum.initial);
    });

    testWidgets('should render ForgotPasswordView', (tester) async {
      await tester.pumpApp(
        RepositoryProvider.value(
          value: authenticationRepositoryImpl,
          child: BlocProvider<ForgotPWCubit>(
            create: (_) => ForgotPWCubit(
              authenticationRepository: authenticationRepositoryImpl,
            ),
            child: const MaterialApp(
              home: ForgotPasswordPage(
                initialText: '',
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(ForgotPasswordView), findsOneWidget);

      final nextButton = find.byKey(const Key('__forgot_email_button__'));
      final field = find.byKey(const Key('__nm_field__'));

      expect(field, findsOneWidget);

      // Checks for empty text validation
      // Triggers the empty validation
      await tester.tap(nextButton);
      await tester.pumpAndSettle();

      // Checks for email validation
      await tester.enterText(field, 'test');

      // Triggers the email validation
      await tester.tap(nextButton);
      await tester.pumpAndSettle();

      await tester.enterText(field, 'anton@me.com');

      when(
        () => authenticationRepositoryImpl.forgotPassword(
          email: 'anton@me.com',
        ),
      ).thenAnswer((_) async => Left(Exception('error')));

      emits(
        [
          state.copyWith(status: GenericRequestStatusEnum.loading),
          state.copyWith(status: GenericRequestStatusEnum.error),
        ],
      );

      await tester.pump();

      await tester.tap(nextButton);
      await tester.pumpAndSettle();

      expect(find.text('Something went wrong'), findsOneWidget);

      // Tap outside the dialog
      await tester.tapAt(Offset.zero);

      // Checks for success
      await tester.enterText(field, 'nmag@me.com');

      const passwordResetModel = PasswordResetModel(
        Success: true,
        Message: 'Password reset email sent',
        MessageTitle: 'Password reset email sent',
      );

      when(
        () => authenticationRepositoryImpl.forgotPassword(
          email: 'nmag@me.com',
        ),
      ).thenAnswer((_) async => const Right(passwordResetModel));

      emits(
        [
          state.copyWith(status: GenericRequestStatusEnum.loading),
          state.copyWith(
            status: GenericRequestStatusEnum.success,
            passwordResetModel: passwordResetModel,
          ),
        ],
      );

      await tester.tap(nextButton);
      await tester.pumpAndSettle();
    });
  });
}
