import 'package:api_service/api_service.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nextminute/features/auth/login/cubit/login_cubit.dart';
import 'package:nextminute/features/auth/login/cubit/login_state.dart';
import 'package:nextminute/features/utils/generic_status_enum.dart';

import '../../forgot_password/view/forgot_password_page_test.dart';

void main() {
  group('LoginCubit Test', () {
    late AuthenticationRepositoryImpl authenticationRepositoryImpl;
    late LoginState state;

    setUp(() async {
      authenticationRepositoryImpl = MockAuthenticationRepositoryImpl();
      state = const LoginState();
    });

    blocTest<LoginCubit, LoginState>(
      'emits [Success] when login() is called',
      setUp: () {
        when(
          () => authenticationRepositoryImpl.login(
            email: 'nmag@me.com',
            password: 'aaaaaaaa',
          ),
        ).thenAnswer((_) async => const Right(UserModel.empty));
      },
      build: () => LoginCubit(
        authenticationRepository: authenticationRepositoryImpl,
      ),
      act: (cubit) => cubit.login(
        email: 'nmag@me.com',
        password: 'aaaaaaaa',
      ),
      expect: () => <LoginState>[
        state.copyWith(status: GenericRequestStatusEnum.loading),
        state.copyWith(status: GenericRequestStatusEnum.success),
      ],
    );
  });
}
