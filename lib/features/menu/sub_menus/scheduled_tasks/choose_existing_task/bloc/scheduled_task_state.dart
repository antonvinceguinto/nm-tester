part of 'scheduled_task_bloc.dart';

class ScheduledTaskState extends Equatable {
  const ScheduledTaskState({
    this.status = GenericRequestStatusEnum.initial,
    this.searchQuery,
    this.taskListModel = const TaskListModel(),
    this.currPage = 1,
    this.errorMessage,
    this.isCalendarOpen = false,
  });

  final GenericRequestStatusEnum status;
  final String? errorMessage;
  final String? searchQuery;
  final TaskListModel taskListModel;
  final int currPage;
  final bool isCalendarOpen;

  ScheduledTaskState copyWith({
    GenericRequestStatusEnum? status,
    String? searchQuery,
    TaskListModel? taskListModel,
    int? currPage,
    String? errorMessage,
    bool? isCalendarOpen,
  }) {
    return ScheduledTaskState(
      status: status ?? this.status,
      searchQuery: searchQuery ?? this.searchQuery,
      taskListModel: taskListModel ?? this.taskListModel,
      currPage: currPage ?? this.currPage,
      errorMessage: errorMessage ?? this.errorMessage,
      isCalendarOpen: isCalendarOpen ?? this.isCalendarOpen,
    );
  }

  @override
  List<Object> get props => [
        status,
        searchQuery ?? '',
        taskListModel,
        currPage,
        errorMessage ?? '',
        isCalendarOpen,
      ];
}
