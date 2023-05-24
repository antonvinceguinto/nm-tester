import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextminute/core/routes/app_router.dart';
import 'package:nextminute/core/utils/utils.dart';
import 'package:nextminute/features/menu/sub_menus/quotes/cubit/quotes_filters_cubit.dart';

class QuoteJobFilterExpansionItem extends StatefulWidget {
  const QuoteJobFilterExpansionItem({super.key});

  @override
  State<QuoteJobFilterExpansionItem> createState() =>
      _QuoteJobFilterExpansionItemState();
}

class _QuoteJobFilterExpansionItemState
    extends State<QuoteJobFilterExpansionItem> {
  bool? isSwitched;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuotesFiltersCubit, QuotesFiltersState>(
      builder: (context, state) {
        final qfc = context.read<QuotesFiltersCubit>();
        final isExpanded =
            state.filters.containsKey('JobIds') || state.isJobFilterEnabled;

        return Column(
          children: [
            ExpansionTile(
              title: const Text('Job'),
              trailing: IgnorePointer(
                child: CupertinoSwitch(
                  value: isSwitched ?? isExpanded,
                  onChanged: (_) {},
                ),
              ),
              onExpansionChanged: (isExpanded) {
                setState(() {
                  isSwitched = isExpanded;
                });

                qfc.toggleJobFilter();
              },
              initiallyExpanded: isExpanded,
              textColor: Colors.black,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: qfc.clearSelectedJobs,
                      child: const Text('Clear'),
                    ),
                    TextButton(
                      onPressed: () {
                        context.router.push(const QuotesSelectJobRoute());
                      },
                      child: const Text('Add'),
                    ),
                  ],
                ).paddingAll(12),
                ...state.selectedJobs.map((job) {
                  return CheckboxListTile(
                    value: state.selectedEnabledJobs.contains(job),
                    onChanged: (value) {
                      qfc.toggleJobEnabled(job);
                    },
                    title: Text('${job.job_number} - ${job.job_name!}'),
                    controlAffinity: ListTileControlAffinity.trailing,
                  );
                }),
              ],
            ),
          ],
        );
      },
    );
  }
}
