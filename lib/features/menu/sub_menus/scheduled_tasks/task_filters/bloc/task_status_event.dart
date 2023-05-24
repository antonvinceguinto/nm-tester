part of 'task_status_bloc.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> get props => [];
}

class TaskStatusFetchEvent extends TaskEvent {
  const TaskStatusFetchEvent();

  @override
  List<Object> get props => [];
}

class TaskCategoryFetchEvent extends TaskEvent {
  const TaskCategoryFetchEvent();

  @override
  List<Object> get props => [];
}
