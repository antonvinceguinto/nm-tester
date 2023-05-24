import 'dart:developer';

import 'package:nextminute/features/menu/sub_menus/quotes/cubit/quotes_filters_cubit.dart';

class QuotesHelpers {
  static String getFilterTitles(
    QuotesFiltersState filter, {
    required bool isQuote,
    required bool isInvoice,
  }) {
    final titleString = isQuote
        ? 'Quotes'
        : isInvoice
            ? 'Invoices'
            : 'Invoices';

    if (filter.filters.isEmpty) {
      return '$titleString - No filters active';
    }

    var filterTitles = <String>[];
    filter.filters.forEach((key, value) {
      final title = isQuote
          ? _getQuoteFilterTitle(filter, key)
          : _getInvoiceFilterTitle(filter, key);
      if (title.isNotEmpty) {
        filterTitles.add(title);
      }
    });

    filterTitles = filterTitles.toSet().toList();

    return '$titleString - ${filterTitles.join(', ')}';
  }

  static String _getInvoiceFilterTitle(QuotesFiltersState filter, String key) {
    String title;

    // If the only key is 'DueDateTo' (which is the quick filter)
    // then just return 'Expired'
    if (filter.filters.keys.length == 2 &&
        filter.filters.containsKey('BillableDateFrom') &&
        filter.filters.containsKey('BillableDateTo')) {
      return 'Invoice Date Due Today';
    }

    switch (key) {
      case 'IsOutstanding':
        title = 'Outstanding';
        break;
      case 'QuoteDateOn':
        title = _getQuoteDateFilterTitle(
          filter.filters['QuoteDateOn'] as String,
          'Invoice Date Due',
        );
        break;
      case 'CustomDateOn':
        title = _getQuoteDateFilterTitle(
          filter.filters['CustomDateOn'] as String?,
          'Due',
        );
        break;
      case 'IsSynced':
        title = 'Synced';
        break;
      case 'IsNonSynced':
        title = 'Non-Synced';
        break;
      case 'JobPricingType':
        title = 'Filtered by PricingType';
        break;
      case 'JobIds':
        title = 'Filtered by Job';
        break;
      case 'ContactIds':
        title = 'Filtered by Customer';
        break;
      case 'OrderStatus':
        title = 'Filtered by Order Status';
        break;
      default:
        title = '';
    }
    return title;
  }

  static String _getQuoteFilterTitle(QuotesFiltersState filter, String key) {
    String title;

    log('filter.filters: ${filter.filters}');

    // If the only key is 'DueDateTo' (which is the quick expired filter)
    // then just return 'Expired'
    if (filter.filters.keys.length == 1 &&
        filter.filters.containsKey('DueDateTo')) {
      return 'Expired';
    }

    switch (key) {
      case 'IsUnAccepted':
        title = 'UnAccepted';
        break;
      case 'IsAccepted':
        title = 'Accepted';
        break;
      case 'IsRejected':
        title = 'Rejected';
        break;
      case 'IsUnInvoiced':
        title = 'Un-Invoiced';
        break;
      case 'IsUnAssigned':
        title = 'Unassigned to a Job or Task';
        break;
      case 'ExcludeArchivedJobs':
        title = 'Exclude Archived Jobs';
        break;
      case 'QuoteDateOn':
        title = _getQuoteDateFilterTitle(
          filter.filters['QuoteDateOn'] as String,
          'Invoice Date Due',
        );
        break;
      case 'CustomDateOn':
        title = _getQuoteDateFilterTitle(
          filter.filters['CustomDateOn'] as String?,
          'Due',
        );
        break;
      case 'JobIds':
        title = 'Filtered by Job';
        break;
      case 'JobPricingType':
        title = 'Filtered by PricingType';
        break;
      case 'ContactIds':
        title = 'Filtered by Customer';
        break;
      default:
        title = '';
    }
    return title;
  }

  static String _getQuoteDateFilterTitle(String? dateFilter, String prefix) {
    switch (dateFilter) {
      case 'Expired':
        return 'Expired';
      case 'Overdue':
        return 'Overdue';
      case 'Yesterday':
        return '$prefix Yesterday';
      case 'Today':
        return '$prefix Today';
      case 'Tomorrow':
        return '$prefix Tomorrow';
      case 'This Week':
        return '$prefix This Week';
      case 'Next Week':
        return '$prefix Next Week';
      case 'This Month':
        return '$prefix This Month';
      case 'Date Range':
        return dateFilter == 'CustomDateOn'
            ? 'Date Range'
            : '$prefix Date Range';
      default:
        return '';
    }
  }
}
