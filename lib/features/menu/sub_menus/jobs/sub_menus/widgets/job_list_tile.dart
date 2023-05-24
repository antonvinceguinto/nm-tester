import 'package:flutter/material.dart';
import 'package:nextminute/core/utils/theme/nm_text_styles.dart';

class JobListTile extends StatelessWidget {
  const JobListTile({
    super.key,
    this.onTap,
    required this.title,
    this.subtitle,
    this.customChild,
    this.isBlueSubtitle = false,
    this.hasChevron = true,
    this.contentPadding,
    this.trailing,
  });

  final VoidCallback? onTap;
  final String title;
  final String? subtitle;
  final bool isBlueSubtitle;
  final bool hasChevron;
  final Widget? customChild;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: contentPadding ??
          const EdgeInsets.symmetric(
            horizontal: 16,
          ),
      onTap: onTap,
      visualDensity: const VisualDensity(vertical: -2),
      minVerticalPadding: 10,
      title: Text(
        title,
        style: NMTextStyles.b2(context)?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: customChild ??
          Text(
            subtitle ?? 'Not set',
            style: isBlueSubtitle
                ? Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Colors.blue,
                    )
                : Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: isNotAssigned(subtitle ?? 'Not set')
                          ? Colors.grey
                          : Theme.of(context).textTheme.titleSmall?.color,
                    ),
          ),
      trailing: !hasChevron
          ? null
          : trailing ??
              const Icon(
                Icons.chevron_right,
                size: 20,
              ),
    );
  }
}

bool isNotAssigned(String subtitle) {
  final loweredSubtitle = subtitle.toLowerCase();

  return loweredSubtitle == 'not assigned' ||
      loweredSubtitle == 'not set' ||
      loweredSubtitle == 'click to assign a contact' ||
      loweredSubtitle == 'no site assigned' ||
      loweredSubtitle == 'no status history' ||
      loweredSubtitle == 'no on-site history' ||
      loweredSubtitle == 'no job assigned' ||
      loweredSubtitle == 'no status assigned' ||
      loweredSubtitle == 'not recurring' ||
      loweredSubtitle == 'add recurrence';
}
