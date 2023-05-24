import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nextminute/core/utils/utils.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/jobs_page/bloc/index.dart';
import 'package:nextminute/features/menu/sub_menus/quotes/cubit/quotes_filters_cubit.dart';
import 'package:nextminute/features/menu/sub_menus/sub_menus.dart';
import 'package:nextminute/features/utils/generic_status_enum.dart';
import 'package:nextminute/features/wigdets/nm_always_scroll.dart';
import 'package:nextminute/features/wigdets/nm_empty_state.dart';
import 'package:nextminute/features/wigdets/nm_small_loading_indicator.dart';
import 'package:nextminute/features/wigdets/nm_widgets.dart';

@RoutePage()
class QuotesSelectJobPage extends StatelessWidget {
  const QuotesSelectJobPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<JobsBloc>.value(
      value: context.read<JobsBloc>()..add(const JobsFetchEvent()),
      child: const QuotesSelectJobView(),
    );
  }
}

class QuotesSelectJobView extends StatefulWidget {
  const QuotesSelectJobView({super.key});

  @override
  State<QuotesSelectJobView> createState() => _QuotesSelectJobViewState();
}

class _QuotesSelectJobViewState extends State<QuotesSelectJobView> {
  late ScrollController _scrollController;

  late TextEditingController _searchController;

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
    final qfc = context.read<QuotesFiltersCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Jobs'),
        actions: [
          BlocBuilder<JobsBloc, JobsState>(
            builder: (context, state) {
              if (state.status == GenericRequestStatusEnum.loading) {
                return const Center(
                  child: NMSmallLoadingIndicator(),
                );
              }

              return NMCupertinoButton(
                child: const Text('Apply'),
                onPressed: () {
                  qfc.applyJobFilterFromSelectPage();
                  context.router.pop();
                },
              );
            },
          )
        ],
      ),
      body: NMBlocConsumer<JobsBloc, JobsState>(
        isPaginated: true,
        builder: (context, state) =>
            BlocBuilder<QuotesFiltersCubit, QuotesFiltersState>(
          builder: (context, qstate) {
            return Column(
              children: [
                NMSearchField(
                  searchController: _searchController,
                  onChanged: (val) {
                    _fetchData();
                  },
                  onClear: () {
                    _searchController.clear();
                    _fetchData();
                  },
                ),
                CurrentFiltersContainer(
                  label: '${qstate.tempSelectedJobsFromJobsPage.length} '
                      'job(s) selected',
                ).paddingSymmetric(horizontal: 8),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      _fetchData();
                    },
                    child: AlwaysScroll(
                      controller: _scrollController,
                      child: state.jobs.data.isEmpty
                          ? const NMEmptyState()
                          : ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              keyboardDismissBehavior:
                                  ScrollViewKeyboardDismissBehavior.onDrag,
                              itemCount: state.jobsList?.length ?? 0,
                              itemBuilder: (context, index) {
                                final job = state.jobsList?[index];

                                return CheckboxListTile(
                                  value: qstate.tempSelectedJobsFromJobsPage
                                      .contains(job),
                                  onChanged: (value) {
                                    qfc.addTempSelectedJobsFromJobsPage(job);
                                  },
                                  title: Text(
                                    '${job!.job_number} - ${job.job_name}',
                                  ),
                                  subtitle: job.job_client_contact_name == null
                                      ? const SizedBox.shrink()
                                      : Text(
                                          'Customer - '
                                          '${job.job_client_contact_name}',
                                        ).fontSize(14),
                                  controlAffinity:
                                      ListTileControlAffinity.trailing,
                                );
                              },
                            ),
                    ),
                  ),
                ),
                NMBottomMenuActions(
                  actionsPanel: NMActionList(
                    actions: [
                      BlocBuilder<JobsBloc, JobsState>(
                        builder: (context, state) {
                          return NMActionItem(
                            onTap: () async {
                              context
                                  .read<JobsBloc>()
                                  .add(SelectAllJobsEvent(qfc: qfc));
                            },
                            label: 'Select all',
                            icon: Icons.checklist_rtl,
                          );
                        },
                      ),
                      NMActionItem(
                        onTap: qfc.selectNonFromJobsPage,
                        label: 'Select none',
                        icon: FontAwesomeIcons.square,
                      ),
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  void _scrollListener() {
    final jb = context.read<JobsBloc>();
    if (_scrollController.offset ==
            _scrollController.position.maxScrollExtent &&
        jb.state.status != GenericRequestStatusEnum.loading) {
      _fetchData(isScroll: true);
    }
  }

  void _fetchData({bool isScroll = false}) {
    final jb = context.read<JobsBloc>();
    jb.add(
      JobsFetchEvent(
        search: _searchController.text,
        skip: isScroll ? jb.state.currentSkip : 20,
      ),
    );
  }
}
