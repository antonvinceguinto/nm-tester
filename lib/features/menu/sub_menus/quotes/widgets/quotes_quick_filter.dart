import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:nextminute/core/utils/utils.dart';
import 'package:nextminute/features/menu/sub_menus/quotes/cubit/quotes_filters_cubit.dart';
import 'package:nextminute/features/wigdets/nm_always_scroll.dart';
import 'package:nextminute/features/wigdets/nm_widgets.dart';

class QuotesQuickFilter extends StatelessWidget {
  const QuotesQuickFilter({
    super.key,
    required this.isQuote,
    required this.isInvoice,
    required this.onFetchData,
  });

  final bool isQuote;
  final bool isInvoice;
  final void Function() onFetchData;

  @override
  Widget build(BuildContext context) {
    final quotesQuickFilterCubit = context.watch<QuotesFiltersCubit>();

    return NMCupertinoButton(
      padding: const EdgeInsets.only(right: 16),
      onPressed: () async {
        await showCupertinoModalBottomSheet<void>(
          context: context,
          closeProgressThreshold: 0.9,
          backgroundColor: NMColors.black,
          builder: (context) => SafeArea(
            child: AlwaysScroll(
              child: Column(
                children: [
                  _buildQuickFilterItem(
                    onTap: () {
                      quotesQuickFilterCubit.clearFilters();
                      Navigator.pop(context);
                      onFetchData.call();
                    },
                    title: 'Clear Filter',
                  ),
                  if (isInvoice) ...{
                    _buildQuickFilterItem(
                      onTap: () => _setQuickFilter(
                        context,
                        InvoiceQuickFilterEnum.unpaidInvoices.key,
                        true,
                      ),
                      title: InvoiceQuickFilterEnum.unpaidInvoices.name,
                    ),
                    _buildQuickFilterItem(
                      onTap: () {
                        Navigator.pop(context);
                        context.read<QuotesFiltersCubit>().clearFilters();

                        final now =
                            DateFormat('yyyy-MM-dd').format(DateTime.now());

                        context.read<QuotesFiltersCubit>()
                          ..addQuoteDateFilter('Today')
                          ..addFilter('BillableDateFrom', now)
                          ..addFilter('BillableDateTo', now)
                          ..applyTempFilters([], [], []);

                        onFetchData.call();
                      },
                      title: InvoiceQuickFilterEnum.invoiceDate.name,
                    ),
                  },
                  if (isQuote) ...{
                    _buildQuickFilterItem(
                      onTap: () => _setQuickFilter(
                        context,
                        QuotesQuickFilterEnum.unacceptedQuotes.key,
                        true,
                      ),
                      title: QuotesQuickFilterEnum.unacceptedQuotes.name,
                    ),
                    _buildQuickFilterItem(
                      onTap: () => _setQuickFilter(
                        context,
                        QuotesQuickFilterEnum.acceptedQuotes.key,
                        true,
                      ),
                      title: QuotesQuickFilterEnum.acceptedQuotes.name,
                    ),
                    _buildQuickFilterItem(
                      onTap: () => _setQuickFilter(
                        context,
                        QuotesQuickFilterEnum.declinedQuotes.key,
                        true,
                      ),
                      title: QuotesQuickFilterEnum.declinedQuotes.name,
                    ),
                    _buildQuickFilterItem(
                      onTap: () => _setQuickFilter(
                        context,
                        QuotesQuickFilterEnum.unInvoicedQuotes.key,
                        true,
                      ),
                      title: QuotesQuickFilterEnum.unInvoicedQuotes.name,
                    ),
                    _buildQuickFilterItem(
                      onTap: () => _setQuickFilter(
                        context,
                        QuotesQuickFilterEnum.unassignedToJobTask.key,
                        true,
                      ),
                      title: QuotesQuickFilterEnum.unassignedToJobTask.name,
                    ),
                    _buildQuickFilterItem(
                      onTap: () => _setQuickFilter(
                        context,
                        QuotesQuickFilterEnum.expiredQuotes.key,
                        DateFormat('yyyy-MM-dd').format(DateTime.now()),
                      ),
                      title: QuotesQuickFilterEnum.expiredQuotes.name,
                    ),
                  },
                  _buildQuickFilterItem(
                    onTap: () => Navigator.pop(context),
                    title: 'Cancel',
                  ),
                ],
              ),
            ),
          ),
        );
      },
      child: const Icon(Icons.arrow_drop_down),
    );
  }

  void _setQuickFilter(BuildContext context, String key, dynamic value) {
    Navigator.pop(context);
    context.read<QuotesFiltersCubit>().clearFilters();

    if (key == QuotesQuickFilterEnum.expiredQuotes.key) {
      context.read<QuotesFiltersCubit>().saveCustomDateType('Expiry Date');
      context.read<QuotesFiltersCubit>().addCustomDateFilter('Expired');
    }

    context.read<QuotesFiltersCubit>().addFilter(key, value);

    onFetchData.call();
  }

  Widget _buildQuickFilterItem({
    void Function()? onTap,
    required String title,
  }) {
    return ListTile(
      onTap: onTap,
      title: Text(title).color(Colors.white),
    );
  }
}

enum QuotesQuickFilterEnum {
  unacceptedQuotes,
  acceptedQuotes,
  declinedQuotes,
  unInvoicedQuotes,
  unassignedToJobTask,
  expiredQuotes,
  excludeArchivedJobs;

  String get key {
    switch (this) {
      case QuotesQuickFilterEnum.unacceptedQuotes:
        return 'IsUnAccepted';
      case QuotesQuickFilterEnum.acceptedQuotes:
        return 'IsAccepted';
      case QuotesQuickFilterEnum.declinedQuotes:
        return 'IsRejected';
      case QuotesQuickFilterEnum.unInvoicedQuotes:
        return 'IsUnInvoiced';
      case QuotesQuickFilterEnum.unassignedToJobTask:
        return 'IsUnAssigned';
      case QuotesQuickFilterEnum.expiredQuotes:
        return 'DueDateTo';
      case QuotesQuickFilterEnum.excludeArchivedJobs:
        return 'ExcludeArchivedJobs';
    }
  }

  String get name {
    switch (this) {
      case QuotesQuickFilterEnum.unacceptedQuotes:
        return 'Unaccepted Quotes';
      case QuotesQuickFilterEnum.acceptedQuotes:
        return 'Accepted Quotes';
      case QuotesQuickFilterEnum.declinedQuotes:
        return 'Declined Quotes';
      case QuotesQuickFilterEnum.unInvoicedQuotes:
        return 'Un-Invoiced Quotes';
      case QuotesQuickFilterEnum.unassignedToJobTask:
        return 'Unassigned to a Job/Task';
      case QuotesQuickFilterEnum.expiredQuotes:
        return 'Expired Quotes';
      case QuotesQuickFilterEnum.excludeArchivedJobs:
        return 'Exclude Archived Jobs';
    }
  }
}

enum InvoiceQuickFilterEnum {
  unpaidInvoices,
  invoiceDate,
  syncedInvoicesOnly,
  excludeSyncedInvoices;

  String get key {
    switch (this) {
      case InvoiceQuickFilterEnum.unpaidInvoices:
        return 'IsOutstanding';
      case InvoiceQuickFilterEnum.invoiceDate:
        return 'InvoiceDate';
      case InvoiceQuickFilterEnum.syncedInvoicesOnly:
        return 'IsSynced';
      case InvoiceQuickFilterEnum.excludeSyncedInvoices:
        return 'IsNonSynced';
    }
  }

  String get name {
    switch (this) {
      case InvoiceQuickFilterEnum.unpaidInvoices:
        return 'Unpaid Invoices';
      case InvoiceQuickFilterEnum.invoiceDate:
        return 'Invoice Date';
      case InvoiceQuickFilterEnum.syncedInvoicesOnly:
        return 'Synced Invoices Only';
      case InvoiceQuickFilterEnum.excludeSyncedInvoices:
        return 'Exclude Synced Invoices';
    }
  }
}
