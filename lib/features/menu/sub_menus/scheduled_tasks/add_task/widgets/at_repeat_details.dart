import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextminute/core/utils/utils.dart';
import 'package:nextminute/features/menu/sub_menus/scheduled_tasks/add_task/at_recurrence/cubit/at_recurrence_cubit.dart';

class ATRepeatDetails extends StatelessWidget {
  const ATRepeatDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ATRecurrenceCubit, ATRecurrenceState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Repeat'),
            Text(
              state.currentRepeat.name,
              style: NMTextStyles.h4(context)?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            if (state.endRepeat == 'On' && state.endRepeatDate == null)
              Text(
                'Please set the end date for the recurrence',
                style: NMTextStyles.b2(context)?.copyWith(
                  fontStyle: FontStyle.italic,
                ),
              )
            else ...{Text(state.tempRepeatText)},
          ],
        ).paddingSymmetric(horizontal: 16);
      },
    );
  }
}
