import 'package:api_service/api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextminute/core/utils/utils.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/sub_menus/job_filters/cubit/jobs_filter_cubit.dart';

class QuoteSelectionFilterExpansionItem extends StatefulWidget {
  const QuoteSelectionFilterExpansionItem({
    super.key,
    required this.label,
    required this.filters,
    required this.selectedFilters,
    required this.onClear,
    this.onChanged,
  });

  final String label;
  final List<FPricingTypeModel> filters;
  final List<FPricingTypeModel> selectedFilters;
  final void Function(bool?, dynamic)? onChanged;
  final void Function()? onClear;

  @override
  State<QuoteSelectionFilterExpansionItem> createState() =>
      _QuoteSelectionFilterExpansionItemState();
}

class _QuoteSelectionFilterExpansionItemState
    extends State<QuoteSelectionFilterExpansionItem> {
  bool? isSwitched;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JobsFilterCubit, JobsFilterState>(
      builder: (context, state) {
        final isExpanded = widget.selectedFilters.isNotEmpty;

        return ExpansionTile(
          title: Text(widget.label),
          trailing: IgnorePointer(
            child: CupertinoSwitch(
              value: isSwitched ?? true && isExpanded,
              onChanged: (_) {},
            ),
          ),
          onExpansionChanged: (isExpanded) {
            widget.selectedFilters.clear();

            setState(() {
              isSwitched = isExpanded;
            });
          },
          initiallyExpanded: isExpanded,
          textColor: NMColors.black,
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: widget.onClear,
              child: const Text('Clear'),
            ).paddingOnly(left: 16),
            ...widget.filters.map((filter) {
              Color color;

              if (filter.color == null) {
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
                    color: color.isDark() ? Colors.white : NMColors.black,
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
        );
      },
    );
  }

  void _onStatusCheck(bool? val, FPricingTypeModel filter) {
    if (val == null) return;

    final jobsCubit = context.read<JobsFilterCubit>();

    if (val) {
      if (widget.selectedFilters.contains(filter)) return;
      widget.selectedFilters.add(filter);
    } else {
      widget.selectedFilters.remove(filter);
    }

    setState(() {});

    jobsCubit.addFilter(
      indexFilter: 2,
      nFilters: widget.selectedFilters,
    );
  }
}
