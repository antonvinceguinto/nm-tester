import 'dart:developer';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:api_service/api_service.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:nextminute/core/routes/app_router.dart';
import 'package:nextminute/core/utils/utils.dart';
import 'package:nextminute/features/menu/main_menu/bloc/main_menu_bloc.dart';
import 'package:nextminute/features/menu/sub_menus/customer/customer/widgets/address_field.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/sub_menus/add_job/add_job/widgets/add_job_field.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/sub_menus/add_job/add_job/widgets/nm_divider.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/sub_menus/add_job/add_job/widgets/send_notifs.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/sub_menus/add_job/sub_menus/generic_cubits/importance_cubit.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/sub_menus/add_job/sub_menus/generic_cubits/user_category_cubit.dart';
import 'package:nextminute/features/menu/sub_menus/scheduled_tasks/add_task/at_recurrence/cubit/at_recurrence_cubit.dart';
import 'package:nextminute/features/menu/sub_menus/scheduled_tasks/add_task/bloc/add_task_bloc.dart';
import 'package:nextminute/features/menu/sub_menus/scheduled_tasks/add_task/widgets/at_assigned_to.dart';
import 'package:nextminute/features/menu/sub_menus/scheduled_tasks/add_task/widgets/at_select_customer.dart';
import 'package:nextminute/features/menu/sub_menus/scheduled_tasks/add_task/widgets/at_select_job.dart';
import 'package:nextminute/features/menu/sub_menus/scheduled_tasks/add_task/widgets/at_select_site.dart';
import 'package:nextminute/features/menu/sub_menus/sub_menus.dart';
import 'package:nextminute/features/utils/generic_status_enum.dart';
import 'package:nextminute/features/wigdets/nm_always_scroll.dart';
import 'package:nextminute/features/wigdets/nm_small_loading_indicator.dart';
import 'package:nextminute/features/wigdets/nm_widgets.dart';
import 'package:nm_repository/nm_repository.dart';
import 'package:rrule/rrule.dart';

@RoutePage()
class AddTaskPage extends StatelessWidget {
  const AddTaskPage({
    super.key,
    this.taskInfoLevel,
    this.updateMode = '',
  });

  final TaskInfoLevelModel? taskInfoLevel;
  final String updateMode;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AddTaskBloc>(
          create: (_) => AddTaskBloc(
            nmRepositoryImpl: context.read<NMRepositoryImpl>(),
          ),
        ),
      ],
      child: AddTaskView(
        taskInfoLevel: taskInfoLevel,
        updateMode: updateMode,
      ),
    );
  }
}

class AddTaskView extends StatefulWidget {
  const AddTaskView({
    super.key,
    this.taskInfoLevel,
    this.updateMode = '',
  });

  final TaskInfoLevelModel? taskInfoLevel;
  final String updateMode;

  @override
  State<AddTaskView> createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _titleController;
  late TextEditingController _detailsController;
  late TextEditingController _addressController;

  late DateTime _startDateTime = DateTime.now();

  late DateTime _endDateTime = DateTime.now();

  bool _isAllDay = false;
  // bool _isDisplayOnJobPlanning = true;

  @override
  void initState() {
    super.initState();

    final startMinutesToNearestQuarter = 15 - (_startDateTime.minute % 15);
    _startDateTime =
        _startDateTime.add(Duration(minutes: startMinutesToNearestQuarter));

    _endDateTime = _startDateTime.add(const Duration(hours: 1));

    setState(() {});

    _initData();
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _detailsController.dispose();
    _addressController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _clearFilters();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.taskInfoLevel == null ? 'Add Task' : 'Edit Task'),
          actions: [
            BlocConsumer<AddTaskBloc, AddTaskState>(
              listener: (context, state) {
                if (state.status == GenericRequestStatusEnum.success) {
                  context.router.pop('added');
                }

                if (state.status == GenericRequestStatusEnum.error) {
                  if (!mounted) return;

                  if (state.errorMessage != null &&
                      state.errorMessage!
                          .replaceAll('Exception:', '')
                          .trim()
                          .isEmpty) {
                    return;
                  }

                  showOkAlertDialog(
                    context: context,
                    message: state.errorMessage?.replaceAll('Exception: ', ''),
                    title: 'Error',
                  );
                }
              },
              builder: (context, state) {
                if (state.status == GenericRequestStatusEnum.loading) {
                  return const NMSmallLoadingIndicator();
                }

                return NMCupertinoButton(
                  onPressed: _onSave,
                  child: const Text('Save'),
                );
              },
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: AlwaysScroll(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      if (widget.taskInfoLevel != null) ...{
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(8),
                          color: Colors.grey.shade700,
                          child: Text(
                            widget.taskInfoLevel!.book_is_recurring!
                                ? '''Edit Recurring Task ${widget.taskInfoLevel!.book_number} occurrence on ${DateFormat('EE dd-MMM-yyyy').format(widget.taskInfoLevel!.book_recurrence_start!)}'''
                                : '''Edit Task ${widget.taskInfoLevel!.book_number}''',
                            style: NMTextStyles.caption(context)?.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      },
                      if (widget.taskInfoLevel != null &&
                          (widget.updateMode ==
                                  'OccurrenceAndFutureOccurrences' ||
                              widget.updateMode == 'EntireSeries'))
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
                                  widget.updateMode ==
                                          'OccurrenceAndFutureOccurrences'
                                      ? '''You are editing this occurrence and ALL future occurrences of the recurring task'''
                                      : '''You are editing the entire series of the recurring task.''',
                                  style: NMTextStyles.caption(context),
                                ),
                              ),
                            ],
                          ),
                        ),
                      const SendNotifs(),
                      NMDivider(),
                      const SizedBox(height: 16),
                      _buildColumnPadding(
                        children: [
                          _buildLabel('Title:'),
                          AddJobField(
                            hint: 'Title*',
                            controller: _titleController,
                          ),
                          const SizedBox(height: 16),
                          _buildLabel('Details:'),
                          AddJobField(
                            controller: _detailsController,
                            hint: '',
                            maxLines: 3,
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                      NMDivider(),
                      const SizedBox(height: 16),
                      _buildColumnPadding(
                        children: [
                          _buildLabel('Schedule'),
                          _buildLabel('Start:'),
                          Row(
                            children: [
                              AddJobDatePicker(
                                label: 'Start Date',
                                isAllDay: _isAllDay,
                                dateTime: Helpers.roundToMinuteInterval(
                                  _startDateTime,
                                  15,
                                ),
                                onDateTimeChanged: (dateTime) {
                                  setState(() {
                                    _startDateTime = dateTime;
                                  });
                                },
                              ),
                              Expanded(
                                child: _buildAllDayCheckBox(),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          _buildLabel('End:'),
                          AddJobDatePicker(
                            label: 'End Date',
                            isAllDay: _isAllDay,
                            dateTime: Helpers.roundToMinuteInterval(
                              _endDateTime,
                              15,
                            ),
                            onDateTimeChanged: (dateTime) {
                              setState(() {
                                _endDateTime = dateTime;
                              });
                            },
                          ),
                          // const SizedBox(height: 16),
                          // AddCheckBox(
                          //   label: 'Display on Job Planning',
                          //   value: _isDisplayOnJobPlanning,
                          //   padding: EdgeInsets.zero,
                          //   onChecked: (val) {
                          //     setState(() {
                          //       _isDisplayOnJobPlanning = val!;
                          //     });
                          //   },
                          // ),
                          const SizedBox(height: 16),
                        ],
                      ),
                      NMDivider(),
                      BlocBuilder<ATRecurrenceCubit, ATRecurrenceState>(
                        builder: (context, state) {
                          return IgnorePointer(
                            ignoring: widget.updateMode == 'Occurrence',
                            child: JobListTile(
                              title: 'Recurrence',
                              subtitle: state.finalRepeatText.isEmpty
                                  ? 'Add recurrence'
                                  : state.finalRepeatText,
                              onTap: _onRecurrenceSelected,
                            ),
                          );
                        },
                      ),
                      NMDivider(),
                      const SizedBox(height: 16),
                      _buildColumnPadding(
                        children: [
                          _buildLabel('Address:'),
                          SingleAddressField(
                            label: 'Enter a location',
                            controller: _addressController,
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                      NMDivider(),
                      ATSelectJob(
                        titleController: _titleController,
                        addressController: _addressController,
                      ),
                      NMDivider(),
                      ATSelectCustomer(tController: _addressController),
                      NMDivider(),
                      const ATSelectSite(),
                      NMDivider(),
                      BlocBuilder<ImportanceCubit,
                          JobGenericState<FPriorityModel>>(
                        builder: (context, state) {
                          return JobListTile(
                            title: 'Importance',
                            subtitle:
                                state.selectedItem?.name ?? 'Not Assigned',
                            onTap: () => _navigateTo(
                              const GenericItemsPage<
                                  ImportanceCubit,
                                  JobGenericState<FPriorityModel>,
                                  FPriorityModel>(),
                            ),
                          );
                        },
                      ),
                      NMDivider(),
                      BlocBuilder<PriorityCubit,
                          JobGenericState<FPriorityModel>>(
                        builder: (context, state) {
                          return JobListTile(
                            title: 'Priority',
                            subtitle:
                                state.selectedItem?.name ?? 'Not Assigned',
                            onTap: () => _navigateTo(
                              const GenericItemsPage<
                                  PriorityCubit,
                                  JobGenericState<FPriorityModel>,
                                  FPriorityModel>(),
                            ),
                          );
                        },
                      ),
                      NMDivider(),
                      BlocBuilder<UserCategoryCubit,
                          JobGenericState<CategoryFilterModel>>(
                        builder: (context, state) {
                          return JobListTile(
                            title: 'Category',
                            subtitle:
                                state.selectedItem?.name ?? 'Not assigned',
                            onTap: () => _navigateTo(
                              const GenericItemsPage<
                                  UserCategoryCubit,
                                  JobGenericState<CategoryFilterModel>,
                                  CategoryFilterModel>(),
                            ),
                          );
                        },
                      ),
                      NMDivider(),
                      if (context.read<MainMenuBloc>().state.isAdmin)
                        const ATAssignedTo(),
                      NMDivider(),
                    ],
                  ),
                ),
              ),
            ),
            const NMBottomMenuActions()
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(
    String label, {
    bool isBold = false,
    double bottomPadding = 0,
    double topPadding = 0,
  }) {
    return Text(
      label,
      style: NMTextStyles.b2(context)?.copyWith(
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      ),
    ).paddingOnly(
      bottom: bottomPadding,
      top: topPadding,
    );
  }

  Widget _buildAllDayCheckBox() {
    return CheckboxListTile(
      value: _isAllDay,
      title: const Text('All Day Event'),
      controlAffinity: ListTileControlAffinity.leading,
      dense: true,
      visualDensity: VisualDensity.compact,
      onChanged: (val) {
        _isAllDay = val ?? false;

        final now = DateTime.now();

        // Update start and end date to all day
        if (_isAllDay) {
          _startDateTime = now;
          _endDateTime = now;
        } else {
          final startMinutesToNearestQuarter =
              15 - (_startDateTime.minute % 15);
          _startDateTime =
              now.add(Duration(minutes: startMinutesToNearestQuarter));

          _endDateTime = _startDateTime.add(
            const Duration(
              days: 1,
            ),
          );
        }

        setState(() {});
      },
    );
  }

  Widget _buildColumnPadding({required List<Widget> children}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    ).paddingSymmetric(horizontal: 16);
  }

  Future<void> _onRecurrenceSelected() async {
    final pageRes = await context.router.push(
      const RecurrenceRoute(),
    );

    if (pageRes == 'save') {
      if (!mounted) return;

      final rCubit = context.read<ATRecurrenceCubit>();

      final string = rCubit.state.tempRecurrencePattern;

      if (string.isEmpty) {
        rCubit.clear();
        return;
      }

      final rrule = RecurrenceRule.fromString(string);

      final tempStartDateTime = _startDateTime.copyWith(
        isUtc: true,
      );

      final instances = rrule
          .getInstances(
            start: tempStartDateTime,
          )
          .take(1);

      final dateFormat = DateFormat('yyyy-MM-dd');

      final parsedStartTime = DateTime.parse(
        dateFormat.format(
          tempStartDateTime,
        ),
      );

      log('instances: ${DateTime.parse(dateFormat.format(instances.first))}');
      log('parsedStartTime: $parsedStartTime');

      if (instances.isNotEmpty &&
          (DateTime.parse(
                dateFormat.format(
                  instances.first,
                ),
              ) !=
              parsedStartTime)) {
        final formatter = DateFormat('EE dd-MMM-yyyy');

        final removeRecRes = await showAlertDialog<String>(
          barrierDismissible: false,
          context: context,
          builder: (context, platform) {
            return AlertDialog(
              title: Text(
                'Recurring Task',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              content: Text(
                'The start date '
                '${formatter.format(_startDateTime.toLocal())} '
                'does not match the recurrence pattern: '
                '\n\n${rCubit.state.tempRepeatText}\n\nThe recurrence pattern '
                'must be removed or the start date changed to '
                '${formatter.format(instances.first)}. '
                '\n\nWhat do you want to do?',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    context.router.pop('change_start_date');
                  },
                  child: const Text(
                    'Change Start Date',
                  ),
                ),
                TextButton(
                  onPressed: () {
                    context.router.pop('remove_recurrence');
                  },
                  child: const Text(
                    'Remove Recurrence',
                  ),
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

        if (removeRecRes == 'change_start_date') {
          setState(() {
            _startDateTime = DateTime.parse(dateFormat.format(instances.first));
            _endDateTime = DateTime.parse(dateFormat.format(instances.first))
                .add(const Duration(hours: 1));
            _isAllDay = false;
          });

          if (!mounted) return;
          context.read<ATRecurrenceCubit>().save();
        } else if (removeRecRes == 'remove_recurrence') {
          rCubit.clear();
        }

        return;
      }

      context.read<ATRecurrenceCubit>().save();
    }
  }

  void _initData() {
    _titleController = TextEditingController(
      text: widget.taskInfoLevel?.book_summary ?? 'New Task',
    );
    _detailsController = TextEditingController(
      text: widget.taskInfoLevel?.book_details ?? '',
    );
    _addressController = TextEditingController(
      text: widget.taskInfoLevel?.book_address ?? '',
    );
    _startDateTime = widget.taskInfoLevel?.book_start ?? DateTime.now();
    _endDateTime = widget.taskInfoLevel?.book_end ??
        DateTime.now().add(const Duration(hours: 1));

    // _isDisplayOnJobPlanning =
    //     widget.taskInfoLevel?.book_is_displayed_on_timeline ?? true;

    if (widget.taskInfoLevel?.book_recurrence_text != null) {
      context.read<ATRecurrenceCubit>().updateFinalRepeatText(
            widget.taskInfoLevel!.book_recurrence_text!,
          );
      context.read<ATRecurrenceCubit>().updateFinalRecurrencePattern(
            widget.taskInfoLevel!.book_recurrence_pattern!,
          );
    }

    if (widget.taskInfoLevel?.book_job_id != null) {
      final job = JobInfoLevelModel(
        job_id: widget.taskInfoLevel!.book_job_id,
        job_name: widget.taskInfoLevel!.book_job_name,
        job_client_contact_id: widget.taskInfoLevel!.book_client_contact_id,
        job_client_contact_name: widget.taskInfoLevel!.book_client_contact_name,
      );

      context.read<AddTaskBloc>().add(
            ATSelectJobEvent(
              selectedJob: job,
            ),
          );

      if (widget.taskInfoLevel?.bookingContacts != null &&
          widget.taskInfoLevel!.bookingContacts.isNotEmpty) {
        context.read<JobsFilterCubit>().addCustomer(
              CustomerDatum(
                contact_id: job.job_client_contact_id,
                contact_name_display: job.job_client_contact_name,
              ),
              isAssignCustomer: false,
            );
      }
    }

    if (widget.taskInfoLevel?.book_site_contact_id != null) {
      context.read<JobsFilterCubit>().selectSite(
            CustomerDatum(
              contact_id: widget.taskInfoLevel?.book_site_contact_id,
              contact_name_display:
                  widget.taskInfoLevel?.book_site_contact_name,
            ),
          );
    }

    if (widget.taskInfoLevel?.book_importance != null) {
      context.read<ImportanceCubit>().selectItem(
            FPriorityModel(
              id: widget.taskInfoLevel!.book_importance,
              name: widget.taskInfoLevel!.book_importance_name,
            ),
          );
    }

    if (widget.taskInfoLevel?.book_priority_id != null) {
      context.read<PriorityCubit>().selectItem(
            FPriorityModel(
              id: widget.taskInfoLevel!.book_priority_id,
              name: widget.taskInfoLevel!.book_priority_name,
            ),
          );
    }

    if (widget.taskInfoLevel?.book_usercategory_id != null) {
      context.read<UserCategoryCubit>().selectItem(
            CategoryFilterModel(
              id: widget.taskInfoLevel!.book_usercategory_id,
              name: widget.taskInfoLevel!.book_usercategory_name,
            ),
          );
    }

    if (widget.taskInfoLevel != null &&
        widget.taskInfoLevel!.bookingContacts.isNotEmpty) {
      final customers = widget.taskInfoLevel!.bookingContacts.map(
        (e) => CustomerDatum(
          contact_id: e.bookcont_contact_id,
          contact_name_display: e.bookcont_contact_name_display,
        ),
      );

      context.read<JobsFilterCubit>().selectAllAssignedCustomers([
        ...customers,
      ]);
    }
  }

  Future<void> _onSave() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final ic = context.read<ImportanceCubit>().state;
    final pc = context.read<PriorityCubit>().state;
    final uc = context.read<UserCategoryCubit>().state;
    final jc = context.read<JobsFilterCubit>().state;
    final atb = context.read<AddTaskBloc>();
    final rc = context.read<ATRecurrenceCubit>().state;

    final currPattern = rc.finalRecurrencePattern.replaceAll('RRULE:', '');
    // Removes time from the string
    final parsedPattern = currPattern.replaceAll(
      RegExp(r'UNTIL=\d{8}T\d{6}'),
      "${RegExp(r'UNTIL=\d{8}T\d{6}').stringMatch(currPattern)}Z",
    );

    atb.add(
      AddNewTaskEvent(
        context: context,
        updateMode: widget.updateMode,
        taskInfoLevelModel: TaskInfoLevelModel(
          book_id: widget.taskInfoLevel?.book_id,
          book_summary: _titleController.text,
          book_details: _detailsController.text,
          book_address: _addressController.text,
          book_start: _startDateTime,
          book_end: _endDateTime,
          book_is_displayed_on_timeline: true,
          book_recurrence_text: rc.finalRepeatText,
          book_recurrence_pattern: parsedPattern,
          book_job_id: atb.state.selectedJob?.job_id,
          book_importance: ic.selectedItem?.id,
          book_priority_id: pc.selectedItem?.id,
          book_usercategory_id: uc.selectedItem?.id,
          book_site_contact_id: jc.selectedSite?.contact_id,
          book_client_contact_id: jc.selectedCustomers.isNotEmpty
              ? jc.selectedCustomers[0].contact_id
              : null,
          bookingContacts: jc.selectedAssignedTos
              .map(
                (e) => BookingContact(
                  bookcont_contact_id: e.contact_id,
                  bookcont_contact_name_display: e.contact_name_display,
                ),
              )
              .toList(),
          book_updated_date: widget.taskInfoLevel?.book_updated_date,
          book_isallday: _isAllDay,
          book_isrecurring: widget.taskInfoLevel?.book_isrecurring ?? false,
          book_is_recurring: widget.taskInfoLevel?.book_is_recurring ?? false,
          book_isoccurrence: widget.taskInfoLevel?.book_isoccurrence ?? false,
          book_first_occurrence_key:
              widget.taskInfoLevel?.book_first_occurrence_key,
          book_key: widget.taskInfoLevel?.book_key,
          book_time_zone: '',
          book_bookingstatus_id: widget.taskInfoLevel?.book_bookingstatus_id,
          book_isactual_times: false,
          book_progress: 0,
          book_client_contact_id_specified:
              widget.taskInfoLevel?.book_client_contact_id_specified ?? true,
          book_job_id_specified:
              widget.taskInfoLevel?.book_job_id_specified ?? true,
          book_site_contact_id_specified:
              widget.taskInfoLevel?.book_site_contact_id_specified ?? true,
          book_recurrence_pattern_specified:
              widget.taskInfoLevel?.book_recurrence_pattern_specified ?? true,
        ),
      ),
    );
  }

  void _navigateTo(Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) => page,
      ),
    );
  }

  void _clearFilters() {
    context.read<ImportanceCubit>().clearSelectedItems();
    context.read<PriorityCubit>().clearSelectedItems();
    context.read<UserCategoryCubit>().clearSelectedItems();
    context.read<ATRecurrenceCubit>().clear();
    context.read<JobsFilterCubit>()
      ..clearCustomers(isAssignCustomer: false)
      ..clearCustomers(isAssignCustomer: true)
      ..removeSite();
  }
}
