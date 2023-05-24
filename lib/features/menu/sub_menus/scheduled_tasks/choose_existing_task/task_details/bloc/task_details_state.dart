part of 'task_details_bloc.dart';

enum DeleteStatusEnum {
  initial,
  loading,
  success,
  error,
}

class TaskDetailsState extends Equatable {
  const TaskDetailsState({
    this.status = GenericRequestStatusEnum.initial,
    this.deleteStatus = DeleteStatusEnum.initial,
    this.locationTaggingStatus = LocationTaggingStatusEnum.initial,
    this.relatedBlobCounts = const {},
    this.errorMessage,
    this.taskInfoLevel = const TaskInfoLevelModel(),
  });

  final GenericRequestStatusEnum status;
  final DeleteStatusEnum deleteStatus;
  final LocationTaggingStatusEnum locationTaggingStatus;
  final Map<String, dynamic> relatedBlobCounts;
  final String? errorMessage;
  final TaskInfoLevelModel taskInfoLevel;

  TaskDetailsState copyWith({
    GenericRequestStatusEnum? status,
    DeleteStatusEnum? deleteStatus,
    LocationTaggingStatusEnum? locationTaggingStatus,
    Map<String, dynamic>? relatedBlobCounts,
    String? errorMessage,
    TaskInfoLevelModel? taskInfoLevel,
  }) {
    return TaskDetailsState(
      status: status ?? this.status,
      deleteStatus: deleteStatus ?? this.deleteStatus,
      locationTaggingStatus:
          locationTaggingStatus ?? this.locationTaggingStatus,
      relatedBlobCounts: relatedBlobCounts ?? this.relatedBlobCounts,
      errorMessage: errorMessage ?? this.errorMessage,
      taskInfoLevel: taskInfoLevel ?? this.taskInfoLevel,
    );
  }

  @override
  List<Object> get props => [
        status,
        deleteStatus,
        locationTaggingStatus,
        relatedBlobCounts,
        errorMessage ?? '',
        taskInfoLevel,
      ];
}
