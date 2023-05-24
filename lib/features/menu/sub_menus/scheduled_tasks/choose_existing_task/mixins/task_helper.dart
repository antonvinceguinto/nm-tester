import 'package:nextminute/features/menu/sub_menus/sub_menus.dart';

class TaskHelper {
  static String getFilterTitles(
    TaskFilterState filter,
    JobsFilterState jobFilter,
  ) {
    final titles = List<String>.empty(growable: true);

    if ((jobFilter.isCustomerFilterEnabled &&
            jobFilter.selectedEnabledCustomers.isNotEmpty) ||
        (jobFilter.isAssignedToFilterEnabled &&
            jobFilter.selectedEnabledAssignedTos.isNotEmpty) ||
        (jobFilter.isCreatedByFilterEnabled &&
            jobFilter.selectedEnabledCreatedBy.isNotEmpty) ||
        (filter.selectedTaskStatuses?.isNotEmpty ?? false) ||
        (filter.selectedAcceptanceStatuses?.isNotEmpty ?? false) ||
        (filter.selectedPriorities?.isNotEmpty ?? false) ||
        (filter.selectedCategories?.isNotEmpty ?? false) ||
        filter.isExcludeArchive) {
      titles.add('Filters Active');
    } else {
      return 'No filters active';
    }

    return titles.join(', ');
  }
}
