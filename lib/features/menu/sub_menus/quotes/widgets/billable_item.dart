import 'package:api_service/api_service.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:nextminute/core/routes/app_router.dart';
import 'package:nextminute/core/utils/utils.dart';
import 'package:nextminute/features/menu/main_menu/bloc/main_menu_bloc.dart';
import 'package:nextminute/features/menu/sub_menus/charges/widgets/charges_item.dart';

class BillableItem extends StatelessWidget {
  const BillableItem(
    this.quote, {
    super.key,
  });

  final QuoteItemDatum quote;

  bool get isQuote => quote.billable_type == 'Quote';
  bool get isInvoice => quote.billable_type == 'Invoice';
  bool get isOrder => quote.billable_type == 'Order';
  bool get isSupplierInvoice => quote.billable_type == 'SupplierInvoice';

  @override
  Widget build(BuildContext context) {
    final up = context.read<MainMenuBloc>().state;
    final isSellVisible = up.userPermissions.isChargeSellPricesVisible &&
        up.isChargeDetailsVisible;

    final totalPaid =
        (quote.billable_total ?? 0) - (quote.billable_total_payments ?? 0);

    return InkWell(
      onTap: () {
        context.router.push(QuotesDetailsRoute(billableId: quote.billable_id!));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // ignore: use_decorated_box
          Container(
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (isQuote) ...{
                    _buildStatusContainer(_getQuoteStatus),
                    const VerticalDivider(
                      color: Colors.black,
                      width: 1,
                    ),
                  },
                  Expanded(
                    child: _buildQuoteDetails(context, up).paddingAll(8),
                  ),
                ],
              ),
            ),
          ),
          if (quote.recordlock != null)
            DecoratedBox(
              decoration: const BoxDecoration(
                color: Colors.red,
                border: Border(
                  bottom: BorderSide(),
                  left: BorderSide(),
                  right: BorderSide(),
                ),
              ),
              child: Center(
                child: Text(
                  'Locked by '
                  '''${quote.recordlock!["recordlock_lockedby_contact_name_display"]}''',
                ).color(Colors.white),
              ).paddingAll(4),
            ),
          if (quote.billable_synced_accounting_provider != null && !isOrder)
            DecoratedBox(
              decoration: const BoxDecoration(
                color: NMColors.orange,
                border: Border(
                  bottom: BorderSide(),
                  left: BorderSide(),
                  right: BorderSide(),
                ),
              ),
              child: Center(
                child: Text(
                  'Synced with ${quote.billable_synced_accounting_provider!}',
                ).color(Colors.white),
              ).paddingAll(4),
            ),
          if (isSupplierInvoice &&
              (quote.billable_isimported ?? false) &&
              quote.billable_client_contact_name != null)
            DecoratedBox(
              decoration: const BoxDecoration(
                color: NMColors.orange,
                border: Border(
                  bottom: BorderSide(),
                  left: BorderSide(),
                  right: BorderSide(),
                ),
              ),
              child: Center(
                child: Text(
                  'Imported from ${quote.billable_client_contact_name!}',
                ).color(Colors.white),
              ).paddingAll(4),
            ),
          if (isSellVisible && !isOrder || isSupplierInvoice)
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if (isQuote)
                  if (quote.billable_invoiced_total != null &&
                      quote.billable_invoiced_total! > 0)
                    PriceTag(
                      price:
                          '\$${quote.billable_invoiced_total?.toCommaString()} '
                          'Billed',
                      color: Colors.green,
                      tipWidth: 0.1,
                    ),
                if (quote.billable_total_payments != null &&
                    quote.billable_total_payments! > 0)
                  PriceTag(
                    price:
                        '\$${quote.billable_total_payments?.toCommaString()} '
                        'Paid',
                    color: Colors.green,
                    tipWidth: 0.1,
                  ),
                if (quote.billable_total_creditnotes != null &&
                    quote.billable_total_creditnotes! > 0)
                  PriceTag(
                    price:
                        '''\$${quote.billable_total_creditnotes?.toCommaString()} '''
                        'Credited',
                    color: Colors.blue,
                    tipWidth: 0.1,
                  ),
                if (quote.billable_invoiced_amount_remaining_total != null &&
                    quote.billable_invoiced_amount_remaining_total! > 0)
                  isInvoice && quote.billable_total_creditnotes! > 0
                      ? const SizedBox.shrink()
                      : totalPaid > 0
                          ? PriceTag(
                              price: '\$${totalPaid.toCommaString()} '
                                  '${isQuote ? 'Remaining' : 'Due'}',
                              color: Colors.red,
                              tipWidth: 0.1,
                            )
                          : const SizedBox.shrink(),
              ],
            )
        ],
      ).paddingSymmetric(vertical: 4),
    );
  }

  Widget _buildStatusContainer(QuoteStatusEnum status) {
    return Container(
      color: status.color,
      constraints: const BoxConstraints(
        minHeight: 80,
      ),
      height: double.infinity,
      child: RotatedBox(
        quarterTurns: -3,
        child: Center(
          child: Text(status.name)
              .color(
                status.color.isDark() ? Colors.white : NMColors.black,
              )
              .paddingSymmetric(vertical: 2),
        ),
      ),
    );
  }

  Widget _buildQuoteDetails(
    BuildContext context,
    MainMenuState up,
  ) {
    var statusText = 'Not Sent';

    if (isOrder) {
      switch (quote.billable_order_status) {
        case 0:
          statusText += ', Pending';
          break;
        case 1:
          statusText += ', Submitted';
          break;
        case 2:
          statusText += ', Cancelled';
          break;
        case 3:
          statusText += ', Complete';
          break;
        default:
          break;
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildClientDetails(),
            Expanded(
              child: _buildQuoteName(context.isDarkMode),
            ),
          ],
        ),
        _buildCreatedBy(),
        if (!isSupplierInvoice) ...{
          if (quote.billable_date_last_sent != null)
            _buildLastSentDate(quote)
          else
            Text(statusText).color(Colors.red).fontSize(14),
        },
        if (quote.billable_total != null && up.isChargeDetailsVisible)
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              '${quote.billable_total! < 0 ? '-' : ''}'
              '\$${quote.billable_total!.abs().toCommaString()}',
            ).bold(),
          ),
      ],
    );
  }

  Widget _buildClientDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (quote.billable_client_contact_name != null &&
            quote.billable_client_contact_name!.isNotEmpty)
          Text('${quote.billable_client_contact_name}').fontSize(20).bold(),
        if (quote.billable_associated_record_number != null &&
            quote.billable_associated_record_number!.isNotEmpty &&
            !isSupplierInvoice)
          Text('${quote.billable_associated_record_number}'),
        if (isSupplierInvoice && quote.billable_job_number != null)
          Text('${quote.billable_job_number}'),
        if (quote.billable_number != null &&
            quote.billable_number!.isNotEmpty &&
            (isOrder || isSupplierInvoice))
          Text('${quote.billable_number}'),
        if (isQuote)
          if (quote.billable_number != null &&
              quote.billable_number!.isNotEmpty)
            Text(getBillableNumber),
        if (isInvoice) Text(getBillableNumber),
        if (quote.billable_reference != null &&
            quote.billable_reference!.isNotEmpty &&
            !isSupplierInvoice)
          Text('${quote.billable_reference}'),
      ],
    );
  }

  String get getBillableNumber {
    if (isQuote) {
      return quote.billable_number ?? '';
    }

    if (quote.billable_synced_invoice_number != null &&
        quote.billable_type == 'Invoice') {
      return quote.billable_number ?? '';
    }

    return 'Draft Invoice';
  }

  Widget _buildQuoteName(bool isDarkMode) {
    return Text(
      quote.billable_name ?? '',
      textAlign: TextAlign.end,
    )
        .color(
          isDarkMode ? Colors.grey.shade300 : Colors.grey.shade600,
        )
        .fontSize(20)
        .bold();
  }

  Widget _buildCreatedBy() {
    return Text(
      'Added by ${quote.billable_createdby_contact_name} on '
      '''${DateFormat('dd-MMM-yyyy').format(quote.billable_date!)}''',
    ).color(Colors.red).fontSize(14);
  }

  Widget _buildLastSentDate(QuoteItemDatum quote) {
    return Text('Last Sent on '
        '''${DateFormat('dd-MMM-yyyy').format(quote.billable_date_last_sent!)}''');
  }

  QuoteStatusEnum get _getQuoteStatus {
    final isAccepted =
        quote.billable_isaccepted != null && quote.billable_isaccepted!;
    final isRejected =
        quote.billable_isaccepted != null && !quote.billable_isaccepted!;
    final isExpired = quote.billable_date_due != null &&
        !isAccepted &&
        !isRejected &&
        DateTime.parse(quote.billable_date_due!.toString())
            .isBefore(DateTime.now());

    if (isAccepted) {
      return QuoteStatusEnum.accepted;
    } else if (isExpired) {
      return QuoteStatusEnum.expired;
    } else if (isRejected) {
      return QuoteStatusEnum.declined;
    } else {
      return QuoteStatusEnum.none;
    }
  }
}

enum QuoteStatusEnum {
  expired,
  declined,
  accepted,
  none;

  String get name {
    switch (this) {
      case QuoteStatusEnum.expired:
        return 'Expired';
      case QuoteStatusEnum.declined:
        return 'Declined';
      case QuoteStatusEnum.accepted:
        return 'Accepted';
      case QuoteStatusEnum.none:
        return '';
    }
  }

  Color get color {
    switch (this) {
      case QuoteStatusEnum.expired:
        return Colors.yellow.shade300;
      case QuoteStatusEnum.declined:
        return Colors.red.shade300;
      case QuoteStatusEnum.accepted:
        return Colors.green;
      case QuoteStatusEnum.none:
        return Colors.white;
    }
  }
}

enum QuoteOrderStatusEnum {
  pending,
  submitted,
  cancelled,
  complete;

  String get name {
    switch (this) {
      case QuoteOrderStatusEnum.pending:
        return 'Pending';
      case QuoteOrderStatusEnum.submitted:
        return 'Submitted';
      case QuoteOrderStatusEnum.cancelled:
        return 'Cancelled';
      case QuoteOrderStatusEnum.complete:
        return 'Complete';
    }
  }

  int get value {
    switch (this) {
      case QuoteOrderStatusEnum.pending:
        return 0;
      case QuoteOrderStatusEnum.submitted:
        return 1;
      case QuoteOrderStatusEnum.cancelled:
        return 2;
      case QuoteOrderStatusEnum.complete:
        return 3;
    }
  }
}
