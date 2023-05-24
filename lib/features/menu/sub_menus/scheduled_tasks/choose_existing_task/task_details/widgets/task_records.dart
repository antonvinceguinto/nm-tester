import 'package:api_service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:nextminute/core/utils/utils.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/sub_menus/job_details/job_details.dart';

class TaskRecords extends StatelessWidget {
  const TaskRecords({
    super.key,
    required this.taskInfo,
  });

  final TaskInfoLevelModel taskInfo;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Record Update Info',
          style: NMTextStyles.b2(context)?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        RowItem(
          label: 'Created By',
          value: (taskInfo.book_created_by_contact_name_display != null &&
                  taskInfo.book_created_by_contact_name_display!.isNotEmpty)
              ? taskInfo.book_created_by_contact_name_display!
              : '-',
        ),
        RowItem(
          label: 'Created Date',
          value: taskInfo.book_created_date?.formatSEJobDetails() ?? '-',
        ),
        RowItem(
          label: 'Last Updated By',
          value: (taskInfo.book_updated_by_contact_name_display != null &&
                  taskInfo.book_updated_by_contact_name_display!.isNotEmpty)
              ? taskInfo.book_updated_by_contact_name_display!
              : '-',
        ),
        RowItem(
          label: 'Last Updated Date',
          value: taskInfo.book_updated_date?.formatSEJobDetails() ?? '-',
        ),
      ],
    ).paddingSymmetric(horizontal: 16);
  }
}
