import 'package:api_service/api_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nextminute/features/utils/generic_status_enum.dart';
import 'package:nm_repository/nm_repository.dart';

part 'task_status_event.dart';
part 'task_status_state.dart';

class TaskStatusBloc extends Bloc<TaskEvent, TaskStatusState> {
  TaskStatusBloc({
    required NMRepositoryImpl nmRepositoryImpl,
  })  : _nmRepositoryImpl = nmRepositoryImpl,
        super(const TaskStatusState()) {
    on<TaskStatusFetchEvent>(_onTaskStatusFetch);
    on<TaskCategoryFetchEvent>(_onCategoryFetch);
  }

  final NMRepositoryImpl _nmRepositoryImpl;

  Future<void> _onCategoryFetch(
    TaskCategoryFetchEvent event,
    Emitter<TaskStatusState> emit,
  ) async {
    emit(state.copyWith(status: GenericRequestStatusEnum.loading));

    final taskStatus = await _nmRepositoryImpl.getCategoryFilters();

    taskStatus.fold(
      (l) => emit(state.copyWith(status: GenericRequestStatusEnum.error)),
      (r) => emit(
        state.copyWith(
          status: GenericRequestStatusEnum.success,
          categoryFilters: [
            const CategoryFilterModel(
              name: 'No Category Assigned',
            ),
            ...r
          ],
        ),
      ),
    );
  }

  Future<void> _onTaskStatusFetch(
    TaskStatusFetchEvent event,
    Emitter<TaskStatusState> emit,
  ) async {
    emit(state.copyWith(status: GenericRequestStatusEnum.loading));

    final taskStatus = await _nmRepositoryImpl.getTaskStatuses();

    taskStatus.fold(
      (l) => emit(state.copyWith(status: GenericRequestStatusEnum.error)),
      (r) => emit(
        state.copyWith(
          status: GenericRequestStatusEnum.success,
          taskStatus: [
            const TaskStatusModel(
              name: 'No Status Assigned',
            ),
            ...r
          ],
        ),
      ),
    );
  }
}
