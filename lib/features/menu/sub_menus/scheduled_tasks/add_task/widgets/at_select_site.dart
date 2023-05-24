import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextminute/core/routes/app_router.dart';
import 'package:nextminute/features/menu/sub_menus/sub_menus.dart';
import 'package:nextminute/features/wigdets/nm_simple_button.dart';

class ATSelectSite extends StatelessWidget {
  const ATSelectSite({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JobsFilterCubit, JobsFilterState>(
      builder: (context, state) {
        final selectedCustomers = state.selectedCustomers;

        if (selectedCustomers.isEmpty) {
          return const SizedBox.shrink();
        }

        final isSiteEmpty = state.selectedSite == null;

        return JobListTile(
          title: 'Site',
          subtitle: isSiteEmpty
              ? 'Not Assigned'
              : state.selectedSite!.contact_name_display,
          onTap: () {
            if (!isSiteEmpty) {
              return;
            }
            context.router.push(
              JobsAssignCustomerRoute(
                isSite: true,
                parentContactId: state.selectedCustomers.first.contact_id,
              ),
            );
          },
          trailing: isSiteEmpty
              ? const Icon(
                  Icons.chevron_right,
                  size: 20,
                )
              : NMSimpleButton(
                  label: 'Clear',
                  onTap: () {
                    context.read<JobsFilterCubit>().removeSite();
                  },
                ),
        );
      },
    );
  }
}
