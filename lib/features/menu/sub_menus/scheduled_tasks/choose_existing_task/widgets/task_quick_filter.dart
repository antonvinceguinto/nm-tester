import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:nextminute/core/utils/utils.dart';
import 'package:nextminute/features/menu/sub_menus/sub_menus.dart';
import 'package:nextminute/features/wigdets/nm_always_scroll.dart';
import 'package:nextminute/features/wigdets/nm_widgets.dart';

class TaskQuickFilter extends StatefulWidget {
  const TaskQuickFilter({
    super.key,
    this.onClear,
    this.onSelect,
    required this.isFromJobs,
    this.jobId,
  });

  final void Function()? onClear;
  final void Function()? onSelect;
  final bool isFromJobs;
  final int? jobId;

  @override
  State<TaskQuickFilter> createState() => _TaskQuickFilterState();
}

class _TaskQuickFilterState extends State<TaskQuickFilter> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskStatusBloc, TaskStatusState>(
      builder: (context, state) {
        return NMCupertinoButton(
          padding: const EdgeInsets.only(right: 16),
          onPressed: state.taskStatus.isEmpty
              ? null
              : () async {
                  await showCupertinoModalBottomSheet<void>(
                    context: context,
                    closeProgressThreshold: 0.9,
                    backgroundColor: NMColors.black,
                    builder: (context) => SafeArea(
                      child: AlwaysScroll(
                        child: Column(
                          children: [
                            _buildQuickFilterItem(
                              onTap: widget.onClear,
                              title: 'Clear Filter',
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: state.taskStatus.length,
                              itemBuilder: (context, index) {
                                final status = state.taskStatus[index];
                                final color = Color(
                                  status.color?.toHexColor() ?? 0xFF000000,
                                );
                                return ColoredBox(
                                  color: color,
                                  child: ListTile(
                                    onTap: () {
                                      context.read<TaskFilterStatusCubit>()
                                        ..clearFilters()
                                        ..addSelectedStatus(status);
                                      widget.onSelect?.call();
                                      Navigator.pop(context);
                                    },
                                    title: Text(
                                      status.name!,
                                      style: TextStyle(
                                        color: color.isDark()
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
          child: const Icon(Icons.arrow_drop_down),
        );
      },
    );
  }

  Widget _buildQuickFilterItem({
    void Function()? onTap,
    required String title,
  }) {
    return ListTile(
      onTap: onTap,
      title: Text(title).color(Colors.white),
    );
  }
}
