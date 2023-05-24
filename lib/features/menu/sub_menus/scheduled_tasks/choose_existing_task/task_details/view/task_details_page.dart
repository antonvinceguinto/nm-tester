import 'dart:io';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:api_service/api_service.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:nextminute/core/routes/app_router.dart';
import 'package:nextminute/core/utils/utils.dart';
import 'package:nextminute/features/menu/main_menu/bloc/main_menu_bloc.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/sub_menus/add_job/sub_menus/generic_cubits/task_status_cubit.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/sub_menus/job_details/bloc/job_details_bloc.dart';
import 'package:nextminute/features/menu/sub_menus/sub_menus.dart';
import 'package:nextminute/features/utils/generic_status_enum.dart';
import 'package:nextminute/features/wigdets/nm_always_scroll.dart';
import 'package:nextminute/features/wigdets/nm_chip.dart';
import 'package:nextminute/features/wigdets/nm_small_loading_indicator.dart';
import 'package:nextminute/features/wigdets/nm_widgets.dart';
import 'package:nm_repository/nm_repository.dart';

@RoutePage()
class TaskDetailsPage extends StatelessWidget {
  const TaskDetailsPage({
    super.key,
    required this.task,
  });

  final TaskInfoLevelModel task;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TaskDetailsBloc>(
      create: (context) => TaskDetailsBloc(
        nmRepositoryImpl: context.read<NMRepositoryImpl>(),
      )..add(
          TaskDetailsFetchEvent(
            taskId: task.book_id!,
            infoLevel: 'Details ChargesTotals',
            bookOccurrenceKey: task.book_key?.toString() ?? '',
          ),
        ),
      child: TaskDetailsView(task),
    );
  }
}

class TaskDetailsView extends StatefulWidget {
  const TaskDetailsView(
    this.task, {
    super.key,
  });

  final TaskInfoLevelModel task;

  @override
  State<TaskDetailsView> createState() => _TaskDetailsViewState();
}

class _TaskDetailsViewState extends State<TaskDetailsView> with TaskDateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Details'),
        actions: [
          if (context.read<MainMenuBloc>().state.isBookingAddEditEnabled)
            BlocBuilder<TaskDetailsBloc, TaskDetailsState>(
              builder: (context, state) {
                if (state.status == GenericRequestStatusEnum.loading) {
                  return const SizedBox.shrink();
                }

                return NMCupertinoButton(
                  key: const Key('__task_details_edit_button__'),
                  child: const Text('Edit'),
                  onPressed: () async {
                    final taskInfoLevel =
                        context.read<TaskDetailsBloc>().state.taskInfoLevel;

                    dynamic res;

                    if (taskInfoLevel.book_is_recurring ?? false) {
                      final dialogRes = await showAlertDialog<String>(
                        context: context,
                        builder: (context, platform) {
                          return AlertDialog(
                            title: Text(
                              'Edit Recurring Task',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            content: Text(
                              'This is an occurence of a recurring task. '
                              'What do you want to edit?',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  context.router.pop('just_this_occurence');
                                },
                                child: const Text('Just this occurrence'),
                              ),
                              TextButton(
                                onPressed: () {
                                  context.router.pop('this_and_all');
                                },
                                child: const Text(
                                  'This and all future occurrences',
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  context.router.pop('the_entire_series');
                                },
                                child: const Text('The entire series'),
                              ),
                              TextButton(
                                onPressed: () {
                                  context.router.pop();
                                },
                                child: const Text('Cancel'),
                              ),
                            ],
                          );
                        },
                      );

                      if (!mounted) return;

                      if (dialogRes == null) return;

                      res = await context.router.push(
                        AddTaskRoute(
                          taskInfoLevel: taskInfoLevel,
                          updateMode: dialogRes == 'just_this_occurence'
                              ? 'Occurrence'
                              : dialogRes == 'this_and_all'
                                  ? 'OccurrenceAndFutureOccurrences'
                                  : dialogRes == 'the_entire_series'
                                      ? 'EntireSeries'
                                      : '',
                        ),
                      );
                    } else {
                      res = await context.router.push(
                        AddTaskRoute(
                          taskInfoLevel: taskInfoLevel,
                        ),
                      );
                    }

                    if (res == 'added' && mounted) {
                      context.read<TaskDetailsBloc>().add(
                            TaskDetailsFetchEvent(
                              taskId: widget.task.book_id!,
                              infoLevel: 'Details ChargesTotals',
                              bookOccurrenceKey:
                                  widget.task.book_key?.toString() ?? '',
                            ),
                          );
                    }
                  },
                );
              },
            ),
        ],
      ),
      body: NMBlocConsumer<TaskDetailsBloc, TaskDetailsState>(
        builder: (context, state) {
          final taskInfo = state.taskInfoLevel;

          final relatedBlobCounts = state.relatedBlobCounts;
          final historyStatus = relatedBlobCounts['statusHistory'];
          final onSiteHistory = relatedBlobCounts['onSiteHistory'];

          BookingContact? currentContact;

          if (taskInfo.bookingContacts.isNotEmpty) {
            currentContact = taskInfo.bookingContacts.firstWhere(
              (contact) =>
                  contact.bookcont_contact_id ==
                  int.parse(context.read<SharedPrefs>().contactId),
              orElse: BookingContact.new,
            );
          }

          final contactId = currentContact?.bookcont_contact_id;

          final hasStatusAndNotInvited = contactId != null &&
              currentContact?.bookcont_acceptance_status_name != null;
          final isInvited = contactId != null &&
              currentContact?.bookcont_acceptance_status_name == null;
          final hasInvitation = hasStatusAndNotInvited || isInvited;

          final acceptanceComment = taskInfo.bookingContacts.isNotEmpty &&
                  currentContact?.bookcont_acceptance_comment != null &&
                  currentContact?.bookcont_acceptance_comment != ''
              ? currentContact?.bookcont_acceptance_comment
              : '';

          return Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                color: Colors.grey.shade700,
                child: Text(
                  (taskInfo.book_is_recurring ?? false)
                      ? '''Task ${taskInfo.book_number} - occurence on ${getSelectedTaskDateFormatter(taskInfo.book_start!.toUtc().toLocal())}'''
                      : '''Task ${taskInfo.book_number} on ${taskInfo.book_start == null ? '-' : getSelectedTaskDateFormatter(taskInfo.book_start!.toUtc().toLocal())}''',
                  style: NMTextStyles.caption(context)?.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
              if (taskInfo.book_is_recurring ?? false)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(8),
                  color: Colors.yellow.shade100,
                  child: Row(
                    children: [
                      const Icon(
                        Icons.replay,
                        size: 18,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          '''This is an occurrence of a recurring task that starts on ${getSelectedTaskDateFormatter(taskInfo.book_recurrence_start!.toUtc().toLocal())} and ${(taskInfo.book_recurrence_end == null || taskInfo.book_recurrence_end?.year == 9999) ? 'has no end date' : getSelectedTaskDateFormatter(taskInfo.book_recurrence_end!.toUtc().toLocal(), hasTime: false)}''',
                          style: NMTextStyles.caption(context),
                        ),
                      ),
                    ],
                  ),
                ),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async => _refreshData(),
                  child: AlwaysScroll(
                    child: Column(
                      children: [
                        const SizedBox(height: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (hasInvitation) ...{
                              ...[
                                _buildInviteButton(
                                  taskInfo,
                                  hasStatusAndNotInvited,
                                  acceptanceComment,
                                  currentContact,
                                ),
                                if (acceptanceComment?.isNotEmpty ?? false) ...{
                                  Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.all(8),
                                    color: Colors.lightBlue.withOpacity(0.35),
                                    child: Text(
                                      '$acceptanceComment',
                                      style: NMTextStyles.b2(context)?.copyWith(
                                        fontSize: 14,
                                      ),
                                    ),
                                  )
                                },
                                const SizedBox(height: 8),
                              ]
                            },
                            BlocConsumer<TaskDetailsBloc, TaskDetailsState>(
                              listener: (context, state) {
                                if (state.locationTaggingStatus ==
                                    LocationTaggingStatusEnum.success) {
                                  _refreshData();

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

                                            context.read<TaskDetailsBloc>().add(
                                                  AddOnSiteLocationTaskEvent(
                                                    context: context,
                                                    bookKey: taskInfo.book_key,
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
                        const SizedBox(height: 8),
                        _buildTaskDetails(taskInfo),
                        const SizedBox(height: 8),
                        _buildDivider(),
                        JobListTile(
                          onTap: !context
                                  .read<MainMenuBloc>()
                                  .state
                                  .userPermissions
                                  .bookCanChangeStatus
                              ? null
                              : () async {
                                  final res = await Navigator.push(
                                    context,
                                    MaterialPageRoute<String>(
                                      builder: (context) =>
                                          const GenericItemsPage<
                                              TaskStatusCubit,
                                              JobGenericState<TaskStatusModel>,
                                              FStatusModel>(
                                        isJobDetailsEdit: true,
                                      ),
                                    ),
                                  );

                                  if (res == null || !mounted) return;

                                  final id = taskInfo.book_id!;

                                  context.read<TaskDetailsBloc>().add(
                                        UpdateTaskStatusEvent(
                                          taskId: id,
                                          statusId: int.parse(res),
                                        ),
                                      );
                                  _refreshData();
                                },
                          title: 'Current Status',
                          subtitle: taskInfo.book_bookingstatus_name ??
                              'No status assigned',
                          hasChevron: context
                              .read<MainMenuBloc>()
                              .state
                              .userPermissions
                              .bookCanChangeStatus,
                        ),
                        _buildDivider(),
                        const SizedBox(height: 8),
                        _buildSchedule(taskInfo),
                        const SizedBox(height: 8),
                        _buildDivider(),
                        JobListTile(
                          title: 'Recurrence',
                          subtitle: (taskInfo.book_is_recurring ?? false)
                              ? taskInfo.book_recurrence_text
                              : 'Not Recurring',
                          hasChevron: false,
                        ),
                        _buildDivider(),
                        if (taskInfo.book_address != null &&
                            taskInfo.book_address!.trim().isNotEmpty)
                          Address(
                            address: taskInfo.book_address!,
                            task: taskInfo,
                          ),
                        JobListTile(
                          title: 'Job',
                          subtitle: taskInfo.book_job_number == null
                              ? 'Not assigned'
                              : '${taskInfo.book_job_number} - ${taskInfo.book_job_name}',
                          hasChevron: false,
                        ),
                        _buildDivider(),
                        JobListTile(
                          title: 'Customer',
                          subtitle: taskInfo.book_client_contact_name,
                          hasChevron: false,
                        ),
                        _buildDivider(),
                        if (taskInfo.book_site_contact_id != null)
                          JobListTile(
                            title: 'Site',
                            subtitle: taskInfo.book_site_contact_name,
                            hasChevron: false,
                          ),
                        _buildDivider(),
                        JobListTile(
                          title: 'Importance',
                          subtitle: taskInfo.book_importance_name,
                          hasChevron: false,
                        ),
                        _buildDivider(),
                        JobListTile(
                          title: 'Priority',
                          subtitle:
                              taskInfo.book_priority_name ?? 'Not assigned',
                          hasChevron: false,
                        ),
                        _buildDivider(),
                        JobListTile(
                          title: 'Category',
                          subtitle:
                              taskInfo.book_usercategory_name ?? 'Not assigned',
                          hasChevron: false,
                        ),
                        _buildDivider(),
                        JobListTile(
                          title: 'Assigned To',
                          hasChevron: false,
                          customChild: ListView.separated(
                            separatorBuilder: (context, i) => const Divider(),
                            padding: const EdgeInsets.only(top: 8),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: taskInfo.bookingContacts.length,
                            itemBuilder: (context, i) {
                              final contact = taskInfo.bookingContacts[i];
                              return InkWell(
                                onTap: () {
                                  context.router.push(
                                    CustomerDetailsRoute(
                                      id: contact.bookcont_contact_id!,
                                    ),
                                  );
                                },
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        contact.bookcont_contact_name_display!,
                                        style:
                                            NMTextStyles.b2(context)?.copyWith(
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ),
                                    if (contact
                                            .bookcont_acceptance_status_name !=
                                        null)
                                      NMChip(
                                        label: contact
                                            .bookcont_acceptance_status_name!,
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
                        if (taskInfo.cost_summary != null)
                          CostSummaryInfo(
                            costSummary: taskInfo.cost_summary!,
                          ),
                        _buildDivider(),
                        JobListTile(
                          title: 'Reports',
                          hasChevron: false,
                          customChild: ElevatedButton(
                            onPressed: () {},
                            child: const Text('Task Summary'),
                          ).paddingOnly(top: 8),
                        ),
                        _buildDivider(),
                        const SizedBox(height: 8),
                        if (context
                                .read<MainMenuBloc>()
                                .state
                                .subPermissions
                                .BookingChargesEnabled ??
                            false)
                          JobCharges(
                            task: taskInfo,
                            actualCharges: taskInfo.actual_charges_totals ??
                                ActualChargesTotals.empty,
                          ),
                        _buildDivider(),
                        const SizedBox(height: 8),
                        TaskRecords(taskInfo: taskInfo),
                        const SizedBox(height: 8),
                        const Divider(
                          thickness: 1,
                          height: 1,
                        ),
                        if (historyStatus != null &&
                            (historyStatus as List).isNotEmpty)
                          StatusHistoryExpansion(
                            historyStatusList: historyStatus,
                            task: taskInfo,
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
                            task: taskInfo,
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
              ),
              NMBlocConsumer<TaskDetailsBloc, TaskDetailsState>(
                listener: (context, state) {
                  if (state.deleteStatus == DeleteStatusEnum.success) {
                    context.router.pop('deleted');
                  } else if (state.deleteStatus == DeleteStatusEnum.error) {
                    showOkAlertDialog(
                      context: context,
                      title: 'Error',
                      message: state.errorMessage,
                    );
                  }
                },
                builder: (context, state) => NMBottomMenuActions(
                  hasBottomSpacing: false,
                  actionsPanel: NMActionList(
                    actions: [
                      const NMActionItem(
                        label: 'Add Timesheet Entry',
                        icon: Icons.timer,
                      ),
                      if (taskInfo.is_owner ?? false)
                        NMActionItem(
                          onTap: () => _onDelete(taskInfo),
                          label: 'Delete',
                          icon: Icons.delete,
                        ),
                    ],
                  ),
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
          );
        },
      ),
    );
  }

  Widget _buildInviteButton(
    TaskInfoLevelModel taskInfo,
    bool hasStatusAndNotInvited,
    String? acceptanceComment,
    BookingContact? currentContact,
  ) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        key: const Key(
          '__invite_button__',
        ),
        onPressed: !context
                .read<MainMenuBloc>()
                .state
                .userPermissions
                .bookCanAcceptReject
            ? null
            : () async {
                final res = await context.router.push(
                  AcceptanceStatusRoute(
                    id: taskInfo.book_id!,
                    isTask: true,
                    acceptanceStatus: hasStatusAndNotInvited
                        ? currentContact?.bookcont_acceptance_status_name ??
                            'Invited'
                        : 'Invited',
                    acceptanceComment: acceptanceComment,
                  ),
                );

                if (res == 'Save' && mounted) {
                  context.read<TaskDetailsBloc>().add(
                        TaskDetailsFetchEvent(
                          taskId: widget.task.book_id!,
                          infoLevel: 'Details ChargesTotals',
                          bookOccurrenceKey:
                              widget.task.book_key?.toString() ?? '',
                        ),
                      );
                }
              },
        style: ElevatedButton.styleFrom(
          backgroundColor: getStatusColor(
            hasStatusAndNotInvited
                ? currentContact?.bookcont_acceptance_status_name ?? 'Invited'
                : 'Invited',
          ),
        ),
        child: Text(
          currentContact?.bookcont_acceptance_status_name ?? 'Invited',
          style: NMTextStyles.b2(context)?.copyWith(
            color: getStatusColor(
              hasStatusAndNotInvited
                  ? currentContact?.bookcont_acceptance_status_name ?? 'Invited'
                  : 'Invited',
            ).isDark()
                ? Colors.white
                : Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildSchedule(TaskInfoLevelModel task) {
    return _buildColumnPadding(
      children: [
        Text(
          'Schedule',
          style: NMTextStyles.b2(context)?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        RowItem(
          label: 'Start Time',
          value: task.book_start == null
              ? '-'
              : DateFormat('EE dd-MMM-yyyy h:mma')
                  .format(task.book_start!.toUtc().toLocal()),
        ),
        RowItem(
          label: 'End Time',
          value: task.book_end == null
              ? '-'
              : DateFormat('EE dd-MMM-yyyy h:mma')
                  .format(task.book_end!.toUtc().toLocal()),
        ),
      ],
    );
  }

  Widget _buildTaskDetails(TaskInfoLevelModel task) {
    return _buildColumnPadding(
      children: [
        Text(
          'Task Details',
          style: NMTextStyles.b2(context)?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        RowItem(
          label: 'Number',
          value: task.book_number ?? '-',
        ),
        RowItem(
          label: 'Subject',
          value: task.book_summary ?? '-',
        ),
        RowItem(
          label: 'Details',
          value: task.book_details ?? 'Not set',
        ),
        RowItem(
          label: 'Display on Job\nPlanning',
          value: (task.book_is_displayed_on_timeline ?? false) ? 'Yes' : 'No',
        ),
        RowItem(
          label: '% Progress',
          value: '${task.book_progress?.toStringAsFixed(2)}%',
        ),
      ],
    );
  }

  Widget _buildColumnPadding({
    required List<Widget> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    ).paddingSymmetric(horizontal: 16);
  }

  Divider _buildDivider() => const Divider(
        thickness: 1,
        height: 1,
      );

  void _refreshData() {
    context.read<TaskDetailsBloc>().add(
          TaskDetailsFetchEvent(
            taskId: widget.task.book_id!,
            infoLevel: 'Details ChargesTotals',
            bookOccurrenceKey: widget.task.book_key?.toString() ?? '',
          ),
        );
  }

  Future<void> _onDelete(TaskInfoLevelModel task) async {
    await context.router.pop();

    if (!mounted) return;

    final isRecurring = task.book_is_recurring ?? false;

    final res = await showAlertDialog<String>(
      context: context,
      builder: (context, child) => AlertDialog(
        title: Text(
          'Delete ${isRecurring ? 'Recurring ' : ''}Task',
        ),
        content: Text(
          isRecurring
              ? 'Do you want to delete all occurrences of this recurring task, '
                  ' or just this one?'
              : 'Are you sure you want to delete this task '
                  '${task.book_number}?\n\nAll associated quotes, orders, '
                  'invoices, notes, photos, files and charges, including any '
                  'associated timesheet records, will also be deleted. '
                  '\n\nDo you want to continue?',
        ),
        actions: isRecurring
            ? [
                TextButton(
                  onPressed: () => Navigator.of(context).pop('this_occurrence'),
                  child: const Text('Delete this occurrence'),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop('entire_series'),
                  child: const Text('Delete the entire series'),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Cancel'),
                ),
              ]
            : [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('No'),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop('yes'),
                  child: const Text('Yes'),
                ),
              ],
      ),
    );

    if (isRecurring) {
      if (res == 'this_occurrence') {
        if (!mounted) return;

        context.read<TaskDetailsBloc>().add(
              TaskDeleteEvent(
                taskId: task.book_id!,
                occurrenceType: 'occurrence',
                selectedDate: task.book_start!,
              ),
            );
      } else if (res == 'entire_series') {
        if (!mounted) return;

        context.read<TaskDetailsBloc>().add(
              TaskDeleteEvent(
                taskId: task.book_id!,
                occurrenceType: '',
                selectedDate: task.book_start!,
              ),
            );
      } else {
        return;
      }
    }

    if (res == 'yes') {
      if (!mounted) return;

      context.read<TaskDetailsBloc>().add(
            TaskDeleteEvent(
              taskId: task.book_id!,
              occurrenceType: '',
              selectedDate: task.book_start!,
            ),
          );
    }
  }
}
