import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class JobsToggleFilterItem extends StatelessWidget {
  const JobsToggleFilterItem({
    super.key,
    required this.onTap,
    required this.label,
    required this.isSelected,
    this.isCompact = false,
  });

  final void Function()? onTap;
  final String label;
  final bool isSelected;
  final bool isCompact;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      selectedTileColor: Colors.grey[200],
      visualDensity: isCompact ? const VisualDensity(vertical: -3) : null,
      contentPadding: isCompact ? EdgeInsets.zero : null,
      onTap: onTap,
      title: Text(label),
      trailing: IgnorePointer(
        child: CupertinoSwitch(
          value: isSelected,
          onChanged: (_) {},
        ),
      ),
    );
  }
}
