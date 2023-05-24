import 'package:flutter/material.dart';

class NMMinSizeContainer extends StatelessWidget {
  const NMMinSizeContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [child],
    );
  }
}
