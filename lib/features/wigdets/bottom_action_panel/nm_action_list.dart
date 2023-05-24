import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:nextminute/core/utils/theme/nm_colors.dart';
import 'package:nextminute/features/wigdets/bottom_action_panel/nm_action_item.dart';
import 'package:url_launcher/url_launcher.dart';

class NMActionList extends StatelessWidget {
  const NMActionList({
    super.key,
    required this.actions,
  });

  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: NMColors.black,
      child: ListView(
        shrinkWrap: true,
        children: [
          ...actions,
          NMActionItem(
            onTap: () async {
              final url = Uri.parse('https://support.nextminute.com/');
              if (await canLaunchUrl(url)) {
                await launchUrl(url, mode: LaunchMode.externalApplication);
              } else {
                throw Exception('Could not launch $url');
              }
            },
            label: 'Knowledgebase',
            icon: Icons.question_mark_outlined,
          ),
          NMActionItem(
            onTap: () async {
              await context.router.pop();
            },
            label: 'Cancel',
            icon: Icons.cancel_outlined,
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
