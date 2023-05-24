import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:api_service/api_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:nextminute/features/utils/generic_status_enum.dart';

part 'jobs_filter_state.dart';

class JobsFilterCubit extends Cubit<JobsFilterState> {
  JobsFilterCubit() : super(const JobsFilterState());

  void clearSelectedStatusFilters() {
    emit(
      state.copyWith(
        selectedStatusFilters: [],
      ),
    );
  }

  void clearSelectedTypeFilters() {
    emit(
      state.copyWith(
        selectedTypeFilters: [],
      ),
    );
  }

  void clearSelectedPricingTypeFilters() {
    emit(
      state.copyWith(
        selectedPricingTypeFilters: [],
      ),
    );
  }

  void clearSelectedPriorityFilters() {
    emit(
      state.copyWith(
        selectedPriorityFilters: [],
      ),
    );
  }

  void toggleCreatedByCustomerEnabled(CustomerDatum cust) {
    final temp = List<CustomerDatum>.from(state.selectedEnabledCreatedBy);
    if (temp.contains(cust)) {
      temp.remove(cust);
    } else {
      temp.add(cust);
    }

    emit(state.copyWith(selectedEnabledCreatedBy: temp));
  }

  void addCreatedByCustomer(CustomerDatum cust) {
    final temp = List<CustomerDatum>.from(state.selectedEnabledCreatedBy);

    if (temp.contains(cust)) {
      temp.remove(cust);
    } else {
      temp.add(cust);
    }

    emit(
      state.copyWith(
        selectedCreatedBy: temp,
        selectedEnabledCreatedBy: temp,
      ),
    );
  }

  void enableCustomerFilter({required bool value}) {
    emit(state.copyWith(isCustomerFilterEnabled: value));
  }

  void enableAssignedToFilter({required bool value}) {
    emit(state.copyWith(isAssignedToFilterEnabled: value));
  }

  void enableCreatedByFilter({required bool value}) {
    emit(state.copyWith(isCreatedByFilterEnabled: value));
  }

  void clearSelectedCreatedBy() {
    emit(
      state.copyWith(
        isCreatedByFilterEnabled: false,
        selectedCreatedBy: [],
        selectedEnabledCreatedBy: [],
      ),
    );
  }

  void clearSelectedCustomers() {
    emit(
      state.copyWith(
        isCustomerFilterEnabled: false,
        selectedCustomers: [],
        selectedEnabledCustomers: [],
      ),
    );
  }

  void clearSelectedAssignedToCustomers() {
    emit(
      state.copyWith(
        isAssignedToFilterEnabled: false,
        selectedAssignedTos: [],
        selectedEnabledAssignedTos: [],
      ),
    );
  }

  void toggleAssignedToCustomerEnabled(CustomerDatum cust) {
    final temp = List<CustomerDatum>.from(state.selectedEnabledAssignedTos);
    if (temp.contains(cust)) {
      temp.remove(cust);
    } else {
      temp.add(cust);
    }

    emit(state.copyWith(selectedEnabledAssignedTos: temp));
  }

  void addAssignedToCustomer(CustomerDatum cust) {
    final temp = List<CustomerDatum>.from(state.selectedEnabledAssignedTos);

    if (temp.contains(cust)) {
      temp.remove(cust);
    } else {
      temp.add(cust);
    }

    emit(
      state.copyWith(
        selectedAssignedTos: temp,
        selectedEnabledAssignedTos: temp,
      ),
    );
  }

  void toggleSelectedCustomerEnabled(CustomerDatum cust) {
    final temp = List<CustomerDatum>.from(state.selectedEnabledCustomers);
    if (temp.contains(cust)) {
      temp.remove(cust);
    } else {
      temp.add(cust);
    }

    emit(state.copyWith(selectedEnabledCustomers: temp));
  }

  void addSelectedCustomer(
    BuildContext context,
    CustomerDatum cust,
  ) {
    final temp = List<CustomerDatum>.from(state.selectedEnabledCustomers);

    if (temp.contains(cust)) {
      if (!context.mounted) return;
      showOkAlertDialog(
        context: context,
        title: 'Already Selected',
        message: '${cust.contact_name_display} is already included '
            'in the filter',
      );
      return;
    } else {
      temp.add(cust);
    }

    emit(
      state.copyWith(
        selectedCustomers: temp,
        selectedEnabledCustomers: temp,
      ),
    );
  }

  void clearCustomers({required bool isAssignCustomer}) {
    if (isAssignCustomer) {
      emit(
        state.copyWith(
          selectedAssignedTos: [],
          selectedEnabledAssignedTos: [],
          selectedCreatedBy: [],
          selectedEnabledCreatedBy: [],
        ),
      );
      return;
    }
    emit(
      state.copyWith(
        selectedCustomers: [],
        selectedEnabledCustomers: [],
        selectedCreatedBy: [],
        selectedEnabledCreatedBy: [],
      ),
    );
  }

  void selectSite(CustomerDatum site) {
    emit(
      state.copyWith(
        selectedSite: site,
      ),
    );
  }

  void removeSite() {
    emit(
      state.copyWith(selectedSite: const CustomerDatum()),
    );
  }

  void selectAllAssignedCustomers(List<CustomerDatum> customers) {
    emit(
      state.copyWith(
        selectedAssignedTos: customers,
      ),
    );
  }

  void removeAllAssignedCustomers() {
    emit(
      state.copyWith(selectedAssignedTos: []),
    );
  }

  void removeCustomer(
    CustomerDatum customer, {
    required bool isAssignCustomer,
  }) {
    if (isAssignCustomer) {
      if (state.selectedAssignedTos.contains(customer)) {
        emit(
          state.copyWith(
            selectedAssignedTos: state.selectedAssignedTos
                .where((element) => element.contact_id != customer.contact_id)
                .toList(),
          ),
        );
      }
      return;
    }
    if (state.selectedCustomers.contains(customer)) {
      emit(
        state.copyWith(
          selectedCustomers: state.selectedCustomers
              .where((element) => element.contact_id != customer.contact_id)
              .toList(),
        ),
      );
    }
  }

  void setSearchQuery(String query) {
    emit(
      state.copyWith(
        search: query,
      ),
    );
  }

  void addCustomer(CustomerDatum customer, {required bool isAssignCustomer}) {
    if (isAssignCustomer) {
      if (state.selectedAssignedTos.contains(customer)) {
        return;
      }
      emit(
        state.copyWith(
          selectedAssignedTos: [
            ...state.selectedAssignedTos,
            customer,
          ],
        ),
      );
      return;
    }

    if (state.selectedCustomers.contains(customer)) {
      return;
    }
    emit(
      state.copyWith(
        selectedCustomers: [
          ...state.selectedCustomers,
          customer,
        ],
      ),
    );
  }

  void saveFinalFilter(Map<String, dynamic> filterData) {
    emit(
      state.copyWith(
        finalFilterData: filterData,
      ),
    );
  }

  void saveDateFilterLabel(String label, {required bool isDue}) {
    if (!isDue) {
      return emit(state.copyWith(selectedStartDate: label));
    }

    emit(state.copyWith(selectedDueDate: label));
  }

  void saveDateFilter({
    required DateTime selectedDate,
    required bool isStart,
    required bool isDueDate,
  }) {
    if (isStart) {
      if (!isDueDate) {
        emit(
          state.copyWith(
            startDateRange: {
              'start': selectedDate,
              'end': state.startDateRange?['end'],
            },
          ),
        );
      } else {
        emit(
          state.copyWith(
            dueDateRange: {
              'start': selectedDate,
              'end': state.dueDateRange?['end'],
            },
          ),
        );
      }
    } else {
      if (!isDueDate) {
        emit(
          state.copyWith(
            startDateRange: {
              'start': state.startDateRange?['start'],
              'end': selectedDate,
            },
          ),
        );
      } else {
        emit(
          state.copyWith(
            dueDateRange: {
              'start': state.dueDateRange?['start'],
              'end': selectedDate,
            },
          ),
        );
      }
    }
  }

  void toggleFilterJob(String filterType) {
    switch (filterType) {
      case 'isUnscheduledJobsSelected':
        emit(
          state.copyWith(
            isUnscheduledJobsSelected: !state.isUnscheduledJobsSelected,
          ),
        );
        break;
      case 'isInternalJobsSelected':
        emit(
          state.copyWith(
            isInternalJobsSelected: !state.isInternalJobsSelected,
          ),
        );
        break;
      case 'isOnlyShowCompletedJobsSelected':
        emit(
          state.copyWith(
            isOnlyShowCompletedJobsSelected:
                !state.isOnlyShowCompletedJobsSelected,
          ),
        );
        break;
      case 'isIncludeCompletedJobsSelected':
        emit(
          state.copyWith(
            isIncludeCompletedJobsSelected:
                !state.isIncludeCompletedJobsSelected,
          ),
        );
        break;
    }
  }

  void addFilter({
    required int indexFilter,
    required List<dynamic> nFilters,
  }) {
    switch (indexFilter) {
      case 0:
        emit(
          state.copyWith(
            selectedStatusFilters: nFilters as List<FStatusModel>,
          ),
        );
        break;
      case 1:
        emit(
          state.copyWith(
            selectedTypeFilters: nFilters as List<FTypeModel>,
          ),
        );
        break;
      case 2:
        emit(
          state.copyWith(
            selectedPricingTypeFilters: nFilters as List<FPricingTypeModel>,
          ),
        );
        break;
      case 3:
        emit(
          state.copyWith(
            selectedPriorityFilters: nFilters as List<FPriorityModel>,
          ),
        );
        break;
    }
  }

  void clearFilters() {
    emit(state.clearAllFilters());
  }
}
