import 'package:api_service/api_service.dart';
import 'package:equatable/equatable.dart';
import 'package:nextminute/features/utils/generic_status_enum.dart';

class JobsState extends Equatable {
  const JobsState({
    this.status = GenericRequestStatusEnum.initial,
    this.jobs = JobsListModel.empty,
    this.jobsList,
    this.errorMessage,
    this.currentSkip = 0,
  });

  final GenericRequestStatusEnum status;
  final String? errorMessage;
  final JobsListModel jobs;
  final List<JobInfoLevelModel>? jobsList;
  final int currentSkip;

  JobsState copyWith({
    GenericRequestStatusEnum? status,
    JobsListModel? jobs,
    List<JobInfoLevelModel>? jobsList,
    String? errorMessage,
    int? currentSkip,
  }) {
    return JobsState(
      status: status ?? this.status,
      jobs: jobs ?? this.jobs,
      jobsList: jobsList ?? this.jobsList,
      errorMessage: errorMessage ?? this.errorMessage,
      currentSkip: currentSkip ?? this.currentSkip,
    );
  }

  @override
  List<Object> get props => [
        status,
        jobs,
        jobsList ?? [],
        errorMessage ?? '',
        currentSkip,
      ];
}
