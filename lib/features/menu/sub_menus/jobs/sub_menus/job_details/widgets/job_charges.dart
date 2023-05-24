import 'package:api_service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextminute/core/utils/utils.dart';
import 'package:nextminute/features/menu/main_menu/bloc/main_menu_bloc.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/sub_menus/job_details/widgets/charges_item.dart';

class JobCharges extends StatelessWidget {
  const JobCharges({
    super.key,
    required this.actualCharges,
    this.job,
    this.task,
  });

  final ActualChargesTotals actualCharges;
  final JobInfoLevelModel? job;
  final TaskInfoLevelModel? task;

  @override
  Widget build(BuildContext context) {
    var taxTotal = 0.0;

    if (actualCharges.actual_charges_subtotal != null &&
        actualCharges.actual_charges_total != null) {
      taxTotal = actualCharges.actual_charges_total! -
          actualCharges.actual_charges_subtotal!;
    }

    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Charges',
              style: NMTextStyles.b2(context)?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            ChargesItem(
              job: job,
              task: task,
              label: 'Labour',
              value: '''\$${actualCharges.time_subtotal?.toCommaString()}''',
              bgColor: NMColors.lightGreen,
            ),
            ChargesItem(
              job: job,
              task: task,
              label: 'Materials',
              value: '''\$${actualCharges.product_subtotal?.toCommaString()}''',
              bgColor: Colors.blue.shade200,
            ),
            ChargesItem(
              job: job,
              task: task,
              label: 'Disbursements',
              value:
                  '''\$${actualCharges.disbursement_subtotal?.toCommaString()}''',
              bgColor: Colors.amber.shade200,
            ),
            ChargesItem(
              job: job,
              task: task,
              label: 'Other Items',
              value: '''\$${actualCharges.other_subtotal?.toCommaString()}''',
              bgColor: Colors.pink.shade200,
            ),
          ],
        ).paddingSymmetric(horizontal: 16),
        if (context
            .read<MainMenuBloc>()
            .state
            .subPermissions
            .canViewCostSummary)
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Subtotal: '
                  '\$${actualCharges.actual_charges_subtotal?.toCommaString()}',
                ),
                Text(
                  'Tax: \$${taxTotal.toCommaString()}',
                ),
                Text(
                  'Total: '
                  '\$${actualCharges.actual_charges_total?.toCommaString()}',
                ),
              ],
            ),
          ),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.list_alt),
                label: const Text(
                  'Sections View',
                ),
              ),
            ),
            Expanded(
              child: !context.read<MainMenuBloc>().state.isAdmin
                  ? const SizedBox.shrink()
                  : TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.add),
                      label: const Text(
                        'Create Invoice ',
                      ),
                    ),
            ),
          ],
        ).paddingSymmetric(horizontal: 16),
      ],
    );
  }
}
