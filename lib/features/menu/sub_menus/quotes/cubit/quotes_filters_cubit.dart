import 'package:api_service/api_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:nextminute/core/utils/extensions.dart';

part 'quotes_filters_state.dart';

class QuotesFiltersCubit extends Cubit<QuotesFiltersState> {
  QuotesFiltersCubit() : super(const QuotesFiltersState());

  void updateSelectedOrderStatus(
    FPricingTypeModel id, {
    required bool isChecked,
  }) {
    final selectedOrderStatus = state.selectedOrderStatus != null
        ? List<FPricingTypeModel>.from(state.selectedOrderStatus!)
        : <FPricingTypeModel>[];

    if (isChecked) {
      selectedOrderStatus.add(id);
    } else {
      selectedOrderStatus.remove(id);
    }

    emit(
      state.copyWith(
        selectedOrderStatus: selectedOrderStatus,
      ),
    );
  }

  void clearSelectedOrderStatus() {
    emit(
      state.copyWith(
        selectedOrderStatus: [],
      ),
    );
  }

  // --- Custom Date Filter ---
  void saveCustomDateRange({
    required DateTime selectedDate,
    required bool isStart,
  }) {
    if (isStart) {
      emit(
        state.copyWith(
          customDateRange: {
            'start': selectedDate,
            'end': state.customDateRange['end'],
          },
        ),
      );
    } else {
      emit(
        state.copyWith(
          customDateRange: {
            'start': state.customDateRange['start'],
            'end': selectedDate,
          },
        ),
      );
    }

    addCustomDateFilter('Date Range');
  }

  void saveCustomDateType(String label) =>
      emit(state.copyWith(selectedCustomDateType: label));

  void addCustomDateFilter(String label) {
    final dateFormat = DateFormat('yyyy-MM-dd');

    final dFilter = <String, dynamic>{};

    final customDateType = state.selectedCustomDateType;

    if (customDateType == 'Expiry Date' || customDateType == 'Due Date') {
      if (label == 'Expired' || label == 'Overdue') {
        dFilter['DueDateTo'] = dateFormat.format(DateTime.now());
      } else if (label == 'Yesterday') {
        final dateYesterday =
            dateFormat.format(DateTime.now().subtract(const Duration(days: 1)));
        dFilter['DueDateFrom'] = dateYesterday;
        dFilter['DueDateTo'] = dateYesterday;
      } else if (label == 'Today') {
        final now = DateTime.now();
        dFilter['DueDateFrom'] = dateFormat.format(now);
        dFilter['DueDateTo'] = dateFormat.format(now);
      } else if (label == 'Tomorrow') {
        final dateTomorrow =
            dateFormat.format(DateTime.now().add(const Duration(days: 1)));
        dFilter['DueDateFrom'] = dateTomorrow;
        dFilter['DueDateTo'] = dateTomorrow;
      } else if (label == 'This Week') {
        final now = DateTime.now().toUtc();
        final firstDayOfWeek = now.subtract(Duration(days: now.weekday));
        final lastDayOfWeek = firstDayOfWeek.add(const Duration(days: 6));

        dFilter['DueDateFrom'] = dateFormat.format(firstDayOfWeek);
        dFilter['DueDateTo'] = dateFormat.format(lastDayOfWeek);
      } else if (label == 'Next Week') {
        final now = DateTime.now().toUtc();
        final firstDayOfWeek = now.subtract(Duration(days: now.weekday));
        final lastDayOfWeek = firstDayOfWeek.add(const Duration(days: 6));
        final firstDayOfNextWeek = lastDayOfWeek.add(const Duration(days: 1));
        final lastDayOfNextWeek =
            firstDayOfNextWeek.add(const Duration(days: 6));

        dFilter['DueDateFrom'] = dateFormat.format(firstDayOfNextWeek);
        dFilter['DueDateTo'] = dateFormat.format(lastDayOfNextWeek);
      } else if (label == 'This Month') {
        final now = DateTime.now().toUtc();
        final firstDayOfMonth = DateTime(now.year, now.month);
        final lastDayOfMonth = DateTime(now.year, now.month + 1, 0);

        dFilter['DueDateFrom'] = dateFormat.format(firstDayOfMonth);
        dFilter['DueDateTo'] = dateFormat.format(lastDayOfMonth);
      } else if (label == 'Date Range') {
        if (state.customDateRange['start'] != null) {
          dFilter['DueDateFrom'] =
              dateFormat.format(state.customDateRange['start']!);
        }
        if (state.customDateRange['end'] != null) {
          dFilter['DueDateTo'] =
              dateFormat.format(state.customDateRange['end']!);
        }
      }
    } else if (customDateType == 'Created Date') {
      if (label == 'Yesterday') {
        final dateYesterday =
            dateFormat.format(DateTime.now().subtract(const Duration(days: 1)));
        dFilter['CreateDateFrom'] = dateYesterday;
        dFilter['CreateDateTo'] = dateYesterday;
      } else if (label == 'Today') {
        final now = DateTime.now();
        dFilter['CreateDateFrom'] = dateFormat.format(now);
        dFilter['CreateDateTo'] = dateFormat.format(now);
      } else if (label == 'This Week') {
        final now = DateTime.now().toUtc();
        final firstDayOfWeek = now.subtract(Duration(days: now.weekday));
        final lastDayOfWeek = firstDayOfWeek.add(const Duration(days: 6));

        dFilter['CreateDateFrom'] = dateFormat.format(firstDayOfWeek);
        dFilter['CreateDateTo'] = dateFormat.format(lastDayOfWeek);
      } else if (label == 'This Month') {
        final now = DateTime.now().toUtc();
        final firstDayOfMonth = DateTime(now.year, now.month);
        final lastDayOfMonth = DateTime(now.year, now.month + 1, 0);

        dFilter['CreateDateFrom'] = dateFormat.format(firstDayOfMonth);
        dFilter['CreateDateTo'] = dateFormat.format(lastDayOfMonth);
      } else if (label == 'Date Range') {
        if (state.customDateRange['start'] != null) {
          dFilter['CreateDateFrom'] =
              dateFormat.format(state.customDateRange['start']!);
        }
        if (state.customDateRange['end'] != null) {
          dFilter['CreateDateTo'] =
              dateFormat.format(state.customDateRange['end']!);
        }
      }
    } else {
      if (label == 'Yesterday') {
        final dateYesterday =
            dateFormat.format(DateTime.now().subtract(const Duration(days: 1)));
        dFilter['UpdateDateFrom'] = dateYesterday;
        dFilter['UpdateDateTo'] = dateYesterday;
      } else if (label == 'Today') {
        final now = DateTime.now();
        dFilter['UpdateDateFrom'] = dateFormat.format(now);
        dFilter['UpdateDateTo'] = dateFormat.format(now);
      } else if (label == 'This Week') {
        final now = DateTime.now().toUtc();
        final firstDayOfWeek = now.subtract(Duration(days: now.weekday));
        final lastDayOfWeek = firstDayOfWeek.add(const Duration(days: 6));

        dFilter['UpdateDateFrom'] = dateFormat.format(firstDayOfWeek);
        dFilter['UpdateDateTo'] = dateFormat.format(lastDayOfWeek);
      } else if (label == 'This Month') {
        final now = DateTime.now().toUtc();
        final firstDayOfMonth = DateTime(now.year, now.month);
        final lastDayOfMonth = DateTime(now.year, now.month + 1, 0);

        dFilter['UpdateDateFrom'] = dateFormat.format(firstDayOfMonth);
        dFilter['UpdateDateTo'] = dateFormat.format(lastDayOfMonth);
      } else if (label == 'Date Range') {
        if (state.customDateRange['start'] != null) {
          dFilter['UpdateDateFrom'] =
              dateFormat.format(state.customDateRange['start']!);
        }
        if (state.customDateRange['end'] != null) {
          dFilter['UpdateDateTo'] =
              dateFormat.format(state.customDateRange['end']!);
        }
      }
    }

    dFilter['CustomDateOn'] = label;

    emit(
      state.copyWith(
        tempSelectedCustomDate: label,
        tempCustomDateFilters: dFilter,
      ),
    );
  }

  // --- End Custom Date Filter ---

  // --- Job Filter ---
  void toggleJobFilter() {
    emit(
      state.copyWith(
        isJobFilterEnabled: !state.isJobFilterEnabled,
      ),
    );
  }

  void applyJobFilterFromSelectPage() {
    emit(
      state.copyWith(
        selectedJobs: state.tempSelectedJobsFromJobsPage,
        selectedEnabledJobs: state.tempSelectedJobsFromJobsPage,
      ),
    );
  }

  void selectAllJobsFromJobsPage(List<JobInfoLevelModel> jobs) {
    emit(
      state.copyWith(
        tempSelectedJobsFromJobsPage: jobs,
      ),
    );
  }

  void selectNonFromJobsPage() {
    emit(
      state.copyWith(
        tempSelectedJobsFromJobsPage: [],
      ),
    );
  }

  void addTempSelectedJobsFromJobsPage(JobInfoLevelModel job) {
    final updatedTempSelectedJobsFromJobsPage =
        List<JobInfoLevelModel>.from(state.tempSelectedJobsFromJobsPage);

    if (updatedTempSelectedJobsFromJobsPage.contains(job)) {
      updatedTempSelectedJobsFromJobsPage.remove(job);
    } else {
      updatedTempSelectedJobsFromJobsPage.add(job);
    }

    emit(
      state.copyWith(
        tempSelectedJobsFromJobsPage: updatedTempSelectedJobsFromJobsPage,
      ),
    );
  }

  void clearSelectedJobs() {
    emit(
      state.copyWith(
        selectedJobs: [],
        selectedEnabledJobs: [],
        tempSelectedJobsFromJobsPage: [],
      ),
    );
  }

  void toggleJobEnabled(JobInfoLevelModel job) {
    // toggle means enabling/disabling the selected job. This is separate from
    // adding the selected job to the list of selected Jobs.
    final updatedSelectedEnabledJobs =
        List<JobInfoLevelModel>.from(state.selectedEnabledJobs);
    if (updatedSelectedEnabledJobs.contains(job)) {
      updatedSelectedEnabledJobs.remove(job);
    } else {
      updatedSelectedEnabledJobs.add(job);
    }

    emit(state.copyWith(selectedEnabledJobs: updatedSelectedEnabledJobs));
  }
  // --- End Job Filter ---

  // --- Quote Date Filter ---
  void saveDateFilter({
    required DateTime selectedDate,
    required bool isStart,
  }) {
    if (isStart) {
      emit(
        state.copyWith(
          quoteDateRange: {
            'start': selectedDate,
            'end': state.quoteDateRange['end'],
          },
        ),
      );
    } else {
      emit(
        state.copyWith(
          quoteDateRange: {
            'start': state.quoteDateRange['start'],
            'end': selectedDate,
          },
        ),
      );
    }

    addQuoteDateFilter('Date Range');
  }

  void addQuoteDateFilter(String label) {
    final dateFormat = DateFormat('yyyy-MM-dd');

    final dFilter = <String, dynamic>{};

    if (label == 'Expired' || label == 'Overdue') {
      dFilter['BillableDateTo'] = dateFormat.format(DateTime.now());
    } else if (label == 'Yesterday') {
      final dateYesterday =
          dateFormat.format(DateTime.now().subtract(const Duration(days: 1)));
      dFilter['BillableDateFrom'] = dateYesterday;
      dFilter['BillableDateTo'] = dateYesterday;
    } else if (label == 'Today') {
      final now = DateTime.now();
      dFilter['BillableDateFrom'] = dateFormat.format(now);
      dFilter['BillableDateTo'] = dateFormat.format(now);
    } else if (label == 'Tomorrow') {
      final dateTomorrow =
          dateFormat.format(DateTime.now().add(const Duration(days: 1)));
      dFilter['BillableDateFrom'] = dateTomorrow;
      dFilter['BillableDateTo'] = dateTomorrow;
    } else if (label == 'This Week') {
      final now = DateTime.now().toUtc();
      final firstDayOfWeek = now.subtract(Duration(days: now.weekday));
      final lastDayOfWeek = firstDayOfWeek.add(const Duration(days: 6));

      dFilter['BillableDateFrom'] = dateFormat.format(firstDayOfWeek);
      dFilter['BillableDateTo'] = dateFormat.format(lastDayOfWeek);
    } else if (label == 'Next Week') {
      final now = DateTime.now().toUtc();
      final firstDayOfWeek = now.subtract(Duration(days: now.weekday));
      final lastDayOfWeek = firstDayOfWeek.add(const Duration(days: 6));
      final firstDayOfNextWeek = lastDayOfWeek.add(const Duration(days: 1));
      final lastDayOfNextWeek = firstDayOfNextWeek.add(const Duration(days: 6));

      dFilter['BillableDateFrom'] = dateFormat.format(firstDayOfNextWeek);
      dFilter['BillableDateTo'] = dateFormat.format(lastDayOfNextWeek);
    } else if (label == 'This Month') {
      final now = DateTime.now().toUtc();
      final firstDayOfMonth = DateTime(now.year, now.month);
      final lastDayOfMonth = DateTime(now.year, now.month + 1, 0);

      dFilter['BillableDateFrom'] = dateFormat.format(firstDayOfMonth);
      dFilter['BillableDateTo'] = dateFormat.format(lastDayOfMonth);
    } else if (label == 'Date Range') {
      if (state.quoteDateRange['start'] != null) {
        dFilter['BillableDateFrom'] =
            dateFormat.format(state.quoteDateRange['start']!);
      }
      if (state.quoteDateRange['end'] != null) {
        dFilter['BillableDateTo'] =
            dateFormat.format(state.quoteDateRange['end']!);
      }
    }

    dFilter['QuoteDateOn'] = label;

    emit(
      state.copyWith(
        tempSelectedQuoteDate: label,
        tempQuoteDateFilters: dFilter,
      ),
    );
  }
  // --- End Quote Date Filter ---

  // --- Finalize filter functions ---
  void addFilter(String key, dynamic value) {
    emit(
      state.copyWith(
        filters: {
          ...state.filters,
          key: value,
        },
      ),
    );
  }

  void addTempFilter(String key, dynamic value) {
    if (state.tempFilters.containsKey(key)) {
      final updatedTempFilters = Map.of(state.tempFilters)..remove(key);
      emit(
        state.copyWith(
          tempFilters: updatedTempFilters,
        ),
      );
    } else {
      emit(
        state.copyWith(
          tempFilters: {
            ...state.tempFilters,
            key: value,
          },
        ),
      );
    }
  }

  void applyTempFilters(
    List<FPricingTypeModel> selectedPricingTypes,
    List<int> selectedContactIds,
    List<int> selectedOrderStatus,
  ) {
    final tempFilters = {...state.tempFilters};
    final updatedQuoteDateFilters = {...state.tempQuoteDateFilters};
    final updatedCustomDateFilters = {...state.tempCustomDateFilters};

    // JobIds
    if (state.selectedEnabledJobs.isNotEmpty && state.isJobFilterEnabled) {
      tempFilters['JobIds'] =
          state.selectedEnabledJobs.map((e) => e.job_id).toList();
    } else {
      tempFilters.remove('JobIds');
    }

    // ContactIds
    if (selectedContactIds.isNotEmpty) {
      tempFilters['ContactIds'] = selectedContactIds;
    } else {
      tempFilters.remove('ContactIds');
    }

    // OrderStatus
    if (selectedOrderStatus.isNotEmpty) {
      tempFilters['OrderStatus'] = '"${selectedOrderStatus.join(',')}"';
    } else {
      tempFilters.remove('OrderStatus');
    }

    // JobPricingType
    tempFilters.updateOrRemove('JobPricingType', selectedPricingTypes, (list) {
      return '"${list.map((e) => e.id).join(',')}"';
    });

    // QuoteDateFilter
    _handleQuoteDateFilter(tempFilters, updatedQuoteDateFilters);

    // CustomDateFilter
    _handleCustomDateFilter(tempFilters, updatedCustomDateFilters);

    tempFilters
      ..addAll(updatedQuoteDateFilters)
      ..addAll(updatedCustomDateFilters);

    emit(
      state.copyWith(
        selectedQuoteDate: state.tempSelectedQuoteDate,
        selectedCustomDate: state.tempSelectedCustomDate,
        filters: tempFilters,
        selectedEnabledJobs: state.selectedEnabledJobs,
      ),
    );
  }

  void _handleQuoteDateFilter(
    Map<String, dynamic> tempFilters,
    Map<String, dynamic> updatedQuoteDateFilters,
  ) {
    if (updatedQuoteDateFilters.isNotEmpty) {
      final quoteDateOn = updatedQuoteDateFilters['QuoteDateOn'];
      final keysToRemove = [
        'QuoteDateOn',
        'BillableDateTo',
        'BillableDateFrom'
      ];

      switch (quoteDateOn) {
        case 'Expired':
          updatedQuoteDateFilters.remove('BillableDateFrom');
          tempFilters.remove('BillableDateFrom');
          break;
        case 'Overdue':
          updatedQuoteDateFilters.remove('BillableDateFrom');
          tempFilters.remove('BillableDateFrom');
          break;
        case 'Date Range':
          if (state.quoteDateRange['start'] == null) {
            tempFilters.remove('BillableDateFrom');
          }
          if (state.quoteDateRange['end'] == null) {
            tempFilters.remove('BillableDateTo');
          }
          break;
        case '':
          for (final key in keysToRemove) {
            updatedQuoteDateFilters.remove(key);
            tempFilters.remove(key);
          }
          break;
      }
    }
  }

  void _handleCustomDateFilter(
    Map<String, dynamic> tempFilters,
    Map<String, dynamic> updatedCustomDateFilters,
  ) {
    if (updatedCustomDateFilters.isNotEmpty) {
      final customDateOn = updatedCustomDateFilters['CustomDateOn'] as String;
      final keysToRemove = [
        'CustomDateOn',
        'DueDateTo',
        'DueDateFrom',
        'CreateDateTo',
        'CreateDateFrom',
        'UpdateDateFrom',
        'UpdateDateTo'
      ];

      if (customDateOn == 'Expired' || customDateOn == 'Overdue') {
        updatedCustomDateFilters.remove('DueDateFrom');
        tempFilters.remove('DueDateFrom');
      } else if (customDateOn == '') {
        for (final key in keysToRemove) {
          updatedCustomDateFilters.remove(key);
          tempFilters.remove(key);
        }
      }

      _handleCustomDateType(
        tempFilters,
        updatedCustomDateFilters,
        customDateOn,
      );
    }
  }

  void _handleCustomDateType(
    Map<String, dynamic> tempFilters,
    Map<String, dynamic> updatedCustomDateFilters,
    String customDateOn,
  ) {
    switch (state.selectedCustomDateType) {
      case 'Expiry Date':
        _handleExpiryDate(tempFilters, updatedCustomDateFilters, customDateOn);
        break;
      case 'Created Date':
        _handleCreatedDate(tempFilters, updatedCustomDateFilters, customDateOn);
        break;
      case 'Updated Date':
        _handleUpdatedDate(tempFilters, updatedCustomDateFilters, customDateOn);
        break;
    }
  }

  void _handleExpiryDate(
    Map<String, dynamic> tempFilters,
    Map<String, dynamic> updatedCustomDateFilters,
    String customDateOn,
  ) {
    final keysToRemove = [
      'CreateDateTo',
      'CreateDateFrom',
      'UpdateDateFrom',
      'UpdateDateTo'
    ];
    for (final key in keysToRemove) {
      updatedCustomDateFilters.remove(key);
      tempFilters.remove(key);
    }

    if (customDateOn == 'Date Range') {
      if (state.customDateRange['start'] == null) {
        tempFilters.remove('DueDateFrom');
      }
      if (state.customDateRange['end'] == null) tempFilters.remove('DueDateTo');
    }
  }

  void _handleCreatedDate(
    Map<String, dynamic> tempFilters,
    Map<String, dynamic> updatedCustomDateFilters,
    String customDateOn,
  ) {
    final keysToRemove = [
      'DueDateTo',
      'DueDateFrom',
      'UpdateDateFrom',
      'UpdateDateTo'
    ];
    for (final key in keysToRemove) {
      updatedCustomDateFilters.remove(key);
      tempFilters.remove(key);
    }

    if (customDateOn == 'Date Range') {
      if (state.customDateRange['start'] == null) {
        tempFilters.remove('CreateDateFrom');
      }
      if (state.customDateRange['end'] == null) {
        tempFilters.remove('CreateDateTo');
      }
    }
  }

  void _handleUpdatedDate(
    Map<String, dynamic> tempFilters,
    Map<String, dynamic> updatedCustomDateFilters,
    String customDateOn,
  ) {
    final keysToRemove = [
      'DueDateTo',
      'DueDateFrom',
      'CreateDateTo',
      'CreateDateFrom'
    ];
    for (final key in keysToRemove) {
      updatedCustomDateFilters.remove(key);
      tempFilters.remove(key);
    }

    if (customDateOn == 'Date Range') {
      if (state.customDateRange['start'] == null) {
        tempFilters.remove('UpdateDateFrom');
      }
      if (state.customDateRange['end'] == null) {
        tempFilters.remove('UpdateDateTo');
      }
    }
  }

  void resetFilters() {
    emit(
      state.copyWith(
        tempFilters: Map.of(state.filters),
        tempQuoteDateFilters: Map.of(state.quoteDateFilters),
        tempSelectedQuoteDate: state.selectedQuoteDate,
      ),
    );
  }

  void clearFilters() {
    emit(const QuotesFiltersState());
  }
}
