import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextminute/features/menu/sub_menus/scheduled_tasks/add_task/at_recurrence/cubit/at_recurrence_cubit.dart';

class ATMonthlyRepeat extends StatelessWidget {
  const ATMonthlyRepeat({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ATRecurrenceCubit, ATRecurrenceState>(
      builder: (context, state) {
        return Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Repeat On'),
                RadioMenuButton(
                  onChanged: (value) {
                    FocusScope.of(context).unfocus();
                    context
                        .read<ATRecurrenceCubit>()
                        .onMonthlyRepeatOnSelected(value!);
                  },
                  value: 'Day',
                  groupValue: state.monthlyRepeatOn,
                  child: Row(
                    children: [
                      const Text('Day'),
                      const SizedBox(width: 6),
                      SizedBox(
                        width: 60,
                        child: TextFormField(
                          enabled: state.monthlyRepeatOn == 'Day',
                          onChanged: (value) {
                            context
                                .read<ATRecurrenceCubit>()
                                .onMonthlyDayDateInput(value);
                          },
                          initialValue: state.monthlyDayDate,
                          keyboardType: TextInputType.number,
                          maxLength: 2,
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
                    ],
                  ),
                ),
                if ((int.tryParse(
                              context
                                  .read<ATRecurrenceCubit>()
                                  .state
                                  .monthlyDayDate,
                            ) ??
                            0) >
                        31 ||
                    (int.tryParse(
                              context
                                  .read<ATRecurrenceCubit>()
                                  .state
                                  .monthlyDayDate,
                            ) ??
                            0) <
                        1) ...{
                  Container(
                    color: Colors.yellow,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                    ),
                    child: const Text('Must be between 1 - 31'),
                  ),
                },
                RadioMenuButton(
                  onChanged: (value) {
                    FocusScope.of(context).unfocus();
                    context
                        .read<ATRecurrenceCubit>()
                        .onMonthlyRepeatOnSelected(value!);
                  },
                  value: 'The',
                  groupValue: state.monthlyRepeatOn,
                  child: Row(
                    children: [
                      const Text('The'),
                      const SizedBox(width: 12),
                      DropdownButton<String>(
                        value: state.monthlyTheRepeatOn,
                        items: const [
                          DropdownMenuItem(
                            value: 'First',
                            child: Text('First'),
                          ),
                          DropdownMenuItem(
                            value: 'Second',
                            child: Text('Second'),
                          ),
                          DropdownMenuItem(
                            value: 'Third',
                            child: Text('Third'),
                          ),
                          DropdownMenuItem(
                            value: 'Fourth',
                            child: Text('Fourth'),
                          ),
                          DropdownMenuItem(
                            value: 'Last',
                            child: Text('Last'),
                          ),
                        ],
                        onChanged: (value) {
                          FocusScope.of(context).unfocus();
                          context
                              .read<ATRecurrenceCubit>()
                              .onMonthlyTheRepeatOnSelected(value!);
                        },
                      ),
                      const SizedBox(width: 12),
                      DropdownButton<String>(
                        value: state.monthlyTheRepeatOnDay,
                        items: const [
                          DropdownMenuItem(
                            value: 'Day',
                            child: Text('Day'),
                          ),
                          DropdownMenuItem(
                            value: 'Week Day',
                            child: Text('Week Day'),
                          ),
                          DropdownMenuItem(
                            value: 'Weekend Day',
                            child: Text('Weekend Day'),
                          ),
                          DropdownMenuItem(
                            value: 'Monday',
                            child: Text('Monday'),
                          ),
                          DropdownMenuItem(
                            value: 'Tuesday',
                            child: Text('Tuesday'),
                          ),
                          DropdownMenuItem(
                            value: 'Wednesday',
                            child: Text('Wednesday'),
                          ),
                          DropdownMenuItem(
                            value: 'Thursday',
                            child: Text('Thursday'),
                          ),
                          DropdownMenuItem(
                            value: 'Friday',
                            child: Text('Friday'),
                          ),
                          DropdownMenuItem(
                            value: 'Saturday',
                            child: Text('Saturday'),
                          ),
                          DropdownMenuItem(
                            value: 'Sunday',
                            child: Text('Sunday'),
                          ),
                        ],
                        onChanged: (value) {
                          FocusScope.of(context).unfocus();
                          context
                              .read<ATRecurrenceCubit>()
                              .onMonthlyTheRepeatOnDaySelected(value!);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
