import 'package:api_service/api_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:nextminute/features/utils/generic_status_enum.dart';
import 'package:nm_repository/nm_repository.dart';

part 'add_task_event.dart';
part 'add_task_state.dart';

class AddTaskBloc extends Bloc<AddTaskEvent, AddTaskState> {
  AddTaskBloc({required NMRepositoryImpl nmRepositoryImpl})
      : _nmRepositoryImpl = nmRepositoryImpl,
        super(const AddTaskState()) {
    on<ATSelectJobEvent>(_onSelectJob);
    on<AddNewTaskEvent>(_onAddNewTask);
  }

  final NMRepositoryImpl _nmRepositoryImpl;

  Future<void> _onAddNewTask(
    AddNewTaskEvent event,
    Emitter<AddTaskState> emit,
  ) async {
    emit(
      state.copyWith(
        status: GenericRequestStatusEnum.loading,
      ),
    );

    final result = await _nmRepositoryImpl.addNewTask(
      taskInfoLevelModel: event.taskInfoLevelModel,
      updateMode: event.updateMode,
      context: event.context,
    );

    result.fold(
      (l) {
        emit(
          state.copyWith(
            status: GenericRequestStatusEnum.error,
            errorMessage: l.toString(),
          ),
        );
      },
      (r) {
        emit(
          state.copyWith(
            status: GenericRequestStatusEnum.success,
          ),
        );
      },
    );
  }

  Future<void> _onSelectJob(
    ATSelectJobEvent event,
    Emitter<AddTaskState> emit,
  ) async {
    if (event.isRemove) {
      emit(const AddTaskState());
      return;
    }

    emit(
      state.copyWith(
        selectedJob: event.selectedJob,
      ),
    );
  }
}
