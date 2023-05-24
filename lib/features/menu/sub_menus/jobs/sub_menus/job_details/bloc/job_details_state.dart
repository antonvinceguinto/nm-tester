part of 'job_details_bloc.dart';

enum LocationTaggingStatusEnum {
  initial,
  loading,
  success,
  error,
}

class JobDetailsState extends Equatable {
  const JobDetailsState({
    this.status = GenericRequestStatusEnum.initial,
    this.locationTaggingStatus = LocationTaggingStatusEnum.initial,
    this.relatedBlobCounts = const {},
    this.errorMessage,
    this.jobInfoLevel = const JobInfoLevelModel(),
  });

  final GenericRequestStatusEnum status;
  final LocationTaggingStatusEnum locationTaggingStatus;
  final Map<String, dynamic> relatedBlobCounts;
  final String? errorMessage;
  final JobInfoLevelModel jobInfoLevel;

  JobDetailsState copyWith({
    GenericRequestStatusEnum? status,
    LocationTaggingStatusEnum? locationTaggingStatus,
    Map<String, dynamic>? relatedBlobCounts,
    String? errorMessage,
    JobInfoLevelModel? jobInfoLevel,
  }) {
    return JobDetailsState(
      status: status ?? this.status,
      locationTaggingStatus:
          locationTaggingStatus ?? this.locationTaggingStatus,
      relatedBlobCounts: relatedBlobCounts ?? this.relatedBlobCounts,
      errorMessage: errorMessage ?? this.errorMessage,
      jobInfoLevel: jobInfoLevel ?? this.jobInfoLevel,
    );
  }

  @override
  List<Object> get props => [
        status,
        locationTaggingStatus,
        relatedBlobCounts,
        errorMessage ?? '',
        jobInfoLevel,
      ];
}
