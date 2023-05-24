import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextminute/core/routes/app_router.dart';
import 'package:nextminute/core/utils/utils.dart';
import 'package:nextminute/features/menu/sub_menus/sub_menus.dart';
import 'package:nextminute/features/wigdets/nm_simple_button.dart';

class ATAssignedTo extends StatelessWidget {
  const ATAssignedTo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JobsFilterCubit, JobsFilterState>(
      builder: (context, state) {
        return Column(
          children: [
            JobListTile(
              title: 'Assigned To',
              subtitle: 'Click to assign a contact',
              onTap: () {
                context.router.push(
                  JobsAssignCustomerRoute(),
                );
              },
            ),
            ListView.separated(
              padding: EdgeInsets.zero,
              separatorBuilder: (context, index) => const Divider(
                height: 1,
              ),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.selectedAssignedTos.length,
              itemBuilder: (context, index) {
                final item = state.selectedAssignedTos[index];
                return ListTile(
                  onTap: () {
                    context.router.push(
                      CustomerDetailsRoute(
                        id: item.contact_id!,
                      ),
                    );
                  },
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  title: Text(
                    item.contact_name_display ?? '-',
                    style: NMTextStyles.b2(context)?.copyWith(
                      fontSize: 14,
                      color: Colors.blue.shade800,
                    ),
                  ),
                  trailing: NMSimpleButton(
                    key: const Key(
                      '__clear_assigned_button__',
                    ),
                    label: 'Clear',
                    onTap: () {
                      context.read<JobsFilterCubit>().removeCustomer(
                            item,
                            isAssignCustomer: true,
                          );
                    },
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
