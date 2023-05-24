import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextminute/features/menu/sub_menus/scheduled_tasks/add_task/at_recurrence/cubit/at_recurrence_cubit.dart';

class ATWeeklyRepeat extends StatelessWidget {
  const ATWeeklyRepeat({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ATRecurrenceCubit, ATRecurrenceState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Repeat On'),
            const SizedBox(height: 6),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 4,
              childAspectRatio: 2.5,
              crossAxisSpacing: 6,
              padding: EdgeInsets.zero,
              children: [
                _buildWeeklyRepeatOnButton(context, 'Mon'),
                _buildWeeklyRepeatOnButton(context, 'Tue'),
                _buildWeeklyRepeatOnButton(context, 'Wed'),
                _buildWeeklyRepeatOnButton(context, 'Thu'),
                _buildWeeklyRepeatOnButton(context, 'Fri'),
                _buildWeeklyRepeatOnButton(context, 'Sat'),
                _buildWeeklyRepeatOnButton(context, 'Sun'),
              ],
            ),
            const SizedBox(height: 16),
          ],
        );
      },
    );
  }

  Widget _buildWeeklyRepeatOnButton(
    BuildContext context,
    String title,
  ) {
    return SizedBox(
      width: 100,
      child: CheckboxMenuButton(
        onChanged: (value) {
          FocusScope.of(context).unfocus();
          context.read<ATRecurrenceCubit>().onWeeklyRepeatOnChanged(title);
        },
        value: context
            .read<ATRecurrenceCubit>()
            .state
            .weeklyCurrentRepeats
            .contains(title),
        child: Text(title),
      ),
    );
  }
}
