part of 'job_details_bloc.dart';

abstract class JobDetailsEvent extends Equatable {
  const JobDetailsEvent();
}

class JobDetailsFetchEvent extends JobDetailsEvent {
  const JobDetailsFetchEvent({
    required this.jobId,
    required this.infoLevel,
  });

  final int jobId;
  final String infoLevel;

  @override
  List<Object> get props => [
        jobId,
        infoLevel,
      ];
}

class UpdateJobStatusEvent extends JobDetailsEvent {
  const UpdateJobStatusEvent({
    required this.jobId,
    required this.jobStatusId,
  });

  final int jobId;
  final int jobStatusId;

  @override
  List<Object> get props => [
        jobId,
        jobStatusId,
      ];
}

class RemoveLinkedTaskEvent extends JobDetailsEvent {
  const RemoveLinkedTaskEvent({
    required this.jobId,
    this.isDeleteBooking = false,
  });

  final int jobId;
  final bool isDeleteBooking;

  @override
  List<Object> get props => [
        jobId,
        isDeleteBooking,
      ];
}

class DeleteJobEvent extends JobDetailsEvent {
  const DeleteJobEvent({
    required this.jobId,
    this.isDeleteTask = false,
  });

  final int jobId;
  final bool isDeleteTask;

  @override
  List<Object> get props => [
        jobId,
        isDeleteTask,
      ];
}

class AddOnSiteLocationEvent extends JobDetailsEvent {
  const AddOnSiteLocationEvent({
    required this.context,
    this.jobId,
  });

  final BuildContext context;
  final int? jobId;

  @override
  List<Object> get props => [
        context,
        jobId ?? -1,
      ];
}
