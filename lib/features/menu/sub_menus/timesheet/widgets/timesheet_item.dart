import 'package:api_service/api_service.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nextminute/core/routes/app_router.dart';
import 'package:nextminute/core/utils/extensions.dart';
import 'package:nextminute/core/utils/theme/nm_text_styles.dart';

class TimesheetItem extends StatefulWidget {
  const TimesheetItem({
    super.key,
    required this.data,
    required this.listWeeklySummaryModel,
  });

  final WeeklyTimesheetDatum? data;
  final ListWeeklySummaryModel? listWeeklySummaryModel;

  @override
  State<TimesheetItem> createState() => _TimesheetItemState();
}

class _TimesheetItemState extends State<TimesheetItem> {
  late WeeklyTimesheetDatum? timesheet;

  @override
  void initState() {
    super.initState();
    timesheet = widget.data;
  }

  @override
  Widget build(BuildContext context) {
    final tsDate = widget.data?.date;

    final dayNumber = tsDate?.day ?? '0';
    final dayName = DateFormat('EEEE').format(tsDate ?? DateTime.now());
    final monthName = DateFormat('MMMM').format(tsDate ?? DateTime.now());

    var totalHours = 0.0;

    if (timesheet?.timesheet_entries?.isNotEmpty ?? false) {
      for (final entry in timesheet?.timesheet_entries ?? []) {
        totalHours += double.tryParse(
              (entry as TimesheetEntry).time_total.toString(),
            ) ??
            0.0;
      }

      totalHours = totalHours / 60;
    }

    final formattedTotalHours = totalHours.formatTo2Decimal();

    return Card(
      child: InkWell(
        onTap: () {
          context.router.push(
            TimesheetDetailsRoute(datum: widget.listWeeklySummaryModel!),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dayName,
                      style: NMTextStyles.b2(context)?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('$dayNumber $monthName'),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      '${formattedTotalHours}hr',
                      style: NMTextStyles.b2(context)?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),
                    const SizedBox(width: 8),
                    SizedBox(
                      width: 42,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Icon(
                          Icons.add,
                          size: 22,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ).paddingAll(8),
          ],
        ).paddingSymmetric(horizontal: 8, vertical: 2),
      ),
    );
  }
}
