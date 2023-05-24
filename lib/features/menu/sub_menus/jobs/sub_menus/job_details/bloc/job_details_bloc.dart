import 'package:api_service/api_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:nextminute/core/utils/utils.dart';
import 'package:nextminute/features/utils/generic_status_enum.dart';
import 'package:nm_repository/nm_repository.dart';

part 'job_details_event.dart';
part 'job_details_state.dart';

class JobDetailsBloc extends Bloc<JobDetailsEvent, JobDetailsState> {
  JobDetailsBloc({
    required NMRepositoryImpl nmRepositoryImpl,
  })  : _nmRepositoryImpl = nmRepositoryImpl,
        super(const JobDetailsState()) {
    on<JobDetailsFetchEvent>(_onFetchEvent);
    on<UpdateJobStatusEvent>(_onUpdateJobStatusEvent);
    on<RemoveLinkedTaskEvent>(_onRemoveLinkedTaskEvent);
    on<AddOnSiteLocationEvent>(_onAddOnsiteLocation);
    on<DeleteJobEvent>(_onDeleteJobEvent);
  }

  final NMRepositoryImpl _nmRepositoryImpl;

  Future<void> _onAddOnsiteLocation(
    AddOnSiteLocationEvent event,
    Emitter<JobDetailsState> emit,
  ) async {
    emit(
      state.copyWith(
        locationTaggingStatus: LocationTaggingStatusEnum.loading,
      ),
    );

    final pos = await Helpers.determinePosition(event.context);

    if (pos == null) {
      emit(
        state.copyWith(
          locationTaggingStatus: LocationTaggingStatusEnum.error,
        ),
      );
      return;
    }

    final res = await _nmRepositoryImpl.addOnsiteLocation(
      jobId: event.jobId,
      latitude: pos.latitude,
      longitude: pos.longitude,
    );

    res.fold(
      (l) => emit(
        state.copyWith(
          locationTaggingStatus: LocationTaggingStatusEnum.error,
          errorMessage: l.toString(),
        ),
      ),
      (r) => emit(
        state.copyWith(
          locationTaggingStatus: LocationTaggingStatusEnum.success,
        ),
      ),
    );

    // reset the status to initial. Without this, the status will remain as
    // LocationTaggingStatusEnum.success and the page will load repeatedly.
    emit(
      state.copyWith(
        locationTaggingStatus: LocationTaggingStatusEnum.initial,
      ),
    );
  }

  Future<void> _onDeleteJobEvent(
    DeleteJobEvent event,
    Emitter<JobDetailsState> emit,
  ) async {
    emit(state.copyWith(status: GenericRequestStatusEnum.loading));

    final res = await _nmRepositoryImpl.deleteJob(
      jobId: event.jobId,
      deleteTask: event.isDeleteTask,
    );

    res.fold(
      (l) => emit(
        state.copyWith(
          status: GenericRequestStatusEnum.error,
          errorMessage: l.toString(),
        ),
      ),
      (r) => emit(state.copyWith(status: GenericRequestStatusEnum.success)),
    );
  }

  Future<void> _onRemoveLinkedTaskEvent(
    RemoveLinkedTaskEvent event,
    Emitter<JobDetailsState> emit,
  ) async {
    emit(state.copyWith(status: GenericRequestStatusEnum.loading));

    final res = await _nmRepositoryImpl.removeLinkedTask(
      jobId: event.jobId,
      isDeleteBooking: event.isDeleteBooking,
    );

    res.fold(
      (l) => emit(
        state.copyWith(
          status: GenericRequestStatusEnum.error,
          errorMessage: l.toString(),
        ),
      ),
      (r) => emit(state.copyWith(status: GenericRequestStatusEnum.success)),
    );
  }

  Future<void> _onUpdateJobStatusEvent(
    UpdateJobStatusEvent event,
    Emitter<JobDetailsState> emit,
  ) async {
    emit(state.copyWith(status: GenericRequestStatusEnum.loading));

    final pos = await Helpers.getLatLngNullable();

    final res = await _nmRepositoryImpl.updateJobStatus(
      jobId: event.jobId,
      jobStatusId: event.jobStatusId,
      latitude: pos?.latitude,
      longitude: pos?.longitude,
    );

    res.fold(
      (l) => emit(
        state.copyWith(
          status: GenericRequestStatusEnum.error,
          errorMessage: l.toString(),
        ),
      ),
      (r) => emit(
        state.copyWith(
          status: GenericRequestStatusEnum.success,
        ),
      ),
    );
  }

  Future<void> _onFetchEvent(
    JobDetailsFetchEvent event,
    Emitter<JobDetailsState> emit,
  ) async {
    emit(state.copyWith(status: GenericRequestStatusEnum.loading));

    final blobCountRes = await _nmRepositoryImpl.getRelatedBlobCounts(
      event.jobId,
    );

    final res = await _nmRepositoryImpl.getJobInfoLevel(
      event.jobId,
      event.infoLevel,
    );

    String? error;
    var relatedBlobCounts = <String, dynamic>{};
    var jobInfoLevel = const JobInfoLevelModel();

    blobCountRes.fold(
      (l) => error = l.toString(),
      (r) => relatedBlobCounts = r,
    );

    res.fold(
      (l) => error = l.toString(),
      (r) => jobInfoLevel = r,
    );

    if (error != null) {
      emit(
        state.copyWith(
          status: GenericRequestStatusEnum.error,
          errorMessage: error,
        ),
      );
    } else {
      emit(
        state.copyWith(
          status: GenericRequestStatusEnum.success,
          relatedBlobCounts: relatedBlobCounts,
          jobInfoLevel: jobInfoLevel,
        ),
      );
    }
  }
}
