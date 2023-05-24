import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextminute/core/utils/extensions.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/sub_menus/job_filters/cubit/jobs_filter_cubit.dart';

class DateFilterExpansionItem extends StatefulWidget {
  const DateFilterExpansionItem({
    super.key,
    required this.label,
    required this.selectedStartDate,
    required this.selectedSStartDateRange,
    required this.selectedSEndDateRange,
  });

  final String label;
  final String selectedStartDate;
  final DateTime? selectedSStartDateRange;
  final DateTime? selectedSEndDateRange;

  @override
  State<DateFilterExpansionItem> createState() =>
      _DateFilterExpansionItemState();
}

class _DateFilterExpansionItemState extends State<DateFilterExpansionItem> {
  bool? isSwitched;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JobsFilterCubit, JobsFilterState>(
      builder: (context, state) {
        final jobsFilterCubit = context.read<JobsFilterCubit>();
        final isExpanded = widget.selectedStartDate.isNotEmpty;
        final isDateRange = widget.selectedStartDate == 'Date Range';
        final isDueDate = widget.label == 'Due Date';

        final startDateRangeLabel =
            widget.selectedSStartDateRange?.formatToFilterStyle() ??
                'Start Date';
        final endDateRangeLabel =
            widget.selectedSEndDateRange?.formatToFilterStyle() ?? 'End Date';

        return Column(
          children: [
            ExpansionTile(
              title: Text(widget.label),
              trailing: IgnorePointer(
                child: CupertinoSwitch(
                  value: isSwitched ?? true && isExpanded,
                  onChanged: (_) {},
                ),
              ),
              onExpansionChanged: (isExpanded) {
                jobsFilterCubit.saveDateFilterLabel(
                  '',
                  isDue: isDueDate,
                );
                setState(() {
                  isSwitched = isExpanded;
                });
              },
              initiallyExpanded: isExpanded,
              textColor: Colors.black,
              children: isDueDate
                  ? jobsFilterCubit.state.dueDateFilters.map((filter) {
                      return RadioListTile(
                        onChanged: (value) => {
                          jobsFilterCubit.saveDateFilterLabel(
                            filter,
                            isDue: isDueDate,
                          ),
                        },
                        title: Text(filter),
                        groupValue: widget.selectedStartDate,
                        value: filter,
                        controlAffinity: ListTileControlAffinity.trailing,
                      );
                    }).toList()
                  : jobsFilterCubit.state.dateFilters.map((filter) {
                      return RadioListTile(
                        onChanged: (value) => {
                          jobsFilterCubit.saveDateFilterLabel(
                            filter,
                            isDue: isDueDate,
                          ),
                        },
                        title: Text(filter),
                        groupValue: widget.selectedStartDate,
                        value: filter,
                        controlAffinity: ListTileControlAffinity.trailing,
                      );
                    }).toList(),
            ),
            if (isDateRange)
              Container(
                width: double.infinity,
                color: Colors.grey.shade300,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Select Date Range'),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () async {
                              final res = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2100),
                              );

                              if (res != null) {
                                jobsFilterCubit.saveDateFilter(
                                  isStart: true,
                                  selectedDate: res,
                                  isDueDate: isDueDate,
                                );
                              }
                            },
                            icon: const Icon(Icons.calendar_today),
                            label: Text(startDateRangeLabel),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () async {
                              final res = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2100),
                              );

                              if (res != null) {
                                jobsFilterCubit.saveDateFilter(
                                  isStart: false,
                                  selectedDate: res,
                                  isDueDate: isDueDate,
                                );
                              }
                            },
                            icon: const Icon(Icons.calendar_today),
                            label: Text(endDateRangeLabel),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
          ],
        );
      },
    );
  }
}
