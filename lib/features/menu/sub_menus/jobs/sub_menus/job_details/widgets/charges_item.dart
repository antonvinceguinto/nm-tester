import 'package:api_service/api_service.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextminute/core/routes/app_router.dart';
import 'package:nextminute/features/menu/main_menu/bloc/main_menu_bloc.dart';

class ChargesItem extends StatelessWidget {
  const ChargesItem({
    super.key,
    required this.label,
    required this.value,
    required this.bgColor,
    this.job,
    this.task,
  });

  final String label;
  final String value;
  final Color bgColor;
  final JobInfoLevelModel? job;
  final TaskInfoLevelModel? task;

  @override
  Widget build(BuildContext context) {
    final subPermissions = context.read<MainMenuBloc>().state.subPermissions;

    var isChargesEnabled = false;

    if (task != null) {
      isChargesEnabled = (subPermissions.BookingChargesEnabled ?? false) &&
          !(task?.book_istemplate ?? false);
    } else if (job != null) {
      isChargesEnabled = subPermissions.JobChargesEnabled ?? false;
    }

    final canViewCostSummary = subPermissions.canViewCostSummary;

    return InkWell(
      onTap: () {
        var tempLabel = label;

        if (label == 'Other Items') tempLabel = 'Other';

        context.router.push(
          ChargesRoute(
            job: job,
            task: task,
            scrollToHeader: tempLabel,
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 140,
              height: 50,
              color: bgColor,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  label,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(canViewCostSummary ? value : '-'),
              ),
            ),
            if (isChargesEnabled)
              ColoredBox(
                color: Colors.grey.shade200,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add,
                    size: 32,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
