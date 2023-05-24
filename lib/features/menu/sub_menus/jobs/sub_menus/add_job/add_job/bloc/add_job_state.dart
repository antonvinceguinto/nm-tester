part of 'add_job_bloc.dart';

class AddJobState extends Equatable {
  const AddJobState({
    this.status = GenericRequestStatusEnum.initial,
    this.errorMessage,
    this.selectedTask,
  });

  final GenericRequestStatusEnum status;
  final String? errorMessage;
  final TaskInfoLevelModel? selectedTask;

  AddJobState copyWith({
    GenericRequestStatusEnum? status,
    String? errorMessage,
    TaskInfoLevelModel? selectedTask,
  }) {
    return AddJobState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      selectedTask: selectedTask ?? this.selectedTask,
    );
  }

  @override
  List<Object> get props => [
        status,
        errorMessage ?? '',
        selectedTask ?? const TaskInfoLevelModel(),
      ];
}
