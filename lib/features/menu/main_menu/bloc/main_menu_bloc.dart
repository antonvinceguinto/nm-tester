import 'package:api_service/api_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nextminute/features/utils/generic_status_enum.dart';
import 'package:nm_repository/nm_repository.dart';

part 'main_menu_event.dart';
part 'main_menu_state.dart';

class MainMenuBloc extends Bloc<MainMenuEvent, MainMenuState> {
  MainMenuBloc({required NMRepositoryImpl nmRepositoryImpl})
      : _nmRepositoryImpl = nmRepositoryImpl,
        super(const MainMenuState()) {
    on<MainMenuFetchEvent>(_onFetch);
    on<MainMenuRecordsFetchEvent>(_onRecordsFetch);
    on<FetchUnreadMessagesCountEvent>(_onMessagesCountEvent);
  }

  final NMRepositoryImpl _nmRepositoryImpl;

  Future<void> _onMessagesCountEvent(
    FetchUnreadMessagesCountEvent event,
    Emitter<MainMenuState> emit,
  ) async {
    emit(state.copyWith(status: GenericRequestStatusEnum.loading));

    final unreadMessagesCountRes =
        await _nmRepositoryImpl.getUnreadMessagesCount();

    unreadMessagesCountRes.fold(
      (l) => emit(
        state.copyWith(
          status: GenericRequestStatusEnum.error,
          errorMessage: l.toString(),
        ),
      ),
      (r) => emit(
        state.copyWith(
          status: GenericRequestStatusEnum.success,
          unreadMessagesCount: r['i'],
        ),
      ),
    );
  }

  Future<void> _onRecordsFetch(
    MainMenuRecordsFetchEvent event,
    Emitter<MainMenuState> emit,
  ) async {
    emit(state.copyWith(status: GenericRequestStatusEnum.loading));

    final recordCountsRes = await _nmRepositoryImpl.getVisibleRecordCounts();

    recordCountsRes.fold(
      (l) => emit(
        state.copyWith(
          status: GenericRequestStatusEnum.error,
          errorMessage: l.toString(),
        ),
      ),
      (r) => emit(
        state.copyWith(
          status: GenericRequestStatusEnum.success,
          recordCounts: r,
        ),
      ),
    );
  }

  Future<void> _onFetch(
    MainMenuFetchEvent event,
    Emitter<MainMenuState> emit,
  ) async {
    emit(state.copyWith(status: GenericRequestStatusEnum.loading));

    final userPermissionRes = await _nmRepositoryImpl.getUserPermissions();

    userPermissionRes.fold(
      (l) => emit(
        state.copyWith(
          status: GenericRequestStatusEnum.error,
          errorMessage: l.toString(),
        ),
      ),
      (r) => emit(
        state.copyWith(
          status: GenericRequestStatusEnum.success,
          userPermissions: r,
        ),
      ),
    );

    await _onRecordsFetch(const MainMenuRecordsFetchEvent(), emit);
  }
}
