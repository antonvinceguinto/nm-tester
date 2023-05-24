import 'package:api_service/api_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'task_filter_status_state.dart';

class TaskFilterStatusCubit extends Cubit<TaskFilterStatusState> {
  TaskFilterStatusCubit() : super(const TaskFilterStatusState());

  void addSelectedStatus(TaskStatusModel status) {
    if (state.selectedTaskStatuses?.contains(status) ?? false) {
      emit(
        state.copyWith(
          selectedTaskStatuses: state.selectedTaskStatuses
              ?.where((element) => element != status)
              .toList(),
        ),
      );
      return;
    }
    emit(
      state.copyWith(
        selectedTaskStatuses: [
          ...state.selectedTaskStatuses ?? [],
          status,
        ],
      ),
    );
  }

  void clearFilters() {
    emit(const TaskFilterStatusState());
  }
}
