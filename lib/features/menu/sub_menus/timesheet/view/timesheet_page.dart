import 'package:api_service/api_service.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:nextminute/core/utils/extensions.dart';
import 'package:nextminute/core/utils/theme/nm_colors.dart';
import 'package:nextminute/core/utils/theme/nm_text_styles.dart';
import 'package:nextminute/features/menu/sub_menus/timesheet/bloc/timesheet_bloc.dart';
import 'package:nextminute/features/menu/sub_menus/timesheet/widgets/timesheet_item.dart';
import 'package:nextminute/features/wigdets/nm_widgets.dart';
import 'package:nm_repository/nm_repository.dart';

@RoutePage()
class TimeSheetPage extends StatelessWidget {
  const TimeSheetPage({super.key});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();

    return BlocProvider<TimesheetWeeklyBloc>(
      create: (context) => TimesheetWeeklyBloc(
        nmRepositoryImpl: context.read<NMRepositoryImpl>(),
      )..add(
          TimesheetFetchEvent(
            now.getSundayThisWeek(),
          ),
        ),
      child: const TimeSheetView(),
    );
  }
}

class TimeSheetView extends StatefulWidget {
  const TimeSheetView({super.key});

  @override
  State<TimeSheetView> createState() => _TimeSheetViewState();
}

class _TimeSheetViewState extends State<TimeSheetView> {
  late DateTime currentDateTime;

  @override
  void initState() {
    super.initState();
    currentDateTime = DateTime.now().getSundayThisWeek();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Timesheet'),
        actions: [
          NMCupertinoButton(
            onPressed: () {},
            child: const Icon(Icons.calendar_month_outlined),
          ),
        ],
      ),
      body: NMBlocConsumer<TimesheetWeeklyBloc, TimesheetWeeklyState>(
        builder: (context, state) {
          if (state.sheetWeeklyModel.data.isEmpty) {
            return const Center(
              child: Text('No data'),
            );
          }

          final dateTimeNow = DateTime.now();
          final timesheetData = state.sheetWeeklyModel.data;
          final formatter = NumberFormat('##,###.##');
          final totalBuyPrice = _computeTotalBuyPrice(timesheetData);
          final weeklyTotalHours = _computeTotalHoursWorked(timesheetData);

          final firstDate = timesheetData.first.date ?? dateTimeNow;

          final endDate = timesheetData.last.date ?? dateTimeNow;

          final formattedDateTime =
              '''${_getStartDate(firstDate)} - ${_getEndDate(endDate)}''';

          return Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey.shade300,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Weekly Total: ',
                              style: NMTextStyles.b2(context)?.copyWith(
                                fontSize: 18,
                              ),
                            ),
                            TextSpan(
                              text: weeklyTotalHours.toString(),
                              style: NMTextStyles.b2(context)?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: NMColors.orange,
                                fontSize: 18,
                              ),
                            ),
                            TextSpan(
                              text: ''' hours = ''',
                              style: NMTextStyles.b2(context)?.copyWith(
                                fontSize: 18,
                              ),
                            ),
                            TextSpan(
                              text: '''\$${formatter.format(totalBuyPrice)}''',
                              style: NMTextStyles.b2(context)?.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.green.shade600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: RefreshIndicator(
                        key: const Key('__refresh_indicator__'),
                        onRefresh: () => _fetchData(currentDateTime),
                        backgroundColor: NMColors.orange,
                        color: Colors.white,
                        child: ListView.builder(
                          itemCount: timesheetData.length,
                          itemBuilder: (context, index) {
                            final item = timesheetData[index];
                            return TimesheetItem(
                              data: item,
                              listWeeklySummaryModel: state.sheetWeeklyModel,
                            );
                          },
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          key: const Key('__prev_button__'),
                          onPressed: () => onWeekPressed(
                            firstDate,
                            isPreviousWeek: true,
                          ),
                          icon: const Icon(
                            Icons.chevron_left_rounded,
                            color: NMColors.orange,
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              formattedDateTime,
                              style: NMTextStyles.b2(context)?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          key: const Key('__next_button__'),
                          onPressed: () => onWeekPressed(endDate),
                          icon: const Icon(
                            Icons.chevron_right,
                            color: NMColors.orange,
                          ),
                        ),
                      ],
                    ).paddingAll(8),
                  ],
                ).paddingSymmetric(horizontal: 16),
              ),
              NMBottomMenuActions(
                actionsPanel: NMActionList(
                  actions: [
                    NMActionItem(
                      onTap: () => onWeekPressed(
                        firstDate,
                        isPreviousWeek: true,
                      ),
                      label: 'Last Week',
                      icon: Icons.chevron_left_rounded,
                    ),
                    NMActionItem(
                      onTap: () => onWeekPressed(endDate),
                      label: 'Next Week',
                      icon: Icons.chevron_right_rounded,
                    ),
                    NMActionItem(
                      onTap: () {},
                      label: 'Submit',
                      icon: Icons.add_circle,
                    ),
                    NMActionItem(
                      onTap: () {},
                      label: 'Report',
                      icon: FontAwesomeIcons.chartLine,
                    ),
                  ],
                ),
              )
              // Container(
              //   padding: EdgeInsets.fromLTRB(
              //     16,
              //     0,
              //     16,
              //     Platform.isIOS ? 32 : 0,
              //   ),
              //   color: Colors.grey[100],
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       if (currentDateTime.formatForAPI() !=
              //           DateTime.now().getSundayThisWeek().formatForAPI()) ...{
              //         TextButton(
              //           key: const Key('__this_week_button__'),
              //           onPressed: () {
              //             _refreshData(
              //               DateTime.now().getSundayThisWeek(),
              //             );
              //             setState(() {
              //               currentDateTime = DateTime.now().getSundayThisWeek();
              //             });
              //           },
              //           child: const Text('This Week'),
              //         ),
              //       } else ...{
              //         const TextButton(
              //           onPressed: null,
              //           child: Text('This Week'),
              //         ),
              //       },
              //       const TextButton(
              //         onPressed: null,
              //         child: Text('Actions'),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          );
        },
      ),
    );
  }

  void onWeekPressed(DateTime dateTime, {bool isPreviousWeek = false}) {
    if (isPreviousWeek) {
      final dt = dateTime.subtract(
        const Duration(days: 8),
      );
      _fetchData(dt);
      setState(() {
        currentDateTime = dt;
      });
      return;
    }

    _fetchData(dateTime);
    setState(() {
      currentDateTime = dateTime;
    });
  }

  Future<void> _fetchData(DateTime date) async {
    context.read<TimesheetWeeklyBloc>().add(
          TimesheetFetchEvent(date),
        );
  }

  String _getStartDate(DateTime dateTime) {
    final fromDateTime = dateTime.toLocal();
    final formattedMonth = fromDateTime.month.formatMonth();
    final formattedDay = fromDateTime.weekday.formatDay();
    return '''$formattedDay ${dateTime.day} $formattedMonth''';
  }

  String _getEndDate(DateTime dateTime) {
    final toDateTime = dateTime
        .add(
          const Duration(days: 7),
        )
        .subtract(
          Duration(
            days: dateTime.weekday,
          ),
        );
    final formattedMonth = toDateTime.month.formatMonth();
    final formattedDay = toDateTime.weekday.formatDay();
    return '''$formattedDay ${toDateTime.day} $formattedMonth''';
  }

  double _computeTotalHoursWorked(List<WeeklyTimesheetDatum>? timesheetData) {
    var totalHours = 0.0;
    timesheetData?.forEach((element) {
      totalHours += element.timesheet_entries?.fold(
            0.0,
            (previousValue, element) => previousValue! + element.time_total!,
          ) ??
          0.0;
    });
    return totalHours / 60;
  }

  double _computeTotalBuyPrice(List<WeeklyTimesheetDatum>? timesheetData) {
    var totalBuyPrice = 0.0;
    for (final item in timesheetData!) {
      totalBuyPrice += item.total_buy_price ?? 0.0;
    }
    return totalBuyPrice;
  }
}
