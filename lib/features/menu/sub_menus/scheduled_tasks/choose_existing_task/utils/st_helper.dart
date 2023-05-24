import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:nextminute/core/utils/utils.dart';
import 'package:nextminute/features/menu/sub_menus/scheduled_tasks/choose_existing_task/mixins/task_helper.dart';
import 'package:nextminute/features/menu/sub_menus/sub_menus.dart';

class STHelper {
  STHelper({
    required this.context,
    required this.focusedDay,
    this.startDate,
    this.originDate,
    required this.isFromMenu,
    required this.isMonthly,
    required this.isWeekly,
    required this.isAll,
  });

  final BuildContext context;
  final DateTime focusedDay;
  final DateTime? startDate;
  final DateTime? originDate;
  final bool isFromMenu;
  final bool isMonthly;
  final bool isWeekly;
  final bool isAll;

  final now = DateTime.now();

  String getContainerFilterText({
    DateTime? allStartDate,
    DateTime? allEndDate,
  }) {
    final month = focusedDay.month;
    final isToday = (startDate ?? originDate)?.isSameDateAs(now) ?? false;
    final filterTitles = TaskHelper.getFilterTitles(
      context.read<TaskFilterBloc>().state,
      context.read<JobsFilterCubit>().state,
    );

    var dateRangeText = '';

    if (isAll) {
      final adFormat = DateFormat('EE dd MMMM, yyyy');

      dateRangeText = '${adFormat.format(allStartDate ?? DateTime.now())} - '
          '${adFormat.format(allEndDate ?? DateTime.now())}';
    }

    String weekText() {
      final startOfThisWeek = now.subtract(Duration(days: now.weekday - 1));
      final startOfLastWeek = startOfThisWeek.subtract(const Duration(days: 7));
      final startOfNextWeek = startOfThisWeek.add(const Duration(days: 7));
      final startOfTwoWeeksLater = startOfNextWeek.add(const Duration(days: 7));

      if (focusedDay.isAfter(startOfLastWeek) &&
          focusedDay.isBefore(startOfThisWeek)) {
        return 'Last Week';
      } else if (focusedDay.isAfter(startOfThisWeek) &&
          focusedDay.isBefore(startOfNextWeek)) {
        return 'This Week';
      } else if (focusedDay.isAfter(startOfNextWeek) &&
          focusedDay.isBefore(startOfTwoWeeksLater)) {
        return 'Next Week';
      } else {
        return focusedDay.formatTaskFilter();
      }
    }

    String monthText() {
      return month == now.month
          ? 'This Month'
          : DateFormat('MMMM yyyy').format(focusedDay);
    }

    String dateText() {
      return isToday
          ? 'Today'
          : (startDate ?? originDate)?.formatTaskFilter() ?? '';
    }

    return isFromMenu
        ? '''${isAll ? dateRangeText : (isMonthly ? monthText() : (isWeekly ? weekText() : dateText()))}'s\nTasks - $filterTitles'''
        : '''Tasks - $filterTitles''';
  }
}
