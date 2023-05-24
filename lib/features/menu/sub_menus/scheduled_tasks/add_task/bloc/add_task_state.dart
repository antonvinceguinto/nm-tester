part of 'add_task_bloc.dart';

class AddTaskState extends Equatable {
  const AddTaskState({
    this.status = GenericRequestStatusEnum.initial,
    this.selectedJob,
    this.errorMessage,
  });

  final GenericRequestStatusEnum status;
  final JobInfoLevelModel? selectedJob;
  final String? errorMessage;

  AddTaskState copyWith({
    GenericRequestStatusEnum? status,
    JobInfoLevelModel? selectedJob,
    String? errorMessage,
  }) {
    return AddTaskState(
      status: status ?? this.status,
      selectedJob: selectedJob ?? this.selectedJob,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [
        status,
        selectedJob ?? const JobInfoLevelModel(),
        errorMessage ?? '',
      ];
}
