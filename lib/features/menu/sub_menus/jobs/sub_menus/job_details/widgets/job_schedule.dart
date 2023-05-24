import 'package:api_service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:nextminute/core/utils/utils.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/sub_menus/job_details/job_details.dart';

class JobSchedule extends StatelessWidget {
  const JobSchedule({
    super.key,
    required this.jobInfoLevel,
  });

  final JobInfoLevelModel jobInfoLevel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Schedule',
          style: NMTextStyles.b2(context)?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        RowItem(
          label: 'Start Time',
          value: jobInfoLevel.job_start?.formatSEJobDetails() ?? '-',
        ),
        RowItem(
          label: 'End Time',
          value: jobInfoLevel.job_end?.formatSEJobDetails() ?? '-',
        ),
        RowItem(
          label: 'Due Date',
          value: jobInfoLevel.job_due?.formatReadable() ?? '-',
        ),
        RowItem(
          label: 'Start Date\n(First Task)',
          value: jobInfoLevel.job_first_booking?.formatSEJobDetails(
                hasTime: false,
              ) ??
              '-',
        ),
        RowItem(
          label: 'End Date\n(Last Task)',
          value: jobInfoLevel.job_last_booking?.formatSEJobDetails(
                hasTime: false,
              ) ??
              '-',
        ),
        RowItem(
          label: '% Progress',
          value: '''${jobInfoLevel.job_progress?.toStringAsFixed(2)}%''',
        ),
      ],
    ).paddingSymmetric(horizontal: 16, vertical: 8);
  }
}
