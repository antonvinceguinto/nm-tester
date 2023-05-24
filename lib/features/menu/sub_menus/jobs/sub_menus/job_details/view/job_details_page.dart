import 'dart:io';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:api_service/api_service.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextminute/core/routes/app_router.dart';
import 'package:nextminute/core/utils/utils.dart';
import 'package:nextminute/features/menu/main_menu/bloc/main_menu_bloc.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/jobs_page/bloc/index.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/sub_menus/job_details/bloc/job_details_bloc.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/sub_menus/job_details/helper/task_remover_helper.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/sub_menus/job_details/widgets/index.dart';
import 'package:nextminute/features/menu/sub_menus/sub_menus.dart';
import 'package:nextminute/features/utils/generic_status_enum.dart';
import 'package:nextminute/features/wigdets/nm_always_scroll.dart';
import 'package:nextminute/features/wigdets/nm_chip.dart';
import 'package:nextminute/features/wigdets/nm_simple_button.dart';
import 'package:nextminute/features/wigdets/nm_small_loading_indicator.dart';
import 'package:nextminute/features/wigdets/nm_widgets.dart';

@RoutePage()
class JobDetailsPage extends StatefulWidget {
  const JobDetailsPage({super.key, required this.job});

  final JobInfoLevelModel job;

  @override
  State<JobDetailsPage> createState() => _JobDetailsPageState();
}

class _JobDetailsPageState extends State<JobDetailsPage> with TaskDateMixin {
  @override
  void initState() {
    super.initState();

    context.read<JobDetailsBloc>().add(
          JobDetailsFetchEvent(
            jobId: widget.job.job_id!,
            infoLevel: 'Details ChargesTotals',
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Job Details'),
        actions: [
          if (context.read<MainMenuBloc>().state.isJobAddEditEnabled)
            BlocBuilder<JobDetailsBloc, JobDetailsState>(
              builder: (context, state) {
                if (state.status == GenericRequestStatusEnum.loading) {
                  return const NMSmallLoadingIndicator();
                }

                return NMCupertinoButton(
                  onPressed: () async {
                    final res = await context.router.push(
                      AddJobRoute(
                        jobInfoLevel:
                            context.read<JobDetailsBloc>().state.jobInfoLevel,
                      ),
                    );

                    if (res == 'added') {
                      _refreshData(widget.job.job_id!);
                    }
                  },
                  child: const Text('Edit'),
                );
              },
            ),
        ],
      ),
      body: NMBlocConsumer<JobDetailsBloc, JobDetailsState>(
        builder: (context, state) {
          final relatedBlobCounts = state.relatedBlobCounts;
          final historyStatus = relatedBlobCounts['statusHistory'];
          final onSiteHistory = relatedBlobCounts['onSiteHistory'];

          final jobInfoLevel = state.jobInfoLevel;

          final myContact = jobInfoLevel.job_contacts.isNotEmpty
              ? jobInfoLevel.job_contacts.firstWhere(
                  (cont) =>
                      cont.jobcont_contact_id ==
                      int.parse(context.read<SharedPrefs>().contactId),
                  orElse: () => const JobContact(
                    jobcont_acceptance_status_name: '',
                  ),
                )
              : null;

          final acceptanceStatus = myContact != null
              ? myContact.jobcont_acceptance_status_name == null
                  ? 'Invite'
                  : myContact.jobcont_acceptance_status_name!
              : '';

          final acceptanceComment = myContact != null
              ? myContact.jobcont_acceptance_comment ?? ''
              : '';

          return RefreshIndicator(
            key: const ValueKey('__refresh_indicator__'),
            onRefresh: () async {
              _refreshData(jobInfoLevel.job_id!);
            },
            child: Column(
              children: [
                Expanded(
                  child: AlwaysScroll(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (acceptanceStatus.isNotEmpty) ...{
                              ...[
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    key: const Key('__invite_button__'),
                                    onPressed: !context
                                            .read<MainMenuBloc>()
                                            .state
                                            .userPermissions
                                            .jobCanAcceptReject
                                        ? null
                                        : () async {
                                            final res =
                                                await context.router.push(
                                              AcceptanceStatusRoute(
                                                id: jobInfoLevel.job_id!,
                                                acceptanceStatus:
                                                    acceptanceStatus,
                                                acceptanceComment: jobInfoLevel
                                                            .job_contacts
                                                            .isNotEmpty &&
                                                        acceptanceComment
                                                            .isNotEmpty
                                                    ? acceptanceComment
                                                    : '',
                                              ),
                                            );

                                            if (res == 'Save' && mounted) {
                                              _refreshData(
                                                jobInfoLevel.job_id!,
                                              );
                                            }
                                          },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: getStatusColor(
                                        acceptanceStatus,
                                      ),
                                    ),
                                    child: Text(
                                      acceptanceStatus,
                                      style: NMTextStyles.b2(context)?.copyWith(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                if (jobInfoLevel.job_contacts.isNotEmpty &&
                                    acceptanceComment.isNotEmpty &&
                                    acceptanceComment != '') ...{
                                  Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.all(8),
                                    color: Colors.lightBlue.withOpacity(0.35),
                                    child: Text(
                                      acceptanceComment,
                                      style: NMTextStyles.b2(context)?.copyWith(
                                        fontSize: 14,
                                      ),
                                    ),
                                  )
                                },
                                const SizedBox(height: 8),
                              ]
                            },
                            BlocConsumer<JobDetailsBloc, JobDetailsState>(
                              listener: (context, state) {
                                if (state.locationTaggingStatus ==
                                    LocationTaggingStatusEnum.success) {
                                  _refreshData(jobInfoLevel.job_id!);

                                  if (!mounted) return;

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Location tagged successfully',
                                      ),
                                    ),
                                  );
                                }
                              },
                              builder: (context, state) {
                                return SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: state.locationTaggingStatus ==
                                            LocationTaggingStatusEnum.loading
                                        ? null
                                        : () async {
                                            await HapticFeedback.lightImpact();

                                            if (!mounted) return;

                                            context.read<JobDetailsBloc>().add(
                                                  AddOnSiteLocationEvent(
                                                    context: context,
                                                    jobId: jobInfoLevel.job_id,
                                                  ),
                                                );
                                          },
                                    child: state.locationTaggingStatus ==
                                            LocationTaggingStatusEnum.loading
                                        ? const NMSmallLoadingIndicator()
                                        : const Text('On Site'),
                                  ),
                                );
                              },
                            ),
                          ],
                        ).paddingSymmetric(horizontal: 8),
                        const SizedBox(height: 8),
                        _buildDivider(),
                        JobListTile(
                          onTap: !context
                                  .read<MainMenuBloc>()
                                  .state
                                  .userPermissions
                                  .jobCanChangeStatus
                              ? null
                              : () => _onJobStatusEdit(jobInfoLevel),
                          title: 'Job Status',
                          subtitle:
                              jobInfoLevel.job_jobstatus_name ?? 'Not Assigned',
                          hasChevron: context
                              .read<MainMenuBloc>()
                              .state
                              .userPermissions
                              .jobCanChangeStatus,
                        ),
                        _buildDivider(),
                        JobListTile(
                          title: 'Job Type',
                          subtitle:
                              jobInfoLevel.job_jobtype_name ?? 'Not Assigned',
                          hasChevron: false,
                        ),
                        _buildDivider(),
                        JobListTile(
                          title: 'Pricing Type',
                          subtitle: jobInfoLevel.job_pricingtype_name ??
                              'Not Assigned',
                          hasChevron: false,
                        ),
                        _buildDivider(),
                        JobListTile(
                          onTap: () {
                            if (jobInfoLevel.job_client_contact_id == null) {
                              return;
                            }
                            context.router.push(
                              CustomerDetailsRoute(
                                id: jobInfoLevel.job_client_contact_id!,
                              ),
                            );
                          },
                          title: 'Customer',
                          subtitle: jobInfoLevel.job_client_contact_name ??
                              'Not Assigned',
                        ),
                        _buildDivider(),
                        if (jobInfoLevel.job_site_contact_id != null)
                          JobListTile(
                            // onTap: () {},
                            title: 'Site',
                            subtitle: jobInfoLevel.job_site_contact_name ??
                                'No site assigned',
                          ),
                        _buildDivider(),
                        if (jobInfoLevel.job_address != null &&
                            jobInfoLevel.job_address!.isNotEmpty)
                          Address(
                            address: jobInfoLevel.job_address!,
                            job: jobInfoLevel,
                          ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Job Details',
                              style: _boldText,
                            ),
                            const SizedBox(height: 8),
                            RowItem(
                              label: 'Number',
                              value: jobInfoLevel.job_number ?? '-',
                            ),
                            RowItem(
                              label: 'Title',
                              value: jobInfoLevel.job_name ?? '-',
                            ),
                            RowItem(
                              label: 'Code',
                              value: jobInfoLevel.job_code ?? '-',
                            ),
                            RowItem(
                              label: 'Order Number',
                              value: jobInfoLevel.job_order_number ?? '-',
                            ),
                            RowItem(
                              label: 'Description',
                              value: jobInfoLevel.job_description_text ?? '-',
                            ),
                            RowItem(
                              label: 'Internal Job',
                              value: jobInfoLevel.job_isinternal ?? false
                                  ? 'Yes'
                                  : 'No',
                            ),
                            RowItem(
                              label:
                                  '''Timesheet & Timer entries must be added to tasks''',
                              value: jobInfoLevel
                                          .job_timesheet_must_be_associated_with_task ??
                                      false
                                  ? 'Yes'
                                  : 'No',
                            ),
                            RowItem(
                              label: 'Display on Job Planning',
                              value:
                                  jobInfoLevel.job_is_displayed_on_timeline ??
                                          false
                                      ? 'Yes'
                                      : 'No',
                            ),
                          ],
                        ).paddingSymmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        _buildDivider(),
                        JobListTile(
                          title: 'Assigned To',
                          hasChevron: false,
                          subtitle: jobInfoLevel.job_contacts.isEmpty
                              ? 'Not assigned'
                              : null,
                          customChild: jobInfoLevel.job_contacts.isEmpty
                              ? null
                              : ListView.separated(
                                  separatorBuilder: (context, i) =>
                                      const Divider(),
                                  padding: const EdgeInsets.only(top: 8),
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: jobInfoLevel.job_contacts.length,
                                  itemBuilder: (context, index) {
                                    final contact =
                                        jobInfoLevel.job_contacts[index];
                                    return InkWell(
                                      onTap: () {
                                        context.router.push(
                                          CustomerDetailsRoute(
                                            id: contact.jobcont_contact_id!,
                                          ),
                                        );
                                      },
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Row(
                                              children: [
                                                Text(
                                                  contact
                                                      .jobcont_contact_name_display!,
                                                  style:
                                                      NMTextStyles.b2(context)
                                                          ?.copyWith(
                                                    color: Colors.blue,
                                                  ),
                                                ),
                                                const SizedBox(width: 8),
                                                if (contact
                                                        .jobcont_acceptance_status_name !=
                                                    null)
                                                  NMChip(
                                                    label: contact
                                                        .jobcont_acceptance_status_name!,
                                                    color: getStatusColor(
                                                      contact
                                                          .jobcont_acceptance_status_name!,
                                                    ),
                                                  )
                                              ],
                                            ),
                                          ),
                                          const Icon(
                                            Icons.chevron_right_outlined,
                                          ),
                                        ],
                                      ).paddingOnly(top: 8),
                                    );
                                  },
                                ),
                        ),
                        _buildDivider(),
                        JobListTile(
                          title: 'Priority',
                          subtitle: jobInfoLevel.job_priority_name ?? 'Not set',
                          hasChevron: false,
                        ),
                        _buildDivider(),
                        JobListTile(
                          title: 'Linked Task',
                          onTap: () {
                            if (jobInfoLevel.job_book_id == null) return;
                            context.router.push(
                              TaskDetailsRoute(
                                task: TaskInfoLevelModel(
                                  book_id: jobInfoLevel.job_book_id,
                                  book_start: jobInfoLevel.book_start,
                                ),
                              ),
                            );
                          },
                          customChild: jobInfoLevel.job_has_book == null ||
                                  !jobInfoLevel.job_has_book!
                              ? Text(
                                  'Not set',
                                  style:
                                      NMTextStyles.caption(context)?.copyWith(
                                    color: Colors.grey,
                                  ),
                                )
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 4),
                                    Text(
                                      jobInfoLevel.book_summary!,
                                      style: NMTextStyles.b2(context)?.copyWith(
                                        color: Colors.blue,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      '''${getSelectedTaskDateFormatter(jobInfoLevel.book_start!.toUtc().toLocal())} to ${getSelectedTaskDateFormatter(jobInfoLevel.book_end!.toUtc().toLocal())}''',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                    ),
                                  ],
                                ),
                          subtitle: jobInfoLevel.job_has_book ?? false
                              ? jobInfoLevel.book_summary
                              : 'Not set',
                          trailing: jobInfoLevel.job_has_book ?? false
                              ? Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    NMSimpleButton(
                                      onTap: () => TaskRemoverHelper.removeTask(
                                        context,
                                        jobInfoLevel,
                                        onRefresh: () => _refreshData(
                                          jobInfoLevel.job_id!,
                                        ),
                                      ),
                                      label: 'Remove Task',
                                    ),
                                    const Icon(
                                      Icons.chevron_right_outlined,
                                    ),
                                  ],
                                )
                              : null,
                        ),
                        _buildDivider(),
                        JobSchedule(jobInfoLevel: jobInfoLevel),
                        _buildDivider(),
                        if (context.read<MainMenuBloc>().state.isAdmin)
                          JobListTile(
                            title: 'Reports',
                            hasChevron: false,
                            customChild: const ElevatedButton(
                              onPressed: null,
                              child: Text('Job Summary'),
                            ).paddingOnly(top: 8),
                          ),
                        _buildDivider(),
                        if (jobInfoLevel.cost_summary != null)
                          CostSummaryInfo(
                            costSummary: jobInfoLevel.cost_summary!,
                          ),
                        _buildDivider(),
                        const SizedBox(height: 8),
                        if (jobInfoLevel.actual_charges_totals != null &&
                            context
                                .read<MainMenuBloc>()
                                .state
                                .isJobChargesEnabled)
                          JobCharges(
                            job: jobInfoLevel,
                            actualCharges: jobInfoLevel.actual_charges_totals!,
                          ),
                        _buildDivider(),
                        const SizedBox(height: 8),
                        JobRecords(jobInfoLevel: jobInfoLevel),
                        const SizedBox(height: 8),
                        const Divider(
                          thickness: 1,
                          height: 1,
                        ),
                        if (historyStatus != null &&
                            (historyStatus as List).isNotEmpty)
                          StatusHistoryExpansion(
                            historyStatusList: historyStatus,
                            job: jobInfoLevel,
                          )
                        else
                          const JobListTile(
                            title: 'Status History',
                            hasChevron: false,
                            subtitle: 'No Status History',
                          ),
                        _buildDivider(),
                        if (onSiteHistory != null &&
                            (onSiteHistory as List).isNotEmpty)
                          OnSiteHistoryExpansion(
                            onsiteHistoryList: onSiteHistory,
                            job: jobInfoLevel,
                          )
                        else
                          const JobListTile(
                            title: 'On-Site History',
                            subtitle: 'No On-Site History',
                            hasChevron: false,
                          ),
                      ],
                    ),
                  ),
                ),
                NMBottomMenuActions(
                  hasBottomSpacing: false,
                  actionsPanel: JobActions(
                    onDelete: () => _onDelete(jobInfoLevel),
                    relatedBlobCounts: relatedBlobCounts,
                    jobInfoLevel: jobInfoLevel,
                  ),
                ),
                Container(
                  width: double.infinity,
                  color: NMColors.orange,
                  padding: EdgeInsets.only(
                    bottom: Platform.isIOS ? 24 : 0,
                  ),
                  child: NMCupertinoButton(
                    child: Text(
                      'Start Timer',
                      style: NMTextStyles.b2(context)?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<void> _onDelete(JobInfoLevelModel job) async {
    await context.router.pop();

    if (!mounted) return;

    final removeJobRes = await showOkCancelAlertDialog(
      context: context,
      title: 'Delete Job',
      message: 'Are you sure you want to delete job ${widget.job.job_number}?'
          '\n\nAll associated quotes, orders, invoices, notes, photos, '
          'files and charges, including timesheet records, '
          'will also be deleted.',
      okLabel: 'Yes',
      cancelLabel: 'No',
    );

    if (removeJobRes == OkCancelResult.ok) {
      if (!mounted) return;

      if (job.job_has_book ?? false) {
        final deleteTaskRes = await showAlertDialog<String>(
          context: context,
          barrierDismissible: false,
          builder: (context, platform) {
            return AlertDialog(
              title: Text(
                'Job in Use',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              content: Text(
                'Scheduled Tasks are associated with this Job.'
                '\n\nPlease choose whether to delete the Job AND associated '
                'Tasks or delete the Job ONLY.\n\nIf you choose to delete '
                'only the Job, the Job association will be removed '
                'from the tasks.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    context.router.pop('delete_job_only');
                  },
                  child: const Text('Delete Job Only'),
                ),
                TextButton(
                  onPressed: () {
                    context.router.pop('delete_task');
                  },
                  child: const Text('Delete Job and Task'),
                ),
                TextButton(
                  onPressed: () {
                    context.router.pop('cancel');
                  },
                  child: const Text('Cancel'),
                ),
              ],
            );
          },
        );

        if (!mounted || deleteTaskRes == 'cancel') return;

        context.read<JobDetailsBloc>().add(
              DeleteJobEvent(
                jobId: job.job_id!,
                isDeleteTask: deleteTaskRes == 'delete_task',
              ),
            );

        await _navigateToJobs();
        return;
      }

      context.read<JobDetailsBloc>().add(
            DeleteJobEvent(
              jobId: job.job_id!,
            ),
          );
      await _navigateToJobs();
    }
  }

  Future<void> _navigateToJobs() async {
    await Future<void>.delayed(const Duration(milliseconds: 1000));
    if (mounted) {
      context.read<JobsBloc>().add(const JobsFetchEvent());
      await context.router.replaceAll([
        const TabManagerRoute(),
        JobsRoute(),
      ]);
    }
  }

  Future<void> _onJobStatusEdit(JobInfoLevelModel jobInfoLevel) async {
    final res = await Navigator.push(
      context,
      MaterialPageRoute<String>(
        builder: (context) => const GenericItemsPage<JobStatusCubit,
            JobGenericState<FStatusModel>, FStatusModel>(
          isJobDetailsEdit: true,
        ),
      ),
    );

    if (res == null || !mounted) return;

    final jobId = jobInfoLevel.job_id!;

    context.read<JobDetailsBloc>().add(
          UpdateJobStatusEvent(
            jobId: jobId,
            jobStatusId: int.tryParse(res)!,
          ),
        );
    _refreshData(jobId);
  }

  void _refreshData(int jobId) {
    context.read<JobDetailsBloc>().add(
          JobDetailsFetchEvent(
            jobId: jobId,
            infoLevel: 'Details ChargesTotals',
          ),
        );
  }

  TextStyle? get _boldText => NMTextStyles.b2(context)?.copyWith(
        fontWeight: FontWeight.bold,
      );

  Divider _buildDivider() => const Divider(
        thickness: 1,
        height: 1,
      );
}
