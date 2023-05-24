import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nextminute/core/utils/enums.dart';
import 'package:nextminute/core/utils/utils.dart';

class NMChip extends StatelessWidget {
  const NMChip({
    super.key,
    required this.label,
    this.isJobType = false,
    this.color,
    this.fontSize,
  });

  final String label;
  final bool isJobType;
  final Color? color;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Hive.box<bool>(BoxType.boxDarkMode.name())
            .get(BoxType.darkMode.name()) ??
        false;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: color ??
            (isDarkMode
                ? Colors.black
                : getStatusColor(label, isJobType: isJobType)),
        borderRadius: BorderRadius.circular(3),
      ),
      child: Text(
        label,
        style: NMTextStyles.b2(context)?.copyWith(
          fontSize: fontSize ?? 12,
          color: color != null
              ? color!.isDark()
                  ? Colors.white
                  : Colors.black
              : isDarkMode
                  ? Colors.white
                  : Colors.black,
        ),
      ),
    );
  }
}
