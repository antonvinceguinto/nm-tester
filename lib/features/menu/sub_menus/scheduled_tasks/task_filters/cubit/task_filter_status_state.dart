part of 'task_filter_status_cubit.dart';

class TaskFilterStatusState extends Equatable {
  const TaskFilterStatusState({
    this.selectedTaskStatuses,
  });

  final List<TaskStatusModel>? selectedTaskStatuses;

  TaskFilterStatusState copyWith({
    List<TaskStatusModel>? selectedTaskStatuses,
  }) {
    return TaskFilterStatusState(
      selectedTaskStatuses: selectedTaskStatuses ?? this.selectedTaskStatuses,
    );
  }

  @override
  List<Object> get props => [
        selectedTaskStatuses ?? [],
      ];
}
