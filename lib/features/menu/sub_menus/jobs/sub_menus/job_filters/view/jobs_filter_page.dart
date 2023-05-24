import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextminute/core/utils/utils.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/sub_menus/job_filters/bloc/jobs_filter_bloc.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/sub_menus/job_filters/cubit/jobs_filter_cubit.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/sub_menus/job_filters/wigdets/jobs_toggle_filter_item.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/widgets/customer_filter_expansion_item.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/widgets/expand_date_filter_item.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/widgets/selection_filter_expansion_item.dart';
import 'package:nextminute/features/wigdets/nm_widgets.dart';
import 'package:nm_repository/nm_repository.dart';

@RoutePage()
class JobsFilterPage extends StatelessWidget {
  const JobsFilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => JobsFilterBloc(
        nmRepositoryImpl: context.read<NMRepositoryImpl>(),
      )..add(const JobsFilterStatusFetch()),
      child: const JobsFilterView(),
    );
  }
}

class JobsFilterView extends StatefulWidget {
  const JobsFilterView({super.key});

  @override
  State<JobsFilterView> createState() => _JobsFilterViewState();
}

class _JobsFilterViewState extends State<JobsFilterView> {
  @override
  Widget build(BuildContext context) {
    final jobsFilterCubit = context.watch<JobsFilterCubit>();
    final jobsFilterBloc = context.watch<JobsFilterBloc>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter Jobs'),
      ),
      body: NMBlocConsumer<JobsFilterBloc, JobsFilterBlocState>(
        builder: (context, state) {
          return Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                color: Theme.of(context).scaffoldBackgroundColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    NMCupertinoButton(
                      onPressed: () {
                        jobsFilterCubit.clearFilters();
                        setState(() {});
                      },
                      child: Text(
                        'Clear Filters',
                        style: NMTextStyles.b2(context)?.copyWith(
                          color: NMColors.orange,
                        ),
                      ),
                    ),
                    NMCupertinoButton(
                      onPressed: () => context.router.pop('Apply'),
                      child: Text(
                        'Apply',
                        style: NMTextStyles.b2(context)?.copyWith(
                          color: NMColors.orange,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Divider(height: 1),
                      SelectionFilterExpansionItem(
                        label: 'Status',
                        onClear: jobsFilterCubit.clearSelectedStatusFilters,
                        filters: jobsFilterBloc.state.filterStatusList ?? [],
                        selectedFilters:
                            jobsFilterCubit.state.selectedStatusFilters ?? [],
                      ),
                      const Divider(height: 1),
                      SelectionFilterExpansionItem(
                        label: 'Type',
                        onClear: jobsFilterCubit.clearSelectedTypeFilters,
                        filters: jobsFilterBloc.state.filterTypeList ?? [],
                        selectedFilters:
                            jobsFilterCubit.state.selectedTypeFilters ?? [],
                      ),
                      const Divider(height: 1),
                      SelectionFilterExpansionItem(
                        label: 'Pricing Type',
                        onClear:
                            jobsFilterCubit.clearSelectedPricingTypeFilters,
                        filters:
                            jobsFilterBloc.state.filterPricingTypeList ?? [],
                        selectedFilters:
                            jobsFilterCubit.state.selectedPricingTypeFilters ??
                                [],
                      ),
                      const Divider(height: 1),
                      SelectionFilterExpansionItem(
                        label: 'Priority',
                        onClear: jobsFilterCubit.clearSelectedPriorityFilters,
                        filters: jobsFilterBloc.state.filterPriorityList ?? [],
                        selectedFilters:
                            jobsFilterCubit.state.selectedPriorityFilters ?? [],
                      ),
                      const Divider(height: 1),
                      CustomerFilterExpansionItem(
                        isEnabled:
                            jobsFilterCubit.state.isCustomerFilterEnabled,
                        label: 'Customer',
                        selectedCustomers:
                            jobsFilterCubit.state.selectedCustomers,
                        selectedEnabledCustomers:
                            jobsFilterCubit.state.selectedEnabledCustomers,
                        onCustomerSelect: (c) =>
                            jobsFilterCubit.addSelectedCustomer(context, c),
                        onCheckboxChanged:
                            jobsFilterCubit.toggleSelectedCustomerEnabled,
                        onClear: jobsFilterCubit.clearSelectedCustomers,
                        onExpansionChanged: (value) {
                          jobsFilterCubit.enableCustomerFilter(value: value);
                        },
                      ),
                      const Divider(height: 1),
                      CustomerFilterExpansionItem(
                        isEnabled:
                            jobsFilterCubit.state.isAssignedToFilterEnabled,
                        label: 'Assigned To',
                        isAssignCustomer: true,
                        selectedCustomers:
                            jobsFilterCubit.state.selectedAssignedTos,
                        selectedEnabledCustomers:
                            jobsFilterCubit.state.selectedEnabledAssignedTos,
                        onCustomerSelect: jobsFilterCubit.addAssignedToCustomer,
                        onCheckboxChanged:
                            jobsFilterCubit.toggleAssignedToCustomerEnabled,
                        onClear:
                            jobsFilterCubit.clearSelectedAssignedToCustomers,
                        onExpansionChanged: (value) {
                          jobsFilterCubit.enableAssignedToFilter(value: value);
                        },
                      ),
                      const Divider(height: 1),
                      DateFilterExpansionItem(
                        label: 'Start Date',
                        selectedStartDate:
                            jobsFilterCubit.state.selectedStartDate,
                        selectedSStartDateRange:
                            jobsFilterCubit.state.startDateRange?['start'],
                        selectedSEndDateRange:
                            jobsFilterCubit.state.startDateRange?['end'],
                      ),
                      const Divider(height: 1),
                      DateFilterExpansionItem(
                        label: 'Due Date',
                        selectedStartDate:
                            jobsFilterCubit.state.selectedDueDate,
                        selectedSStartDateRange:
                            jobsFilterCubit.state.dueDateRange?['start'],
                        selectedSEndDateRange:
                            jobsFilterCubit.state.dueDateRange?['end'],
                      ),
                      const Divider(height: 1),
                      JobsToggleFilterItem(
                        label: 'Unscheduled Jobs',
                        isSelected:
                            jobsFilterCubit.state.isUnscheduledJobsSelected,
                        onTap: () =>
                            context.read<JobsFilterCubit>().toggleFilterJob(
                                  'isUnscheduledJobsSelected',
                                ),
                      ),
                      const Divider(height: 1),
                      JobsToggleFilterItem(
                        label: 'Internal Jobs',
                        isSelected:
                            jobsFilterCubit.state.isInternalJobsSelected,
                        onTap: () =>
                            context.read<JobsFilterCubit>().toggleFilterJob(
                                  'isInternalJobsSelected',
                                ),
                      ),
                      const Divider(height: 1),
                      JobsToggleFilterItem(
                        label: 'Archived Jobs Only',
                        isSelected: jobsFilterCubit
                            .state.isOnlyShowCompletedJobsSelected,
                        onTap: () =>
                            context.read<JobsFilterCubit>().toggleFilterJob(
                                  'isOnlyShowCompletedJobsSelected',
                                ),
                      ),
                      const Divider(height: 1),
                      JobsToggleFilterItem(
                        label: 'Active & Archived Jobs',
                        isSelected: jobsFilterCubit
                            .state.isIncludeCompletedJobsSelected,
                        onTap: () =>
                            context.read<JobsFilterCubit>().toggleFilterJob(
                                  'isIncludeCompletedJobsSelected',
                                ),
                      ),
                      const Divider(height: 1),
                      const SizedBox(height: 42),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
