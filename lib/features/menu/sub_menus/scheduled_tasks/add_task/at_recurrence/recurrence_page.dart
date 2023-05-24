import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextminute/core/utils/utils.dart';
import 'package:nextminute/features/menu/sub_menus/scheduled_tasks/add_task/at_recurrence/cubit/at_recurrence_cubit.dart';
import 'package:nextminute/features/menu/sub_menus/scheduled_tasks/add_task/widgets/at_end_repeat.dart';
import 'package:nextminute/features/menu/sub_menus/scheduled_tasks/add_task/widgets/at_monthly_repeat.dart';
import 'package:nextminute/features/menu/sub_menus/scheduled_tasks/add_task/widgets/at_repeat_details.dart';
import 'package:nextminute/features/menu/sub_menus/scheduled_tasks/add_task/widgets/at_weekly_repeat.dart';
import 'package:nextminute/features/menu/sub_menus/scheduled_tasks/add_task/widgets/at_yearly_repeat.dart';
import 'package:nextminute/features/wigdets/nm_always_scroll.dart';
import 'package:nextminute/features/wigdets/nm_widgets.dart';

enum RecurrenceFrequency {
  never,
  daily,
  weekly,
  monthly,
  yearly;

  String get name {
    switch (this) {
      case RecurrenceFrequency.never:
        return 'Never'.toUpperCase();
      case RecurrenceFrequency.daily:
        return 'Daily'.toUpperCase();
      case RecurrenceFrequency.weekly:
        return 'Weekly'.toUpperCase();
      case RecurrenceFrequency.monthly:
        return 'Monthly'.toUpperCase();
      case RecurrenceFrequency.yearly:
        return 'Yearly'.toUpperCase();
    }
  }
}

@RoutePage()
class RecurrencePage extends StatefulWidget {
  const RecurrencePage({super.key});

  @override
  State<RecurrencePage> createState() => _RecurrencePageState();
}

class _RecurrencePageState extends State<RecurrencePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ATRecurrenceCubit, ATRecurrenceState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Recurrence'),
            actions: [
              NMCupertinoButton(
                onPressed: context.watch<ATRecurrenceCubit>().hasError()
                    ? null
                    : () {
                        context.router.pop('save');
                      },
                child: const Text('Done'),
              ),
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: AlwaysScroll(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      const ATRepeatDetails(),
                      const SizedBox(height: 12),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            const SizedBox(width: 16),
                            _buildRepeatButton(RecurrenceFrequency.never),
                            const SizedBox(width: 6),
                            _buildRepeatButton(RecurrenceFrequency.daily),
                            const SizedBox(width: 6),
                            _buildRepeatButton(RecurrenceFrequency.weekly),
                            const SizedBox(width: 6),
                            _buildRepeatButton(RecurrenceFrequency.monthly),
                            const SizedBox(width: 6),
                            _buildRepeatButton(RecurrenceFrequency.yearly),
                            const SizedBox(width: 6),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      if (state.currentRepeat != RecurrenceFrequency.never) ...{
                        _buildColumnPadding(
                          children: [
                            Row(
                              children: [
                                const Text('Every'),
                                const SizedBox(width: 6),
                                SizedBox(
                                  width: 60,
                                  child: TextFormField(
                                    initialValue: state.everyDays,
                                    onChanged: (val) {
                                      context
                                          .read<ATRecurrenceCubit>()
                                          .onEveryDaysInput(val);
                                    },
                                    keyboardType: TextInputType.number,
                                    maxLength: 3,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                    textAlign: TextAlign.center,
                                    decoration: const InputDecoration(
                                      counterText: '',
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 6,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 6),
                                Text(getEveryText),
                              ],
                            ),
                            if (state.everyDays.isEmpty ||
                                (int.tryParse(
                                          context
                                              .read<ATRecurrenceCubit>()
                                              .state
                                              .everyDays,
                                        ) ??
                                        0) <
                                    1)
                              Container(
                                color: Colors.yellow,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                ),
                                child: const Text('Value is required'),
                              ),
                            const SizedBox(height: 24),
                            if (state.currentRepeat ==
                                RecurrenceFrequency.weekly)
                              const ATWeeklyRepeat(),
                            if (state.currentRepeat ==
                                RecurrenceFrequency.monthly)
                              const ATMonthlyRepeat(),
                            if (state.currentRepeat ==
                                RecurrenceFrequency.yearly)
                              const ATYearlyRepeat(),
                            const SizedBox(height: 16),
                            const ATEndRepeat(),
                          ],
                        ),
                      },
                    ],
                  ),
                ),
              ),
              const NMBottomMenuActions()
            ],
          ),
        );
      },
    );
  }

  Widget _buildColumnPadding({required List<Widget> children}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    ).paddingSymmetric(horizontal: 16);
  }

  Widget _buildRepeatButton(RecurrenceFrequency repeat) {
    final isSelected =
        context.read<ATRecurrenceCubit>().state.currentRepeat == repeat;

    return CupertinoButton(
      onPressed: () {
        FocusScope.of(context).unfocus();
        context.read<ATRecurrenceCubit>().onCurrentRepeatSelected(repeat);
      },
      padding: EdgeInsets.zero,
      child: Chip(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        backgroundColor: isSelected ? NMColors.orange : Colors.grey.shade200,
        label: Text(
          repeat.name.toLowerCase().capitalizeFirstLetter(),
          style: NMTextStyles.b2(context)?.copyWith(
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  String get getEveryText {
    switch (context.read<ATRecurrenceCubit>().state.currentRepeat) {
      case RecurrenceFrequency.never:
        return '';
      case RecurrenceFrequency.daily:
        return 'days';
      case RecurrenceFrequency.weekly:
        return 'weeks';
      case RecurrenceFrequency.monthly:
        return 'months';
      case RecurrenceFrequency.yearly:
        return 'years';
    }
  }
}
