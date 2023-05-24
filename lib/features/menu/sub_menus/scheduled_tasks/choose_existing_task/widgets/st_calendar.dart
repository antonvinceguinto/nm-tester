import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextminute/core/utils/utils.dart';
import 'package:nextminute/features/menu/sub_menus/scheduled_tasks/choose_existing_task/bloc/scheduled_task_bloc.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class STCalendar extends StatelessWidget {
  const STCalendar({
    super.key,
    this.onDaySelected,
    required this.focusedDay,
    required this.calendarController,
  });

  final void Function(CalendarSelectionDetails)? onDaySelected;
  final DateTime focusedDay;
  final CalendarController calendarController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScheduledTaskBloc, ScheduledTaskState>(
      builder: (context, state) {
        return !state.isCalendarOpen
            ? const SizedBox()
            : SfCalendar(
                controller: calendarController,
                view: CalendarView.month,
                onSelectionChanged: onDaySelected,
                firstDayOfWeek: 1,
                showDatePickerButton: true,
                showNavigationArrow: true,
                initialSelectedDate: focusedDay,
                cellBorderColor: Colors.white,
                monthCellBuilder: (context, details) {
                  return Container(
                    child: Center(
                      child: Text(
                        details.date.day.toString(),
                        style: NMTextStyles.b2(context)!.copyWith(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  );
                },
                headerStyle: CalendarHeaderStyle(
                  textAlign: TextAlign.center,
                  textStyle: NMTextStyles.b2(context)!.copyWith(
                    color: Colors.black,
                  ),
                ),
              );
      },
    );
  }
}
