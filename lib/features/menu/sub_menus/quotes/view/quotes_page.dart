import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextminute/core/routes/app_router.dart';
import 'package:nextminute/core/utils/extensions.dart';
import 'package:nextminute/features/menu/main_menu/bloc/main_menu_bloc.dart';
import 'package:nextminute/features/menu/sub_menus/quotes/bloc/quotes_bloc.dart';
import 'package:nextminute/features/menu/sub_menus/quotes/cubit/quotes_filters_cubit.dart';
import 'package:nextminute/features/menu/sub_menus/quotes/utils/quotes_helpers.dart';
import 'package:nextminute/features/menu/sub_menus/quotes/widgets/billable_item.dart';
import 'package:nextminute/features/menu/sub_menus/quotes/widgets/quotes_quick_filter.dart';
import 'package:nextminute/features/menu/sub_menus/sub_menus.dart';
import 'package:nextminute/features/utils/generic_status_enum.dart';
import 'package:nextminute/features/wigdets/nm_always_scroll.dart';
import 'package:nextminute/features/wigdets/nm_empty_state.dart';
import 'package:nextminute/features/wigdets/nm_widgets.dart';
import 'package:nm_repository/nm_repository.dart';

@RoutePage()
class QuotesPage extends StatelessWidget {
  const QuotesPage({
    super.key,
    required this.type,
  });

  final String type;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuotesBloc(
        nmRepositoryImpl: context.read<NMRepositoryImpl>(),
      )..add(QuotesFetchEvent(type: type)),
      child: QuotesView(type: type),
    );
  }
}

class QuotesView extends StatefulWidget {
  const QuotesView({
    super.key,
    required this.type,
  });

  final String type;

  @override
  State<QuotesView> createState() => _QuotesViewState();
}

class _QuotesViewState extends State<QuotesView> {
  late TextEditingController _searchController;

  late bool isQuote;
  late bool isInvoice;
  late bool isOrder;
  late bool isSupplierInvoice;

  @override
  void initState() {
    super.initState();

    _searchController = TextEditingController();

    context.read<QuotesFiltersCubit>().clearFilters();

    isQuote = widget.type == 'Quote';
    isInvoice = widget.type == 'Invoice';
    isOrder = widget.type == 'Order';
    isSupplierInvoice = widget.type == 'SupplierInvoice';
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<JobsFilterCubit>()
          ..clearSelectedAssignedToCustomers()
          ..clearSelectedCreatedBy()
          ..clearSelectedCustomers();
        context.read<QuotesFiltersCubit>().resetFilters();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            isQuote
                ? 'Quotes'
                : isInvoice
                    ? 'Invoices'
                    : isOrder
                        ? 'Orders'
                        : 'Supplier Invoices',
          ),
          actions: [
            BlocBuilder<QuotesBloc, QuotesState>(
              builder: (context, state) {
                if (state.status == GenericRequestStatusEnum.loading) {
                  return const SizedBox.shrink();
                }

                return Row(
                  children: [
                    NMCupertinoButton(
                      key: const Key('__filter_button__'),
                      onPressed: () async {
                        final res = await context.router.push(
                          QuotesFilterRoute(
                            isQuote: isQuote,
                            isInvoice: isInvoice,
                            isOrder: isOrder,
                            isSupplierInvoice: isSupplierInvoice,
                          ),
                        );

                        if (res == 'Apply') {
                          _fetchData();
                        }
                      },
                      child: const Text('Filters'),
                    ),
                    QuotesQuickFilter(
                      isQuote: isQuote,
                      isInvoice: isInvoice,
                      onFetchData: _fetchData,
                    ),
                  ],
                );
              },
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  NMSearchField(
                    key: const ValueKey('__search_field__'),
                    searchController: _searchController,
                    onChanged: (_) => _fetchData(),
                    onClear: _fetchData,
                  ),
                  Expanded(
                    child: RefreshIndicator(
                      key: const ValueKey('quotes_refresh_indicator'),
                      onRefresh: () async {
                        _fetchData();
                      },
                      child: NMBlocConsumer<QuotesBloc, QuotesState>(
                        isPaginated: true,
                        builder: (context, state) {
                          if (state.status ==
                              GenericRequestStatusEnum.loading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }

                          final quotes = state.quotesModel?.data ?? [];

                          final filterText = QuotesHelpers.getFilterTitles(
                            context.watch<QuotesFiltersCubit>().state,
                            isQuote: isQuote,
                            isInvoice: isInvoice,
                          );

                          return Column(
                            children: [
                              CurrentFiltersContainer(
                                label: filterText,
                                trailing: Text(
                                  '${state.quotesModel?.total ?? ''} '
                                  '''${isQuote ? 'Quotes' : isInvoice ? 'Invoices' : isOrder ? 'Orders' : 'Invoices'}''',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ).paddingSymmetric(horizontal: 8),
                              Expanded(
                                child: quotes.isEmpty
                                    ? const NMEmptyState()
                                    : AlwaysScroll(
                                        child: ListView.builder(
                                          key: const ValueKey(
                                            'quotes_list_view',
                                          ),
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          keyboardDismissBehavior:
                                              ScrollViewKeyboardDismissBehavior
                                                  .onDrag,
                                          itemCount: quotes.length,
                                          itemBuilder: (
                                            BuildContext context,
                                            int index,
                                          ) {
                                            final quote = quotes[index];
                                            return BillableItem(quote);
                                          },
                                        ).paddingSymmetric(horizontal: 16),
                                      ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            NMBottomMenuActions(
              actionsPanel: NMActionList(
                actions: [
                  if ((context
                              .read<MainMenuBloc>()
                              .state
                              .subPermissions
                              .QuotesEditable ??
                          false) &&
                      !isSupplierInvoice)
                    const NMActionItem(
                      label: 'Add',
                      icon: Icons.add,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _fetchData({bool isScroll = false}) {
    final qb = context.read<QuotesBloc>();
    final qfc = context.read<QuotesFiltersCubit>();
    final filters = qfc.state.filters;

    context.read<QuotesBloc>().add(
          QuotesFetchEvent(
            type: widget.type,
            currPage: isScroll ? qb.state.currPage + 1 : 1,
            searchQuery: _searchController.text,
            filter: filters,
          ),
        );
  }
}
