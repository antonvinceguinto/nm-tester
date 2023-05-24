import 'package:flutter/material.dart';

class NMSmallLoadingIndicator extends StatelessWidget {
  const NMSmallLoadingIndicator({
    super.key,
    this.color,
    this.margin = const EdgeInsets.only(right: 16),
    this.size = const Size(16, 16),
  });

  final Color? color;
  final EdgeInsets margin;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: margin,
        width: size.width,
        height: size.height,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(color ?? Colors.white),
          strokeWidth: 3,
        ),
      ),
    );
  }
}
