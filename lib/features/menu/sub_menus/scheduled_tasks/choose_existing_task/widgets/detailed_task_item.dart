import 'package:api_service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextminute/core/utils/utils.dart';
import 'package:nextminute/features/menu/main_menu/bloc/main_menu_bloc.dart';
import 'package:nextminute/features/menu/sub_menus/sub_menus.dart';
import 'package:nextminute/features/wigdets/nm_chip.dart';

class DetailedTaskItem extends StatelessWidget with TaskDateMixin {
  const DetailedTaskItem({
    super.key,
    required this.task,
    required this.onTaskSelected,
  });

  final TaskInfoLevelModel task;
  final void Function(TaskInfoLevelModel) onTaskSelected;

  @override
  Widget build(BuildContext context) {
    final startDate = task.book_start != null
        ? getDateFormatter(task).format(task.book_start!.toLocal())
        : '';

    final endDate = task.book_end != null
        ? getDateFormatter(task, isEnd: true).format(task.book_end!.toLocal())
        : '';

    // Get difference between start and end date
    final difference = task.book_end != null && task.book_start != null
        ? task.book_end!.difference(task.book_start!)
        : Duration.zero;

    final duration = getTaskDuration(difference);

    return GestureDetector(
      onTap: () => onTaskSelected(task),
      child: Card(
        margin: const EdgeInsets.only(
          bottom: 8,
          left: 8,
          right: 8,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          '${task.book_number} - ${task.book_summary}',
                          style: NMTextStyles.b2(context)?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Wrap(
                        spacing: 4,
                        alignment: WrapAlignment.center,
                        children: [
                          if (task.book_has_photos)
                            const Icon(
                              Icons.camera_alt,
                              size: 18,
                            ),
                          if (task.book_has_scribbles)
                            const Icon(
                              Icons.edit,
                              size: 18,
                            ),
                          if (task.book_has_notes)
                            const Icon(
                              Icons.note,
                              size: 18,
                            ),
                          if (task.book_has_files)
                            const Icon(
                              Icons.attach_file,
                              size: 18,
                            ),
                        ],
                      )
                    ],
                  ),
                ),
                if (task.book_is_recurring ?? false)
                  const Icon(
                    Icons.replay,
                    color: Colors.orange,
                    size: 19,
                  ),
              ],
            ),
            if (task.book_job_number != null) ...{
              Text(
                '${task.book_job_number} - ${task.book_job_name}',
              ),
            },
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    if (task.book_bookingstatus_name != null) ...{
                      NMChip(
                        label: '${task.book_bookingstatus_name}',
                        color: Color(
                          task.book_bookingstatus_brush_colour_argb!
                              .toHexColor(),
                        ),
                      ),
                      const SizedBox(width: 6),
                    },
                    if (task.bookcont_acceptance_status_name != null) ...{
                      NMChip(
                        label: '${task.bookcont_acceptance_status_name}',
                        color: getStatusColor(
                          task.bookcont_acceptance_status_name!,
                        ),
                      ),
                      const SizedBox(width: 6),
                    },
                    if ((task.bookcont_is_assigned != null &&
                            task.bookcont_is_assigned!) &&
                        task.bookcont_acceptance_status_name == null)
                      const NMChip(
                        label: 'Invited',
                      ),
                  ],
                ),
                const SizedBox(width: 6),
                Text(duration),
              ],
            ),
            const SizedBox(height: 8),
            if (task.book_address != null) ...{
              Text(
                '${task.book_address}',
                style: NMTextStyles.caption(context),
              ),
              const SizedBox(height: 4),
            },
            if (task.book_client_contact_name != null) ...{
              Text(
                'Customer - ${task.book_client_contact_name}',
                style: NMTextStyles.caption(context),
              ),
              const SizedBox(height: 4),
            },
            Text(
              '''$startDate - $endDate''',
              style: NMTextStyles.caption(context)?.copyWith(
                color: Colors.blue.shade800,
              ),
            ),
            const SizedBox(height: 4),
            Divider(color: Colors.grey.shade400),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Text(
                        'Assignees:',
                        style: NMTextStyles.caption(context),
                      ),
                      const SizedBox(width: 8),
                      if (task.bookingContacts.isNotEmpty) ...{
                        Expanded(
                          child: Wrap(
                            spacing: 2,
                            runSpacing: 2,
                            children: [
                              for (final BookingContact assignee
                                  in task.bookingContacts)
                                if (assignee.bookcont_contact_initials != null)
                                  NMChip(
                                    label:
                                        '''${assignee.bookcont_contact_initials}''',
                                    color: Color(
                                      assignee
                                          .bookcont_contact_brush_colour_argb!
                                          .toHexColor(),
                                    ),
                                  )
                            ],
                          ),
                        )
                      },
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                if ((task.book_actual_charges_subtotal != null &&
                        task.book_actual_charges_subtotal != 0) &&
                    context
                        .read<MainMenuBloc>()
                        .state
                        .isUnbilledChargeTotalsVisible)
                  Text(
                    '''Unbilled: \$${task.book_actual_charges_subtotal!.toCommaString()}''',
                    style: NMTextStyles.caption(context)?.copyWith(
                      color: Colors.red,
                      decoration: TextDecoration.combine(
                        [
                          TextDecoration.underline,
                          TextDecoration.underline,
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ).paddingAll(12),
      ),
    );
  }
}
