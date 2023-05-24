import 'package:api_service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:nextminute/core/utils/utils.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/jobs_page/bloc/index.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/jobs_page/utils/jobs_helper.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/sub_menus/job_filters/bloc/jobs_filter_bloc.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/sub_menus/job_filters/cubit/jobs_filter_cubit.dart';
import 'package:nextminute/features/wigdets/nm_always_scroll.dart';
import 'package:nextminute/features/wigdets/nm_widgets.dart';

class JobsQuickFilter extends StatefulWidget {
  const JobsQuickFilter({
    super.key,
    this.onClear,
  });

  final void Function()? onClear;

  @override
  State<JobsQuickFilter> createState() => _JobsQuickFilterState();
}

class _JobsQuickFilterState extends State<JobsQuickFilter> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JobsFilterBloc, JobsFilterBlocState>(
      builder: (context, state) {
        return NMCupertinoButton(
          padding: const EdgeInsets.only(right: 16),
          onPressed: state.filterStatusList == null ||
                  (state.filterStatusList?.isEmpty ?? false)
              ? null
              : () async {
                  await showCupertinoModalBottomSheet<void>(
                    context: context,
                    closeProgressThreshold: 0.9,
                    backgroundColor: NMColors.black,
                    builder: (context) => SafeArea(
                      child: AlwaysScroll(
                        child: Column(
                          children: [
                            _buildQuickFilterItem(
                              onTap: widget.onClear,
                              title: 'Clear Filter',
                            ),
                            _buildQuickFilterItem(
                              onTap: () {
                                setQuickFilter(
                                  filterType: 'isInternalJobsSelected',
                                );
                                Navigator.pop(context);
                              },
                              title: 'Internal Jobs',
                            ),
                            _buildQuickFilterItem(
                              onTap: () {
                                setQuickFilter(
                                  filterType: 'isUnscheduledJobsSelected',
                                );
                                Navigator.pop(context);
                              },
                              title: 'Unscheduled Jobs',
                            ),
                            _buildQuickFilterItem(
                              onTap: () {
                                setQuickFilter(
                                  isOverdue: true,
                                );
                                Navigator.pop(context);
                              },
                              title: 'Overdue Jobs',
                            ),
                            _buildQuickFilterItem(
                              onTap: () {
                                setQuickFilter(
                                  filterType: 'isOnlyShowCompletedJobsSelected',
                                );
                                Navigator.pop(context);
                              },
                              title: 'Archived Jobs',
                            ),
                            _buildQuickFilterItem(
                              onTap: () {
                                setQuickFilter(
                                  filterType: 'isIncludeCompletedJobsSelected',
                                );
                                Navigator.pop(context);
                              },
                              title: 'Include Archived Jobs',
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: state.filterStatusList!.length,
                              itemBuilder: (context, index) {
                                final status = state.filterStatusList![index];
                                final color = Color(
                                  status.color?.toHexColor() ?? 0xFF000000,
                                );
                                return ColoredBox(
                                  color: color,
                                  child: ListTile(
                                    onTap: () {
                                      setQuickStatus(status);
                                      Navigator.pop(context);
                                    },
                                    title: Text(
                                      status.name!,
                                      style: TextStyle(
                                        color: color.isDark()
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
          child: const Icon(Icons.arrow_drop_down),
        );
      },
    );
  }

  void setQuickStatus(FStatusModel status) {
    context.read<JobsFilterCubit>().clearFilters();

    final jobsCubit = context.read<JobsFilterCubit>();

    jobsCubit.addFilter(
      indexFilter: 0,
      nFilters: jobsCubit.state.selectedStatusFilters!..add(status),
    );

    final jobsFilter = context.read<JobsFilterCubit>();

    final filterData = JobsHelper.getFilterDataMap(
      jobsFilter: jobsFilter,
    );

    jobsFilter.saveFinalFilter(
      filterData,
    );

    context.read<JobsBloc>().add(
          JobsFetchEvent(
            filterData: filterData,
            search: jobsFilter.state.search,
          ),
        );
  }

  void setQuickFilter({
    String? filterType,
    bool isOverdue = false,
  }) {
    if (isOverdue) {
      final jobsFilter = context.read<JobsFilterCubit>()
        ..saveDateFilterLabel(
          'Overdue',
          isDue: true,
        );

      final res = JobsHelper.getDateFilter(
        jobsFilter: jobsFilter,
        isDue: true,
      );

      jobsFilter.saveFinalFilter(
        res,
      );

      final filterData = JobsHelper.getFilterDataMap(
        jobsFilter: jobsFilter,
      );

      context.read<JobsBloc>().add(
            JobsFetchEvent(
              filterData: filterData,
              search: jobsFilter.state.search,
            ),
          );
      return;
    }

    context.read<JobsFilterCubit>().clearFilters();
    context.read<JobsFilterCubit>().toggleFilterJob(filterType!);

    final jobsFilter = context.read<JobsFilterCubit>();

    final filterData = JobsHelper.getFilterDataMap(
      jobsFilter: jobsFilter,
    );

    jobsFilter.saveFinalFilter(
      filterData,
    );

    context.read<JobsBloc>().add(
          JobsFetchEvent(
            filterData: filterData,
            search: jobsFilter.state.search,
          ),
        );
  }

  Widget _buildQuickFilterItem({
    void Function()? onTap,
    required String title,
  }) {
    return ListTile(
      onTap: onTap,
      title: Text(
        title,
        style: NMTextStyles.b2(context)?.copyWith(
          color: Colors.white,
        ),
      ),
    );
  }
}
