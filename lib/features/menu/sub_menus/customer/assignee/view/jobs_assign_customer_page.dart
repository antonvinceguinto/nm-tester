import 'package:api_service/api_service.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nextminute/core/routes/app_router.dart';
import 'package:nextminute/core/utils/utils.dart';
import 'package:nextminute/features/menu/main_menu/bloc/main_menu_bloc.dart';
import 'package:nextminute/features/menu/sub_menus/customer/assignee/cubit/assignee_filter_cubit.dart';
import 'package:nextminute/features/menu/sub_menus/customer/customer/blocs/select_c_bloc/select_customer_bloc.dart';
import 'package:nextminute/features/menu/sub_menus/customer/customer/contact_type/bloc/contact_types_bloc.dart';
import 'package:nextminute/features/menu/sub_menus/customer/customer/widgets/customer_item.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/jobs_page/utils/jobs_helper.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/sub_menus/job_filters/cubit/jobs_filter_cubit.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/widgets/current_filters_container.dart';
import 'package:nextminute/features/utils/generic_status_enum.dart';
import 'package:nextminute/features/wigdets/nm_always_scroll.dart';
import 'package:nextminute/features/wigdets/nm_empty_state.dart';
import 'package:nextminute/features/wigdets/nm_paginate_scaffold.dart';
import 'package:nextminute/features/wigdets/nm_widgets.dart';

@RoutePage()
class JobsAssignCustomerPage extends StatelessWidget {
  const JobsAssignCustomerPage({
    super.key,
    this.isSelection = false,
    this.isSite = false,
    this.parentContactId,
    this.onCustomerSelect,
    this.isFromMenu = false,
    this.isCreatedBy = false,
  });

  final bool isSelection;
  final bool isSite;
  final int? parentContactId;
  final void Function(CustomerDatum)? onCustomerSelect;
  final bool isFromMenu;
  final bool isCreatedBy; // This is for Tasks filter

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SelectCustomerBloc>.value(
          value: context.read<SelectCustomerBloc>()
            ..add(
              SelectCustomerFetchEvent(
                isSite: isSite,
                parentContactId: parentContactId,
              ),
            ),
        ),
        // Clears the filters when the page is opened
        BlocProvider<AssigneeFilterCubit>.value(
          value: context.read<AssigneeFilterCubit>()
            ..clearFilters()
            ..fetchUserRoles(),
        ),
      ],
      child: JobsAssignCustomerView(
        isSelection: isSelection,
        isSite: isSite,
        parentContactId: parentContactId,
        onTap: onCustomerSelect,
        isCreatedBy: isCreatedBy,
        isFromMenu: isFromMenu,
      ),
    );
  }
}

class JobsAssignCustomerView extends StatefulWidget {
  const JobsAssignCustomerView({
    super.key,
    required this.isSelection,
    required this.isSite,
    this.parentContactId,
    this.onTap,
    this.isFromMenu = false,
    this.isCreatedBy = false,
  });

  final bool isSelection;
  final bool isSite;
  final int? parentContactId;
  final void Function(CustomerDatum)? onTap;
  final bool isFromMenu;
  final bool isCreatedBy; // This is for Tasks filter

  @override
  State<JobsAssignCustomerView> createState() => _JobsAssignCustomerViewState();
}

class _JobsAssignCustomerViewState extends State<JobsAssignCustomerView> {
  late TextEditingController _searchController;

  late ScrollController _scrollController;

  bool isCustomer = false;
  bool isUser = false;

  void _initUserFilter() {
    context.read<AssigneeFilterCubit>()
      ..clearSelectedContactTypes()
      ..allAdministrators(val: true)
      ..allUsers(val: true);
    context.read<SelectCustomerBloc>().add(
          SelectCustomerFetchEvent(
            search: _searchController.text,
            isUser: true,
            isSite: widget.isSite,
            parentContactId: widget.isSite ? widget.parentContactId : null,
          ),
        );
    setState(() {
      isUser = true;
      isCustomer = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _scrollController = ScrollController()..addListener(_scrollListener);
    if (widget.isCreatedBy) {
      _initUserFilter();
      return;
    }
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
        title: Text(
          widget.isFromMenu
              ? 'Contacts'
              : widget.isSite
                  ? 'Assign Site'
                  : 'Select Contact',
        ),
        actions: [
          BlocBuilder<SelectCustomerBloc, SelectCustomerState>(
            builder: (context, state) {
              if (state.status == GenericRequestStatusEnum.loading) {
                return const SizedBox.shrink();
              }

              return Row(
                children: [
                  NMCupertinoButton(
                    child: const Text('Filters'),
                    onPressed: () async {
                      final res = await context.router.push(
                        const AssigneeFilterRoute(),
                      );

                      if (res == 'Apply' && mounted) {
                        _fetchData();
                      }
                    },
                  ),
                  SizedBox(
                    height: double.infinity,
                    child: PopupMenuButton(
                      key: const ValueKey('popup_menu'),
                      padding: const EdgeInsets.only(right: 16),
                      icon: const Icon(Icons.arrow_drop_down),
                      itemBuilder: (context) {
                        final afCubit = context.read<AssigneeFilterCubit>();

                        final sitesUserRole =
                            afCubit.state.contactTypes?.firstWhere(
                          (element) =>
                              element.contacttype_name?.toLowerCase() == 'site',
                        );

                        final suppliersUserRole =
                            afCubit.state.contactTypes?.firstWhere(
                          (element) =>
                              element.contacttype_name?.toLowerCase() ==
                              'supplier',
                        );

                        final customerUserRole =
                            afCubit.state.contactTypes?.firstWhere(
                          (element) =>
                              element.contacttype_name?.toLowerCase() ==
                              'customer',
                        );

                        return <PopupMenuItem<String>>[
                          PopupMenuItem(
                            key: const ValueKey('clear_filter'),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.46,
                              child: const Text('Clear Filter'),
                            ),
                            onTap: () {
                              _searchController.clear();

                              context
                                  .read<AssigneeFilterCubit>()
                                  .clearFilters();

                              context
                                  .read<AssigneeFilterCubit>()
                                  .fetchUserRoles();

                              setState(() {
                                isCustomer = false;
                                isUser = false;
                              });

                              _fetchData();
                            },
                          ),
                          if ((widget.isSite && sitesUserRole != null) ||
                              (widget.isFromMenu && sitesUserRole != null))
                            PopupMenuItem(
                              child: const Text('Sites'),
                              onTap: () {
                                afCubit
                                  ..clearFilters()
                                  ..fetchUserRoles()
                                  ..addToCustomerTypes(sitesUserRole)
                                  ..toggleContactTypes(val: true);

                                context.read<SelectCustomerBloc>().add(
                                      SelectCustomerFetchEvent(
                                        search: _searchController.text,
                                        isSite: true,
                                        parentContactId: widget.parentContactId,
                                        selectedContactTypeIds: !afCubit
                                                .state.isContactTypesTurnedOn
                                            ? []
                                            : afCubit.state.selectedContactTypes
                                                .map(
                                                  (e) => e.contacttype_id!,
                                                )
                                                .toList(),
                                      ),
                                    );

                                setState(() {
                                  isUser = false;
                                  isCustomer = false;
                                });
                              },
                            ),
                          if ((widget.isSite && suppliersUserRole != null) ||
                              (widget.isFromMenu && suppliersUserRole != null))
                            PopupMenuItem(
                              child: const Text('Supplier'),
                              onTap: () {
                                afCubit
                                  ..clearFilters()
                                  ..fetchUserRoles()
                                  ..addToCustomerTypes(suppliersUserRole)
                                  ..toggleContactTypes(val: true);

                                context.read<SelectCustomerBloc>().add(
                                      SelectCustomerFetchEvent(
                                        search: _searchController.text,
                                        isSupplier: true,
                                        parentContactId: widget.parentContactId,
                                        selectedContactTypeIds: !afCubit
                                                .state.isContactTypesTurnedOn
                                            ? []
                                            : afCubit.state.selectedContactTypes
                                                .map(
                                                  (e) => e.contacttype_id!,
                                                )
                                                .toList(),
                                      ),
                                    );

                                setState(() {
                                  isUser = false;
                                  isCustomer = false;
                                });
                              },
                            ),
                          if (customerUserRole != null)
                            PopupMenuItem(
                              child: const Text('Customers'),
                              onTap: () {
                                afCubit
                                  ..clearFilters()
                                  ..fetchUserRoles()
                                  ..addToCustomerTypes(customerUserRole)
                                  ..toggleContactTypes(val: true);

                                context.read<SelectCustomerBloc>().add(
                                      SelectCustomerFetchEvent(
                                        search: _searchController.text,
                                        isCustomer: true,
                                        isSite: widget.isSite,
                                        parentContactId: widget.parentContactId,
                                        selectedContactTypeIds: !afCubit
                                                .state.isContactTypesTurnedOn
                                            ? []
                                            : afCubit.state.selectedContactTypes
                                                .map(
                                                  (e) => e.contacttype_id!,
                                                )
                                                .toList(),
                                      ),
                                    );

                                setState(() {
                                  isCustomer = true;
                                  isUser = false;
                                });
                              },
                            ),
                          PopupMenuItem(
                            onTap: _initUserFilter,
                            child: const Text('Users'),
                          ),
                        ];
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
      body: NMBlocConsumer<SelectCustomerBloc, SelectCustomerState>(
        isPaginated: true,
        builder: (context, state) {
          final afCubit = context.watch<AssigneeFilterCubit>();

          return Column(
            children: [
              NMSearchField(
                searchController: _searchController,
                onChanged: (value) {
                  _fetchData();
                },
                onClear: () {
                  _searchController.clear();
                  _fetchData();
                },
              ),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    _fetchData();
                  },
                  child: (state.customerList?.isEmpty ?? false) &&
                          state.status != GenericRequestStatusEnum.loading
                      ? const NMEmptyState()
                      : Column(
                          children: [
                            CurrentFiltersContainer(
                              trailing: Text(
                                '${state.customerModel?.total ?? ''} '
                                'Contacts',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              label: JobsHelper.getFilterTitlesForAssignedTo(
                                afCubit.state,
                              ).isEmpty
                                  ? 'No Filters Active'
                                  : '''Filtered by: ${JobsHelper.getFilterTitlesForAssignedTo(afCubit.state)}''',
                            ),
                            Expanded(
                              child: AlwaysScroll(
                                controller: _scrollController,
                                child: ListView.builder(
                                  key: const ValueKey('customer_list'),
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  keyboardDismissBehavior:
                                      ScrollViewKeyboardDismissBehavior.onDrag,
                                  itemCount: state.customerList?.length ?? 0,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final customer = state.customerList?[index];

                                    return CustomerItem(
                                      customer:
                                          customer ?? const CustomerDatum(),
                                      isAssignCustomer: true,
                                      isSelection: widget.isSelection,
                                      isSite: widget.isSite,
                                      isOnMenu: widget.isFromMenu,
                                      onTap: widget.isFromMenu
                                          ? (cust) {
                                              context.router.push(
                                                CustomerDetailsRoute(
                                                  id: cust.contact_id!,
                                                ),
                                              );
                                            }
                                          : widget.onTap,
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ).paddingSymmetric(horizontal: 8),
                ),
              ),
              NMBottomMenuActions(
                actionsPanel: NMActionList(
                  key: const ValueKey('action_list'),
                  actions: [
                    if (context
                        .read<MainMenuBloc>()
                        .state
                        .isContactAddEditEnabled)
                      NMActionItem(
                        onTap: () async {
                          final res = await context.router.push(
                            JobsAddCustomerRoute(
                              isSite: widget.isSite,
                              parentContactId: widget.parentContactId,
                            ),
                          );

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
                    if (widget.isFromMenu) ...{
                      NMActionItem(
                        key: const ValueKey('show_on_map'),
                        onTap: () async {
                          await context.router.push(
                            ContactMapRoute(
                              contacts: state.customerList ?? [],
                            ),
                          );
                        },
                        label: 'Show on Map',
                        icon: FontAwesomeIcons.mapLocation,
                      ),
                    },
                    if (widget.isSelection) ...{
                      NMActionItem(
                        onTap: () async {
                          context
                              .read<JobsFilterCubit>()
                              .removeAllAssignedCustomers();
                        },
                        label: 'Clear Selected',
                        icon: Icons.crop_square,
                      ),
                      NMActionItem(
                        onTap: _fetchData,
                        // onTap: () => context
                        //     .read<JobsFilterCubit>()
                        //     .selectAllAssignedCustomers(
                        //       sCBloc.state.customerList ?? [],
                        //     ),
                        label: 'Select All',
                        icon: Icons.checklist_rtl,
                      ),
                      NMActionItem(
                        onTap: () async {
                          await context.router.pop();
                          if (mounted) {
                            await context.router.pop();
                          }
                        },
                        label: 'Assign',
                        icon: Icons.check,
                      ),
                    }
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _fetchData({
    bool isScroll = false,
    bool? isSupplier = false,
    bool? isSite,
    bool? isUserCust,
    bool? isCust,
  }) {
    final sCBloc = context.read<SelectCustomerBloc>();
    final afCubit = context.read<AssigneeFilterCubit>();

    sCBloc.add(
      SelectCustomerFetchEvent(
        currPage: isScroll ? sCBloc.state.currPage + 1 : 1,
        search: _searchController.text,
        isSite: widget.isSite,
        isUser: isUser,
        isCustomer: isCustomer,
        parentContactId: widget.parentContactId,
        excludeArchived: afCubit.state.isExcludeArchivedContacts,
        excludeDisabled: afCubit.state.isExcludeDisabledUsers,
        includeDeleted: afCubit.state.includeDeleted,
        selectedRoleIds: !afCubit.state.isUserRolesTurnedOn
            ? []
            : afCubit.state.selectedUserRoles
                .map(
                  (e) => e.subrole_id,
                )
                .toList(),
        isAllAdministrators: afCubit.state.isUserRolesTurnedOn &&
            afCubit.state.isAllAdministrators,
        isAllUsers:
            afCubit.state.isUserRolesTurnedOn && afCubit.state.isAllUsers,
        selectedContactTypeIds: !afCubit.state.isContactTypesTurnedOn
            ? []
            : afCubit.state.selectedContactTypes
                .map(
                  (e) => e.contacttype_id!,
                )
                .toList(),
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
