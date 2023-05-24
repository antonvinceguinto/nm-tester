import 'package:flutter/material.dart';
import 'package:nextminute/core/utils/utils.dart';

class AddCheckBox extends StatelessWidget {
  const AddCheckBox({
    super.key,
    required this.label,
    required this.value,
    required this.onChecked,
    this.subtitle,
    this.padding,
  });

  final String label;
  final bool value;
  final void Function(bool?)? onChecked;
  final Widget? subtitle;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: value,
      title: Text(label),
      subtitle: subtitle,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
        side: BorderSide(
          color: Colors.grey.withOpacity(0.5),
        ),
      ),
      controlAffinity: ListTileControlAffinity.trailing,
      dense: true,
      visualDensity: VisualDensity.compact,
      onChanged: onChecked,
    ).paddingSymmetric(horizontal: 16);
  }
}
