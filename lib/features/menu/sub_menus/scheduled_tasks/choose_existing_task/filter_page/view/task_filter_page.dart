import 'package:api_service/api_service.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/widgets/customer_filter_expansion_item.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/widgets/selection_filter_expansion_item.dart';
import 'package:nextminute/features/menu/sub_menus/sub_menus.dart';
import 'package:nextminute/features/utils/generic_status_enum.dart';
import 'package:nextminute/features/wigdets/nm_always_scroll.dart';
import 'package:nextminute/features/wigdets/nm_widgets.dart';
import 'package:nm_repository/nm_repository.dart';

@RoutePage()
class TaskFilterPage extends StatelessWidget {
  const TaskFilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TaskStatusBloc>(
          create: (context) => TaskStatusBloc(
            nmRepositoryImpl: context.read<NMRepositoryImpl>(),
          )
            ..add(const TaskStatusFetchEvent())
            ..add(const TaskCategoryFetchEvent()),
        ),
        BlocProvider<JobsFilterBloc>(
          create: (context) => JobsFilterBloc(
            nmRepositoryImpl: context.read<NMRepositoryImpl>(),
          )..add(const PriorityFetchEvent()),
        )
      ],
      child: const TaskFilterView(),
    );
  }
}

class TaskFilterView extends StatelessWidget {
  const TaskFilterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Filter'),
        actions: [
          NMCupertinoButton(
            onPressed: () {
              context.router.pop('Apply');
            },
            child: const Text('Apply'),
          ),
        ],
      ),
      body: SafeArea(
        child: BlocBuilder<TaskStatusBloc, TaskStatusState>(
          builder: (context, state) {
            if (state.status == GenericRequestStatusEnum.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return BlocBuilder<JobsFilterCubit, JobsFilterState>(
              builder: (context, jstate) {
                return BlocBuilder<TaskFilterBloc, TaskFilterState>(
                  builder: (context, state) {
                    final tfBloc = context.read<TaskFilterBloc>();
                    final jobsFilterCubit = context.read<JobsFilterCubit>();

                    return AlwaysScroll(
                      child: Column(
                        children: [
                          CustomerFilterExpansionItem(
                            isEnabled: jstate.isCustomerFilterEnabled,
                            label: 'Customer',
                            selectedCustomers: jstate.selectedCustomers,
                            selectedEnabledCustomers:
                                jstate.selectedEnabledCustomers,
                            onCustomerSelect: (c) =>
                                jobsFilterCubit.addSelectedCustomer(context, c),
                            onCheckboxChanged:
                                jobsFilterCubit.toggleSelectedCustomerEnabled,
                            onClear: jobsFilterCubit.clearSelectedCustomers,
                            onExpansionChanged: (value) {
                              jobsFilterCubit.enableCustomerFilter(
                                value: value,
                              );
                            },
                          ),
                          const Divider(height: 1),
                          CustomerFilterExpansionItem(
                            isEnabled: jstate.isAssignedToFilterEnabled,
                            label: 'Assigned To',
                            selectedCustomers: jstate.selectedAssignedTos,
                            selectedEnabledCustomers:
                                jstate.selectedEnabledAssignedTos,
                            onCustomerSelect:
                                jobsFilterCubit.addAssignedToCustomer,
                            onCheckboxChanged:
                                jobsFilterCubit.toggleAssignedToCustomerEnabled,
                            onClear: jobsFilterCubit
                                .clearSelectedAssignedToCustomers,
                            onExpansionChanged: (value) {
                              jobsFilterCubit.enableAssignedToFilter(
                                value: value,
                              );
                            },
                          ),
                          const Divider(height: 1),
                          CustomerFilterExpansionItem(
                            isEnabled: jstate.isCreatedByFilterEnabled,
                            label: 'Created By',
                            selectedCustomers: jstate.selectedCreatedBy,
                            selectedEnabledCustomers:
                                jstate.selectedEnabledCreatedBy,
                            onCustomerSelect:
                                jobsFilterCubit.addCreatedByCustomer,
                            onCheckboxChanged:
                                jobsFilterCubit.toggleCreatedByCustomerEnabled,
                            onClear: jobsFilterCubit.clearSelectedCreatedBy,
                            onExpansionChanged: (value) {
                              jobsFilterCubit.enableCreatedByFilter(
                                value: value,
                              );
                            },
                          ),
                          // const Divider(height: 1),
                          // CustomerFilterExpansionItem(
                          //   label: 'Created By',
                          //   isAssignCustomer: true,
                          //   selectedCustomers:
                          //       tfBloc.state.selectedCreatedBys ?? [],
                          //   isCreatedBy: true,
                          //   onClear: () => tfBloc.add(
                          //     const TaskFilterCustomerSelectedEvent(
                          //       isClear: true,
                          //       isCreatedBy: true,
                          //     ),
                          //   ),
                          //   onCustomerSelect: (customer) => tfBloc.add(
                          //     TaskFilterCustomerSelectedEvent(
                          //       customer: customer,
                          //       isCreatedBy: true,
                          //     ),
                          //   ),
                          //   onRemove: (customer) => tfBloc
                          //     ..add(
                          //       TaskFilterCustomerSelectedEvent(
                          //         customer: customer,
                          //         isCreatedBy: true,
                          //         isRemove: true,
                          //       ),
                          //     ),
                          // ),
                          const Divider(height: 1),
                          SelectionFilterExpansionItem(
                            label: 'Task Status',
                            filters:
                                context.read<TaskStatusBloc>().state.taskStatus,
                            onChanged: (selectedFilters, filter) {
                              tfBloc.add(
                                TaskFilterSelectStatusEvent(
                                  selectedTaskStatus: filter as TaskStatusModel,
                                ),
                              );
                            },
                            selectedFilters:
                                tfBloc.state.selectedTaskStatuses ?? [],
                          ),
                          const Divider(height: 1),
                          SelectionFilterExpansionItem(
                            label: 'Acceptance Status',
                            filters: const [
                              AcceptanceStatusModel(
                                name: 'Invited',
                              ),
                              AcceptanceStatusModel(
                                name: 'Accepted',
                                color: '#008000',
                              ),
                              AcceptanceStatusModel(
                                name: 'Tentative',
                                color: '#f7c783',
                              ),
                              AcceptanceStatusModel(
                                name: 'Rejected',
                                color: '#cc4545',
                              ),
                            ],
                            onChanged: (selectedFilters, filter) {
                              tfBloc.add(
                                TaskFilterSelectAcceptanceStatusEvent(
                                  selectedStatus:
                                      filter as AcceptanceStatusModel,
                                ),
                              );
                            },
                            selectedFilters:
                                tfBloc.state.selectedAcceptanceStatuses ?? [],
                          ),
                          const Divider(height: 1),
                          SelectionFilterExpansionItem(
                            label: 'Priority',
                            filters: context
                                    .watch<JobsFilterBloc>()
                                    .state
                                    .filterPriorityList ??
                                [],
                            onChanged: (selectedFilters, filter) {
                              tfBloc.add(
                                TaskFilterSelectPriorityEvent(
                                  selectedPriority: filter as FPriorityModel,
                                ),
                              );
                            },
                            selectedFilters:
                                tfBloc.state.selectedPriorities ?? [],
                          ),
                          const Divider(height: 1),
                          SelectionFilterExpansionItem(
                            label: 'Category',
                            filters: context
                                .read<TaskStatusBloc>()
                                .state
                                .categoryFilters,
                            onChanged: (selectedFilters, filter) {
                              tfBloc.add(
                                TaskFilterSelectCategoryEvent(
                                  selectedCategory:
                                      filter as CategoryFilterModel,
                                ),
                              );
                            },
                            selectedFilters:
                                tfBloc.state.selectedCategories ?? [],
                          ),
                          const Divider(height: 1),
                          JobsToggleFilterItem(
                            label: 'Exclude Archived Tasks',
                            isSelected: tfBloc.state.isExcludeArchive,
                            onTap: () =>
                                tfBloc.add(const ToggleExcludeArchiveEvent()),
                          ),
                          const Divider(height: 1),
                        ],
                      ),
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
