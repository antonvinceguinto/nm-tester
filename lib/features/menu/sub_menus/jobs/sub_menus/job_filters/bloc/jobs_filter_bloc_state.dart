part of 'jobs_filter_bloc.dart';

class JobsFilterBlocState extends Equatable {
  const JobsFilterBlocState({
    this.status = GenericRequestStatusEnum.initial,
    this.errorMessage,
    this.filterStatusList,
    this.filterTypeList,
    this.filterPricingTypeList,
    this.filterPriorityList,
  });

  final List<FStatusModel>? filterStatusList;
  final List<FTypeModel>? filterTypeList;
  final List<FPricingTypeModel>? filterPricingTypeList;
  final List<FPriorityModel>? filterPriorityList;

  final GenericRequestStatusEnum status;
  final String? errorMessage;

  JobsFilterBlocState copyWith({
    GenericRequestStatusEnum? status,
    String? errorMessage,
    List<FStatusModel>? filterStatusList,
    List<FTypeModel>? filterTypeList,
    List<FPricingTypeModel>? filterPricingTypeList,
    List<FPriorityModel>? filterPriorityList,
  }) {
    return JobsFilterBlocState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      filterStatusList: filterStatusList ?? this.filterStatusList,
      filterTypeList: filterTypeList ?? this.filterTypeList,
      filterPricingTypeList:
          filterPricingTypeList ?? this.filterPricingTypeList,
      filterPriorityList: filterPriorityList ?? this.filterPriorityList,
    );
  }

  @override
  List<Object> get props => [
        status,
        errorMessage ?? '',
        filterStatusList ?? [],
        filterTypeList ?? [],
        filterPricingTypeList ?? [],
        filterPriorityList ?? [],
      ];
}
