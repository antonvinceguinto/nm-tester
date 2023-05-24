import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nextminute/core/utils/utils.dart';
import 'package:nextminute/features/menu/sub_menus/jobs/sub_menus/add_job/add_job/widgets/nm_divider.dart';
import 'package:nextminute/features/menu/sub_menus/sub_menus.dart';

class SendNotifs extends StatefulWidget {
  const SendNotifs({super.key});

  @override
  State<SendNotifs> createState() => _SendNotifsState();
}

class _SendNotifsState extends State<SendNotifs> {
  bool isNotificationsOn = false;
  bool isPushNotifs = true;
  bool isEmail = true;
  bool isSMS = false;
  bool isSendAutomatically = false;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: const Text('Send Notification'),
      trailing: IgnorePointer(
        child: CupertinoSwitch(
          value: isNotificationsOn,
          onChanged: (_) {},
        ),
      ),
      onExpansionChanged: (isExpanded) {
        setState(() {
          isNotificationsOn = isExpanded;
        });
      },
      textColor: Colors.black,
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      expandedAlignment: Alignment.topLeft,
      childrenPadding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      children: [
        NMDivider(),
        Text(
          'Send notification by:',
          style: NMTextStyles.b2(context)?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ).paddingSymmetric(vertical: 8),
        JobsToggleFilterItem(
          isSelected: isPushNotifs,
          isCompact: true,
          label: 'Push Notification',
          onTap: () {
            setState(() {
              isPushNotifs = !isPushNotifs;
            });
          },
        ),
        JobsToggleFilterItem(
          isSelected: isEmail,
          label: 'Email',
          isCompact: true,
          onTap: () {
            setState(() {
              isEmail = !isEmail;
            });
          },
        ),
        JobsToggleFilterItem(
          key: const Key('smsToggle'),
          isSelected: isSMS,
          label: 'SMS',
          isCompact: true,
          onTap: () {
            setState(() {
              isSMS = !isSMS;
            });
          },
        ),
        Text(
          'Notification options:',
          style: NMTextStyles.b2(context)?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ).paddingSymmetric(vertical: 8),
        JobsToggleFilterItem(
          isSelected: isSendAutomatically,
          label: 'Send automatically',
          isCompact: true,
          onTap: () {
            setState(() {
              isSendAutomatically = !isSendAutomatically;
            });
          },
        ),
      ],
    );
  }
}
