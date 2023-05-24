import 'package:api_service/api_service.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nextminute/core/routes/app_router.dart';
import 'package:nextminute/core/utils/utils.dart';
import 'package:nextminute/features/wigdets/nm_widgets.dart';

class JobActions extends StatelessWidget {
  const JobActions({
    super.key,
    required this.relatedBlobCounts,
    required this.jobInfoLevel,
    this.onDelete,
  });

  final Map<String, dynamic> relatedBlobCounts;
  final JobInfoLevelModel jobInfoLevel;
  final void Function()? onDelete;

  @override
  Widget build(BuildContext context) {
    return NMActionList(
      actions: [
        const SizedBox(height: 8),
        const NMActionItem(
          // onTap: () {},
          label: 'Add Timesheet Entry',
          icon: Icons.timer,
        ),
        const NMActionItem(
          // onTap: () {},
          label: 'Send Message',
          icon: Icons.mail,
        ),
        NMActionItem(
          onTap: () {
            context.router.push(
              ScheduledTaskRoute(
                isFromJobs: true,
                jobId: jobInfoLevel.job_id,
              ),
            );
          },
          label: 'Scheduled Tasks (${relatedBlobCounts['Booking']})',
          icon: Icons.checklist_sharp,
        ),
        NMActionItem(
          // onTap: () {},
          label: 'Linked Contacts (${relatedBlobCounts['LinkedContact']})',
          icon: Icons.people,
        ),
        NMActionItem(
          // onTap: () {},
          label: 'Photos (${relatedBlobCounts['Photo']})',
          icon: Icons.camera_alt,
        ),
        NMActionItem(
          // onTap: () {},
          label: 'Notes (${relatedBlobCounts['Note']})',
          icon: Icons.note,
        ),
        NMActionItem(
          // onTap: () {},
          label: 'Scribbles (${relatedBlobCounts['Scribble']})',
          icon: Icons.edit,
        ),
        NMActionItem(
          // onTap: () {},
          label: 'Files (${relatedBlobCounts['File']})',
          icon: Icons.attach_file,
        ),
        NMActionItem(
          // onTap: () {},
          label:
              'Charges (\$${jobInfoLevel.actual_charges_totals!.actual_charges_subtotal!.toCommaString()})',
          icon: Icons.paid,
        ),
        NMActionItem(
          // onTap: () {},
          label: 'Quotes (${relatedBlobCounts['Quote']})',
          icon: Icons.format_quote,
        ),
        NMActionItem(
          // onTap: () {},
          label: 'Invoices (${relatedBlobCounts['Invoice']})',
          icon: Icons.attach_money,
        ),
        const NMActionItem(
          // onTap: () {},
          label: 'Supplier Invoices',
          icon: Icons.inbox,
        ),
        const NMActionItem(
          // onTap: () {},
          label: 'Orders',
          icon: Icons.view_stream,
        ),
        const NMActionItem(
          // onTap: () {},
          label: 'Job Sheet',
          icon: Icons.menu_book_rounded,
        ),
        const NMActionItem(
          // onTap: () {},
          label: 'View GPS Data',
          icon: FontAwesomeIcons.mapLocation,
        ),
        const NMActionItem(
          // onTap: () {},
          label: 'Archive Job',
          icon: Icons.inventory,
        ),
        const NMActionItem(
          // onTap: () {},
          label: 'Duplicate',
          icon: Icons.file_copy,
        ),
        const NMActionItem(
          // onTap: () {},
          label: 'Save as Template',
          icon: Icons.save_alt,
        ),
        const NMActionItem(
          // onTap: () {},
          label: 'Message Log',
          icon: Icons.forum,
        ),
        NMActionItem(
          // onTap: () {},
          label: 'Activity Log (${relatedBlobCounts['ActivityLog']})',
          icon: Icons.monitor_heart,
        ),
        NMActionItem(
          onTap: onDelete,
          label: 'Delete',
          icon: Icons.delete,
        ),
      ],
    );
  }
}
