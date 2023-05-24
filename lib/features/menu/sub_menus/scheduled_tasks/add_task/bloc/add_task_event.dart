part of 'add_task_bloc.dart';

class AddTaskEvent extends Equatable {
  const AddTaskEvent();
  @override
  List<Object> get props => [];
}

class AddNewTaskEvent extends AddTaskEvent {
  const AddNewTaskEvent({
    // required this.title,
    required this.taskInfoLevelModel,
    // this.details = '',
    // this.address = '',
    // this.bookingContacts,
    // this.bookingClientId,
    // required this.bookEnd,
    // required this.bookStart,
    // // required this.isDisplayedOnTimeline,
    // this.jobId,
    // this.priorityId,
    // this.recurrencePattern,
    // this.reccurenceText,
    // this.siteContactId,
    // this.userCategoryId,
    // this.importanceId,
    // this.taskId,
    this.updateMode = '',
    // this.updatedDate,
    required this.context,
  });

  // final String title;
  // final String details;
  // final String address;
  // final List<int>? bookingContacts;
  // final int? bookingClientId;
  // final DateTime bookEnd;
  // final DateTime bookStart;
  // // final bool isDisplayedOnTimeline;
  // final int? jobId;
  // final int? priorityId;
  // final String? recurrencePattern;
  // final String? reccurenceText;
  // final int? siteContactId;
  // final int? userCategoryId;
  // final int? importanceId;
  // final int? taskId;
  final TaskInfoLevelModel taskInfoLevelModel;
  final String updateMode;
  // final DateTime? updatedDate;
  final BuildContext context;

  @override
  List<Object> get props => [
        taskInfoLevelModel,
        // jobId ?? -1,
        // title,
        // details,
        // address,
        // bookingContacts ?? const [],
        // bookingClientId ?? -1,
        // bookEnd,
        // bookStart,
        // // isDisplayedOnTimeline,
        // priorityId ?? -1,
        // recurrencePattern ?? '',
        // reccurenceText ?? '',
        // siteContactId ?? -1,
        // userCategoryId ?? -1,
        // importanceId ?? -1,
        // taskId ?? -1,
        updateMode,
        // updatedDate ?? DateTime.now(),
        context,
      ];
}

class ATSelectJobEvent extends AddTaskEvent {
  const ATSelectJobEvent({
    this.selectedJob,
    this.isRemove = false,
  });

  final JobInfoLevelModel? selectedJob;
  final bool isRemove;

  @override
  List<Object> get props => [
        selectedJob ?? const JobInfoLevelModel(),
        isRemove,
      ];
}
