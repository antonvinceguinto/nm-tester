import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:nextminute/features/auth/forgot_password/cubit/forgot_pw_state.dart';
import 'package:nextminute/features/utils/generic_status_enum.dart';

class ForgotPWCubit extends Cubit<FPWState> {
  ForgotPWCubit({
    required AuthenticationRepositoryImpl authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(
          const FPWState(status: GenericRequestStatusEnum.initial),
        );

  final AuthenticationRepositoryImpl _authenticationRepository;

  Future<void> forgotPassword({required String email}) async {
    emit(state.copyWith(status: GenericRequestStatusEnum.loading));

    final res = await _authenticationRepository.forgotPassword(
      email: email,
    );

    res.fold(
      (l) => emit(
        state.copyWith(
          status: GenericRequestStatusEnum.error,
          error: l.toString(),
        ),
      ),
      (r) => emit(
        state.copyWith(
          status: GenericRequestStatusEnum.success,
          passwordResetModel: r,
        ),
      ),
    );
  }
}
