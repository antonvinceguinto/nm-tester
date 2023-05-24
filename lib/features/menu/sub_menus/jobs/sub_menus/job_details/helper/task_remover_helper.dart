import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:api_service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/sub_menus/job_details/bloc/job_details_bloc.dart';
import 'package:nextminute/features/menu/sub_menus/sub_menus.dart';

class TaskRemoverHelper {
  TaskRemoverHelper._();

  static Future<void> removeTask(
    BuildContext context,
    JobInfoLevelModel job, {
    void Function()? onRefresh,
  }) async {
    final removeLinkedTaskRes = await showOkCancelAlertDialog(
      context: context,
      title: 'Remove Task',
      message: 'Are you sure you want to clear this linked task?',
      okLabel: 'Remove',
    );

    if (!context.mounted) return;

    if (removeLinkedTaskRes == OkCancelResult.ok) {
      context.read<AddJobBloc>().add(
            const RemoveSelectedTask(),
          );

      // Prompt another dialog to confirm
      final deleteTaskRes = await showOkCancelAlertDialog(
        context: context,
        title: 'Confirm',
        message: 'Do you want to delete linked task?',
        okLabel: 'Yes',
        cancelLabel: 'No',
      );

      if (!context.mounted) return;

      context.read<JobDetailsBloc>().add(
            RemoveLinkedTaskEvent(
              jobId: job.job_id!,
              isDeleteBooking: deleteTaskRes == OkCancelResult.ok,
            ),
          );

      onRefresh?.call();
    }
  }
}
