import 'dart:async';
import 'dart:developer';

import 'package:api_service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart' as geocoding;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:nextminute/core/utils/extensions.dart';
import 'package:nextminute/features/menu/sub_menus/customer/assignee/cubit/assignee_filter_cubit.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/sub_menus/job_filters/cubit/jobs_filter_cubit.dart';

class JobsHelper {
  static Future<void> getDirections(
    BuildContext context,
    String address,
  ) async {
    final defaultMaps = context.read<SharedPrefs>().defaultMaps;

    if (defaultMaps.isEmpty) {
      final listOfMaps = await MapLauncher.installedMaps;

      // ignore: use_build_context_synchronously
      if (!context.mounted) return;

      await showMaterialModalBottomSheet<void>(
        context: context,
        builder: (context) => SafeArea(
          top: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ...listOfMaps.map(
                (map) => ListTile(
                  trailing: const Icon(Icons.chevron_right),
                  title: Text(map.mapName),
                  onTap: () async {
                    context.read<SharedPrefs>().defaultMaps = map.mapName;

                    final res =
                        await JobsHelper.getAddressCoords(address: address);

                    await map.showDirections(
                      destination: Coords(
                        res.latitude,
                        res.longitude,
                      ),
                      originTitle: 'Current Location',
                    );
                  },
                ),
              ),
            ],
          ).paddingAll(16),
        ),
      );
    } else {
      final listOfMaps = await MapLauncher.installedMaps;

      final map = listOfMaps.firstWhere(
        (element) => element.mapName == defaultMaps,
        orElse: () => listOfMaps.first,
      );

      final res = await JobsHelper.getAddressCoords(address: address);

      await map.showDirections(
        destination: Coords(
          res.latitude,
          res.longitude,
        ),
        originTitle: 'Current Location',
      );
    }
  }

  static String getFilterTitlesForAssignedTo(AssigneeFilterState filter) {
    final titles = List<String>.empty(growable: true);

    if (filter.includeDeleted) {
      titles.add('Include Deleted');
    }
    if (filter.isExcludeArchivedContacts) {
      titles.add('Exclude Archived');
    }
    if (filter.isExcludeDisabledUsers) {
      titles.add('Exclude Disabled');
    }
    if (filter.isAllAdministrators && filter.isAllUsers) {
      titles.add('Users');
    }
    if (filter.isAllAdministrators &&
        !(filter.isAllAdministrators && filter.isAllUsers)) {
      titles.add('All Admins');
    }
    if (filter.isAllUsers &&
        !(filter.isAllAdministrators && filter.isAllUsers)) {
      titles.add('Users');
    }
    if (filter.selectedUserRoles.isNotEmpty) {
      titles.add('User Roles');
    }
    if (filter.selectedContactTypes.isNotEmpty) {
      for (final element in filter.selectedContactTypes) {
        titles.add(element.contacttype_name ?? '');
      }
    }

    return titles.join(', ');
  }

  static String getFilterTitles(JobsFilterState filter) {
    final titles = List<String>.empty(growable: true);

    if (filter.selectedStatusFilters?.isNotEmpty ?? false) {
      titles.add('Status');
    }
    if (filter.selectedTypeFilters?.isNotEmpty ?? false) {
      titles.add('Type');
    }
    if (filter.selectedPricingTypeFilters?.isNotEmpty ?? false) {
      titles.add('Pricing Type');
    }
    if (filter.selectedPriorityFilters?.isNotEmpty ?? false) {
      titles.add('Priority');
    }
    if (filter.isUnscheduledJobsSelected) {
      titles.add('Unscheduled Jobs');
    }
    if (filter.isInternalJobsSelected) {
      titles.add('Internal Jobs');
    }
    if (filter.isOnlyShowCompletedJobsSelected) {
      titles.add('Archived Jobs');
    }
    if (filter.isIncludeCompletedJobsSelected) {
      titles.add('Active & Archived Jobs');
    }
    if (filter.selectedStartDate != '') {
      titles.add('Start Date');
    }
    if (filter.selectedDueDate != '') {
      if (filter.selectedDueDate == 'Overdue') {
        titles.add('Overdue Jobs');
      }
      if (filter.selectedDueDate == 'Yesterday') {
        titles.add('Jobs Due Yesterday');
      }
      if (filter.selectedDueDate == 'Today') {
        titles.add('Jobs Due Today');
      }
      if (filter.selectedDueDate == 'Tomorrow') {
        titles.add('Jobs Due Tomorrow');
      }
      if (filter.selectedDueDate == 'This Week') {
        titles.add('Jobs Due This Week');
      }
      if (filter.selectedDueDate == 'Next Week') {
        titles.add('Jobs Due Next Week');
      }
      if (filter.selectedDueDate == 'This Month') {
        titles.add('This Month');
      }
    }
    if (filter.selectedEnabledCustomers.isNotEmpty &&
        filter.isCustomerFilterEnabled) {
      titles.add('Customer');
    }
    if (filter.selectedEnabledAssignedTos.isNotEmpty &&
        filter.isAssignedToFilterEnabled) {
      titles.add('Assigned To');
    }

    return titles.join(', ');
  }

  static Map<String, dynamic> getFilterDataMap({
    required JobsFilterCubit jobsFilter,
  }) {
    final filter = {
      // ---- Selection Filters ----
      'jobStatus': jobsFilter.state.selectedStatusFilters
          ?.map(
            (e) => e.id,
          )
          .join(','),
      'jobType': jobsFilter.state.selectedTypeFilters
          ?.map(
            (e) => e.id,
          )
          .join(','),
      'jobPricingType': jobsFilter.state.selectedPricingTypeFilters
          ?.map(
            (e) => e.id,
          )
          .join(','),
      'priority': jobsFilter.state.selectedPriorityFilters
          ?.map(
            (e) => e.id,
          )
          .join(','),
      // ---- Boolean Filters ----
      'unscheduledJobs': jobsFilter.state.isUnscheduledJobsSelected,
      'internalJobs': jobsFilter.state.isInternalJobsSelected,
      'onlyShowCompleted': jobsFilter.state.isOnlyShowCompletedJobsSelected,
      'includeCompleted': jobsFilter.state.isIncludeCompletedJobsSelected,
      // ---- Date Filters ----
      ...JobsHelper.getDateFilter(
        jobsFilter: jobsFilter,
        isDue: false,
      ),
      ...JobsHelper.getDateFilter(
        jobsFilter: jobsFilter,
        isDue: true,
      ),
      if (jobsFilter.state.isCustomerFilterEnabled)
        'jobClient': jobsFilter.state.selectedEnabledCustomers
            .map(
              (e) => e.contact_id,
            )
            .join(','),
      if (jobsFilter.state.isAssignedToFilterEnabled)
        'jobContacts': jobsFilter.state.selectedEnabledAssignedTos
            .map(
              (e) => e.contact_id,
            )
            .join(','),
    };

    return filter;
  }

  static Map<String, dynamic> getDateFilter({
    required JobsFilterCubit jobsFilter,
    required bool isDue,
  }) {
    switch (isDue
        ? jobsFilter.state.selectedDueDate
        : jobsFilter.state.selectedStartDate) {
      case 'Started':
        return JobsHelper.getStarted(isDue: isDue);
      case 'Overdue':
        return JobsHelper.getStarted(isDue: isDue);
      case 'Yesterday':
        return JobsHelper.getYesterday(isDue: isDue);
      case 'Today':
        return JobsHelper.getToday(isDue: isDue);
      case 'Tomorrow':
        return JobsHelper.getTomorrow(isDue: isDue);
      case 'This Week':
        return JobsHelper.getThisWeek(isDue: isDue);
      case 'Next Week':
        return JobsHelper.getNextWeek(isDue: isDue);
      case 'This Month':
        return JobsHelper.getThisMonth(isDue: isDue);
      case 'Date Range':
        return JobsHelper.getDateRange(jobsFilter, isDue: isDue);
      default:
        return {};
    }
  }

  static Map<String, dynamic> getDateRange(
    JobsFilterCubit jobsFilterCubit, {
    bool isDue = false,
  }) {
    final key = isDue ? 'due' : 'start';

    DateTime? dateFrom;
    DateTime? dateTo;

    if (isDue) {
      dateFrom = jobsFilterCubit.state.dueDateRange?['start']?.toUtc();
      dateTo = jobsFilterCubit.state.dueDateRange?['end']?.toUtc();
    } else {
      dateFrom = jobsFilterCubit.state.startDateRange?['start']?.toUtc();
      dateTo = jobsFilterCubit.state.startDateRange?['end']?.toUtc();
    }

    return {
      '${key}DateFrom': dateFrom?.formatForAPI(),
      '${key}DateTo': dateTo?.formatForAPI(),
    };
  }

  static Map<String, dynamic> getThisMonth({bool isDue = false}) {
    final key = isDue ? 'due' : 'start';
    final dateNow = DateTime.now();

    final lastDayOfLastMonth = DateTime(
      dateNow.year,
      dateNow.month,
      0,
    );

    final lastDayOfThisMonth = DateTime(
      dateNow.year,
      dateNow.month + 1,
      0,
    );

    return {
      '${key}DateFrom': lastDayOfLastMonth.formatForAPI(),
      '${key}DateTo': lastDayOfThisMonth.formatForAPI(),
    };
  }

  static Map<String, dynamic> getNextWeek({bool isDue = false}) {
    final key = isDue ? 'due' : 'start';
    final dateNow = DateTime.now();

    return {
      '${key}DateFrom': dateNow.getSaturdayThisWeek().formatForAPI(),
      '${key}DateTo': dateNow.getNextWeekSaturday().formatForAPI(),
    };
  }

  static Map<String, dynamic> getThisWeek({bool isDue = false}) {
    final key = isDue ? 'due' : 'start';
    final dateNow = DateTime.now();

    return {
      '${key}DateFrom': dateNow.getPreviousSaturdayThisWeek().formatForAPI(),
      '${key}DateTo': dateNow.getSaturdayThisWeek().formatForAPI(),
    };
  }

  static Map<String, dynamic> getTomorrow({bool isDue = false}) {
    final key = isDue ? 'due' : 'start';
    final dateNow = DateTime.now();

    final tomorrow = dateNow.add(
      const Duration(days: 1),
    );

    return {
      '${key}DateFrom': dateNow.formatForAPI(),
      '${key}DateTo': tomorrow.formatForAPI(),
    };
  }

  static Map<String, dynamic> getToday({bool isDue = false}) {
    final key = isDue ? 'due' : 'start';
    final dateNow = DateTime.now();

    final yesterday = dateNow.subtract(
      const Duration(days: 1),
    );

    return {
      '${key}DateFrom': yesterday.formatForAPI(),
      '${key}DateTo': dateNow.formatForAPI(),
    };
  }

  static Map<String, dynamic> getYesterday({bool isDue = false}) {
    final key = isDue ? 'due' : 'start';

    final dateNow = DateTime.now();

    final dateTo = dateNow.subtract(
      const Duration(days: 1),
    );

    final yesterday = dateNow.subtract(
      const Duration(days: 2),
    );

    return {
      '${key}DateFrom': yesterday.formatForAPI(),
      '${key}DateTo': dateTo.formatForAPI(),
    };
  }

  static Map<String, dynamic> getStarted({bool isDue = false}) {
    final key = isDue ? 'dueDateTo' : 'startDateTo';

    final dateNow = DateTime.now();

    final dateTo = dateNow.subtract(
      const Duration(days: 1),
    );

    return {key: dateTo.formatForAPI()};
  }

  static Future<LatLng> getAddressCoords({required String address}) async {
    // @dev this removes zip code and double spaces
    final formattedAddress =
        address.replaceAll(RegExp(r'\s{2,}|\n\b\d{4}\b'), ' ');
    try {
      final locations = await geocoding.locationFromAddress(
        formattedAddress,
        localeIdentifier: 'en-NZ',
      );
      return LatLng(locations.first.latitude, locations.first.longitude);
    } catch (e) {
      log('error fetching (e) \n$e');
      log('error fetching (address) \n$formattedAddress');
      return const LatLng(0, 0);
    }
  }
}

class Debouncer {
  static void run(VoidCallback action, {required int milliseconds}) {
    Timer? timer;

    if (timer != null) {
      timer.cancel();
    }
    timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
