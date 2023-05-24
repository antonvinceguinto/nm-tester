import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextminute/core/routes/app_router.dart';
import 'package:nextminute/features/menu/sub_menus/sub_menus.dart';
import 'package:nextminute/features/wigdets/nm_simple_button.dart';

class ATSelectCustomer extends StatelessWidget {
  const ATSelectCustomer({
    super.key,
    required this.tController,
  });

  final TextEditingController tController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JobsFilterCubit, JobsFilterState>(
      builder: (context, state) {
        final isSelectionEmpty = state.selectedCustomers.isEmpty;

        return JobListTile(
          key: const Key('__select_customer__'),
          title: 'Customer',
          subtitle: isSelectionEmpty
              ? 'Not Assigned'
              : state.selectedCustomers
                  .map((e) => e.contact_name_display)
                  .join(', '),
          onTap: () async {
            if (!isSelectionEmpty) {
              await context.router.push(
                CustomerDetailsRoute(
                  id: state.selectedCustomers.first.contact_id!,
                ),
              );
              return;
            }

            final res = await context.router.push(JobsSelectCustomerRoute());

            if (res == 'add_job_customer') {
              if (tController.text.isEmpty) {
                tController.text = context
                        .read<JobsFilterCubit>()
                        .state
                        .selectedCustomers
                        .first
                        .contact_address ??
                    '';
              }

              if (!context.mounted) return;

              final dialogRes = await showOkCancelAlertDialog(
                context: context,
                title: 'Confirm',
                message:
                    '''The Customer address is different to the address. Do you want to update the Task address to match the Customer address?''',
              );

              if (dialogRes == OkCancelResult.ok) {
                tController.text = context
                        .read<JobsFilterCubit>()
                        .state
                        .selectedCustomers
                        .first
                        .contact_address ??
                    '';
              }
            }
          },
          trailing: isSelectionEmpty
              ? const Icon(
                  Icons.chevron_right,
                  size: 20,
                )
              : NMSimpleButton(
                  key: const Key('__clear_customer_button__'),
                  label: 'Clear',
                  onTap: () {
                    context.read<JobsFilterCubit>().clearCustomers(
                          isAssignCustomer: false,
                        );
                    context.read<JobsFilterCubit>().removeSite();
                  },
                ),
        );
      },
    );
  }
}
