import 'package:flutter/material.dart';
import 'package:nextminute/core/utils/theme/nm_colors.dart';

class NmLogo extends StatelessWidget {
  const NmLogo({
    super.key,
    this.height = 200,
    this.width = 200,
    this.color = NMColors.orange,
  });

  final double height;
  final double width;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/logo_white.png',
      color: color,
      fit: BoxFit.contain,
      width: width,
      height: height,
    );
  }
}
