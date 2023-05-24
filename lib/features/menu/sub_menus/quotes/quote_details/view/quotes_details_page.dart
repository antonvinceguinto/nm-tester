import 'package:api_service/api_service.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:nextminute/core/utils/utils.dart';
import 'package:nextminute/features/menu/sub_menus/charges/bloc/charges_bloc.dart';
import 'package:nextminute/features/menu/sub_menus/charges/view/charges_page.dart';
import 'package:nextminute/features/menu/sub_menus/charges/widgets/charges_item.dart';
import 'package:nextminute/features/menu/sub_menus/quotes/quote_details/bloc/quote_details_bloc.dart';
import 'package:nextminute/features/wigdets/nm_widgets.dart';
import 'package:nm_repository/nm_repository.dart';

const infoLevel = 'detailedItems summary sections header associatedContacts '
    'clientContact subscriptionBillingSettings targetInvoiceItemSummaries';

@RoutePage()
class QuotesDetailsPage extends StatelessWidget {
  const QuotesDetailsPage({
    super.key,
    required this.billableId,
  });

  final int billableId;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => QuoteDetailsBloc(
            nmRepositoryImpl: context.read<NMRepositoryImpl>(),
          )..add(
              QuoteDetailsFetch(
                billableId: billableId,
                infoLevel: infoLevel,
              ),
            ),
        ),
        BlocProvider(
          create: (context) => ChargesBloc(
            nmRepositoryImpl: context.read<NMRepositoryImpl>(),
          ),
        ),
      ],
      child: QuotesDetailsView(billableId: billableId),
    );
  }
}

class QuotesDetailsView extends StatefulWidget {
  const QuotesDetailsView({
    super.key,
    required this.billableId,
  });

  final int billableId;

  @override
  State<QuotesDetailsView> createState() => _QuotesDetailsViewState();
}

class _QuotesDetailsViewState extends State<QuotesDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<QuoteDetailsBloc, QuoteDetailsState>(
          builder: (context, state) {
            final quoteDetails = state.billableDetailsModel;
            final isQuote = quoteDetails.billable_type == 'Quote';
            final isInvoice = quoteDetails.billable_type == 'Invoice';
            final isOrder = quoteDetails.billable_type == 'Order';
            final isSupplierInvoice =
                quoteDetails.billable_type == 'SupplierInvoice';

            return Text(
              isQuote
                  ? 'Quote'
                  : isInvoice || isSupplierInvoice
                      ? 'Invoice'
                      : isOrder
                          ? 'Order'
                          : 'Billable Details',
            );
          },
        ),
        actions: [
          NMCupertinoButton(
            onPressed: () {},
            child: const Text('Add'),
          ),
        ],
      ),
      body: NMBlocConsumer<QuoteDetailsBloc, QuoteDetailsState>(
        builder: (context, state) {
          final quoteDetails = state.billableDetailsModel;

          final isQuote = quoteDetails.billable_type == 'Quote';
          final isInvoice = quoteDetails.billable_type == 'Invoice';
          final isOrder = quoteDetails.billable_type == 'Order';
          final isSupplierInvoice =
              quoteDetails.billable_type == 'SupplierInvoice';

          final isBillableReadOnly =
              (quoteDetails.billable_isdeleted ?? false) ||
                  (quoteDetails.billable_isaccepted != null) ||
                  (quoteDetails.billable_synced_invoice_number != null);

          return Column(
            children: [
              if (isBillableReadOnly)
                _bannerInfo(
                  label: 'READ-ONLY',
                  hasDefaultIcon: false,
                ),
              if (quoteDetails.billable_isdeleted ?? false)
                _bannerInfo(label: 'This Invoice is Deleted'),
              if (quoteDetails.recordlock != null)
                _bannerInfo(
                  label: 'Locked by '
                      '''${quoteDetails.recordlock!.recordlock_lockedby_contact_name_display}''',
                ),
              if (isInvoice &&
                  quoteDetails.billable_accounting_provider_name_display !=
                      null)
                _bannerInfo(
                  color: NMColors.orange,
                  label: 'Synced with '
                      '''${quoteDetails.billable_accounting_provider_name_display}''',
                  hasDefaultIcon: false,
                  icon: FontAwesomeIcons.arrowsRotate,
                ),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    context.read<QuoteDetailsBloc>().add(
                          QuoteDetailsFetch(
                            billableId: widget.billableId,
                            infoLevel: infoLevel,
                          ),
                        );
                  },
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Column(
                      children: [
                        const SizedBox(height: 16),
                        _buildHeader(quoteDetails),
                        if (isInvoice || isSupplierInvoice)
                          ListTile(
                            tileColor: Colors.grey,
                            visualDensity: VisualDensity.compact,
                            contentPadding:
                                const EdgeInsets.only(left: 16, right: 20),
                            title: Text(
                              'Details for '
                              '${quoteDetails.billable_name} '
                              '${quoteDetails.billable_number}',
                            ).color(Colors.white),
                          )
                        else
                          CheckboxListTile(
                            value: false,
                            onChanged: (val) {},
                            tileColor: Colors.grey,
                            visualDensity: VisualDensity.compact,
                            contentPadding:
                                const EdgeInsets.only(left: 16, right: 20),
                            title: Text(
                              'Details for '
                              '${quoteDetails.billable_name} '
                              '${quoteDetails.billable_number}',
                            ).color(Colors.white),
                          ),
                        _buildSection(
                          quoteDetails,
                          isInvoice,
                          isSupplierInvoice,
                        ),
                        _buildFooter(quoteDetails),
                        _buildQuoteTotals(quoteDetails),
                      ],
                    ),
                  ),
                ),
              ),
              const NMBottomMenuActions(),
            ],
          );
        },
      ),
    );
  }

  Widget _bannerInfo({
    String? label,
    Widget? child,
    Color? color,
    bool hasDefaultIcon = true,
    IconData? icon,
  }) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: color ?? Colors.red,
      ),
      child: child ??
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (!hasDefaultIcon && icon != null)
                  Icon(
                    icon,
                    color: Colors.white,
                    size: 20,
                  ).paddingOnly(right: 6),
                if (hasDefaultIcon && icon == null)
                  const Icon(
                    Icons.lock,
                    color: Colors.white,
                    size: 20,
                  ),
                Text(
                  label ?? '',
                ).color(Colors.white),
              ],
            ),
          ).paddingAll(6),
    );
  }

  Widget _buildQuoteTotals(BillableDetailsModel billable) {
    var totalLabour = 0.0;
    var totalMaterials = 0.0;
    var totalDisbursements = 0.0;
    var totalOther = 0.0;

    if (billable.billableItems.isNotEmpty) {
      final labourItems = billable.billableItems
          .where((element) => element.billableitem_type == 'time')
          .map((e) => e.billableitem_sell_subtotal ?? 0);
      totalLabour = labourItems.isNotEmpty
          ? labourItems.reduce((value, element) => value + element)
          : 0.0;

      final materialItems = billable.billableItems
          .where((element) => element.billableitem_type == 'product')
          .map((e) => e.billableitem_sell_subtotal ?? 0);
      totalMaterials = materialItems.isNotEmpty
          ? materialItems.reduce((value, element) => value + element)
          : 0.0;

      final disbursementItems = billable.billableItems
          .where((element) => element.billableitem_type == 'disbursement')
          .map((e) => e.billableitem_sell_subtotal ?? 0);
      totalDisbursements = disbursementItems.isNotEmpty
          ? disbursementItems.reduce((value, element) => value + element)
          : 0.0;

      final otherItems = billable.billableItems
          .where((element) => element.billableitem_type == '')
          .map((e) => e.billableitem_sell_subtotal ?? 0);
      totalOther = otherItems.isNotEmpty
          ? otherItems.reduce((value, element) => value + element)
          : 0.0;
    }

    final subtotal =
        totalLabour + totalMaterials + totalDisbursements + totalOther;

    final totalGST = (billable.billable_total ?? 0) - subtotal;

    return Column(
      children: [
        Container(
          color: Colors.grey,
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Quote Totals').color(Colors.white).bold(),
              const Text('Total').color(Colors.white).bold(),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Total Labour'),
            Text('\$${totalLabour.toCommaString()}'),
          ],
        ).paddingSymmetric(
          horizontal: 16,
          vertical: 8,
        ),
        const Divider(height: 1),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Total Materials'),
            Text('\$${totalMaterials.toCommaString()}'),
          ],
        ).paddingSymmetric(
          horizontal: 16,
          vertical: 8,
        ),
        const Divider(height: 1),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Total Disbursements'),
            Text('\$${totalDisbursements.toCommaString()}'),
          ],
        ).paddingSymmetric(
          horizontal: 16,
          vertical: 8,
        ),
        const Divider(height: 1),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Total Other'),
            Text('\$${totalOther.toCommaString()}'),
          ],
        ).paddingSymmetric(
          horizontal: 16,
          vertical: 8,
        ),
        const Divider(height: 1),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Subtotal').bold(),
            Text('\$${subtotal.toCommaString()}').bold(),
          ],
        ).paddingSymmetric(
          horizontal: 16,
          vertical: 8,
        ),
        const Divider(height: 1),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Total GST'),
            Text('\$${totalGST.toCommaString()}'),
          ],
        ).paddingSymmetric(
          horizontal: 16,
          vertical: 8,
        ),
        const Divider(height: 1),
        Container(
          color: NMColors.orange,
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Quote Total').color(Colors.white).bold(),
              Text('\$${(billable.billable_total ?? 0).toCommaString()}')
                  .color(Colors.white)
                  .bold(),
            ],
          ),
        ),
        const Divider(height: 1),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Margin',
              style: TextStyle(
                decoration: TextDecoration.underline,
              ),
            ).color(Colors.green.shade700),
            Text('\$${totalGST.toCommaString()}').color(Colors.green.shade700),
          ],
        ).paddingSymmetric(
          horizontal: 16,
          vertical: 8,
        ),
        const Divider(height: 1),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Profit',
            ).color(Colors.green.shade700),
            Text('\$${totalGST.toCommaString()}').color(Colors.green.shade700),
          ],
        ).paddingSymmetric(
          horizontal: 16,
          vertical: 8,
        ),
      ],
    );
  }

  Widget _buildSection(
    BillableDetailsModel billable,
    bool isInvoice,
    bool isSupplierInvoice,
  ) {
    List<BillableInfoLevelItem> filterItemsByTypeAndSection(
      String type,
      int sectionId,
    ) {
      return billable.billableItems
          .where(
            (element) =>
                element.billableitem_type == type &&
                (element.billableitem_billablesection_id == sectionId),
          )
          .toList();
    }

    // For each section in billable.sections, build a section widget
    return Column(
      children: billable.sections.map((section) {
        final labours = filterItemsByTypeAndSection(
          BillableTypeEnum.time.toString(),
          section.billablesection_id!,
        );
        final materials = filterItemsByTypeAndSection(
          BillableTypeEnum.product.toString(),
          section.billablesection_id!,
        );
        final disbursements = filterItemsByTypeAndSection(
          BillableTypeEnum.disbursement.toString(),
          section.billablesection_id!,
        );
        final others = filterItemsByTypeAndSection(
          '',
          section.billablesection_id!,
        );

        final sectionTotal = labours.fold(
              // ignore: prefer_int_literals
              0.0,
              (previousValue, element) =>
                  previousValue + (element.billableitem_sell_subtotal ?? 0.0),
            ) +
            materials.fold(
              0.0,
              (previousValue, element) =>
                  previousValue + (element.billableitem_sell_subtotal ?? 0.0),
            ) +
            disbursements.fold(
              0.0,
              (previousValue, element) =>
                  previousValue + (element.billableitem_sell_subtotal ?? 0.0),
            ) +
            others.fold(
              0.0,
              (previousValue, element) =>
                  previousValue + (element.billableitem_sell_subtotal ?? 0.0),
            );

        return Column(
          children: [
            ListTile(
              tileColor: Colors.grey.shade300,
              title: Text(section.billablesection_name ?? '-'),
              trailing: isInvoice || isSupplierInvoice
                  ? const SizedBox.shrink()
                  : Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.settings,
                            color: Colors.grey.shade800,
                          ),
                        ),
                        Checkbox(
                          value: false,
                          onChanged: (val) {},
                        ),
                      ],
                    ),
            ),
            _buildSectionListView(labours, BillableTypeEnum.time),
            _buildSectionListView(materials, BillableTypeEnum.product),
            _buildSectionListView(disbursements, BillableTypeEnum.disbursement),
            _buildSectionListView(others, BillableTypeEnum.other),
            const SizedBox(height: 6),
            if (sectionTotal.roundToDouble() > 0)
              Align(
                alignment: Alignment.centerRight,
                child: Text('Section Total: \$${sectionTotal.toCommaString()}')
                    .bold(),
              ).paddingOnly(right: 16),
            SizedBox(
              width: 500,
              child: _addButton(
                'Add a new item',
                onPressed: () {},
              ),
            ).paddingSymmetric(horizontal: 16, vertical: 8),
          ],
        );
      }).toList(),
    );
  }

  Widget _buildSectionListView(
    List<BillableInfoLevelItem> items,
    BillableTypeEnum type,
  ) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return ChargesItem(
          type: type,
          billable: item,
        ).paddingSymmetric(horizontal: 16, vertical: 8);
      },
    );
  }

  Widget _buildFooter(BillableDetailsModel billable) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.grey.shade700,
              ),
              bottom: BorderSide(
                color: Colors.grey.shade700,
              ),
            ),
          ),
          padding: const EdgeInsets.all(12),
          child: billable.billable_footer_notes == null
              ? const Text('Click to edit the footer notes...')
              : HtmlWidget(billable.billable_footer_notes!),
        ),
      ],
    );
  }

  Widget _buildHeader(BillableDetailsModel billable) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                billable.billable_type ?? '-',
              ).fontSize(22).bold(),
            ),
            if (billable.subscription?.subscription_logo_uri != null)
              Expanded(
                child: CachedNetworkImage(
                  imageUrl: billable.subscription!.subscription_logo_uri!,
                  width: 150,
                  placeholder: (context, url) => const SizedBox.shrink(),
                  errorWidget: (context, url, error) => const SizedBox.shrink(),
                ),
              ),
          ],
        ).paddingSymmetric(
          horizontal: 12,
        ),
        const SizedBox(height: 8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text('To: ${billable.billable_client_contact_name ?? ''}\n'
                      '${billable.billable_client_contact_address ?? ''}')
                  .paddingOnly(right: 8),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Quote Number').bold(),
                  Text(billable.billable_number ?? '-'),
                  const SizedBox(height: 8),
                  if (billable.billable_date != null) ...{
                    const Text('Quote Date').bold(),
                    Text(
                      DateFormat('dd-MMM-yyyy').format(billable.billable_date!),
                    ),
                  },
                  const SizedBox(height: 8),
                  if (billable.billable_date_due != null) ...{
                    const Text('Expiry Date').bold(),
                    Text(
                      DateFormat('dd-MMM-yyyy')
                          .format(billable.billable_date_due!),
                    ),
                  },
                  const SizedBox(height: 8),
                  if (billable.BillableReferenceMultiLine != null &&
                      billable.BillableReferenceMultiLine!.isNotEmpty) ...{
                    const Text('Quote Reference').bold(),
                    Text(billable.BillableReferenceMultiLine!),
                  },
                  if (billable.billable_source_billable_number != null &&
                      billable.billable_source_billable_number!.isNotEmpty) ...{
                    const SizedBox(height: 8),
                    const Text('Source Quote').bold(),
                    Text(billable.billable_source_billable_number ?? '-'),
                  },
                ],
              ),
            ),
          ],
        ).paddingSymmetric(
          horizontal: 12,
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.grey.shade700,
              ),
              bottom: BorderSide(
                color: Colors.grey.shade700,
              ),
            ),
          ),
          padding: const EdgeInsets.all(12),
          child: billable.billable_header_notes == null
              ? const Text('Click to edit the header notes...')
              : HtmlWidget(billable.billable_header_notes!),
        ),
      ],
    );
  }

  Widget _addButton(String title, {void Function()? onPressed}) {
    final isDarkMode = context.isDarkMode;

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
              backgroundColor: isDarkMode
                  ? MaterialStateProperty.all(Colors.grey.shade800)
                  : MaterialStateProperty.all(Colors.grey.shade300),
            ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FaIcon(
              FontAwesomeIcons.plus,
              color: isDarkMode ? Colors.white : NMColors.black,
              size: 16,
            ),
            const SizedBox(width: 8),
            Text(
              title,
              style: NMTextStyles.btn(context)?.copyWith(
                color: isDarkMode ? Colors.white : NMColors.black,
              ),
            ),
          ],
        ),
      ).paddingSymmetric(vertical: 8),
    );
  }
}
