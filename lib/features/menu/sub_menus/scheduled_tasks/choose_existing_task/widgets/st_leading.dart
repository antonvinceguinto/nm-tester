import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nextminute/core/utils/utils.dart';
import 'package:nextminute/features/wigdets/nm_widgets.dart';

class STLeading extends StatelessWidget {
  const STLeading({
    super.key,
    required this.onCalendarPressed,
    required this.onBackPressed,
    required this.isFromMenu,
  });

  final void Function() onCalendarPressed;
  final void Function() onBackPressed;
  final bool isFromMenu;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Platform.isIOS
              ? const Icon(Icons.arrow_back_ios)
              : const Icon(Icons.arrow_back),
          onPressed: onBackPressed,
        ),
        if (isFromMenu) ...{
          NMCupertinoButton(
            onPressed: onCalendarPressed,
            padding: EdgeInsets.zero,
            child: const FaIcon(
              FontAwesomeIcons.calendarDay,
              size: 25,
            ),
          ).paddingOnly(bottom: 4),
        },
      ],
    );
  }
}
