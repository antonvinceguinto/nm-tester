import 'package:api_service/api_service.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nextminute/core/utils/extensions.dart';
import 'package:nextminute/core/utils/theme/nm_colors.dart';
import 'package:nextminute/core/utils/theme/nm_text_styles.dart';
import 'package:nextminute/features/wigdets/nm_chip.dart';

@RoutePage()
class TimesheetDetailsPage extends StatelessWidget {
  const TimesheetDetailsPage({super.key, required this.datum});

  final ListWeeklySummaryModel datum;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Timesheet Details'),
      ),
      // backgroundColor: Colors.lightBlue[50],
      body: SafeArea(
        child: ListView.separated(
          separatorBuilder: (context, index) => const Divider(thickness: 1),
          itemCount: datum.data.length,
          itemBuilder: (context, index) {
            final dataItem = datum.data[index];

            final timeSheetEntries = dataItem.timesheet_entries;

            final date = DateFormat('EEEE, d MMMM')
                .format(dataItem.date ?? DateTime.now());

            final totalHours = _computeDailtyTotalHrs(timeSheetEntries);

            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.calendar_month,
                            size: 20,
                            // color: Colors.grey.shade900,
                          ),
                          const SizedBox(width: 8),
                          Text(date),
                        ],
                      ),
                      TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.add),
                        label: const Text('Add'),
                      ),
                    ],
                  ),
                  if (timeSheetEntries?.isNotEmpty ?? false) ...{
                    Column(
                      children: [
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 8),
                          itemCount: timeSheetEntries?.length ?? 0,
                          itemBuilder: (context, index) {
                            final entry = timeSheetEntries?[index];

                            if (entry == null) {
                              return const SizedBox.shrink();
                            }

                            return _buildItem(entry);
                          },
                        )
                      ],
                    )
                  } else
                    const SizedBox.shrink(),
                  if (totalHours != 0) ...{
                    Text(
                      'Total: ${totalHours.convertToHours()}hr',
                    ).paddingAll(8),
                  }
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  double _computeDailtyTotalHrs(List<TimesheetEntry>? entries) {
    var total = 0.0;

    if (entries != null && entries.isNotEmpty) {
      total = entries.map((e) => e.time_total ?? 0).reduce(
            (value, element) => value + element,
          );
    }

    return total;
  }

  Widget _buildItem(TimesheetEntry entry) {
    final task = entry.task_number ?? '';
    final hours = entry.time_total ?? 0;
    final taskSummary = entry.task_summary ?? '';
    final job = entry.job_number ?? '';
    final jobSummary = entry.job_name ?? '';

    final summaries = entry.target_billableitem_summaries ?? [];
    final isBillable = entry.is_billable ?? false;

    final subTotal = entry.billableitem_sell_subtotal ?? 0.0;
    final invoicedTotal = entry.billableitem_invoiced_total ?? 0.0;

    final invoiceDiff = subTotal - invoicedTotal;

    String invoiceStatus;

    if (summaries.isNotEmpty && invoiceDiff > 0) {
      invoiceStatus = 'Part Invoiced';
    } else if (summaries.isNotEmpty && invoiceDiff <= 0) {
      invoiceStatus = 'Invoiced';
    } else {
      invoiceStatus = 'Not Invoiced';
    }

    return Builder(
      builder: (context) {
        return Column(
          children: [
            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (task.isNotEmpty) ...{
                              Text.rich(
                                TextSpan(
                                  style: NMTextStyles.b2(context)?.copyWith(),
                                  children: [
                                    TextSpan(
                                      text: task,
                                      style: NMTextStyles.b2(context)?.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          ' ${taskSummary.isEmpty ? '' : '- $taskSummary'}',
                                    ),
                                  ],
                                ),
                              ),
                            },
                            if (job.isNotEmpty) ...{
                              Text.rich(
                                TextSpan(
                                  style: NMTextStyles.b2(context)?.copyWith(),
                                  children: [
                                    TextSpan(
                                      text: job,
                                      style: NMTextStyles.b2(context)?.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          ''' ${jobSummary.isEmpty ? '' : '- $jobSummary'}''',
                                    ),
                                  ],
                                ),
                              ),
                            },
                          ],
                        ),
                      ),
                      Text(
                        '${hours.convertToHours()}hr',
                        style: NMTextStyles.b2(context)?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ).paddingSymmetric(horizontal: 8),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (entry.job_address != null) ...{
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 8),
                            Text(
                              entry.job_address ?? '',
                              style: NMTextStyles.b2(context)?.copyWith(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      },
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const SizedBox(height: 8),
                            Wrap(
                              alignment: WrapAlignment.end,
                              children: [
                                NMChip(
                                  label: invoiceStatus,
                                  color: invoiceStatus == 'Invoiced'
                                      ? NMColors.lightGreen
                                      : invoiceStatus == 'Part Invoiced'
                                          ? NMColors.lightYellow
                                          : Colors.red.shade100,
                                ),
                                if (isBillable) ...{
                                  const SizedBox(width: 8),
                                  NMChip(
                                    label: 'Billable',
                                    color: NMColors.orange.withAlpha(60),
                                  ),
                                }
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(entry.title ?? ''),
                          ],
                        ),
                      ),
                    ],
                  ),
                  if (entry.billableitem_entry_type == 'Time Range')
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Divider(),
                        Text(
                          '''Start: ${entry.start_time?.formatToStartEndTime()}''',
                        ),
                        Text(
                          'End: ${entry.end_time?.formatToStartEndTime()}',
                        ),
                      ],
                    )
                ],
              ).paddingAll(16),
            ),
          ],
        );
      },
    );
  }
}
