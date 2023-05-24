import 'package:api_service/api_service.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextminute/core/routes/app_router.dart';
import 'package:nextminute/core/utils/extensions.dart';
import 'package:nextminute/core/utils/theme/nm_text_styles.dart';
import 'package:nextminute/features/menu/main_menu/bloc/main_menu_bloc.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/jobs_page/utils/jobs_helper.dart';
import 'package:nextminute/features/wigdets/nm_chip.dart';

class JobsItem extends StatelessWidget {
  const JobsItem({
    super.key,
    required this.job,
    this.hasUnbilled = true,
  });

  final JobInfoLevelModel job;
  final bool hasUnbilled;

  @override
  Widget build(BuildContext context) {
    final jobBillAmount = (job.job_actual_charges_subtotal ?? 0.0) <= 0.0
        ? 0.0
        : job.job_actual_charges_subtotal!;

    return InkWell(
      onTap: () {
        context.router.push(
          JobDetailsRoute(job: job),
        );
      },
      child: Card(
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '''${job.job_number} - ${job.job_name}''',
                style: NMTextStyles.b2(context)?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              if (job.job_start != null)
                Text(
                  '''Start: ${job.job_start!.jobItemStyle()} ${job.job_isallday! ? '(All day)' : ''}''',
                  style: NMTextStyles.caption(context),
                ),
              if (job.job_due != null)
                Text(
                  '''Due: ${job.job_due!.jobItemStyle()}''',
                  style: NMTextStyles.caption(context),
                ),
              const SizedBox(height: 6),
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: [
                  if (job.job_jobtype_name != null)
                    NMChip(
                      label: job.job_jobtype_name!,
                      isJobType: true,
                      color: job.job_jobtype_brush_colour_argb == null
                          ? Colors.grey
                          : Color(
                              job.job_jobtype_brush_colour_argb!.toHexColor(),
                            ),
                    ),
                  if (job.job_priority_name != null)
                    NMChip(
                      label: job.job_priority_name!,
                      color: job.job_priority_brush_colour_argb == null
                          ? Colors.grey
                          : Color(
                              job.job_priority_brush_colour_argb!.toHexColor(),
                            ),
                    ),
                  if (job.job_jobstatus_name != null)
                    NMChip(
                      label: job.job_jobstatus_name!,
                      color: job.job_jobstatus_brush_colour_argb == null
                          ? Colors.grey
                          : Color(
                              job.job_jobstatus_brush_colour_argb!.toHexColor(),
                            ),
                    ),
                  if (job.job_pricingtype_name != null)
                    NMChip(
                      label: job.job_pricingtype_name!,
                      color: Colors.red.shade800,
                    ),
                  if (job.jobcont_acceptance_status_name == null &&
                      job.jobcont_is_assigned) ...{
                    const NMChip(
                      label: 'Invited',
                    )
                  } else ...{
                    if (job.jobcont_acceptance_status_name != null)
                      NMChip(
                        label: job.jobcont_acceptance_status_name!,
                      ),
                  }
                ],
              ),
              if (job.job_client_contact_name != null) ...{
                const Divider(thickness: 1),
                Text(
                  '''${job.job_client_contact_name}''',
                  style: NMTextStyles.b2(context),
                ),
              },
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if (job.job_address != null && job.job_address!.isNotEmpty)
                    Expanded(
                      child: Text(
                        '''${job.job_address}''',
                        style: NMTextStyles.caption(context),
                      ),
                    ),
                  const Spacer(),
                  Wrap(
                    spacing: 4,
                    alignment: WrapAlignment.center,
                    children: [
                      if (job.job_has_photos ?? false)
                        const Icon(
                          Icons.camera_alt,
                          size: 18,
                        ),
                      if (job.job_has_scribbles ?? false)
                        const Icon(
                          Icons.edit,
                          size: 18,
                        ),
                      if (job.job_has_notes ?? false)
                        const Icon(
                          Icons.note,
                          size: 18,
                        ),
                      if (job.job_has_files ?? false)
                        const Icon(
                          Icons.attach_file,
                          size: 18,
                        ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 4),
              if (job.job_contacts.isNotEmpty || jobBillAmount > 0)
                const Divider(thickness: 1),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: job.job_contacts.isEmpty
                        ? const SizedBox.shrink()
                        : Row(
                            children: [
                              Text(
                                'Assignees:',
                                style: NMTextStyles.caption(context),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Wrap(
                                  spacing: 2,
                                  runSpacing: 2,
                                  children: [
                                    for (final JobContact assignee
                                        in job.job_contacts)
                                      if (assignee
                                          .jobcont_contact_initials!.isNotEmpty)
                                        NMChip(
                                          label:
                                              '''${assignee.jobcont_contact_initials}''',
                                          color:
                                              assignee.jobcont_contact_brush_colour_argb ==
                                                      null
                                                  ? Colors.grey
                                                  : Color(
                                                      assignee
                                                          .jobcont_contact_brush_colour_argb!
                                                          .toHexColor(),
                                                    ),
                                        )
                                  ],
                                ),
                              ),
                            ],
                          ),
                  ),
                  if (!hasUnbilled && job.job_address != null) ...{
                    IconButton(
                      onPressed: () => JobsHelper.getDirections(
                        context,
                        job.job_address!,
                      ),
                      padding: EdgeInsets.zero,
                      icon: const Icon(Icons.drive_eta),
                    )
                  },
                  if ((jobBillAmount > 0 && hasUnbilled) &&
                      context
                          .read<MainMenuBloc>()
                          .state
                          .isUnbilledChargeTotalsVisible)
                    Text(
                      '''Unbilled: \$${jobBillAmount.toCommaString()}''',
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
          ),
        ),
      ),
    );
  }
}
