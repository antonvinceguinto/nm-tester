import 'package:api_service/api_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nextminute/features/utils/generic_status_enum.dart';
import 'package:nm_repository/nm_repository.dart';

part 'version_history_event.dart';
part 'version_history_state.dart';

class VersionHistoryBloc
    extends Bloc<VersionHistoryEvent, VersionHistoryState> {
  VersionHistoryBloc({
    required NMRepositoryImpl nmRepositoryImpl,
  })  : _nmRepositoryImpl = nmRepositoryImpl,
        super(const VersionHistoryState()) {
    on<VersionHistoryEvent>(_onFetch);
  }

  final NMRepositoryImpl _nmRepositoryImpl;

  Future<void> _onFetch(
    VersionHistoryEvent event,
    Emitter<VersionHistoryState> emit,
  ) async {
    emit(state.copyWith(status: GenericRequestStatusEnum.loading));

    final result =
        await _nmRepositoryImpl.getVersionHistory(versionId: event.versionId);

    result.fold(
      (l) => emit(
        state.copyWith(
          status: GenericRequestStatusEnum.error,
        ),
      ),
      (r) => emit(
        state.copyWith(
          status: GenericRequestStatusEnum.success,
          versionHistory: r,
        ),
      ),
    );
  }
}
