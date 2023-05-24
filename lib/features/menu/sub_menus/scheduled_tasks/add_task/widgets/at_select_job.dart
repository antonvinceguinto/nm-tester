import 'package:api_service/api_service.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextminute/core/routes/app_router.dart';
import 'package:nextminute/features/menu/sub_menus/scheduled_tasks/add_task/bloc/add_task_bloc.dart';
import 'package:nextminute/features/menu/sub_menus/sub_menus.dart';
import 'package:nextminute/features/wigdets/nm_simple_button.dart';

class ATSelectJob extends StatelessWidget {
  const ATSelectJob({
    super.key,
    required this.addressController,
    required this.titleController,
  });

  final TextEditingController addressController;
  final TextEditingController titleController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddTaskBloc, AddTaskState>(
      builder: (context, state) => JobListTile(
        onTap: () {
          if (state.selectedJob != null) {
            context.router.push(
              JobDetailsRoute(
                job: state.selectedJob!,
              ),
            );
            return;
          }
          context.router.push(
            JobsRoute(
              onTap: (job) {
                context
                    .read<AddTaskBloc>()
                    .add(ATSelectJobEvent(selectedJob: job));

                if (job.job_client_contact_id != null) {
                  context.read<JobsFilterCubit>().addCustomer(
                        CustomerDatum(
                          contact_id: job.job_client_contact_id,
                          contact_name_display: job.job_client_contact_name,
                        ),
                        isAssignCustomer: false,
                      );
                }

                addressController.text = job.job_address!;
                titleController.text =
                    'Task for Job ${job.job_number} - ${job.job_name!}';
                context.router.pop(context);
              },
            ),
          );
        },
        title: 'Job',
        subtitle: state.selectedJob == null
            ? 'No job assigned'
            : state.selectedJob!.job_name,
        trailing: state.selectedJob == null
            ? const Icon(Icons.chevron_right)
            : NMSimpleButton(
                key: const ValueKey(
                  'clear_job',
                ),
                label: 'Clear',
                onTap: () {
                  context
                      .read<AddTaskBloc>()
                      .add(const ATSelectJobEvent(isRemove: true));
                },
              ),
      ),
    );
  }
}
