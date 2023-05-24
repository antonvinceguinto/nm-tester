part of 'task_details_bloc.dart';

abstract class TaskDetailsEvent extends Equatable {
  const TaskDetailsEvent();

  @override
  List<Object> get props => [];
}

class UpdateTaskStatusEvent extends TaskDetailsEvent {
  const UpdateTaskStatusEvent({
    required this.taskId,
    required this.statusId,
  });

  final int taskId;
  final int statusId;

  @override
  List<Object> get props => [
        taskId,
        statusId,
      ];
}

class AddOnSiteLocationTaskEvent extends TaskDetailsEvent {
  const AddOnSiteLocationTaskEvent({
    required this.context,
    this.bookKey,
  });

  final BuildContext context;
  final String? bookKey;

  @override
  List<Object> get props => [
        context,
        bookKey ?? -1,
      ];
}

class TaskDeleteEvent extends TaskDetailsEvent {
  const TaskDeleteEvent({
    required this.taskId,
    required this.selectedDate,
    required this.occurrenceType,
  });

  final int taskId;
  final DateTime selectedDate;
  final String occurrenceType;

  @override
  List<Object> get props => [
        taskId,
        selectedDate,
        occurrenceType,
      ];
}

class TaskDetailsFetchEvent extends TaskDetailsEvent {
  const TaskDetailsFetchEvent({
    required this.taskId,
    required this.infoLevel,
    required this.bookOccurrenceKey,
  });

  final int taskId;
  final String infoLevel;
  final String bookOccurrenceKey;

  @override
  List<Object> get props => [
        taskId,
        infoLevel,
        bookOccurrenceKey,
      ];
}
