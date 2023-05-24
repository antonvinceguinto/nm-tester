import 'package:api_service/api_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nextminute/features/utils/generic_status_enum.dart';
import 'package:nm_repository/nm_repository.dart';

part 'jobs_filter_event.dart';
part 'jobs_filter_bloc_state.dart';

class JobsFilterBloc extends Bloc<JobsFilterEvent, JobsFilterBlocState> {
  JobsFilterBloc({
    required NMRepositoryImpl nmRepositoryImpl,
  })  : _nmRepositoryImpl = nmRepositoryImpl,
        super(const JobsFilterBlocState()) {
    on<JobsFilterStatusFetch>(_onStatusFetch);
    on<PriorityFetchEvent>(_onPriorityFetch);
    on<PricingFetchEvent>(_onPricingFetch);
  }

  final NMRepositoryImpl _nmRepositoryImpl;

  Future<void> _onPricingFetch(
    PricingFetchEvent event,
    Emitter<JobsFilterBlocState> emit,
  ) async {
    emit(state.copyWith(status: GenericRequestStatusEnum.loading));

    final priorityRes = await _nmRepositoryImpl.getPricingTypeFilterList();

    priorityRes.fold(
        (l) => emit(state.copyWith(status: GenericRequestStatusEnum.error)),
        (r) {
      emit(
        state.copyWith(
          status: GenericRequestStatusEnum.success,
          filterPricingTypeList: [
            const FPricingTypeModel(
              name: 'No Priority Assigned',
            ),
            ...r,
          ],
        ),
      );
    });
  }

  Future<void> _onPriorityFetch(
    PriorityFetchEvent event,
    Emitter<JobsFilterBlocState> emit,
  ) async {
    emit(state.copyWith(status: GenericRequestStatusEnum.loading));

    final priorityRes = await _nmRepositoryImpl.getPriorityFilterList();

    priorityRes.fold(
        (l) => emit(state.copyWith(status: GenericRequestStatusEnum.error)),
        (r) {
      emit(
        state.copyWith(
          status: GenericRequestStatusEnum.success,
          filterPriorityList: [
            const FPriorityModel(
              name: 'No Priority Assigned',
            ),
            ...r,
          ],
        ),
      );
    });
  }

  Future<void> _onStatusFetch(
    JobsFilterStatusFetch event,
    Emitter<JobsFilterBlocState> emit,
  ) async {
    emit(state.copyWith(status: GenericRequestStatusEnum.loading));

    final statusRes = await _nmRepositoryImpl.getJobStatusFilterList();
    final typeRes = await _nmRepositoryImpl.getJobTypeFilterList();
    final pricingRes = await _nmRepositoryImpl.getPricingTypeFilterList();
    final priorityRes = await _nmRepositoryImpl.getPriorityFilterList();

    statusRes.fold(
      (l) => emit(state.copyWith(status: GenericRequestStatusEnum.error)),
      (r) => emit(
        state.copyWith(
          status: GenericRequestStatusEnum.success,
          filterStatusList: [
            const FStatusModel(
              name: 'No Status Assigned',
            ),
            ...r,
          ],
        ),
      ),
    );

    typeRes.fold(
      (l) => emit(state.copyWith(status: GenericRequestStatusEnum.error)),
      (r) => emit(
        state.copyWith(
          status: GenericRequestStatusEnum.success,
          filterTypeList: [
            const FTypeModel(
              name: 'No Type Assigned',
            ),
            ...r,
          ],
        ),
      ),
    );

    pricingRes.fold(
      (l) => emit(state.copyWith(status: GenericRequestStatusEnum.error)),
      (r) => emit(
        state.copyWith(
          status: GenericRequestStatusEnum.success,
          filterPricingTypeList: [
            const FPricingTypeModel(
              name: 'No Pricing Type Assigned',
            ),
            ...r,
          ],
        ),
      ),
    );

    priorityRes.fold(
        (l) => emit(state.copyWith(status: GenericRequestStatusEnum.error)),
        (r) {
      emit(
        state.copyWith(
          status: GenericRequestStatusEnum.success,
          filterPriorityList: [
            const FPriorityModel(
              name: 'No Priority Assigned',
            ),
            ...r,
          ],
        ),
      );
    });
  }
}
