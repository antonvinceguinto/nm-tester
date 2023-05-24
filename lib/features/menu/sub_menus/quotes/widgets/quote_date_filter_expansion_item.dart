import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextminute/core/utils/extensions.dart';
import 'package:nextminute/features/menu/sub_menus/quotes/cubit/quotes_filters_cubit.dart';

class QuoteDateFilterExpansionItem extends StatefulWidget {
  const QuoteDateFilterExpansionItem({
    super.key,
    required this.isQuote,
    required this.isInvoice,
    required this.isOrder,
    required this.isSupplierInvoice,
  });

  final bool isQuote;
  final bool isInvoice;
  final bool isOrder;
  final bool isSupplierInvoice;

  @override
  State<QuoteDateFilterExpansionItem> createState() =>
      _QuoteDateFilterExpansionItemState();
}

class _QuoteDateFilterExpansionItemState
    extends State<QuoteDateFilterExpansionItem> {
  bool? isSwitched;

  late List<String> dateFilters;

  @override
  void initState() {
    super.initState();

    dateFilters = [
      if (widget.isQuote) 'Expired' else 'Overdue',
      'Yesterday',
      'Today',
      'Tomorrow',
      'This Week',
      'Next Week',
      'This Month',
      'Date Range',
    ];
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuotesFiltersCubit, QuotesFiltersState>(
      builder: (context, state) {
        final qfc = context.read<QuotesFiltersCubit>();

        final isExpanded = state.filters.containsKey('QuoteDateOn') ||
            state.filters.containsKey('BillableDateTo');
        // final isExpanded = state.filters.containsKey('QuoteDateOn');
        final isDateRange = state.tempSelectedQuoteDate == 'Date Range';

        final startDateRangeLabel =
            state.quoteDateRange['start']?.formatToFilterStyle() ??
                'Start Date';
        final endDateRangeLabel =
            state.quoteDateRange['end']?.formatToFilterStyle() ?? 'End Date';

        return Column(
          children: [
            ExpansionTile(
              title: Text(
                widget.isQuote
                    ? 'Quotes Date'
                    : widget.isInvoice
                        ? 'Invoice Date'
                        : widget.isOrder
                            ? 'Order Date'
                            : 'Supplier Invoice Date',
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
                    qfc.addQuoteDateFilter('Expired');
                  } else {
                    qfc.addQuoteDateFilter('Overdue');
                  }
                } else {
                  qfc.addQuoteDateFilter('');
                }
              },
              initiallyExpanded: isExpanded,
              textColor: Colors.black,
              children: dateFilters.map((filter) {
                return RadioListTile(
                  onChanged: (value) {
                    qfc.addQuoteDateFilter(filter);
                  },
                  title: Text(filter),
                  groupValue: state.tempSelectedQuoteDate,
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
                                qfc.saveDateFilter(
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
                                qfc.saveDateFilter(
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
