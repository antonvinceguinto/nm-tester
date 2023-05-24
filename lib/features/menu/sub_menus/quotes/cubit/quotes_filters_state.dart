part of 'quotes_filters_cubit.dart';

class QuotesFiltersState extends Equatable {
  const QuotesFiltersState({
    this.filters = const {},
    this.tempFilters = const {},
    this.selectedQuoteDate = '',
    this.tempSelectedQuoteDate = '',
    this.quoteDateRange = const {},
    this.tempQuoteDateFilters = const {},
    this.quoteDateFilters = const {},
    this.isJobFilterEnabled = false,
    this.selectedEnabledJobs = const [],
    this.selectedJobs = const [],
    this.tempSelectedJobsFromJobsPage = const [],
    this.selectedCustomDateType = '',
    this.selectedCustomDate = '',
    this.tempSelectedCustomDate = '',
    this.customDateRange = const {},
    this.tempCustomDateFilters = const {},
    this.customDateFilters = const {},
    this.selectedOrderStatus,
  });

  final Map<String, dynamic> filters;
  final Map<String, dynamic> tempFilters;

  // Quote Date Filter
  final String selectedQuoteDate;
  final String tempSelectedQuoteDate;
  final Map<String, DateTime?> quoteDateRange;
  final Map<String, dynamic> tempQuoteDateFilters;
  final Map<String, dynamic> quoteDateFilters;

  // Job Filter
  final bool isJobFilterEnabled;
  final List<JobInfoLevelModel> selectedEnabledJobs;
  final List<JobInfoLevelModel> selectedJobs;
  final List<JobInfoLevelModel> tempSelectedJobsFromJobsPage;

  // Custom Date Filter
  final String selectedCustomDateType;
  final String selectedCustomDate;
  final String tempSelectedCustomDate;
  final Map<String, DateTime?> customDateRange;
  final Map<String, dynamic> tempCustomDateFilters;
  final Map<String, dynamic> customDateFilters;

  // Order Status
  final List<FPricingTypeModel>? selectedOrderStatus;

  // --- copyWith ---
  QuotesFiltersState copyWith({
    Map<String, dynamic>? filters,
    Map<String, dynamic>? tempFilters,

    // Quote Date Filter
    String? selectedQuoteDate,
    String? tempSelectedQuoteDate,
    Map<String, DateTime?>? quoteDateRange,
    Map<String, dynamic>? tempQuoteDateFilters,
    Map<String, dynamic>? quoteDateFilters,

    // Job Filter
    bool? isJobFilterEnabled,
    List<JobInfoLevelModel>? selectedEnabledJobs,
    List<JobInfoLevelModel>? selectedJobs,
    List<JobInfoLevelModel>? tempSelectedJobsFromJobsPage,

    // Quote Date Filter
    String? selectedCustomDateType,
    String? selectedCustomDate,
    String? tempSelectedCustomDate,
    Map<String, DateTime?>? customDateRange,
    Map<String, dynamic>? tempCustomDateFilters,
    Map<String, dynamic>? customDateFilters,

    // Order Status
    List<FPricingTypeModel>? selectedOrderStatus,
  }) {
    return QuotesFiltersState(
      filters: filters ?? this.filters,
      tempFilters: tempFilters ?? this.tempFilters,
      selectedQuoteDate: selectedQuoteDate ?? this.selectedQuoteDate,
      tempSelectedQuoteDate:
          tempSelectedQuoteDate ?? this.tempSelectedQuoteDate,
      quoteDateRange: quoteDateRange ?? this.quoteDateRange,
      tempQuoteDateFilters: tempQuoteDateFilters ?? this.tempQuoteDateFilters,
      quoteDateFilters: quoteDateFilters ?? this.quoteDateFilters,
      isJobFilterEnabled: isJobFilterEnabled ?? this.isJobFilterEnabled,
      selectedEnabledJobs: selectedEnabledJobs ?? this.selectedEnabledJobs,
      selectedJobs: selectedJobs ?? this.selectedJobs,
      tempSelectedJobsFromJobsPage:
          tempSelectedJobsFromJobsPage ?? this.tempSelectedJobsFromJobsPage,
      selectedCustomDateType:
          selectedCustomDateType ?? this.selectedCustomDateType,
      selectedCustomDate: selectedCustomDate ?? this.selectedCustomDate,
      tempSelectedCustomDate:
          tempSelectedCustomDate ?? this.tempSelectedCustomDate,
      customDateRange: customDateRange ?? this.customDateRange,
      tempCustomDateFilters:
          tempCustomDateFilters ?? this.tempCustomDateFilters,
      customDateFilters: customDateFilters ?? this.customDateFilters,
      selectedOrderStatus: selectedOrderStatus ?? this.selectedOrderStatus,
    );
  }

  @override
  List<Object> get props => [
        filters,
        tempFilters,
        selectedQuoteDate,
        tempSelectedQuoteDate,
        quoteDateRange,
        tempQuoteDateFilters,
        quoteDateFilters,
        isJobFilterEnabled,
        selectedEnabledJobs,
        selectedJobs,
        tempSelectedJobsFromJobsPage,
        selectedCustomDateType,
        selectedCustomDate,
        tempSelectedCustomDate,
        customDateRange,
        tempCustomDateFilters,
        customDateFilters,
        selectedOrderStatus ?? [],
      ];
}
