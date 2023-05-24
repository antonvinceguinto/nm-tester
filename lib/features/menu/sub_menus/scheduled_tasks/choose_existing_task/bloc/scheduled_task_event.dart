part of 'scheduled_task_bloc.dart';

class ScheduledTaskEvent extends Equatable {
  const ScheduledTaskEvent();

  @override
  List<Object> get props => [];
}

class OpenCalendarEvent extends ScheduledTaskEvent {
  const OpenCalendarEvent({this.isOpen = false});

  final bool isOpen;

  @override
  List<Object> get props => [isOpen];
}

class ScheduledTaskFetchEvent extends ScheduledTaskEvent {
  const ScheduledTaskFetchEvent({
    this.currPage = 1,
    this.searchQuery,
    this.bookingStatusIds,
    this.acceptanceStatus,
    this.priorityIds,
    this.taskCategoryIds,
    this.bookingClient,
    this.bookingContacts,
    this.bookingCreatedBys,
    this.isExcludeArchive = false,
    this.isFromJobs = false,
    this.jobId,
    this.startDate,
    this.endDate,
    this.isArchived = false,
    this.originDate,
  });

  final int currPage;
  final String? searchQuery;
  final List<int?>? bookingStatusIds;
  final List<String>? acceptanceStatus;
  final List<int?>? priorityIds;
  final List<int?>? taskCategoryIds;
  final List<int>? bookingClient;
  final List<int>? bookingContacts;
  final List<int>? bookingCreatedBys;
  final bool isExcludeArchive;
  final bool isFromJobs;
  final int? jobId;
  final DateTime? startDate;
  final DateTime? endDate;
  final bool isArchived;
  final DateTime? originDate;

  @override
  List<Object> get props => [
        currPage,
        searchQuery ?? '',
        bookingStatusIds ?? [],
        acceptanceStatus ?? [],
        priorityIds ?? [],
        taskCategoryIds ?? [],
        bookingClient ?? [],
        bookingContacts ?? [],
        bookingCreatedBys ?? [],
        isExcludeArchive,
        isFromJobs,
        jobId ?? 0,
        startDate ?? DateTime.now(),
        endDate ?? DateTime.now(),
        isArchived,
        originDate ?? DateTime.now(),
      ];
}
