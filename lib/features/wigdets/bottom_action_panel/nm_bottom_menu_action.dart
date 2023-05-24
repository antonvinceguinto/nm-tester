import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:nextminute/core/utils/enums.dart';
import 'package:nextminute/core/utils/utils.dart';

import 'package:nextminute/features/wigdets/bottom_action_panel/nm_bottom_action_button.dart';

class NMBottomMenuActions extends StatelessWidget {
  const NMBottomMenuActions({
    super.key,
    this.actionsPanel,
    this.actionButton,
    this.hasBottomSpacing = true,
    this.hasMenu = true,
  });

  final Widget? actionsPanel;
  final Widget? actionButton;
  final bool hasBottomSpacing;
  final bool hasMenu;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Hive.box<bool>(BoxType.boxDarkMode.name()).get(
                BoxType.darkMode.name(),
                defaultValue: false,
              ) ??
              false
          ? NMColors.black
          : Colors.grey.shade200,
      width: double.infinity,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (!hasMenu)
                const SizedBox.shrink()
              else
                NMBottomActionButton(
                  onPressed: () {
                    HapticFeedback.lightImpact();
                    // Phoenix.rebirth(context);
                    Navigator.of(context).popUntil(
                      (route) => route.isFirst,
                    );
                  },
                  label: 'Menu',
                ),
              if (actionButton != null) actionButton!,
              if (actionsPanel != null)
                NMBottomActionButton(
                  label: 'Actions',
                  onPressed: () async {
                    await HapticFeedback.lightImpact();
                    if (context.mounted) {
                      await showCupertinoModalBottomSheet<void>(
                        context: context,
                        closeProgressThreshold: 0.9,
                        builder: (_) => actionsPanel!,
                      );
                    }
                  },
                ),
            ],
          ).paddingSymmetric(horizontal: 16),
          if (hasBottomSpacing && Platform.isIOS) const SizedBox(height: 24),
        ],
      ),
    );
  }
}
