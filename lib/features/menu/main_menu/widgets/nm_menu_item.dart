import 'package:flutter/material.dart';
import 'package:nextminute/core/utils/utils.dart';

class NMMenuItem extends StatelessWidget {
  const NMMenuItem({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });

  final String title;
  final Widget icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      // shadowColor: NMColors.black.withOpacity(0.2),
      color: context.isDarkMode ? NMColors.black : Colors.grey.shade100,
      child: InkWell(
        onTap: onTap ?? () {},
        borderRadius: BorderRadius.circular(
          NMBorderRadius.defaultBorderRadius,
        ),
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              NMBorderRadius.defaultBorderRadius,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              const SizedBox(height: 8),
              Text(
                title,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: NMTextStyles.b2(context)?.copyWith(
                  height: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
