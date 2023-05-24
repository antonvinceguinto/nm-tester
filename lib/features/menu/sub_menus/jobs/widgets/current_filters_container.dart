import 'package:flutter/material.dart';
import 'package:nextminute/core/utils/utils.dart';

class CurrentFiltersContainer extends StatelessWidget {
  const CurrentFiltersContainer({
    super.key,
    required this.label,
    this.trailing,
  });

  final String label;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        trailing ?? const SizedBox.shrink(),
      ],
    ).paddingOnly(
      left: 8,
      right: 8,
      bottom: 6,
    );
  }
}
