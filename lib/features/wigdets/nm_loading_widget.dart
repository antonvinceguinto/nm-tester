import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:nextminute/core/utils/utils.dart';

class NMLoadingWidget extends StatelessWidget {
  const NMLoadingWidget({
    super.key,
    this.bgColor,
    this.textColor,
    this.label,
    this.loadingIndicator,
  });

  final Color? bgColor;
  final Color? textColor;
  final String? label;
  final Widget? loadingIndicator;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 4),
              loadingIndicator ??
                  SpinKitCubeGrid(
                    color: textColor ?? NMColors.orange,
                  ),
              const SizedBox(height: 14),
              if (label != null)
                Text(
                  label!,
                  style: NMTextStyles.b2(context)?.copyWith(
                    color: textColor ?? NMColors.orange,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
