import 'package:flutter/material.dart';
import 'package:nextminute/core/utils/utils.dart';

class RowItem extends StatelessWidget {
  const RowItem({
    super.key,
    required this.label,
    required this.value,
    this.isBlueSubtitle = false,
  });

  final String label;
  final String value;
  final bool isBlueSubtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            '$label:',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            value,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: isBlueSubtitle
                      ? Colors.blue
                      : value.toLowerCase() == 'not assigned' ||
                              value.toLowerCase() == 'not set'
                          ? Colors.grey
                          : null,
                  decoration: isBlueSubtitle ? TextDecoration.underline : null,
                ),
          ),
        ),
      ],
    ).paddingSymmetric(vertical: 2);
  }
}
