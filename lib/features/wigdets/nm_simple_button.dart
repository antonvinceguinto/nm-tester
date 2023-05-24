import 'package:flutter/material.dart';
import 'package:nextminute/core/utils/theme/nm_text_styles.dart';

class NMSimpleButton extends StatelessWidget {
  const NMSimpleButton({
    super.key,
    required this.label,
    this.onTap,
  });

  final String label;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 6,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.shade400,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: NMTextStyles.btn(context)?.copyWith(
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
