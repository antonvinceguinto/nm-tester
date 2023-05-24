import 'package:api_service/api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextminute/core/utils/utils.dart';
import 'package:nextminute/features/menu/sub_menus/customer/assignee/cubit/assignee_filter_cubit.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/sub_menus/job_filters/cubit/jobs_filter_cubit.dart';

class SelectionFilterExpansionItem extends StatefulWidget {
  const SelectionFilterExpansionItem({
    super.key,
    required this.label,
    required this.filters,
    required this.selectedFilters,
    this.isAssignee = false,
    this.isUserRole = false,
    this.isContactType = false,
    this.onChanged,
    this.onClear,
    this.onExpansionChanged,
  });

  final String label;
  final List<dynamic> filters;
  final List<dynamic> selectedFilters;
  final bool isAssignee;
  final bool isUserRole;
  final bool isContactType;
  final void Function(bool?, dynamic)? onChanged;
  final void Function()? onClear;
  final void Function(bool)? onExpansionChanged;

  @override
  State<SelectionFilterExpansionItem> createState() =>
      _SelectionFilterExpansionItemState();
}

class _SelectionFilterExpansionItemState
    extends State<SelectionFilterExpansionItem> {
  bool? isSwitched;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JobsFilterCubit, JobsFilterState>(
      builder: (context, state) {
        final afCubit = context.read<AssigneeFilterCubit>();
        final isExpanded = widget.isAssignee
            ? widget.isUserRole
                ? (widget.selectedFilters.isNotEmpty ||
                    afCubit.state.isAllAdministrators ||
                    afCubit.state.isAllUsers)
                : widget.selectedFilters.isNotEmpty
            : widget.selectedFilters.isNotEmpty;

        return ExpansionTile(
          title: Text(widget.label),
          trailing: IgnorePointer(
            child: CupertinoSwitch(
              value: isSwitched ?? true && isExpanded,
              onChanged: (_) {},
            ),
          ),
          onExpansionChanged: (val) {
            setState(() {
              isSwitched = val;
            });

            if (widget.onExpansionChanged != null) {
              widget.onExpansionChanged!.call(val);
            }
          },
          initiallyExpanded: isExpanded,
          textColor: NMColors.black,
          children: widget.isAssignee
              ? [
                  if (widget.isUserRole) ...{
                    ...[
                      CheckboxListTile(
                        activeColor: NMColors.orange,
                        selectedTileColor: Colors.grey[200],
                        title: const Text('Administrators'),
                        value: afCubit.state.isAllAdministrators,
                        onChanged: (val) =>
                            afCubit.allAdministrators(val: val!),
                      ),
                      CheckboxListTile(
                        activeColor: NMColors.orange,
                        selectedTileColor: Colors.grey[200],
                        title: const Text('All Users'),
                        value: afCubit.state.isAllUsers,
                        onChanged: (val) => afCubit.allUsers(val: val!),
                      )
                    ],
                  },
                  ...widget.filters.map((filter) {
                    return CheckboxListTile(
                      selectedTileColor: Colors.grey[200],
                      title: Text(
                        widget.isContactType
                            ? filter.contacttype_name.toString()
                            : filter.subrole_name.toString(),
                      ),
                      value: widget.isUserRole
                          ? afCubit.state.selectedUserRoles.contains(filter)
                          : afCubit.state.selectedContactTypes.contains(filter),
                      onChanged: (val) {
                        widget.onChanged != null
                            ? widget.onChanged!(val, filter)
                            : _onStatusCheck(val, filter);
                      },
                    );
                  })
                ]
              : [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ElevatedButton(
                        onPressed: widget.onClear,
                        child: const Text('Clear'),
                      ).paddingOnly(left: 16),
                      ...widget.filters.map((filter) {
                        Color color;

                        if (filter?.color == null) {
                          color = Colors.white;
                        } else {
                          color = Color(filter.color.toString().toHexColor());
                        }

                        return CheckboxListTile(
                          tileColor: color,
                          selectedTileColor: Colors.grey[200],
                          title: Text(
                            filter.name.toString(),
                            style: NMTextStyles.b2(context)?.copyWith(
                              color: color.isDark()
                                  ? Colors.white
                                  : NMColors.black,
                            ),
                          ),
                          value: widget.selectedFilters.contains(filter),
                          onChanged: (val) {
                            widget.onChanged != null
                                ? widget.onChanged!(val, filter)
                                : _onStatusCheck(val, filter);
                          },
                        );
                      }),
                    ],
                  )
                ],
        );
      },
    );
  }

  void _onStatusCheck(bool? val, dynamic filter) {
    if (val == null) return;

    if (widget.isAssignee) {
      if (widget.isUserRole) {
        context
            .read<AssigneeFilterCubit>()
            .addToUserRole(filter as UserRoleModel);

        setState(() {});
        return;
      }

      context
          .read<AssigneeFilterCubit>()
          .addToCustomerTypes(filter as ContactTypeModel);

      setState(() {});
      return;
    }

    final jobsCubit = context.read<JobsFilterCubit>();

    if (val) {
      if (widget.selectedFilters.contains(filter)) return;
      widget.selectedFilters.add(filter);
    } else {
      widget.selectedFilters.remove(filter);
    }

    setState(() {});

    var index = 0;

    if (widget.label == 'Status') {
      index = 0;
    } else if (widget.label == 'Type') {
      index = 1;
    } else if (widget.label == 'Pricing Type') {
      index = 2;
    } else if (widget.label == 'Priority') {
      index = 3;
    }

    jobsCubit.addFilter(
      indexFilter: index,
      nFilters: widget.selectedFilters,
    );
  }
}
