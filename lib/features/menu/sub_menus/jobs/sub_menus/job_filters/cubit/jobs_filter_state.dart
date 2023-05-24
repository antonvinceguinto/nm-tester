part of 'jobs_filter_cubit.dart';

class JobsFilterState extends Equatable {
  const JobsFilterState({
    this.status = GenericRequestStatusEnum.initial,
    this.finalFilterData = const {},
    this.search = '',
    this.selectedStatusFilters,
    this.selectedTypeFilters,
    this.selectedPricingTypeFilters,
    this.selectedPriorityFilters,
    this.isUnscheduledJobsSelected = false,
    this.isInternalJobsSelected = false,
    this.isOnlyShowCompletedJobsSelected = false,
    this.isIncludeCompletedJobsSelected = false,
    this.dateFilters = const [
      'Started',
      'Yesterday',
      'Today',
      'Tomorrow',
      'This Week',
      'Next Week',
      'This Month',
      'Date Range',
    ],
    this.dueDateFilters = const [
      'Overdue',
      'Yesterday',
      'Today',
      'Tomorrow',
      'This Week',
      'Next Week',
      'This Month',
      'Date Range',
    ],
    this.selectedStartDate = '',
    this.selectedDueDate = '',
    this.startDateRange,
    this.dueDateRange,
    this.selectedSite,
    this.selectedCustomers = const [],
    this.selectedAssignedTos = const [],
    this.selectedEnabledCustomers = const [],
    this.selectedEnabledAssignedTos = const [],
    this.isCustomerFilterEnabled = false,
    this.isAssignedToFilterEnabled = false,
    this.selectedCreatedBy = const [],
    this.selectedEnabledCreatedBy = const [],
    this.isCreatedByFilterEnabled = false,
  });

  final GenericRequestStatusEnum status;

  /// @dev finalFilterData saves the state of the filter data
  /// to enable fetching with filters when searching.
  /// This stores all the filters selected by the user.
  final Map<String, dynamic> finalFilterData;
  final String search;

  final List<FStatusModel>? selectedStatusFilters;
  final List<FTypeModel>? selectedTypeFilters;
  final List<FPricingTypeModel>? selectedPricingTypeFilters;
  final List<FPriorityModel>? selectedPriorityFilters;

  // ---- Customer Filters
  final bool isCustomerFilterEnabled;
  final List<CustomerDatum> selectedEnabledCustomers;
  final List<CustomerDatum> selectedCustomers;

  // ---- Assigned To Filters
  final bool isAssignedToFilterEnabled;
  final List<CustomerDatum> selectedEnabledAssignedTos;
  final List<CustomerDatum> selectedAssignedTos;

  // ---- Created By Filters
  final bool isCreatedByFilterEnabled;
  final List<CustomerDatum> selectedEnabledCreatedBy;
  final List<CustomerDatum> selectedCreatedBy;

  final CustomerDatum? selectedSite;

  // ---- Date Filters
  final List<String> dateFilters;
  final List<String> dueDateFilters;

  final String selectedStartDate;
  final Map<String, DateTime?>? startDateRange;

  final String selectedDueDate;
  final Map<String, DateTime?>? dueDateRange;
  // ----

  final bool isUnscheduledJobsSelected;
  final bool isInternalJobsSelected;
  final bool isOnlyShowCompletedJobsSelected;
  final bool isIncludeCompletedJobsSelected;

  JobsFilterState copyWith({
    Map<String, dynamic>? finalFilterData,
    String? search,
    // ----
    List<FStatusModel>? selectedStatusFilters,
    List<FTypeModel>? selectedTypeFilters,
    List<FPricingTypeModel>? selectedPricingTypeFilters,
    List<FPriorityModel>? selectedPriorityFilters,
    // ----
    bool? isUnscheduledJobsSelected,
    bool? isInternalJobsSelected,
    bool? isOnlyShowCompletedJobsSelected,
    bool? isIncludeCompletedJobsSelected,
    // ----
    String? selectedStartDate,
    Map<String, DateTime?>? startDateRange,
    String? selectedDueDate,
    Map<String, DateTime?>? dueDateRange,
    List<CustomerDatum>? selectedCustomers,
    List<CustomerDatum>? selectedAssignedTos,
    CustomerDatum? selectedSite,
    List<CustomerDatum>? selectedEnabledCustomers,
    List<CustomerDatum>? selectedEnabledAssignedTos,
    bool? isCustomerFilterEnabled,
    bool? isAssignedToFilterEnabled,
    List<CustomerDatum>? selectedCreatedBy,
    List<CustomerDatum>? selectedEnabledCreatedBy,
    bool? isCreatedByFilterEnabled,
  }) {
    return JobsFilterState(
      finalFilterData: finalFilterData ?? this.finalFilterData,
      search: search ?? this.search,
      // ----
      selectedStatusFilters:
          selectedStatusFilters ?? this.selectedStatusFilters,
      selectedTypeFilters: selectedTypeFilters ?? this.selectedTypeFilters,
      selectedPricingTypeFilters:
          selectedPricingTypeFilters ?? this.selectedPricingTypeFilters,
      selectedPriorityFilters:
          selectedPriorityFilters ?? this.selectedPriorityFilters,
      // ----
      isUnscheduledJobsSelected:
          isUnscheduledJobsSelected ?? this.isUnscheduledJobsSelected,
      isInternalJobsSelected:
          isInternalJobsSelected ?? this.isInternalJobsSelected,
      isOnlyShowCompletedJobsSelected: isOnlyShowCompletedJobsSelected ??
          this.isOnlyShowCompletedJobsSelected,
      isIncludeCompletedJobsSelected:
          isIncludeCompletedJobsSelected ?? this.isIncludeCompletedJobsSelected,
      // ----
      selectedStartDate: selectedStartDate ?? this.selectedStartDate,
      startDateRange: startDateRange ?? this.startDateRange,
      selectedDueDate: selectedDueDate ?? this.selectedDueDate,
      dueDateRange: dueDateRange ?? this.dueDateRange,
      // ----
      selectedCustomers: selectedCustomers ?? this.selectedCustomers,
      selectedAssignedTos: selectedAssignedTos ?? this.selectedAssignedTos,
      selectedSite: selectedSite ?? this.selectedSite,
      selectedEnabledCustomers:
          selectedEnabledCustomers ?? this.selectedEnabledCustomers,
      selectedEnabledAssignedTos:
          selectedEnabledAssignedTos ?? this.selectedEnabledAssignedTos,
      isCustomerFilterEnabled:
          isCustomerFilterEnabled ?? this.isCustomerFilterEnabled,
      isAssignedToFilterEnabled:
          isAssignedToFilterEnabled ?? this.isAssignedToFilterEnabled,
      selectedCreatedBy: selectedCreatedBy ?? this.selectedCreatedBy,
      selectedEnabledCreatedBy:
          selectedEnabledCreatedBy ?? this.selectedEnabledCreatedBy,
      isCreatedByFilterEnabled:
          isCreatedByFilterEnabled ?? this.isCreatedByFilterEnabled,
    );
  }

  // Clear all filters
  JobsFilterState clearAllFilters() {
    return copyWith(
      finalFilterData: {},
      search: '',
      selectedStatusFilters: List<FStatusModel>.empty(growable: true),
      selectedTypeFilters: List<FTypeModel>.empty(growable: true),
      selectedPricingTypeFilters: List<FPricingTypeModel>.empty(growable: true),
      selectedPriorityFilters: List<FPriorityModel>.empty(growable: true),
      isUnscheduledJobsSelected: false,
      isInternalJobsSelected: false,
      isOnlyShowCompletedJobsSelected: false,
      isIncludeCompletedJobsSelected: false,
      selectedStartDate: '',
      startDateRange: {},
      selectedDueDate: '',
      dueDateRange: {},
      selectedCustomers: List<CustomerDatum>.empty(growable: true),
      selectedAssignedTos: List<CustomerDatum>.empty(growable: true),
      selectedEnabledCustomers: List<CustomerDatum>.empty(growable: true),
      selectedEnabledAssignedTos: List<CustomerDatum>.empty(growable: true),
      isCustomerFilterEnabled: false,
      isAssignedToFilterEnabled: false,
      selectedCreatedBy: List<CustomerDatum>.empty(growable: true),
      selectedEnabledCreatedBy: List<CustomerDatum>.empty(growable: true),
      isCreatedByFilterEnabled: false,
    );
  }

  @override
  List<Object> get props => [
        finalFilterData,
        search,
        selectedStatusFilters ?? [''],
        selectedTypeFilters ?? [''],
        selectedPricingTypeFilters ?? [''],
        selectedPriorityFilters ?? [''],
        isUnscheduledJobsSelected,
        isInternalJobsSelected,
        isOnlyShowCompletedJobsSelected,
        isIncludeCompletedJobsSelected,
        selectedStartDate,
        startDateRange ?? Map<String, DateTime?>,
        selectedDueDate,
        dueDateRange ?? Map<String, DateTime?>,
        finalFilterData,
        selectedCustomers,
        selectedAssignedTos,
        selectedSite ?? const CustomerDatum(),
        selectedEnabledCustomers,
        selectedEnabledAssignedTos,
        isCustomerFilterEnabled,
        isAssignedToFilterEnabled,
        selectedCreatedBy,
        selectedEnabledCreatedBy,
        isCreatedByFilterEnabled,
      ];
}
