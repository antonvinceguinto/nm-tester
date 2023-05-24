import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nextminute/features/utils/generic_status_enum.dart';
import 'package:nm_repository/nm_repository.dart';

part 'acceptance_status_state.dart';

class AcceptanceStatusCubit extends Cubit<AcceptanceStatusState> {
  AcceptanceStatusCubit({
    required NMRepositoryImpl nmRepositoryImpl,
  })  : _nmRepositoryImpl = nmRepositoryImpl,
        super(const AcceptanceStatusState()) {
    getRecentResponses();
  }

  final NMRepositoryImpl _nmRepositoryImpl;

  Future<void> getRecentResponses() async {
    emit(state.copyWith(status: GenericRequestStatusEnum.loading));

    final recentResponses = await _nmRepositoryImpl.getRecentResponses();

    recentResponses.fold(
      (l) => emit(state.copyWith(status: GenericRequestStatusEnum.error)),
      (r) => emit(
        state.copyWith(
          status: GenericRequestStatusEnum.success,
          recentResponses: r,
        ),
      ),
    );
  }

  Future<void> updateAcceptanceResponse(
    String acceptanceStatusInitial,
    String acceptanceComment,
    int id, {
    bool isTask = false,
  }) async {
    emit(state.copyWith(status: GenericRequestStatusEnum.loading));

    await _nmRepositoryImpl.updateAcceptanceResponse(
      acceptanceStatusInitial,
      acceptanceComment,
      id,
      isTask,
    );

    emit(state.copyWith(status: GenericRequestStatusEnum.success));
  }
}
