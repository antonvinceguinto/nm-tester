import 'package:flutter/material.dart';
import 'package:nextminute/core/utils/utils.dart';
import 'package:nextminute/features/wigdets/nm_cupertino_button.dart';

class NMBottomActionButton extends StatelessWidget {
  const NMBottomActionButton({
    super.key,
    required this.label,
    this.onPressed,
  });

  final String label;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return NMCupertinoButton(
      onPressed: onPressed,
      child: Text(
        label,
        style: Theme.of(context)
            .cupertinoOverrideTheme
            ?.textTheme
            ?.textStyle
            .copyWith(
              color: NMColors.orange,
            ),
      ),
    );
  }
}
