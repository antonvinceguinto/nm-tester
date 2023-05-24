import 'package:api_service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:nextminute/core/utils/utils.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/sub_menus/job_details/widgets/row_item.dart';

class CostSummaryInfo extends StatelessWidget {
  const CostSummaryInfo({
    super.key,
    required this.costSummary,
  });

  final CostSummary costSummary;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Cost Summary (Quoted vs Actual)',
          style: NMTextStyles.b2(context)?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        RowItem(
          label: 'Total Quoted',
          value: '${costSummary.total_quoted! < 0 ? '-' : ''}'
              '\$${costSummary.total_quoted?.abs().toCommaString()}',
        ),
        RowItem(
          label: 'Actual Cost',
          value: '${costSummary.actual_costs! < 0 ? '-' : ''}'
              '\$${costSummary.actual_costs?.abs().toCommaString()}',
        ),
        RowItem(
          label: r'Variance $',
          value: '${costSummary.variance_amount! < 0 ? '-' : ''}'
              '\$${costSummary.variance_amount?.abs().toCommaString()}',
        ),
        RowItem(
          label: 'Variance %',
          value: '${costSummary.variance_percent?.toStringAsFixed(0)}%',
        ),
        const RowItem(
          label: 'Progress',
          value: '',
        ),
        Row(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(3),
                child: LinearProgressIndicator(
                  value: (costSummary.progress ?? 0) / 100,
                  valueColor: const AlwaysStoppedAnimation<Color>(
                    NMColors.orange,
                  ),
                  backgroundColor: Colors.grey.shade200,
                  minHeight: 20,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              '${costSummary.progress?.toStringAsFixed(2)}%',
              style: NMTextStyles.b2(context),
            ),
          ],
        )
      ],
    ).paddingSymmetric(
      horizontal: 16,
      vertical: 8,
    );
  }
}
