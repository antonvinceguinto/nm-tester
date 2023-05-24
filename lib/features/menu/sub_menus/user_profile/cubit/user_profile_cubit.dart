import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:nextminute/features/menu/sub_menus/user_profile/cubit/user_profile_state.dart';
import 'package:nextminute/features/utils/generic_status_enum.dart';

class UserProfileCubit extends Cubit<UPState> {
  UserProfileCubit({
    required AuthenticationRepositoryImpl authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(const UPState(status: GenericRequestStatusEnum.initial));

  final AuthenticationRepositoryImpl _authenticationRepository;

  Future<void> changePassword({
    required String oldPassword,
    required String newPassword,
    required String confirmPassword,
  }) async {
    emit(state.copyWith(status: GenericRequestStatusEnum.loading));

    final res = await _authenticationRepository.changePassword(
      oldPassword: oldPassword,
      newPassword: newPassword,
    );

    res.fold(
      (l) => emit(
        state.copyWith(
          status: GenericRequestStatusEnum.error,
          errorMessage: l.toString(),
        ),
      ),
      (r) {
        if (r.Success!) {
          return emit(
            state.copyWith(
              status: GenericRequestStatusEnum.success,
              passwordResetModel: r,
            ),
          );
        }

        return emit(
          state.copyWith(
            status: GenericRequestStatusEnum.error,
            errorMessage: r.Message,
          ),
        );
      },
    );
  }
}
