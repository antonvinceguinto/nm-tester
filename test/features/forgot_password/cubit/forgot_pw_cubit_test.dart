import 'package:api_service/api_service.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nextminute/features/auth/forgot_password/cubit/forgot_pw_cubit.dart';
import 'package:nextminute/features/auth/forgot_password/cubit/forgot_pw_state.dart';
import 'package:nextminute/features/utils/generic_status_enum.dart';

import '../view/forgot_password_page_test.dart';

void main() {
  group('ForgotPasswordCubit Test', () {
    const passwordResetModel = PasswordResetModel(
      Success: true,
      Message: 'Password reset email sent',
      MessageTitle: 'Password reset email sent',
    );

    late AuthenticationRepositoryImpl authenticationRepositoryImpl;
    late FPWState state;

    setUp(() async {
      authenticationRepositoryImpl = MockAuthenticationRepositoryImpl();
      state = const FPWState(status: GenericRequestStatusEnum.initial);
    });

    blocTest<ForgotPWCubit, FPWState>(
      'emits [Loading, Success] when forgotPassword() is called',
      setUp: () {
        when(
          () => authenticationRepositoryImpl.forgotPassword(
            email: 'nmag@me.com',
          ),
        ).thenAnswer((_) async => const Right(passwordResetModel));
      },
      build: () => ForgotPWCubit(
        authenticationRepository: authenticationRepositoryImpl,
      ),
      act: (cubit) => cubit.forgotPassword(email: 'nmag@me.com'),
      expect: () => <FPWState>[
        state.copyWith(status: GenericRequestStatusEnum.loading),
        state.copyWith(
          status: GenericRequestStatusEnum.success,
          passwordResetModel: passwordResetModel,
        ),
      ],
    );

    blocTest<ForgotPWCubit, FPWState>(
      'emits [Loading, Failure] when forgotPassword() is called',
      setUp: () {
        when(
          () => authenticationRepositoryImpl.forgotPassword(email: ''),
        ).thenAnswer((_) async => Left(Exception('Error')));
      },
      build: () => ForgotPWCubit(
        authenticationRepository: authenticationRepositoryImpl,
      ),
      act: (cubit) => cubit.forgotPassword(email: ''),
      expect: () => <FPWState>[
        state.copyWith(status: GenericRequestStatusEnum.loading),
        state.copyWith(
          status: GenericRequestStatusEnum.error,
          error: 'Exception: Error',
        ),
      ],
    );
  });
}
