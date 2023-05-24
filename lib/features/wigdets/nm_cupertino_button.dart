import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NMCupertinoButton extends StatelessWidget {
  const NMCupertinoButton({
    super.key,
    required this.child,
    this.padding,
    this.onPressed,
  });

  final Widget child;
  final VoidCallback? onPressed;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        // textTheme: GoogleFonts.openSansTextTheme(),
        cupertinoOverrideTheme:
            Theme.of(context).cupertinoOverrideTheme?.copyWith(
                  primaryColor: Colors.white,
                ),
      ),
      child: CupertinoButton(
        onPressed: onPressed,
        padding: padding,
        child: child,
      ),
    );
  }
}
