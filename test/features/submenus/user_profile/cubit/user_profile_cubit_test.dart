import 'package:api_service/api_service.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nextminute/features/menu/sub_menus/user_profile/cubit/user_profile_cubit.dart';
import 'package:nextminute/features/menu/sub_menus/user_profile/cubit/user_profile_state.dart';
import 'package:nextminute/features/utils/generic_status_enum.dart';

import '../../../forgot_password/view/forgot_password_page_test.dart';

void main() {
  group('UserProfile Cubit Test', () {
    const passwordResetModel = PasswordResetModel.empty;

    late AuthenticationRepositoryImpl authenticationRepositoryImpl;
    late UPState state;

    setUp(() async {
      authenticationRepositoryImpl = MockAuthenticationRepositoryImpl();
      state = const UPState(status: GenericRequestStatusEnum.initial);
    });

    blocTest<UserProfileCubit, UPState>(
      'emits [Error] when changePassword() is called',
      setUp: () {
        when(
          () => authenticationRepositoryImpl.changePassword(
            oldPassword: '',
            newPassword: '',
          ),
        ).thenAnswer(
          (_) async => const Right(passwordResetModel),
        );
      },
      build: () => UserProfileCubit(
        authenticationRepository: authenticationRepositoryImpl,
      ),
      act: (cubit) => cubit.changePassword(
        oldPassword: '',
        newPassword: '',
        confirmPassword: '',
      ),
      expect: () => <UPState>[
        state.copyWith(status: GenericRequestStatusEnum.loading),
        state.copyWith(status: GenericRequestStatusEnum.error),
      ],
    );

    blocTest<UserProfileCubit, UPState>(
      'emits [Exception] when changePassword() is called',
      setUp: () {
        when(
          () => authenticationRepositoryImpl.changePassword(
            oldPassword: '',
            newPassword: '',
          ),
        ).thenAnswer(
          (_) async => const Right(
            PasswordResetModel(
              Success: false,
              Message: 'Unauthorized: Please try again later',
            ),
          ),
        );
      },
      build: () => UserProfileCubit(
        authenticationRepository: authenticationRepositoryImpl,
      ),
      act: (cubit) => cubit.changePassword(
        oldPassword: '',
        newPassword: '',
        confirmPassword: '',
      ),
      expect: () => <UPState>[
        state.copyWith(status: GenericRequestStatusEnum.loading),
        state.copyWith(
          status: GenericRequestStatusEnum.error,
          errorMessage: 'Unauthorized: Please try again later',
          passwordResetModel: PasswordResetModel.empty,
        ),
      ],
    );
  });
}
