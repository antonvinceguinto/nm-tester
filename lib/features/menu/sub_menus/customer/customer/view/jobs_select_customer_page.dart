import 'dart:developer';

import 'package:api_service/api_service.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextminute/core/routes/app_router.dart';
import 'package:nextminute/core/utils/utils.dart';
import 'package:nextminute/features/menu/main_menu/bloc/main_menu_bloc.dart';
import 'package:nextminute/features/menu/sub_menus/customer/customer/blocs/select_c_bloc/select_customer_bloc.dart';
import 'package:nextminute/features/menu/sub_menus/customer/customer/contact_type/bloc/contact_types_bloc.dart';
import 'package:nextminute/features/menu/sub_menus/customer/customer/widgets/customer_item.dart';
import 'package:nextminute/features/utils/generic_status_enum.dart';
import 'package:nextminute/features/wigdets/nm_always_scroll.dart';
import 'package:nextminute/features/wigdets/nm_paginate_scaffold.dart';
import 'package:nextminute/features/wigdets/nm_widgets.dart';
import 'package:nm_repository/nm_repository.dart';

@RoutePage()
class JobsSelectCustomerPage extends StatelessWidget {
  const JobsSelectCustomerPage({
    super.key,
    this.onCustomerSelect,
    this.isSupplier = false,
    this.separateHardwareSuppliers = false,
  });

  final void Function(CustomerDatum)? onCustomerSelect;
  final bool isSupplier;
  final bool separateHardwareSuppliers;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SelectCustomerBloc>(
      create: (context) => SelectCustomerBloc(
        nmRepositoryImpl: context.read<NMRepositoryImpl>(),
      )..add(
          SelectCustomerFetchEvent(
            isCustomer: !isSupplier,
            isSupplier: isSupplier,
            separateHardwareSuppliers: separateHardwareSuppliers,
          ),
        ),
      child: JobsSelectCustomerView(
        onCustomerSelect: onCustomerSelect,
        isSupplier: isSupplier,
        separateHardwareSuppliers: separateHardwareSuppliers,
      ),
    );
  }
}

class JobsSelectCustomerView extends StatefulWidget {
  const JobsSelectCustomerView({
    super.key,
    this.onCustomerSelect,
    this.isSupplier = false,
    this.separateHardwareSuppliers = false,
  });

  final void Function(CustomerDatum)? onCustomerSelect;
  final bool isSupplier;
  final bool separateHardwareSuppliers;

  @override
  State<JobsSelectCustomerView> createState() => _JobsSelectCustomerViewState();
}

class _JobsSelectCustomerViewState extends State<JobsSelectCustomerView> {
  late TextEditingController _searchController;

  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _scrollController = ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NMPaginateScaffold<SelectCustomerBloc, SelectCustomerState>(
      appBar: AppBar(
        title: Text(widget.isSupplier ? 'Select Supplier' : 'Select Customer'),
      ),
      body: NMBlocConsumer<SelectCustomerBloc, SelectCustomerState>(
        isPaginated: true,
        builder: (context, state) {
          return Column(
            children: [
              NMSearchField(
                searchController: _searchController,
                onChanged: (_) => _fetchData(),
                onClear: _fetchData,
              ),
              Expanded(
                child: Column(
                  children: [
                    if (widget.isSupplier) _buildIntegratedSuppliers(),
                    Container(
                      width: double.infinity,
                      color: Colors.grey,
                      child: const Text('Suppliers')
                          .color(Colors.white)
                          .paddingSymmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                    ),
                    Expanded(
                      child: RefreshIndicator(
                        onRefresh: () async {
                          _fetchData();
                        },
                        child: AlwaysScroll(
                          controller: _scrollController,
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            keyboardDismissBehavior:
                                ScrollViewKeyboardDismissBehavior.onDrag,
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            itemCount: state.customerList?.length ?? 0,
                            itemBuilder: (BuildContext context, int index) {
                              final customer = state.customerList?[index];
                              return CustomerItem(
                                customer: customer ?? const CustomerDatum(),
                                onTap: widget.onCustomerSelect,
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              NMBottomMenuActions(
                actionsPanel: NMActionList(
                  actions: [
                    if (context
                        .read<MainMenuBloc>()
                        .state
                        .isContactAddEditEnabled)
                      NMActionItem(
                        onTap: () async {
                          final res =
                              await context.router.push(JobsAddCustomerRoute());

                          // if customer added, refresh list
                          if (res == 'Apply') {
                            _fetchData();
                          }

                          // Clear selected contact types
                          if (mounted) {
                            context
                                .read<ContactTypesBloc>()
                                .add(const ClearSelectedContactTypes());
                          }
                        },
                        label: 'Add Customer',
                        icon: Icons.add,
                      ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildIntegratedSuppliers() {
    return BlocBuilder<SelectCustomerBloc, SelectCustomerState>(
      builder: (context, state) {
        final hardwareProviders = state.customerModel?.hardwareProviders ?? [];

        final customerList = state.customerList ?? [];

        // Get the list of contact_id from hardwareProvider
        final List<int> hardwareProviderIds;
        if (hardwareProviders.isEmpty) {
          hardwareProviderIds = [];
        } else {
          hardwareProviderIds = hardwareProviders
              .map(
                (provider) => provider.is_tagged_products_contact_id!,
              )
              .toList();
        }

        // Get the list of contact_id from customerList
        final customerIds =
            customerList.map((customer) => customer.contact_id).toList();

        // Get the common contact_ids
        final commonIds = hardwareProviderIds
            .toSet()
            .intersection(customerIds.toSet())
            .toList();

        // Filter the customerList based on the common contact_ids
        final providers = customerList
            .where((element) => commonIds.contains(element.contact_id))
            .toList();

        return Column(
          children: [
            Container(
              width: double.infinity,
              color: Colors.grey,
              child: const Text('Integrated Suppliers')
                  .color(Colors.white)
                  .paddingSymmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: providers.length,
              itemBuilder: (context, index) {
                if (providers.isEmpty) {
                  return const SizedBox.shrink();
                }

                final item = providers[index];

                final formattedProviderItem = hardwareProviders.firstWhere(
                  (provider) =>
                      provider.is_tagged_products_contact_id == item.contact_id,
                  orElse: () => HardwareProvider.empty,
                );

                log('formattedProviderItem: $formattedProviderItem');

                final parsedItem = CustomerDatum(
                  contact_id: formattedProviderItem.is_contact_id,
                  contact_name_display: item.contact_name_display,
                );

                if (item.contact_logo_uri != null) {
                  return InkWell(
                    onTap: widget.onCustomerSelect == null
                        ? () {}
                        : () {
                            widget.onCustomerSelect!.call(parsedItem);
                            context.router.pop();
                          },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(3),
                      child: CachedNetworkImage(
                        imageUrl:
                            'https://app.nextminute.com/${item.contact_logo_uri}',
                        width: 120,
                        placeholder: (context, url) => const SizedBox.shrink(),
                        errorWidget: (context, url, error) =>
                            const SizedBox.shrink(),
                      ),
                    ),
                  ).paddingAll(8);
                }

                return CustomerItem(
                  customer: item,
                  onTap: widget.onCustomerSelect,
                );
              },
            ).paddingSymmetric(
              horizontal: 8,
              vertical: 8,
            ),
          ],
        );
      },
    );
  }

  void _fetchData({bool isScroll = false}) {
    final sCBloc = context.read<SelectCustomerBloc>();
    sCBloc.add(
      SelectCustomerFetchEvent(
        currPage: isScroll ? sCBloc.state.currPage + 1 : 1,
        search: _searchController.text,
        isCustomer: !widget.isSupplier,
        isSupplier: widget.isSupplier,
        separateHardwareSuppliers: widget.separateHardwareSuppliers,
      ),
    );
  }

  void _scrollListener() {
    final sCBloc = context.read<SelectCustomerBloc>();

    if (_scrollController.offset ==
            _scrollController.position.maxScrollExtent &&
        sCBloc.state.status != GenericRequestStatusEnum.loading) {
      _fetchData(isScroll: true);
    }
  }
}
