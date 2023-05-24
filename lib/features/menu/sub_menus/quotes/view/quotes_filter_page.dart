import 'package:api_service/api_service.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/widgets/customer_filter_expansion_item.dart';
import 'package:nextminute/features/menu/sub_menus/quotes/cubit/quotes_filters_cubit.dart';
import 'package:nextminute/features/menu/sub_menus/quotes/widgets/quote_custom_date_filter_expansion_item.dart';
import 'package:nextminute/features/menu/sub_menus/quotes/widgets/quote_date_filter_expansion_item.dart';
import 'package:nextminute/features/menu/sub_menus/quotes/widgets/quote_job_filter_expansion_item.dart';
import 'package:nextminute/features/menu/sub_menus/quotes/widgets/quote_pricing_filter_expansion_item.dart';
import 'package:nextminute/features/menu/sub_menus/quotes/widgets/quotes_quick_filter.dart';
import 'package:nextminute/features/menu/sub_menus/sub_menus.dart';
import 'package:nextminute/features/utils/generic_status_enum.dart';
import 'package:nextminute/features/wigdets/nm_always_scroll.dart';
import 'package:nextminute/features/wigdets/nm_widgets.dart';
import 'package:nm_repository/nm_repository.dart';

@RoutePage()
class QuotesFilterPage extends StatelessWidget {
  const QuotesFilterPage({
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
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: JobsFilterBloc(
        nmRepositoryImpl: context.read<NMRepositoryImpl>(),
      )..add(const PricingFetchEvent()),
      child: QuotesFilterView(
        isQuote: isQuote,
        isInvoice: isInvoice,
        isOrder: isOrder,
        isSupplierInvoice: isSupplierInvoice,
      ),
    );
  }
}

class QuotesFilterView extends StatefulWidget {
  const QuotesFilterView({
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
  State<QuotesFilterView> createState() => _QuotesFilterViewState();
}

class _QuotesFilterViewState extends State<QuotesFilterView> {
  @override
  void initState() {
    super.initState();
    context.read<QuotesFiltersCubit>().resetFilters();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuotesFiltersCubit, QuotesFiltersState>(
      builder: (context, state) {
        final jobsFilterBloc = context.watch<JobsFilterBloc>();
        final qfc = context.watch<QuotesFiltersCubit>();

        return Scaffold(
          appBar: AppBar(
            title: Text(
              widget.isQuote
                  ? 'Quotes Filter'
                  : widget.isInvoice
                      ? 'Invoices Filter'
                      : widget.isOrder
                          ? 'Filter Orders'
                          : '',
            ),
            actions: [
              NMCupertinoButton(
                child: const Text('Apply'),
                onPressed: () {
                  final jfc = context.read<JobsFilterCubit>();
                  qfc.applyTempFilters(
                    jfc.state.selectedPricingTypeFilters ?? [],
                    jfc.state.isCustomerFilterEnabled
                        ? (jfc.state.selectedEnabledCustomers)
                            .map((e) => e.contact_id!)
                            .toList()
                        : [],
                    state.selectedOrderStatus?.map((e) => e.id!).toList() ?? [],
                  );
                  context.router.pop('Apply');
                },
              )
            ],
          ),
          body: jobsFilterBloc.state.status == GenericRequestStatusEnum.loading
              ? const Center(child: CircularProgressIndicator())
              : AlwaysScroll(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (widget.isInvoice || widget.isSupplierInvoice)
                        JobsToggleFilterItem(
                          label: widget.isSupplierInvoice
                              ? 'UnpaId Supplier Invoices'
                              : InvoiceQuickFilterEnum.unpaidInvoices.name,
                          isSelected: state.tempFilters.containsKey(
                            InvoiceQuickFilterEnum.unpaidInvoices.key,
                          ),
                          onTap: () => qfc.addTempFilter(
                            InvoiceQuickFilterEnum.unpaidInvoices.key,
                            !state.tempFilters.containsKey(
                              InvoiceQuickFilterEnum.unpaidInvoices.key,
                            ),
                          ),
                        ),
                      if (widget.isQuote) ...{
                        JobsToggleFilterItem(
                          label: QuotesQuickFilterEnum.unacceptedQuotes.name,
                          isSelected: state.tempFilters.containsKey(
                            QuotesQuickFilterEnum.unacceptedQuotes.key,
                          ),
                          onTap: () => qfc.addTempFilter(
                            QuotesQuickFilterEnum.unacceptedQuotes.key,
                            !state.tempFilters.containsKey(
                              QuotesQuickFilterEnum.unacceptedQuotes.key,
                            ),
                          ),
                        ),
                        JobsToggleFilterItem(
                          label: QuotesQuickFilterEnum.acceptedQuotes.name,
                          isSelected: state.tempFilters.containsKey(
                            QuotesQuickFilterEnum.acceptedQuotes.key,
                          ),
                          onTap: () => qfc.addTempFilter(
                            QuotesQuickFilterEnum.acceptedQuotes.key,
                            !state.tempFilters.containsKey(
                              QuotesQuickFilterEnum.acceptedQuotes.key,
                            ),
                          ),
                        ),
                        JobsToggleFilterItem(
                          label: QuotesQuickFilterEnum.declinedQuotes.name,
                          isSelected: state.tempFilters.containsKey(
                            QuotesQuickFilterEnum.declinedQuotes.key,
                          ),
                          onTap: () => qfc.addTempFilter(
                            QuotesQuickFilterEnum.declinedQuotes.key,
                            !state.tempFilters.containsKey(
                              QuotesQuickFilterEnum.declinedQuotes.key,
                            ),
                          ),
                        ),
                        JobsToggleFilterItem(
                          label: QuotesQuickFilterEnum.unInvoicedQuotes.name,
                          isSelected: state.tempFilters.containsKey(
                            QuotesQuickFilterEnum.unInvoicedQuotes.key,
                          ),
                          onTap: () => qfc.addTempFilter(
                            QuotesQuickFilterEnum.unInvoicedQuotes.key,
                            !state.tempFilters.containsKey(
                              QuotesQuickFilterEnum.unInvoicedQuotes.key,
                            ),
                          ),
                        ),
                        JobsToggleFilterItem(
                          label: 'Quotes without a Job or Task',
                          isSelected: state.tempFilters.containsKey(
                            QuotesQuickFilterEnum.unassignedToJobTask.key,
                          ),
                          onTap: () => qfc.addTempFilter(
                            QuotesQuickFilterEnum.unassignedToJobTask.key,
                            !state.tempFilters.containsKey(
                              QuotesQuickFilterEnum.unassignedToJobTask.key,
                            ),
                          ),
                        ),
                      },
                      QuoteDateFilterExpansionItem(
                        isQuote: widget.isQuote,
                        isInvoice: widget.isInvoice,
                        isOrder: widget.isOrder,
                        isSupplierInvoice: widget.isSupplierInvoice,
                      ),
                      QuoteCustomDateFilterExpansionItem(
                        isQuote: widget.isQuote,
                        isInvoice: widget.isInvoice,
                      ),
                      if (widget.isOrder)
                        QuoteSelectionFilterExpansionItem(
                          label: 'Order Status',
                          onClear: qfc.clearSelectedOrderStatus,
                          filters: const [
                            FPricingTypeModel(
                              id: 0,
                              name: 'Pending',
                            ),
                            FPricingTypeModel(
                              id: 1,
                              name: 'Submitted',
                            ),
                            FPricingTypeModel(
                              id: 2,
                              name: 'Cancelled',
                            ),
                            FPricingTypeModel(
                              id: 3,
                              name: 'Complete',
                            ),
                          ],
                          selectedFilters: state.selectedOrderStatus ?? [],
                          onChanged: (value, filter) =>
                              qfc.updateSelectedOrderStatus(
                            filter as FPricingTypeModel,
                            isChecked: value!,
                          ),
                        ),
                      if (widget.isQuote)
                        JobsToggleFilterItem(
                          label: QuotesQuickFilterEnum.excludeArchivedJobs.name,
                          isSelected: state.tempFilters.containsKey(
                            QuotesQuickFilterEnum.excludeArchivedJobs.key,
                          ),
                          onTap: () => qfc.addTempFilter(
                            QuotesQuickFilterEnum.excludeArchivedJobs.key,
                            !state.tempFilters.containsKey(
                              QuotesQuickFilterEnum.excludeArchivedJobs.key,
                            ),
                          ),
                        ),
                      BlocBuilder<JobsFilterCubit, JobsFilterState>(
                        builder: (context, state) {
                          final jfc = context.read<JobsFilterCubit>();
                          return CustomerFilterExpansionItem(
                            isEnabled: state.isCustomerFilterEnabled,
                            label: widget.isOrder || widget.isSupplierInvoice
                                ? 'Supplier'
                                : 'Customer',
                            selectedCustomers: state.selectedCustomers,
                            selectedEnabledCustomers:
                                state.selectedEnabledCustomers,
                            onCustomerSelect: (c) =>
                                jfc.addSelectedCustomer(context, c),
                            onCheckboxChanged:
                                jfc.toggleSelectedCustomerEnabled,
                            onClear: jfc.clearSelectedCustomers,
                            onExpansionChanged: (isExpanded) =>
                                jfc.enableCustomerFilter(value: isExpanded),
                            isSupplier:
                                widget.isOrder || widget.isSupplierInvoice,
                          );
                        },
                      ),
                      const QuoteJobFilterExpansionItem(),
                      QuoteSelectionFilterExpansionItem(
                        label: 'Job Pricing Type',
                        onClear: context
                            .read<JobsFilterCubit>()
                            .clearSelectedPricingTypeFilters,
                        filters: context
                                .watch<JobsFilterBloc>()
                                .state
                                .filterPricingTypeList ??
                            [],
                        selectedFilters: context
                                .watch<JobsFilterCubit>()
                                .state
                                .selectedPricingTypeFilters ??
                            [],
                      ),
                      if (widget.isInvoice || widget.isSupplierInvoice) ...{
                        JobsToggleFilterItem(
                          label: InvoiceQuickFilterEnum.syncedInvoicesOnly.name,
                          isSelected: state.tempFilters.containsKey(
                            InvoiceQuickFilterEnum.syncedInvoicesOnly.key,
                          ),
                          onTap: () => qfc.addTempFilter(
                            InvoiceQuickFilterEnum.syncedInvoicesOnly.key,
                            !state.tempFilters.containsKey(
                              InvoiceQuickFilterEnum.syncedInvoicesOnly.key,
                            ),
                          ),
                        ),
                        JobsToggleFilterItem(
                          label:
                              InvoiceQuickFilterEnum.excludeSyncedInvoices.name,
                          isSelected: state.tempFilters.containsKey(
                            InvoiceQuickFilterEnum.excludeSyncedInvoices.key,
                          ),
                          onTap: () => qfc.addTempFilter(
                            InvoiceQuickFilterEnum.excludeSyncedInvoices.key,
                            !state.tempFilters.containsKey(
                              InvoiceQuickFilterEnum.excludeSyncedInvoices.key,
                            ),
                          ),
                        ),
                      },
                      const SizedBox(height: 32)
                    ],
                  ),
                ),
        );
      },
    );
  }
}
