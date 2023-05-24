import 'package:api_service/api_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:nextminute/core/utils/utils.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/sub_menus/job_details/bloc/job_details_bloc.dart';
import 'package:nextminute/features/utils/generic_status_enum.dart';
import 'package:nm_repository/nm_repository.dart';

part 'task_details_event.dart';
part 'task_details_state.dart';

class TaskDetailsBloc extends Bloc<TaskDetailsEvent, TaskDetailsState> {
  TaskDetailsBloc({required NMRepositoryImpl nmRepositoryImpl})
      : _nmRepository = nmRepositoryImpl,
        super(const TaskDetailsState()) {
    on<TaskDetailsFetchEvent>(_onFetchEvent);
    on<AddOnSiteLocationTaskEvent>(_onAddOnsiteLocation);
    on<TaskDeleteEvent>(_onDeleteEvent);
    on<UpdateTaskStatusEvent>(_onUpdateTaskStatus);
  }

  final NMRepositoryImpl _nmRepository;

  Future<void> _onUpdateTaskStatus(
    UpdateTaskStatusEvent event,
    Emitter<TaskDetailsState> emit,
  ) async {
    emit(state.copyWith(status: GenericRequestStatusEnum.loading));

    final pos = await Helpers.getLatLngNullable();

    final res = await _nmRepository.updateTaskCurrentStatus(
      taskId: event.taskId,
      statusId: event.statusId,
      longitude: pos?.longitude,
      latitude: pos?.latitude,
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

  Future<void> _onAddOnsiteLocation(
    AddOnSiteLocationTaskEvent event,
    Emitter<TaskDetailsState> emit,
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

    final res = await _nmRepository.addOnsiteLocation(
      bookKey: event.bookKey,
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

  Future<void> _onDeleteEvent(
    TaskDeleteEvent event,
    Emitter<TaskDetailsState> emit,
  ) async {
    emit(state.copyWith(deleteStatus: DeleteStatusEnum.loading));

    final res = await _nmRepository.deleteTask(
      event.taskId,
      event.selectedDate,
      event.occurrenceType,
    );

    res.fold(
      (l) => emit(
        state.copyWith(
          deleteStatus: DeleteStatusEnum.error,
          errorMessage: l.toString(),
        ),
      ),
      (r) => emit(
        state.copyWith(
          deleteStatus: DeleteStatusEnum.success,
        ),
      ),
    );
  }

  Future<void> _onFetchEvent(
    TaskDetailsFetchEvent event,
    Emitter<TaskDetailsState> emit,
  ) async {
    emit(state.copyWith(status: GenericRequestStatusEnum.loading));

    final blobCountRes = await _nmRepository.getTaskBlobs(
      event.taskId,
    );

    final res = await _nmRepository.getTaskInfoLevel(
      event.taskId,
      event.infoLevel,
      bookOccurrenceKey: event.bookOccurrenceKey,
    );

    String? error;
    var relatedBlobCounts = <String, dynamic>{};
    var taskInfoLevel = const TaskInfoLevelModel();

    blobCountRes.fold(
      (l) => error = l.toString(),
      (r) => relatedBlobCounts = r,
    );

    res.fold(
      (l) => error = l.toString(),
      (r) => taskInfoLevel = r,
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
          taskInfoLevel: taskInfoLevel,
        ),
      );
    }
  }
}
