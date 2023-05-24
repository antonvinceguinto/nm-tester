import 'package:flutter/material.dart';
import 'package:nextminute/core/utils/theme/nm_text_styles.dart';

class NMActionItem extends StatelessWidget {
  const NMActionItem({
    super.key,
    this.onTap,
    required this.label,
    this.icon,
    this.iconColor,
    this.trailing,
  });

  final String label;
  final VoidCallback? onTap;
  final IconData? icon;
  final Color? iconColor;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        if (onTap != null) {
          onTap!.call();
          Navigator.pop(context);
        }
      },
      title: Text(
        label,
        style: NMTextStyles.b2(context)?.copyWith(
          color: Colors.white,
        ),
      ),
      trailing: trailing,
      leading: icon == null
          ? null
          : Icon(
              icon,
              color: iconColor ?? Colors.white,
            ),
    );
  }
}
