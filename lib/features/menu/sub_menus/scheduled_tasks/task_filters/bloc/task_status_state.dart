part of 'task_status_bloc.dart';

class TaskStatusState extends Equatable {
  const TaskStatusState({
    this.status = GenericRequestStatusEnum.loading,
    this.taskStatus = const [],
    this.categoryFilters = const [],
  });

  final GenericRequestStatusEnum status;
  final List<TaskStatusModel> taskStatus;
  final List<CategoryFilterModel> categoryFilters;

  TaskStatusState copyWith({
    GenericRequestStatusEnum? status,
    List<TaskStatusModel>? taskStatus,
    List<CategoryFilterModel>? categoryFilters,
  }) {
    return TaskStatusState(
      status: status ?? this.status,
      taskStatus: taskStatus ?? this.taskStatus,
      categoryFilters: categoryFilters ?? this.categoryFilters,
    );
  }

  @override
  List<Object> get props => [
        status,
        taskStatus,
        categoryFilters,
      ];
}
