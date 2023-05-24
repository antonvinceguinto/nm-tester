import 'package:api_service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nextminute/core/utils/utils.dart';
import 'package:nextminute/features/menu/sub_menus/sub_menus.dart';
import 'package:nextminute/features/wigdets/nm_chip.dart';

class SimpleTaskItem extends StatelessWidget with TaskDateMixin {
  const SimpleTaskItem({
    super.key,
    required this.task,
    required this.onTaskSelected,
  });

  final TaskInfoLevelModel task;
  final void Function(TaskInfoLevelModel) onTaskSelected;

  @override
  Widget build(BuildContext context) {
    final startDate = task.book_start != null
        ? DateFormat('dd/MM/yyyy h:mm a').format(task.book_start!.toLocal())
        : '';

    final difference = task.book_end != null && task.book_start != null
        ? task.book_end!.difference(task.book_start!)
        : Duration.zero;

    final duration = getTaskDuration(
      difference,
      isSimple: true,
    );

    return GestureDetector(
      onTap: () => onTaskSelected(task),
      child: Container(
        margin: const EdgeInsets.only(
          bottom: 8,
          left: 8,
          right: 8,
        ),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.shade600,
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    '${task.book_summary}',
                    style: NMTextStyles.b2(context)?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                if (task.book_bookingstatus_name != null) ...{
                  NMChip(
                    label: '${task.book_bookingstatus_name}',
                    color: Color(
                      task.book_bookingstatus_brush_colour_argb!.toHexColor(),
                    ),
                  ),
                  const SizedBox(width: 8),
                },
                if (task.bookcont_acceptance_status_name != null) ...{
                  NMChip(
                    label: '${task.bookcont_acceptance_status_name}',
                    color: getStatusColor(
                      task.bookcont_acceptance_status_name!,
                    ),
                  ),
                  const SizedBox(width: 8),
                },
                if ((task.bookcont_is_assigned != null &&
                        task.bookcont_is_assigned!) &&
                    task.bookcont_acceptance_status_name == null)
                  const NMChip(
                    label: 'Invited',
                  ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (task.bookingContacts.isNotEmpty) ...{
                  Expanded(
                    child: Wrap(
                      spacing: 2,
                      runSpacing: 2,
                      children: [
                        for (final BookingContact assignee
                            in task.bookingContacts)
                          if (assignee.bookcont_contact_initials != null &&
                              assignee.bookcont_contact_initials!.isNotEmpty)
                            NMChip(
                              label:
                                  '''${assignee.bookcont_contact_initials}''',
                              color: Color(
                                assignee.bookcont_contact_brush_colour_argb!
                                    .toHexColor(),
                              ),
                            )
                      ],
                    ),
                  ),
                },
                Expanded(
                  flex: 4,
                  child: Text(
                    'Starts $startDate ${duration.isEmpty ? '' : '($duration)'} ',
                    textAlign: TextAlign.start,
                  ),
                ),
                const SizedBox(width: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
