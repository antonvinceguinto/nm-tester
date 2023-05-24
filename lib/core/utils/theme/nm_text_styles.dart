import 'package:flutter/material.dart';

class NMTextStyles {
  static TextStyle? b2(BuildContext context) {
    return Theme.of(context).textTheme.bodyMedium;
  }

  static TextStyle? caption(BuildContext context) {
    return Theme.of(context).textTheme.bodySmall?.copyWith(
          fontSize: 14,
        );
  }

  static TextStyle? btn(BuildContext context) {
    return Theme.of(context).textTheme.labelLarge;
  }

  static TextStyle? h4(BuildContext context) {
    return Theme.of(context).textTheme.headlineMedium;
  }
}
