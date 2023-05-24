import 'package:api_service/api_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nextminute/features/utils/generic_status_enum.dart';
import 'package:nm_repository/nm_repository.dart';

part 'expired_subscription_event.dart';
part 'expired_subscription_state.dart';

class ExpiredSubscriptionBloc
    extends Bloc<ExpiredSubscriptionFetchEvent, ExpiredSubscriptionState> {
  ExpiredSubscriptionBloc({required NMRepositoryImpl nmRepositoryImpl})
      : _nmRepositoryImpl = nmRepositoryImpl,
        super(const ExpiredSubscriptionState()) {
    on<ExpiredSubscriptionFetchEvent>(_onFetch);
  }

  final NMRepositoryImpl _nmRepositoryImpl;

  Future<void> _onFetch(
    ExpiredSubscriptionFetchEvent event,
    Emitter<ExpiredSubscriptionState> emit,
  ) async {
    emit(state.copyWith(status: GenericRequestStatusEnum.loading));

    final res = await _nmRepositoryImpl.getUserSubscriptions();

    res.fold(
      (l) => emit(
        state.copyWith(
          status: GenericRequestStatusEnum.error,
        ),
      ),
      (r) => emit(
        state.copyWith(
          status: GenericRequestStatusEnum.success,
          userSubscription: r,
        ),
      ),
    );
  }
}
