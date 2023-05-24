part of 'add_job_bloc.dart';

abstract class AddJobEvent extends Equatable {
  const AddJobEvent();
}

class RemoveSelectedTask extends AddJobEvent {
  const RemoveSelectedTask();

  @override
  List<Object> get props => [];
}

class AddExistingTask extends AddJobEvent {
  const AddExistingTask({
    required this.selectedTask,
  });

  final TaskInfoLevelModel selectedTask;

  AddExistingTask copyWith({
    TaskInfoLevelModel? selectedTask,
  }) {
    return AddExistingTask(
      selectedTask: selectedTask ?? this.selectedTask,
    );
  }

  @override
  List<Object> get props => [
        selectedTask,
      ];
}

class AddNewJobEvent extends AddJobEvent {
  const AddNewJobEvent({
    required this.job,
    this.isUpdate = false,
    this.jobId,
  });

  final JobInfoLevelModel job;
  final bool isUpdate;
  final int? jobId;

  @override
  List<Object> get props => [
        job,
        isUpdate,
        jobId ?? -1,
      ];
}
