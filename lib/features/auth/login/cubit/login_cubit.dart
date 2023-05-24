import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:nextminute/features/auth/login/cubit/login_state.dart';
import 'package:nextminute/features/utils/generic_status_enum.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required AuthenticationRepositoryImpl authenticationRepository})
      : _authenticationRepository = authenticationRepository,
        super(const LoginState());

  final AuthenticationRepositoryImpl _authenticationRepository;

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(state.copyWith(status: GenericRequestStatusEnum.loading));

    final res = await _authenticationRepository.login(
      email: email,
      password: password,
    );

    res.fold(
      (l) => emit(
        state.copyWith(
          status: GenericRequestStatusEnum.error,
          message: l.toString(),
        ),
      ),
      (r) => emit(
        state.copyWith(
          status: GenericRequestStatusEnum.success,
          // message: r.toString(),
        ),
      ),
    );
  }
}
