import 'dart:collection';
import 'package:api_service/api_service.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:nextminute/core/routes/app_router.dart';
import 'package:nextminute/core/utils/utils.dart';
import 'package:nextminute/features/menu/main_menu/bloc/main_menu_bloc.dart';
import 'package:nextminute/features/menu/sub_menus/sub_menus.dart';
import 'package:nextminute/features/utils/generic_status_enum.dart';
import 'package:nextminute/features/wigdets/nm_always_scroll.dart';
import 'package:nextminute/features/wigdets/nm_empty_state.dart';
import 'package:nextminute/features/wigdets/nm_small_loading_indicator.dart';
import 'package:nextminute/features/wigdets/nm_widgets.dart';
import 'package:nm_repository/nm_repository.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

@RoutePage()
class ScheduledTaskPage extends StatefulWidget {
  const ScheduledTaskPage({
    super.key,
    this.isFromJobs = false,
    this.isFromMenu = false,
    this.jobId,
  });

  final bool isFromJobs;
  final bool isFromMenu;
  final int? jobId;

  @override
  State<ScheduledTaskPage> createState() => _ScheduledTaskPageState();
}

class _ScheduledTaskPageState extends State<ScheduledTaskPage> {
  DateTime? startDate;
  DateTime? endDate;

  @override
  void initState() {
    super.initState();
    if (widget.isFromMenu) {
      startDate = DateTime.now().toUtc().toLocal();
      endDate = DateTime.now().toLocal();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TaskStatusBloc>(
          create: (context) => TaskStatusBloc(
            nmRepositoryImpl: context.read<NMRepositoryImpl>(),
          )..add(const TaskStatusFetchEvent()),
        ),
        BlocProvider<ScheduledTaskBloc>.value(
          value: context.read<ScheduledTaskBloc>()
            ..add(
              ScheduledTaskFetchEvent(
                isFromJobs: widget.isFromJobs,
                jobId: widget.jobId,
                startDate: startDate,
                endDate: endDate,
              ),
            )
            ..add(
              const OpenCalendarEvent(),
            ),
        ),
      ],
      child: ScheduledTaskView(
        isFromJobs: widget.isFromJobs,
        isFromMenu: widget.isFromMenu,
        jobId: widget.jobId,
      ),
    );
  }
}

class ScheduledTaskView extends StatefulWidget {
  const ScheduledTaskView({
    super.key,
    this.isFromJobs = false,
    this.isFromMenu = false,
    this.jobId,
  });

  final bool isFromJobs;
  final bool isFromMenu;
  final int? jobId;

  @override
  State<ScheduledTaskView> createState() => _ScheduledTaskViewState();
}

class _ScheduledTaskViewState extends State<ScheduledTaskView> {
  late ScrollController _scrollController;

  late TextEditingController _searchController;

  late bool isDetailedView;

  late CalendarController _calendarController;

  DateTime? focusedDay;
  DateTime? startDate;
  DateTime? endDate;
  DateTime? originDate;
  bool isAll = false;
  bool isArchived = false;
  bool isMonthly = false;
  bool isWeekly = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_scrollListener);
    _searchController = TextEditingController();
    _calendarController = CalendarController();

    isDetailedView = context.read<SharedPrefs>().isTaskSimpleView;

    if (widget.isFromMenu) {
      focusedDay = DateTime.now();
      startDate = DateTime.now();
      endDate = DateTime.now();
    }
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
        title: Text(widget.isFromMenu ? 'Tasks' : 'Select Task'),
        leadingWidth: 100,
        leading: STLeading(
          onCalendarPressed: () {
            context.read<ScheduledTaskBloc>().add(
                  OpenCalendarEvent(
                    isOpen:
                        !context.read<ScheduledTaskBloc>().state.isCalendarOpen,
                  ),
                );
          },
          onBackPressed: () {
            _clearFilters();
            Navigator.pop(context);
          },
          isFromMenu: widget.isFromMenu,
        ),
        actions: [
          BlocBuilder<ScheduledTaskBloc, ScheduledTaskState>(
            builder: (context, state) {
              if (state.status == GenericRequestStatusEnum.loading) {
                return const NMSmallLoadingIndicator();
              }

              return Row(
                children: [
                  NMCupertinoButton(
                    key: const ValueKey('__filter_button__'),
                    onPressed: () async {
                      final res = await context.router.push(
                        const TaskFilterRoute(),
                      );

                      if (res == 'Apply') {
                        _fetchData();
                      }
                    },
                    child: const Text('Filters'),
                  ),
                  TaskQuickFilter(
                    onSelect: () {
                      _fetchData(
                        bookingStatusIds: context
                            .read<TaskFilterStatusCubit>()
                            .state
                            .selectedTaskStatuses!
                            .map((e) => e.id)
                            .toList(),
                      );
                    },
                    onClear: () {
                      _clearFilters();
                      context.router.pop();
                    },
                    isFromJobs: widget.isFromJobs,
                    jobId: widget.jobId,
                  ),
                ],
              );
            },
          ),
        ],
      ),
      body: WillPopScope(
        onWillPop: () async {
          _clearFilters();
          Navigator.pop(context);
          return true;
        },
        child: Column(
          children: [
            Expanded(
              child: NMBlocConsumer<ScheduledTaskBloc, ScheduledTaskState>(
                isPaginated: true,
                builder: (context, state) {
                  return Column(
                    children: [
                      STCalendar(
                        calendarController: _calendarController,
                        onDaySelected: _onDaySelected,
                        focusedDay:
                            focusedDay == null ? DateTime.now() : focusedDay!,
                      ),
                      NMSearchField(
                        key: const ValueKey('__search_field__'),
                        searchController: _searchController,
                        onChanged: (val) {
                          _fetchData();
                        },
                        onClear: _fetchData,
                      ),
                      Expanded(
                        child: RefreshIndicator(
                          onRefresh: () async {
                            _searchController.clear();
                            _fetchData();
                          },
                          child: Column(
                            children: [
                              CurrentFiltersContainer(
                                label: STHelper(
                                  context: context,
                                  focusedDay: focusedDay ?? DateTime.now(),
                                  startDate: startDate,
                                  originDate: originDate,
                                  isFromMenu: widget.isFromMenu,
                                  isMonthly: isMonthly,
                                  isWeekly: isWeekly,
                                  isAll: isAll,
                                ).getContainerFilterText(
                                  allStartDate: state.taskListModel.start_date,
                                  allEndDate: state.taskListModel.end_date,
                                ),
                                trailing: widget.isFromMenu
                                    ? isMonthly
                                        ? Text(
                                            '''From: ${(focusedDay ?? DateTime.now()).getFirstDayOfMonth().formatReadable()}\nTo: ${(focusedDay ?? DateTime.now()).getLastDayOfMonth().formatReadable()}''',
                                            textAlign: TextAlign.end,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge,
                                          )
                                        : isWeekly
                                            ? Text(
                                                '''From: ${DateFormat('EE dd-MMM-yyyy').format(startDate!)}\n'''
                                                '''To: ${DateFormat('EE dd-MMM-yyyy').format(endDate!)}''',
                                                textAlign: TextAlign.end,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge,
                                              )
                                            : null
                                    : Text(
                                        '${state.taskListModel.total} Tasks',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                      ),
                              ).paddingSymmetric(horizontal: 8),
                              if (!isAll && !isMonthly && !isWeekly)
                                _buildDateHeader(
                                  DateFormat('EEEE dd MMMM yyyy')
                                      .format(focusedDay ?? DateTime.now()),
                                  margin: const EdgeInsets.only(
                                    bottom: 8,
                                  ),
                                ),
                              Expanded(
                                child: (state.taskListModel.data.isEmpty &&
                                        state.status !=
                                            GenericRequestStatusEnum.loading)
                                    ? const Center(
                                        child: NMEmptyState(),
                                      )
                                    : AlwaysScroll(
                                        controller: _scrollController,
                                        child: ListView.builder(
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          keyboardDismissBehavior:
                                              ScrollViewKeyboardDismissBehavior
                                                  .onDrag,
                                          itemCount: isAll ||
                                                  isMonthly ||
                                                  isWeekly
                                              ? _getGroupedTasks(
                                                  state.taskListModel.data,
                                                ).length
                                              : state.taskListModel.data.length,
                                          itemBuilder: (context, index) {
                                            final item = isAll ||
                                                    isMonthly ||
                                                    isWeekly
                                                ? _getGroupedTasks(
                                                    state.taskListModel.data,
                                                  )[index]
                                                : state
                                                    .taskListModel.data[index];

                                            if (item is DateTime) {
                                              // Render date header
                                              if (isAll ||
                                                  isMonthly ||
                                                  isWeekly) {
                                                return _buildDateHeader(
                                                  DateFormat(
                                                    'EEEE d MMMM yyyy',
                                                  ).format(item),
                                                );
                                              }
                                            } else {
                                              final task =
                                                  item as TaskInfoLevelModel;

                                              return isDetailedView
                                                  ? DetailedTaskItem(
                                                      task: task,
                                                      onTaskSelected:
                                                          _onItemSelect,
                                                    ).paddingSymmetric(
                                                      horizontal: 8,
                                                    )
                                                  : SimpleTaskItem(
                                                      task: task,
                                                      onTaskSelected:
                                                          _onItemSelect,
                                                    ).paddingSymmetric(
                                                      horizontal: 8,
                                                    );
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            NMBottomMenuActions(
              key: const ValueKey('__bottom_menu_actions__'),
              actionButton: !widget.isFromMenu
                  ? null
                  : STDateSelection(
                      onDateSelect: _onDateSelect,
                    ),
              actionsPanel: NMActionList(
                actions: [
                  if (context
                      .read<MainMenuBloc>()
                      .state
                      .isBookingAddEditEnabled)
                    NMActionItem(
                      onTap: () async {
                        final res = await context.router.push(
                          AddTaskRoute(),
                        );

                        if (res == 'added') {
                          _fetchData();
                        }
                      },
                      icon: FontAwesomeIcons.plus,
                      label: 'Add Task',
                    ),
                  NMActionItem(
                    onTap: () {
                      context.read<SharedPrefs>().isTaskSimpleView =
                          !isDetailedView;
                      setState(() {
                        isDetailedView = !isDetailedView;
                      });
                    },
                    icon: isDetailedView ? Icons.list : Icons.list_alt_rounded,
                    label: isDetailedView ? 'Simple View' : 'Detailed View',
                  ),
                  NMActionItem(
                    onTap: () {
                      context.router.push(
                        JobMapsRoute(
                          tasks: context
                              .read<ScheduledTaskBloc>()
                              .state
                              .taskListModel
                              .data,
                        ),
                      );
                    },
                    icon: FontAwesomeIcons.mapLocation,
                    label: 'Show Tasks on Map',
                  ),
                  NMActionItem(
                    onTap: () {
                      if (originDate != null) {
                        originDate = DateTime.now().toUtc();
                      }
                      if (startDate != null) {
                        startDate = DateTime.now().toUtc();
                        endDate = endDate;
                      }

                      focusedDay = DateTime.now();

                      _calendarController.selectedDate = DateTime.now();

                      _fetchData();
                    },
                    icon: Icons.calendar_today,
                    label: 'Go to Today',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Object> _getGroupedTasks(List<TaskInfoLevelModel> tasks) {
    final map = SplayTreeMap<DateTime, List<TaskInfoLevelModel>>();

    for (final task in tasks) {
      final taskStartDate = task.book_start!.toUtc().toLocal();
      final taskEndDate = task.book_end!.toUtc().toLocal();

      // check if end date and start date is null (this is for All filter)
      if (startDate == null && endDate == null) {
        for (var date = taskStartDate;
            date.isBefore(taskEndDate) || date.isSameDateAs(taskEndDate);
            date = date.add(const Duration(days: 1))) {
          final dayOnly = DateTime(date.year, date.month, date.day);
          if (!map.containsKey(dayOnly)) {
            map[dayOnly] = <TaskInfoLevelModel>[];
          }
          map[dayOnly]!.add(task);
        }
      } else {
        if (taskStartDate.isAfter(endDate!) ||
            taskEndDate.isBefore(startDate!)) {
          // Skip tasks with a book_start date beyond endDate or
          // book_end date before startDate
          continue;
        }

        for (var date = taskStartDate;
            date.isBefore(taskEndDate) || date.isAtSameMomentAs(taskEndDate);
            date = date.add(const Duration(days: 1))) {
          if (date.isBefore(startDate!) ||
              date.isAfter(endDate!.add(const Duration(days: 1)))) {
            // Skip dates that are outside the startDate and endDate range
            continue;
          }
          final dayOnly = DateTime(date.year, date.month, date.day);
          if (!map.containsKey(dayOnly)) {
            map[dayOnly] = <TaskInfoLevelModel>[];
          }
          map[dayOnly]!.add(task);
        }
      }
    }

    final items = <Object>[];
    for (final entry in map.entries) {
      final date = entry.key;
      final tasks = entry.value;
      items
        ..add(date)
        ..addAll(tasks);
    }
    return items;
  }

  void _onDateSelect(String date) {
    var isMonthly = false;
    var isAll = false;
    var isWeekly = false;
    var isArchived = false;
    DateTime? originDate;
    DateTime? startDate;
    DateTime? endDate;

    if (date == 'Daily') {
      startDate = focusedDay;
      endDate = focusedDay;
    } else if (date == 'Weekly') {
      isWeekly = true;
      startDate = focusedDay!.getPreviousSaturdayThisWeek().add(
            const Duration(days: 1),
          );
      endDate = focusedDay!.getSaturdayThisWeek();
    } else if (date == 'Monthly') {
      isMonthly = true;
      startDate = (focusedDay ?? DateTime.now()).getFirstDayOfMonth().add(
            const Duration(days: 1),
          );
      endDate = (focusedDay ?? DateTime.now()).getLastDayOfMonth();
    } else if (date == 'All' || date == 'Archived') {
      isAll = date == 'All';
      isArchived = date == 'Archived';
      originDate = focusedDay;
    }

    setState(() {
      this.isMonthly = isMonthly;
      this.isAll = isAll;
      this.isWeekly = isWeekly;
      this.isArchived = isArchived;
      this.originDate = originDate;
      this.startDate = startDate;
      this.endDate = endDate;
    });

    _fetchData();
  }

  void _onDaySelected(CalendarSelectionDetails details) {
    final date = details.date;

    if (date == null) {
      return;
    }

    DateTime? newStartDate;
    DateTime? newEndDate;
    DateTime? newOriginDate;

    if (isAll) {
      newOriginDate = date;
    } else if (isMonthly) {
      newStartDate = date.getFirstDayOfMonth();
      newEndDate = date.getLastDayOfMonth();
    } else if (isWeekly) {
      newStartDate = date.getPreviousSaturdayThisWeek().add(
            const Duration(days: 1),
          );
      newEndDate = date.getSaturdayThisWeek();
    } else {
      newStartDate = date;
      newEndDate = date;
    }

    focusedDay = date;
    originDate = newOriginDate ?? originDate;
    startDate = newStartDate ?? startDate;
    endDate = newEndDate ?? endDate;

    _fetchData();
  }

  Future<void> _onItemSelect(TaskInfoLevelModel task) async {
    if (widget.isFromJobs || widget.isFromMenu) {
      final res = await context.router.push(
        TaskDetailsRoute(task: task),
      );

      if (res == 'deleted') {
        _fetchData();
      }
      return;
    }
    context.read<AddJobBloc>().add(
          AddExistingTask(
            selectedTask: task,
          ),
        );
    Navigator.of(context).pop();
  }

  void _fetchData({bool isScroll = false, List<int?>? bookingStatusIds}) {
    final tfBloc = context.read<TaskFilterBloc>().state;
    final taskBloc = context.read<ScheduledTaskBloc>();
    final jfc = context.read<JobsFilterCubit>().state;

    context.read<ScheduledTaskBloc>().add(
          ScheduledTaskFetchEvent(
            currPage: isScroll ? taskBloc.state.currPage + 1 : 1,
            searchQuery: _searchController.text,
            bookingStatusIds: bookingStatusIds ??
                tfBloc.selectedTaskStatuses?.map((e) => e.id).toList(),
            acceptanceStatus: tfBloc.selectedAcceptanceStatuses
                ?.map((e) => e.getInitials())
                .toList(),
            priorityIds: tfBloc.selectedPriorities?.map((e) => e.id).toList(),
            taskCategoryIds:
                tfBloc.selectedCategories?.map((e) => e.id).toList(),
            bookingClient: jfc.isCustomerFilterEnabled
                ? jfc.selectedEnabledCustomers
                    .map((e) => e.contact_id!)
                    .toList()
                : [],
            bookingContacts: jfc.isAssignedToFilterEnabled
                ? jfc.selectedEnabledAssignedTos
                    .map((e) => e.contact_id!)
                    .toList()
                : [],
            bookingCreatedBys: jfc.isCreatedByFilterEnabled
                ? jfc.selectedEnabledCreatedBy
                    .map((e) => e.contact_id!)
                    .toList()
                : [],
            isExcludeArchive: tfBloc.isExcludeArchive,
            isFromJobs: widget.isFromJobs,
            jobId: widget.jobId,
            startDate: isAll || isArchived ? null : startDate,
            endDate: isAll || isArchived ? null : endDate,
            originDate: originDate,
            isArchived: isArchived,
          ),
        );
  }

  void _clearFilters() {
    context.read<TaskFilterStatusCubit>().clearFilters();
    context.read<TaskFilterBloc>().add(
          const ClearTaskFiltersEvent(),
        );
    _fetchData();
  }

  void _scrollListener() {
    if (widget.isFromMenu) {
      return;
    }

    final taskBloc = context.read<ScheduledTaskBloc>();
    if (_scrollController.offset ==
            _scrollController.position.maxScrollExtent &&
        taskBloc.state.status != GenericRequestStatusEnum.loading) {
      _fetchData(
        isScroll: true,
      );
    }
  }

  Widget _buildDateHeader(String text, {EdgeInsets? margin}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      margin: margin ??
          const EdgeInsets.symmetric(
            vertical: 8,
          ),
      color: context.isDarkMode ? Colors.grey[800] : Colors.grey[300],
      child: Text(text),
    );
  }
}
