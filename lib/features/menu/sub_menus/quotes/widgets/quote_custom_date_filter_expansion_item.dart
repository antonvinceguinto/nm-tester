import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextminute/core/utils/extensions.dart';
import 'package:nextminute/features/menu/sub_menus/quotes/cubit/quotes_filters_cubit.dart';

class QuoteCustomDateFilterExpansionItem extends StatefulWidget {
  const QuoteCustomDateFilterExpansionItem({
    super.key,
    required this.isQuote,
    required this.isInvoice,
  });

  final bool isQuote;
  final bool isInvoice;

  @override
  State<QuoteCustomDateFilterExpansionItem> createState() =>
      _QuoteCustomDateFilterExpansionItemState();
}

class _QuoteCustomDateFilterExpansionItemState
    extends State<QuoteCustomDateFilterExpansionItem> {
  bool? isSwitched;

  late String selectedDateFilter;
  late List<String> expiryDateFilters;

  List<String> otherDateFilters = const [
    'Yesterday',
    'Today',
    'This Week',
    'This Month',
    'Date Range',
  ];

  List<String> currentDateFilters = [];

  @override
  void initState() {
    super.initState();

    expiryDateFilters = [
      if (widget.isQuote) 'Expired' else 'Overdue',
      'Yesterday',
      'Today',
      'Tomorrow',
      'This Week',
      'Next Week',
      'This Month',
      'Date Range',
    ];

    final qfc = context.read<QuotesFiltersCubit>();

    if (qfc.state.selectedCustomDateType.isEmpty) {
      if (widget.isQuote) {
        selectedDateFilter = 'Expiry Date';
      } else {
        selectedDateFilter = 'Due Date';
      }
    } else {
      selectedDateFilter = qfc.state.selectedCustomDateType;
    }

    if (selectedDateFilter == 'Expiry Date' ||
        selectedDateFilter == 'Due Date') {
      currentDateFilters = expiryDateFilters;
    } else {
      currentDateFilters = otherDateFilters;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuotesFiltersCubit, QuotesFiltersState>(
      builder: (context, state) {
        final qfc = context.read<QuotesFiltersCubit>();

        final isExpanded = state.filters.containsKey('CustomDateOn') ||
            state.filters.containsKey('DueDateTo');

        final isDateRange = state.tempSelectedCustomDate == 'Date Range';

        final startDateRangeLabel =
            state.customDateRange['start']?.formatToFilterStyle() ??
                'Start Date';
        final endDateRangeLabel =
            state.customDateRange['end']?.formatToFilterStyle() ?? 'End Date';

        return Column(
          children: [
            ExpansionTile(
              title: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedDateFilter,
                  items: [
                    if (widget.isQuote)
                      const DropdownMenuItem(
                        value: 'Expiry Date',
                        child: Text('Expiry Date'),
                      )
                    else
                      const DropdownMenuItem(
                        value: 'Due Date',
                        child: Text('Due Date'),
                      ),
                    const DropdownMenuItem(
                      value: 'Created Date',
                      child: Text('Created Date'),
                    ),
                    const DropdownMenuItem(
                      value: 'Updated Date',
                      child: Text('Updated Date'),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      selectedDateFilter = value!;
                    });

                    qfc.saveCustomDateType(selectedDateFilter);

                    // check if switched then initialize the list.
                    if ((isSwitched ?? false) || isExpanded) {
                      if (widget.isQuote) {
                        if (selectedDateFilter == 'Expiry Date') {
                          currentDateFilters = expiryDateFilters;
                          qfc.addCustomDateFilter('Expired');
                        } else {
                          currentDateFilters = otherDateFilters;
                          qfc.addCustomDateFilter('Yesterday');
                        }
                      } else {
                        if (selectedDateFilter == 'Due Date') {
                          currentDateFilters = expiryDateFilters;
                          qfc.addCustomDateFilter('Overdue');
                        } else {
                          currentDateFilters = otherDateFilters;
                          qfc.addCustomDateFilter('Yesterday');
                        }
                      }
                    }
                  },
                ),
              ),
              trailing: IgnorePointer(
                child: CupertinoSwitch(
                  value: isSwitched ?? isExpanded,
                  onChanged: (_) {},
                ),
              ),
              onExpansionChanged: (isExpanded) {
                setState(() {
                  isSwitched = isExpanded;
                });

                if (isSwitched!) {
                  if (widget.isQuote) {
                    if (selectedDateFilter == 'Expiry Date') {
                      currentDateFilters = expiryDateFilters;
                      qfc.addCustomDateFilter('Expired');
                    } else {
                      currentDateFilters = otherDateFilters;
                      qfc.addCustomDateFilter('Yesterday');
                    }
                  } else {
                    if (selectedDateFilter == 'Due Date') {
                      currentDateFilters = expiryDateFilters;
                      qfc.addCustomDateFilter('Overdue');
                    } else {
                      currentDateFilters = otherDateFilters;
                      qfc.addCustomDateFilter('Yesterday');
                    }
                  }
                } else {
                  qfc
                    ..saveCustomDateType('')
                    ..addCustomDateFilter('');
                }
              },
              initiallyExpanded: isExpanded,
              textColor: Colors.black,
              children: currentDateFilters.map((filter) {
                return RadioListTile(
                  onChanged: (value) {
                    qfc.addCustomDateFilter(filter);
                  },
                  title: Text(filter),
                  groupValue: state.tempSelectedCustomDate,
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
                                qfc.saveCustomDateRange(
                                  isStart: true,
                                  selectedDate: res,
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
                                qfc.saveCustomDateRange(
                                  isStart: false,
                                  selectedDate: res,
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
