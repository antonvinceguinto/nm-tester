import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextminute/features/menu/sub_menus/customer/assignee/cubit/assignee_filter_cubit.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/sub_menus/job_filters/wigdets/jobs_toggle_filter_item.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/widgets/selection_filter_expansion_item.dart';
import 'package:nextminute/features/wigdets/nm_always_scroll.dart';
import 'package:nextminute/features/wigdets/nm_widgets.dart';

@RoutePage()
class AssigneeFilterPage extends StatelessWidget {
  const AssigneeFilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AssigneeFilterCubit>().fetchUserRoles();

    return const AssigneeFilterView();
  }
}

class AssigneeFilterView extends StatefulWidget {
  const AssigneeFilterView({super.key});

  @override
  State<AssigneeFilterView> createState() => _AssigneeFilterViewState();
}

class _AssigneeFilterViewState extends State<AssigneeFilterView> {
  @override
  Widget build(BuildContext context) {
    final fCubit = context.watch<AssigneeFilterCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter Assignee'),
        actions: [
          NMCupertinoButton(
            child: const Text('Apply'),
            onPressed: () {
              context.router.pop('Apply');
            },
          ),
        ],
      ),
      body: SafeArea(
        child: AlwaysScroll(
          child: Column(
            children: [
              JobsToggleFilterItem(
                label: 'Exclude Archived Contacts',
                isSelected: fCubit.state.isExcludeArchivedContacts,
                onTap: fCubit.excludeArchivedContacts,
              ),
              JobsToggleFilterItem(
                label: 'Exclude Disabled Users',
                isSelected: fCubit.state.isExcludeDisabledUsers,
                onTap: fCubit.excludeDisabledUsers,
              ),
              SelectionFilterExpansionItem(
                label: 'User Roles',
                filters: fCubit.state.userRoles ?? [],
                selectedFilters: fCubit.state.selectedUserRoles,
                isAssignee: true,
                isUserRole: true,
                onExpansionChanged: (isExpanded) =>
                    fCubit.toggleUserRoles(val: isExpanded),
              ),
              SelectionFilterExpansionItem(
                label: 'Contact Types',
                filters: fCubit.state.contactTypes ?? [],
                selectedFilters: fCubit.state.selectedContactTypes,
                isAssignee: true,
                isContactType: true,
                onExpansionChanged: (isExpanded) =>
                    fCubit.toggleContactTypes(val: isExpanded),
              ),
              JobsToggleFilterItem(
                label: 'Include Deleted',
                isSelected: fCubit.state.includeDeleted,
                onTap: fCubit.includeDeleted,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
