import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextminute/core/utils/theme/nm_text_styles.dart';
import 'package:nextminute/features/menu/sub_menus/scheduled_tasks/add_task/at_recurrence/cubit/at_recurrence_cubit.dart';
import 'package:nextminute/features/menu/sub_menus/sub_menus.dart';

class ATEndRepeat extends StatelessWidget {
  const ATEndRepeat({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ATRecurrenceCubit, ATRecurrenceState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('End Repeat'),
            RadioMenuButton(
              onChanged: (value) {
                FocusScope.of(context).unfocus();
                context.read<ATRecurrenceCubit>().onEndRepeatSelected(value!);
              },
              value: 'Never',
              groupValue: context.read<ATRecurrenceCubit>().state.endRepeat,
              child: const Text('Never'),
            ),
            RadioMenuButton(
              onChanged: (value) {
                FocusScope.of(context).unfocus();
                context.read<ATRecurrenceCubit>().onEndRepeatSelected(value!);
              },
              value: 'After',
              groupValue: context.read<ATRecurrenceCubit>().state.endRepeat,
              child: Row(
                children: [
                  const Text('After'),
                  const SizedBox(width: 6),
                  SizedBox(
                    width: 60,
                    child: TextFormField(
                      enabled:
                          context.read<ATRecurrenceCubit>().state.endRepeat ==
                              'After',
                      onChanged: (value) {
                        context
                            .read<ATRecurrenceCubit>()
                            .onEndRepeatInput(value);
                      },
                      initialValue:
                          context.read<ATRecurrenceCubit>().state.endRepeatDays,
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
                  Text(
                    "x's",
                    style: NMTextStyles.b2(context),
                  ),
                ],
              ),
            ),
            if ((int.tryParse(
                      context.read<ATRecurrenceCubit>().state.endRepeatDays,
                    ) ??
                    0) <
                1)
              Container(
                color: Colors.yellow,
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                ),
                child: const Text('Must be between 1 and 999'),
              ),
            RadioMenuButton(
              onChanged: (value) {
                FocusScope.of(context).unfocus();
                context.read<ATRecurrenceCubit>().onEndRepeatSelected(value!);
              },
              value: 'On',
              groupValue: context.read<ATRecurrenceCubit>().state.endRepeat,
              child: IgnorePointer(
                ignoring:
                    context.read<ATRecurrenceCubit>().state.endRepeat != 'On',
                child: Row(
                  children: [
                    const Text('On'),
                    const SizedBox(width: 6),
                    AddJobDatePicker(
                      label: 'Select Date',
                      datePickerMode: CupertinoDatePickerMode.date,
                      isAllDay: false,
                      dateTime:
                          context.read<ATRecurrenceCubit>().state.endRepeatDate,
                      onDateTimeChanged: (dateTime) {
                        context.read<ATRecurrenceCubit>().updateEndRepeatDate(
                              dateTime,
                            );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
