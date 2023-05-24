import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:api_service/api_service.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextminute/core/routes/app_router.dart';
import 'package:nextminute/core/utils/utils.dart';
import 'package:nextminute/features/menu/main_menu/bloc/main_menu_bloc.dart';
import 'package:nextminute/features/menu/sub_menus/customer/customer/widgets/address_field.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/sub_menus/add_job/add_job/widgets/add_check_box.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/sub_menus/add_job/add_job/widgets/add_job_field.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/sub_menus/add_job/add_job/widgets/add_job_save_button.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/sub_menus/add_job/add_job/widgets/nm_divider.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/sub_menus/add_job/add_job/widgets/send_notifs.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/sub_menus/job_details/helper/task_remover_helper.dart';
import 'package:nextminute/features/menu/sub_menus/sub_menus.dart';
import 'package:nextminute/features/wigdets/nm_always_scroll.dart';
import 'package:nextminute/features/wigdets/nm_simple_button.dart';
import 'package:nextminute/features/wigdets/nm_widgets.dart';

@RoutePage()
class AddJobPage extends StatefulWidget {
  const AddJobPage({
    super.key,
    this.jobInfoLevel,
  });

  final JobInfoLevelModel? jobInfoLevel;

  @override
  State<AddJobPage> createState() => _AddJobPageState();
}

class _AddJobPageState extends State<AddJobPage> with TaskDateMixin {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _titleController;
  late TextEditingController _progressController;
  late TextEditingController _autoAddressController;
  late TextEditingController _manualAddressController;
  late TextEditingController _jobCodeController;
  late TextEditingController _orderNumberController;
  late TextEditingController _descriptionController;

  DateTime? _startDateTime;
  DateTime? _endDateTime;
  DateTime? _dueDate;

  bool isAllDay = false;
  bool isAutoLocation = true;
  bool isDisplayOnJobPlanning = false;
  bool isInternalJob = false;
  bool isAddedToTasks = false;

  @override
  void initState() {
    super.initState();
    _initData();
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _progressController.dispose();
    _autoAddressController.dispose();
    _manualAddressController.dispose();
    _jobCodeController.dispose();
    _orderNumberController.dispose();
    _descriptionController.dispose();
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
          title: Text(widget.jobInfoLevel == null ? 'Add Job' : 'Edit Job'),
          actions: [
            AddJobSaveButton(
              key: const Key('add_job_save_button'),
              onPressed: () {
                if (!_formKey.currentState!.validate()) {
                  return;
                }

                _saveJob();
              },
            )
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: AlwaysScroll(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SendNotifs(),
                      NMDivider(),
                      const SizedBox(height: 8),
                      _buildColumnPadding(
                        children: [
                          _buildLabel('Title:'),
                          AddJobField(
                            key: const Key('add_job_title_field'),
                            hint: 'Job Title*',
                            controller: _titleController,
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      IgnorePointer(
                        ignoring: widget.jobInfoLevel?.job_start != null &&
                            widget.jobInfoLevel?.job_end != null,
                        child: _buildColumnPadding(
                          children: [
                            _buildLabel('Start:'),
                            NMMinSizeContainer(
                              child: Row(
                                children: [
                                  AddJobDatePicker(
                                    label: 'Start Date',
                                    isAllDay: isAllDay,
                                    dateTime: _startDateTime,
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
                            ),
                            const SizedBox(height: 8),
                            _buildLabel(
                              'End:',
                            ),
                            AddJobDatePicker(
                              label: 'End Date',
                              isAllDay: isAllDay,
                              dateTime: _endDateTime,
                              onDateTimeChanged: (dateTime) {
                                setState(() {
                                  _endDateTime = dateTime;
                                });
                              },
                            ),
                            if (widget.jobInfoLevel?.job_start != null &&
                                widget.jobInfoLevel?.job_end != null) ...{
                              const SizedBox(height: 8),
                              Text(
                                '''The Job Start and End dates are derived from the job's task dates.''',
                                style: NMTextStyles.caption(context)?.copyWith(
                                  fontStyle: FontStyle.italic,
                                ),
                              )
                            }
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      _buildColumnPadding(
                        children: [
                          _buildLabel('Progress %'),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: AddJobField(
                              hint: '%',
                              controller: _progressController,
                              maxLength: 4,
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  final progress = double.parse(value);
                                  if (progress > 100) {
                                    _progressController.text = '100';
                                  }
                                }
                              },
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                  RegExp(r'^\d+\.?\d{0,2}'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      NMDivider(),
                      BlocBuilder<JobStatusCubit,
                          JobGenericState<FStatusModel>>(
                        builder: (context, state) {
                          return JobListTile(
                            title: 'Job Status',
                            subtitle:
                                state.selectedItem?.name ?? 'Not Assigned',
                            onTap: () => _navigateTo(
                              const GenericItemsPage<
                                  JobStatusCubit,
                                  JobGenericState<FStatusModel>,
                                  FStatusModel>(),
                            ),
                          );
                        },
                      ),
                      NMDivider(),
                      BlocBuilder<JobTypeCubit, JobGenericState<FTypeModel>>(
                        builder: (context, state) {
                          return JobListTile(
                            title: 'Job Type',
                            subtitle:
                                state.selectedItem?.name ?? 'Not Assigned',
                            onTap: () => _navigateTo(
                              const GenericItemsPage<JobTypeCubit,
                                  JobGenericState<FTypeModel>, FTypeModel>(),
                            ),
                          );
                        },
                      ),
                      NMDivider(),
                      BlocBuilder<PricingTypeCubit,
                          JobGenericState<FPricingTypeModel>>(
                        builder: (context, state) {
                          return JobListTile(
                            title: 'Pricing Type',
                            subtitle:
                                state.selectedItem?.name ?? 'Not Assigned',
                            onTap: () => _navigateTo(
                              const GenericItemsPage<
                                  PricingTypeCubit,
                                  JobGenericState<FPricingTypeModel>,
                                  FPricingTypeModel>(),
                            ),
                          );
                        },
                      ),
                      NMDivider(),
                      BlocBuilder<JobsFilterCubit, JobsFilterState>(
                        builder: (context, state) {
                          final isSelectionEmpty =
                              state.selectedCustomers.isEmpty;
                          return JobListTile(
                            key: const Key('__select_customer__'),
                            title: 'Customer',
                            subtitle: isSelectionEmpty
                                ? 'Not Assigned'
                                : state.selectedCustomers
                                    .map((e) => e.contact_name_display)
                                    .join(', '),
                            onTap: () async {
                              if (!isSelectionEmpty) {
                                await context.router.push(
                                  CustomerDetailsRoute(
                                    id: state
                                        .selectedCustomers.first.contact_id!,
                                  ),
                                );
                                return;
                              }

                              final res = await context.router
                                  .push(JobsSelectCustomerRoute());

                              if (res == 'add_job_customer') {
                                if (_manualAddressController.text
                                    .trim()
                                    .isEmpty) {
                                  if (mounted) {
                                    _manualAddressController.text = context
                                            .read<JobsFilterCubit>()
                                            .state
                                            .selectedCustomers
                                            .first
                                            .contact_address ??
                                        '';
                                    return;
                                  }
                                }

                                if (!mounted) return;

                                final dialogRes = await showOkCancelAlertDialog(
                                  context: context,
                                  title: 'Confirm',
                                  message:
                                      '''The Customer address is different to the Job address. Do you want to update the Job address to match the Customer address?''',
                                );

                                if (dialogRes == OkCancelResult.ok) {
                                  if (mounted) {
                                    _manualAddressController.text = context
                                            .read<JobsFilterCubit>()
                                            .state
                                            .selectedCustomers
                                            .first
                                            .contact_address ??
                                        '';
                                  }
                                }
                              }
                            },
                            trailing: isSelectionEmpty
                                ? const Icon(
                                    Icons.chevron_right,
                                    size: 20,
                                  )
                                : NMSimpleButton(
                                    key: const ValueKey(
                                      '__clear_customer_button__',
                                    ),
                                    label: 'Clear',
                                    onTap: () {
                                      context
                                          .read<JobsFilterCubit>()
                                          .clearCustomers(
                                            isAssignCustomer: false,
                                          );
                                      context
                                          .read<JobsFilterCubit>()
                                          .removeSite();
                                    },
                                  ),
                          );
                        },
                      ),
                      NMDivider(),
                      BlocBuilder<JobsFilterCubit, JobsFilterState>(
                        builder: (context, state) {
                          final selectedCustomers = state.selectedCustomers;

                          if (selectedCustomers.isEmpty) {
                            return const SizedBox.shrink();
                          }

                          final isSiteEmpty =
                              state.selectedSite == null;

                          return JobListTile(
                            title: 'Site',
                            subtitle: isSiteEmpty
                                ? 'Not Assigned'
                                : state.selectedSite!.contact_name_display,
                            onTap: () {
                              if (!isSiteEmpty) {
                                return;
                              }
                              context.router.push(
                                JobsAssignCustomerRoute(
                                  isSite: true,
                                  parentContactId:
                                      state.selectedCustomers.first.contact_id,
                                ),
                              );
                            },
                            trailing: isSiteEmpty
                                ? const Icon(
                                    Icons.chevron_right,
                                    size: 20,
                                  )
                                : NMSimpleButton(
                                    label: 'Clear',
                                    onTap: () {
                                      context
                                          .read<JobsFilterCubit>()
                                          .removeSite();
                                    },
                                  ),
                          );
                        },
                      ),
                      NMDivider(),
                      _buildColumnPadding(
                        children: [
                          const SizedBox(height: 16),
                          AddressField(
                            label: 'Enter a location',
                            autoController: _autoAddressController,
                            manualController: _manualAddressController,
                            isAuto: isAutoLocation,
                            onAutoChanged: (val) {
                              isAutoLocation = val!;
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                      NMDivider(),
                      const SizedBox(height: 16),
                      _buildColumnPadding(
                        children: [
                          _buildLabel('Job Details'),
                          const SizedBox(height: 8),
                          _buildLabel('Code:'),
                          AddJobField(
                            hint: 'Job Code',
                            controller: _jobCodeController,
                          ),
                          _buildLabel(
                            'Order Number:',
                            topPadding: 8,
                          ),
                          AddJobField(
                            hint: 'Job Order Number',
                            controller: _orderNumberController,
                          ),
                          _buildLabel(
                            'Description:',
                            topPadding: 8,
                          ),
                          AddJobField(
                            hint: '',
                            controller: _descriptionController,
                            maxLines: 5,
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                      AddCheckBox(
                        label: 'Display on Job Planning',
                        value: isDisplayOnJobPlanning,
                        onChecked: (val) {
                          setState(() {
                            isDisplayOnJobPlanning = val!;
                          });
                        },
                      ),
                      const SizedBox(height: 8),
                      AddCheckBox(
                        label: 'Internal Job',
                        value: isInternalJob,
                        onChecked: (val) {
                          setState(() {
                            isInternalJob = val!;
                          });
                        },
                      ),
                      const SizedBox(height: 8),
                      AddCheckBox(
                        label:
                            'Timesheet & Timer entries must be added to tasks',
                        value: isAddedToTasks,
                        subtitle: isAddedToTasks
                            ? Text(
                                '''WARNING: This job has no tasks. Please create tasks, otherwise your users will not be able to add timesheets.''',
                                style: NMTextStyles.caption(context)?.copyWith(
                                  color: Colors.red,
                                ),
                              )
                            : null,
                        onChecked: (val) {
                          setState(() {
                            isAddedToTasks = val!;
                          });
                        },
                      ),
                      const SizedBox(height: 16),
                      NMDivider(),
                      BlocBuilder<JobsFilterCubit, JobsFilterState>(
                        builder: (context, state) {
                          return Column(
                            children: [
                              // if (context.read<MainMenuBloc>().state.isAdmin)
                              JobListTile(
                                title: 'Assigned To',
                                subtitle: 'Click to assign a contact',
                                onTap: () {
                                  context.router.push(
                                    JobsAssignCustomerRoute(
                                      isSelection: true,
                                    ),
                                  );
                                },
                              ),
                              ListView.separated(
                                padding: EdgeInsets.zero,
                                separatorBuilder: (context, index) =>
                                    const Divider(
                                  height: 1,
                                ),
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: state.selectedAssignedTos.length,
                                itemBuilder: (context, index) {
                                  final item = state.selectedAssignedTos[index];
                                  return ListTile(
                                    onTap: () {
                                      context.router.push(
                                        CustomerDetailsRoute(
                                          id: item.contact_id!,
                                        ),
                                      );
                                    },
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                    ),
                                    title: Text(
                                      item.contact_name_display ?? '-',
                                      style: NMTextStyles.b2(context)?.copyWith(
                                        fontSize: 14,
                                        color: Colors.blue.shade800,
                                      ),
                                    ),
                                    trailing: NMSimpleButton(
                                      key: const Key(
                                        '__clear_assigned_button__',
                                      ),
                                      label: 'Clear',
                                      onTap: () async {
                                        final res =
                                            await showOkCancelAlertDialog(
                                          context: context,
                                          title: 'Clear',
                                          message: 'Clear '
                                              '${item.contact_name_display} '
                                              'from the Job?',
                                        );

                                        if (res == OkCancelResult.ok) {
                                          if (!mounted) return;
                                          context
                                              .read<JobsFilterCubit>()
                                              .removeCustomer(
                                                item,
                                                isAssignCustomer: true,
                                              );
                                        }
                                      },
                                    ),
                                  );
                                },
                              ),
                            ],
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
                      BlocBuilder<AddJobBloc, AddJobState>(
                        builder: (context, state) {
                          final hasTask = state.selectedTask != null;
                          return JobListTile(
                            title: 'Linked Task',
                            onTap: () {
                              if (!hasTask) return;
                              context.router.push(
                                TaskDetailsRoute(
                                  task: state.selectedTask!,
                                ),
                              );
                            },
                            customChild: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 4),
                                    Text(
                                      !hasTask
                                          ? 'Not Set'
                                          : state.selectedTask!.book_summary!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.copyWith(
                                            color: state.selectedTask == null
                                                ? Colors.grey
                                                : Colors.blue.shade800,
                                          ),
                                    ),
                                    if (state.selectedTask != null) ...{
                                      const SizedBox(height: 4),
                                      Text(
                                        '''${getSelectedTaskDateFormatter(state.selectedTask!.book_start!.toLocal())} to ${getSelectedTaskDateFormatter(state.selectedTask!.book_end!.toLocal())}''',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall,
                                      ),
                                    }
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    if (state.selectedTask == null) ...{
                                      Expanded(
                                        child: NMSimpleButton(
                                          label: 'Create Calendar Task',
                                          onTap: () {},
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                    },
                                    Expanded(
                                      child: NMSimpleButton(
                                        label: state.selectedTask == null
                                            ? 'Choose Existing Task'
                                            : 'Clear Linked Task',
                                        onTap: () async {
                                          if (state.selectedTask != null) {
                                            if (widget.jobInfoLevel != null) {
                                              await TaskRemoverHelper
                                                  .removeTask(
                                                context,
                                                widget.jobInfoLevel!,
                                              );
                                              return;
                                            }
                                            context.read<AddJobBloc>().add(
                                                  const RemoveSelectedTask(),
                                                );
                                            return;
                                          }
                                          await context.router.push(
                                            ScheduledTaskRoute(),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            hasChevron: false,
                          );
                        },
                      ),
                      NMDivider(),
                      const SizedBox(height: 8),
                      _buildColumnPadding(
                        children: [
                          _buildLabel('Schedule'),
                          const SizedBox(height: 8),
                          _buildLabel('Due Date:'),
                          NMMinSizeContainer(
                            child: Row(
                              children: [
                                AddJobDatePicker(
                                  label: 'Due Date',
                                  isAllDay: false,
                                  dateTime: _dueDate,
                                  onDateTimeChanged: (dateTime) {
                                    _dueDate = dateTime;
                                    setState(() {});
                                  },
                                ),
                                NMCupertinoButton(
                                  onPressed: () {
                                    setState(() {
                                      _dueDate = null;
                                    });
                                  },
                                  child: Text(
                                    'Clear',
                                    style: NMTextStyles.btn(context)?.copyWith(
                                      fontSize: 14,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
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

  void _initData() {
    _titleController =
        TextEditingController(text: widget.jobInfoLevel?.job_name);
    _progressController = TextEditingController(
      text: widget.jobInfoLevel?.job_progress?.toStringAsFixed(2),
    );
    _autoAddressController = TextEditingController();
    _manualAddressController = TextEditingController(
      text: widget.jobInfoLevel?.job_address,
    );
    _jobCodeController =
        TextEditingController(text: widget.jobInfoLevel?.job_code);
    _orderNumberController = TextEditingController(
      text: widget.jobInfoLevel?.job_order_number,
    );
    _descriptionController = TextEditingController(
      text: widget.jobInfoLevel?.job_description_text,
    );

    _startDateTime = widget.jobInfoLevel?.job_start;
    _endDateTime = widget.jobInfoLevel?.job_end;

    context.read<JobStatusCubit>().selectItem(
          FStatusModel(
            id: widget.jobInfoLevel?.job_jobstatus_id,
            name: widget.jobInfoLevel?.job_jobstatus_name,
          ),
        );
    context.read<JobTypeCubit>().selectItem(
          FTypeModel(
            id: widget.jobInfoLevel?.job_jobtype_id,
            name: widget.jobInfoLevel?.job_jobtype_name,
          ),
        );
    context.read<PricingTypeCubit>().selectItem(
          FPricingTypeModel(
            id: widget.jobInfoLevel?.job_pricingtype_id,
            name: widget.jobInfoLevel?.job_pricingtype_name,
          ),
        );
    context.read<PriorityCubit>().selectItem(
          FPriorityModel(
            id: widget.jobInfoLevel?.job_priority_id,
            name: widget.jobInfoLevel?.job_priority_name,
          ),
        );

    if (widget.jobInfoLevel?.job_client_contact_id != null) {
      context.read<JobsFilterCubit>().addCustomer(
            CustomerDatum(
              contact_id: widget.jobInfoLevel?.job_client_contact_id,
              contact_name_display:
                  widget.jobInfoLevel?.job_client_contact_name,
            ),
            isAssignCustomer: false,
          );
    }

    if (widget.jobInfoLevel?.job_site_contact_id != null) {
      context.read<JobsFilterCubit>().selectSite(
            CustomerDatum(
              contact_id: widget.jobInfoLevel?.job_site_contact_id,
              contact_name_display: widget.jobInfoLevel?.job_site_contact_name,
            ),
          );
    }

    final jobContacts = widget.jobInfoLevel?.job_contacts;

    if (widget.jobInfoLevel != null &&
        jobContacts != null &&
        jobContacts.isNotEmpty) {
      final customers = jobContacts.map(
        (e) => CustomerDatum(
          contact_id: e.jobcont_contact_id,
          contact_name_display: e.jobcont_contact_name_display,
        ),
      );

      context.read<JobsFilterCubit>().selectAllAssignedCustomers([
        ...customers,
      ]);
    }

    isDisplayOnJobPlanning =
        widget.jobInfoLevel?.job_is_displayed_on_timeline ?? false;
    isInternalJob = widget.jobInfoLevel?.job_isinternal ?? false;
    isAddedToTasks =
        widget.jobInfoLevel?.job_timesheet_must_be_associated_with_task ??
            false;

    _dueDate = widget.jobInfoLevel?.job_due;

    if (widget.jobInfoLevel != null &&
        (widget.jobInfoLevel!.job_has_book ?? false)) {
      context.read<AddJobBloc>().add(
            AddExistingTask(
              selectedTask: TaskInfoLevelModel(
                book_id: widget.jobInfoLevel!.job_book_id,
                book_summary: widget.jobInfoLevel!.book_summary,
                book_start: widget.jobInfoLevel!.book_start,
                book_end: widget.jobInfoLevel!.book_end,
              ),
            ),
          );
    }
  }

  void _saveJob() {
    if (context.read<MainMenuBloc>().state.isAdmin) {
      // Make sure to clear Assigned-to customers if the user is not admin
      context.read<JobsFilterCubit>().clearCustomers(isAssignCustomer: true);
    }

    final selectedAssignedTos = context
        .read<JobsFilterCubit>()
        .state
        .selectedAssignedTos
        .map((e) => e.contact_id!)
        .toList();

    final selectedCustomers = context
        .read<JobsFilterCubit>()
        .state
        .selectedCustomers
        .map((e) => e.contact_id!)
        .toList();

    final selectedSite = context.read<JobsFilterCubit>().state.selectedSite;

    context.read<AddJobBloc>().add(
          AddNewJobEvent(
            jobId: widget.jobInfoLevel?.job_id,
            isUpdate: widget.jobInfoLevel != null,
            job: JobInfoLevelModel(
              job_id: widget.jobInfoLevel?.job_id,
              job_name: _titleController.text.trim().isEmpty
                  ? null
                  : _titleController.text,
              job_code: _jobCodeController.text.trim().isEmpty
                  ? null
                  : _jobCodeController.text,
              job_order_number: _orderNumberController.text.trim().isEmpty
                  ? null
                  : _orderNumberController.text,
              job_description_text: _descriptionController.text.trim().isEmpty
                  ? null
                  : _descriptionController.text,
              job_due: _dueDate,
              job_due_isset: true,
              job_start: _startDateTime,
              job_end: _endDateTime,
              job_isallday: isAllDay,
              job_address: isAutoLocation
                  ? _autoAddressController.text.trim().isEmpty
                      ? _manualAddressController.text
                      : _autoAddressController.text
                  : _manualAddressController.text.trim().isEmpty
                      ? _autoAddressController.text
                      : _manualAddressController.text,
              job_jobstatus_id:
                  context.read<JobStatusCubit>().state.selectedItem?.id,
              job_jobtype_id:
                  context.read<JobTypeCubit>().state.selectedItem?.id,
              job_priority_id:
                  context.read<PriorityCubit>().state.selectedItem?.id,
              job_client_contact_id_specified: true,
              job_client_contact_id:
                  selectedCustomers.isEmpty ? null : selectedCustomers.first,
              job_site_contact_id: selectedSite?.contact_id,
              job_site_contact_id_specified: true,
              job_contacts: selectedAssignedTos
                  .map(
                    (e) => JobContact(
                      jobcont_contact_id: e,
                    ),
                  )
                  .toList(),
              job_is_displayed_on_timeline: isDisplayOnJobPlanning,
              job_isinternal: isInternalJob,
              job_timesheet_must_be_associated_with_task: isAddedToTasks,
              job_book_id:
                  context.read<AddJobBloc>().state.selectedTask?.book_id,
              job_progress: double.parse(
                _progressController.text.isEmpty
                    ? '0'
                    : _progressController.text,
              ),
              job_pricingtype_id:
                  context.read<PricingTypeCubit>().state.selectedItem?.id,
              job_pricingtype_name:
                  context.read<PricingTypeCubit>().state.selectedItem?.name,
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
      value: isAllDay,
      title: const Text('All Day Event'),
      controlAffinity: ListTileControlAffinity.leading,
      dense: true,
      visualDensity: VisualDensity.compact,
      onChanged: (val) {
        isAllDay = val ?? false;

        final now = DateTime.now().toLocal();

        // Update start and end date to all day
        if (isAllDay) {
          _startDateTime = now;
          _endDateTime = now;
        } else {
          _endDateTime = DateTime.now().add(
            Duration(
              days: 31 - DateTime.now().day,
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

  void _clearFilters() {
    context.read<JobStatusCubit>().clearSelectedItems();
    context.read<JobTypeCubit>().clearSelectedItems();
    context.read<PricingTypeCubit>().clearSelectedItems();
    context.read<PriorityCubit>().clearSelectedItems();
    context.read<AddJobBloc>().add(const RemoveSelectedTask());
    context.read<JobsFilterCubit>()
      ..clearCustomers(isAssignCustomer: false)
      ..clearCustomers(isAssignCustomer: true)
      ..removeSite();
  }
}
