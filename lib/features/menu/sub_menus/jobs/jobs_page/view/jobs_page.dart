import 'dart:async';

import 'package:api_service/api_service.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nextminute/core/routes/app_router.dart';
import 'package:nextminute/core/utils/utils.dart';
import 'package:nextminute/features/menu/main_menu/bloc/main_menu_bloc.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/jobs_page/bloc/index.dart';
import 'package:nextminute/features/menu/sub_menus/sub_menus.dart';
import 'package:nextminute/features/utils/generic_status_enum.dart';
import 'package:nextminute/features/wigdets/nm_always_scroll.dart';
import 'package:nextminute/features/wigdets/nm_empty_state.dart';
import 'package:nextminute/features/wigdets/nm_small_loading_indicator.dart';
import 'package:nextminute/features/wigdets/nm_widgets.dart';
import 'package:nm_repository/nm_repository.dart';

@RoutePage()
class JobsPage extends StatelessWidget {
  const JobsPage({
    super.key,
    this.onTap,
  });

  final void Function(JobInfoLevelModel job)? onTap;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => JobsFilterBloc(
            nmRepositoryImpl: context.read<NMRepositoryImpl>(),
          )..add(const JobsFilterStatusFetch()),
        ),
        BlocProvider<JobsBloc>.value(
          value: context.read<JobsBloc>()..add(const JobsFetchEvent()),
        ),
        BlocProvider<JobsFilterCubit>.value(
          value: context.read<JobsFilterCubit>()..clearFilters(),
        ),
      ],
      child: JobsView(onTap: onTap),
    );
  }
}

class JobsView extends StatefulWidget {
  const JobsView({super.key, this.onTap});

  final void Function(JobInfoLevelModel job)? onTap;

  @override
  State<JobsView> createState() => _JobsViewState();
}

class _JobsViewState extends State<JobsView> {
  late ScrollController _scrollController;

  late TextEditingController _searchController;

  String _currentSortName = '';
  String _currentSort = 'desc';

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _scrollController = ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jobs'),
        actions: [
          BlocBuilder<JobsBloc, JobsState>(
            builder: (context, state) {
              if (state.status == GenericRequestStatusEnum.loading) {
                return const NMSmallLoadingIndicator();
              }

              return Row(
                children: [
                  NMCupertinoButton(
                    key: const Key('__filter_button__'),
                    onPressed: () async {
                      await _applyFilters();
                    },
                    child: const Text('Filters'),
                  ),
                  JobsQuickFilter(
                    onClear: () {
                      context.read<JobsFilterCubit>().clearFilters();
                      _refreshData(clearSearch: false);
                      Navigator.pop(context);
                    },
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
                  key: const Key('__search_field__'),
                  searchController: _searchController,
                  onChanged: (_) {
                    context.read<JobsFilterCubit>().setSearchQuery(_);
                    _fetchData();
                  },
                  onClear: _refreshData,
                ),
                Expanded(
                  child: NMBlocConsumer<JobsBloc, JobsState>(
                    isPaginated: true,
                    builder: (context, state) {
                      final jobs = state.jobs;

                      if (jobs.data.isEmpty) {
                        if (state.status == GenericRequestStatusEnum.loading) {
                          return SizedBox(
                            height: MediaQuery.of(context).size.height * 0.3,
                            child: const Center(
                              child: NMLoadingWidget(),
                            ),
                          );
                        }
                        return const NMEmptyState();
                      }

                      return RefreshIndicator(
                        key: const Key('__refresh_indicator__'),
                        onRefresh: () async => _refreshData(clearSearch: false),
                        child: SizedBox(
                          height: double.infinity,
                          child: Column(
                            children: [
                              CurrentFiltersContainer(
                                label: JobsHelper.getFilterTitles(
                                  context.read<JobsFilterCubit>().state,
                                ).isEmpty
                                    ? 'Results:'
                                    : '''Filtered by: ${JobsHelper.getFilterTitles(context.watch<JobsFilterCubit>().state)}''',
                                trailing: Text(
                                  '''${state.currentSkip == 20 ? '${jobs.total} Recent' : jobs.total_all} Jobs''',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ),
                              Expanded(
                                child: state.jobs.data.isEmpty
                                    ? const NMEmptyState()
                                    : AlwaysScroll(
                                        controller: _scrollController,
                                        child: ListView.builder(
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount:
                                              state.jobsList?.length ?? 0,
                                          itemBuilder: (context, index) {
                                            final job = state.jobsList![index];

                                            return InkWell(
                                              onTap: () {
                                                if (widget.onTap != null) {
                                                  widget.onTap!.call(job);
                                                }
                                              },
                                              child: IgnorePointer(
                                                ignoring: widget.onTap != null,
                                                child: JobsItem(
                                                  job: job,
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                              ),
                            ],
                          ).paddingSymmetric(horizontal: 8),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          NMBottomMenuActions(
            key: const ValueKey('__bottom_menu_actions__'),
            actionsPanel: NMActionList(
              key: const ValueKey('__action_list__'),
              actions: [
                if (context.read<MainMenuBloc>().state.isJobAddEditEnabled)
                  NMActionItem(
                    key: const ValueKey('__add_job_button__'),
                    onTap: () async {
                      final res = await context.router.push(
                        AddJobRoute(),
                      );
                      if (res == 'added') {
                        _refreshData();
                      }
                    },
                    icon: Icons.add,
                    label: 'Add Job',
                  ),
                if (context.read<MainMenuBloc>().state.jobTemplatesEnabled)
                  const NMActionItem(
                    icon: Icons.add,
                    label: 'Add Using Template',
                    // onTap: () {},
                  ),
                NMActionItem(
                  onTap: () {
                    setState(() {
                      _currentSortName = 'recent';
                    });
                    context
                        .read<JobsFilterCubit>()
                        .saveFinalFilter({'recent': true});
                    _fetchData();
                  },
                  label: 'Sort by Recently Used',
                  icon: _currentSortName == 'recent'
                      ? Icons.check_circle
                      : Icons.circle_outlined,
                  iconColor:
                      _currentSortName == 'recent' ? NMColors.orange : null,
                ),
                _buildSortAction('Sort by Job Start', 'job_start'),
                _buildSortAction('Sort by Due Date', 'job_due'),
                if (context.read<MainMenuBloc>().state.isAdmin)
                  const NMActionItem(
                    icon: Icons.download_for_offline,
                    label: 'Import',
                    // onTap: () {},
                  ),
                if (context.read<MainMenuBloc>().state.jobTemplatesEnabled)
                  const NMActionItem(
                    icon: FontAwesomeIcons.cube,
                    label: 'Job Templates',
                    // onTap: () {},
                  ),
                NMActionItem(
                  key: const ValueKey('__show_maps__'),
                  onTap: () {
                    context.router.push(
                      JobMapsRoute(
                        jobs: context.read<JobsBloc>().state.jobs.data,
                      ),
                    );
                  },
                  icon: FontAwesomeIcons.mapLocation,
                  label: 'Show Jobs on Map',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSortAction(String label, String sortName) {
    return NMActionItem(
      onTap: () {
        setState(() {
          _currentSortName = sortName;
          _currentSort = _currentSort == 'asc' ? 'desc' : 'asc';
        });
        context.read<JobsFilterCubit>().saveFinalFilter({
          'sort': '$sortName $_currentSort',
          'recent': true,
        });
        _fetchData();
      },
      label: label,
      icon: _currentSortName == sortName
          ? Icons.check_circle
          : Icons.circle_outlined,
      iconColor: _currentSortName == sortName ? NMColors.orange : null,
      trailing: _currentSortName != sortName
          ? null
          : _currentSort == 'asc'
              ? const Icon(
                  Icons.arrow_upward,
                  color: NMColors.orange,
                )
              : const Icon(
                  Icons.arrow_downward,
                  color: NMColors.orange,
                ),
    );
  }

  Future<void> _applyFilters() async {
    final res = await context.router.push(
      const JobsFilterRoute(),
    );

    if (res == 'Apply' && mounted) {
      final jobsFilter = context.read<JobsFilterCubit>();
      final filterData = JobsHelper.getFilterDataMap(jobsFilter: jobsFilter);

      jobsFilter.saveFinalFilter(filterData);

      _fetchData();
    }
  }

  void _refreshData({bool clearSearch = true}) {
    if (clearSearch) _searchController.clear();
    _fetchData();
  }

  void _fetchData({bool isScroll = false}) {
    final jobsFilter = context.read<JobsFilterCubit>();
    final jb = context.read<JobsBloc>();

    jb.add(
      JobsFetchEvent(
        search: _searchController.text,
        filterData: jobsFilter.state.finalFilterData,
        skip: isScroll ? jb.state.currentSkip : 0,
      ),
    );
  }

  void _scrollListener() {
    final taskBloc = context.read<ScheduledTaskBloc>();
    if (_scrollController.offset ==
            _scrollController.position.maxScrollExtent &&
        taskBloc.state.status != GenericRequestStatusEnum.loading) {
      _fetchData(isScroll: true);
    }
  }
}
