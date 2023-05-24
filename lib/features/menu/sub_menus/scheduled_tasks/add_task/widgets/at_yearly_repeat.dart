import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextminute/features/menu/sub_menus/scheduled_tasks/add_task/at_recurrence/cubit/at_recurrence_cubit.dart';

class ATYearlyRepeat extends StatelessWidget {
  const ATYearlyRepeat({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ATRecurrenceCubit, ATRecurrenceState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Repeat On'),
            RadioMenuButton(
              onChanged: (value) {
                FocusScope.of(context).unfocus();
                context.read<ATRecurrenceCubit>().onYearlyRepeatOnSelected(
                      value!,
                    );
              },
              value: 'Date',
              groupValue: state.yearlyRepeatOn,
              child: Row(
                children: [
                  const Text('Date:'),
                  const SizedBox(width: 6),
                  DropdownButton<String>(
                    value: state.yearlyDateMonth,
                    items: const [
                      DropdownMenuItem(
                        value: 'January',
                        child: Text('January'),
                      ),
                      DropdownMenuItem(
                        value: 'February',
                        child: Text('February'),
                      ),
                      DropdownMenuItem(
                        value: 'March',
                        child: Text('March'),
                      ),
                      DropdownMenuItem(
                        value: 'April',
                        child: Text('April'),
                      ),
                      DropdownMenuItem(
                        value: 'May',
                        child: Text('May'),
                      ),
                      DropdownMenuItem(
                        value: 'June',
                        child: Text('June'),
                      ),
                      DropdownMenuItem(
                        value: 'July',
                        child: Text('July'),
                      ),
                      DropdownMenuItem(
                        value: 'August',
                        child: Text('August'),
                      ),
                      DropdownMenuItem(
                        value: 'September',
                        child: Text('September'),
                      ),
                      DropdownMenuItem(
                        value: 'October',
                        child: Text('October'),
                      ),
                      DropdownMenuItem(
                        value: 'November',
                        child: Text('November'),
                      ),
                      DropdownMenuItem(
                        value: 'December',
                        child: Text('December'),
                      ),
                    ],
                    onChanged: (value) {
                      FocusScope.of(context).unfocus();
                      context
                          .read<ATRecurrenceCubit>()
                          .onYearlyDateMonthSelected(value!);
                    },
                  ),
                  const SizedBox(width: 12),
                  SizedBox(
                    width: 60,
                    child: TextFormField(
                      onChanged: (val) {
                        context
                            .read<ATRecurrenceCubit>()
                            .onYearlyDateDayInput(val);
                      },
                      maxLength: 2,
                      enabled: state.yearlyRepeatOn == 'Date',
                      initialValue: state.yearlyDateDay,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
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
                          context.read<ATRecurrenceCubit>().state.yearlyDateDay,
                        ) ??
                        0) >
                    31 ||
                (int.tryParse(
                          context.read<ATRecurrenceCubit>().state.yearlyDateDay,
                        ) ??
                        0) <
                    1) ...{
              Container(
                color: Colors.yellow,
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                ),
                child: const Text('Must be between 1-31'),
              ),
            },
            RadioMenuButton(
              onChanged: (value) {
                FocusScope.of(context).unfocus();
                context
                    .read<ATRecurrenceCubit>()
                    .onYearlyRepeatOnSelected(value!);
              },
              value: 'The',
              groupValue: state.yearlyRepeatOn,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text('The'),
                      const SizedBox(width: 12),
                      DropdownButton<String>(
                        value: state.yearlyTheOn,
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
                              .onYearlyTheOnSelected(value!);
                        },
                      ),
                      const SizedBox(width: 12),
                      DropdownButton<String>(
                        value: state.yearlyTheDay,
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
                              .onYearlyTheDaySelected(value!);
                        },
                      ),
                      const SizedBox(width: 12),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('of'),
                      const SizedBox(width: 12),
                      DropdownButton<String>(
                        value: state.yearlyTheMonth,
                        items: const [
                          DropdownMenuItem(
                            value: 'January',
                            child: Text('January'),
                          ),
                          DropdownMenuItem(
                            value: 'February',
                            child: Text('February'),
                          ),
                          DropdownMenuItem(
                            value: 'March',
                            child: Text('March'),
                          ),
                          DropdownMenuItem(
                            value: 'April',
                            child: Text('April'),
                          ),
                          DropdownMenuItem(
                            value: 'May',
                            child: Text('May'),
                          ),
                          DropdownMenuItem(
                            value: 'June',
                            child: Text('June'),
                          ),
                          DropdownMenuItem(
                            value: 'July',
                            child: Text('July'),
                          ),
                          DropdownMenuItem(
                            value: 'August',
                            child: Text('August'),
                          ),
                          DropdownMenuItem(
                            value: 'September',
                            child: Text('September'),
                          ),
                          DropdownMenuItem(
                            value: 'October',
                            child: Text('October'),
                          ),
                          DropdownMenuItem(
                            value: 'November',
                            child: Text('November'),
                          ),
                          DropdownMenuItem(
                            value: 'December',
                            child: Text('December'),
                          ),
                        ],
                        onChanged: (value) {
                          FocusScope.of(context).unfocus();
                          context
                              .read<ATRecurrenceCubit>()
                              .onYearlyTheMonthSelected(value!);
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
