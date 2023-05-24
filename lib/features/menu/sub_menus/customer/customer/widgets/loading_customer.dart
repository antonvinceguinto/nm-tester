import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nextminute/core/utils/utils.dart';
import 'package:nextminute/features/wigdets/nm_small_loading_indicator.dart';

class LoadingCustomers extends StatelessWidget {
  const LoadingCustomers({
    super.key,
    this.title = 'Loading Customers..',
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 16, 16, Platform.isIOS ? 32 : 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title),
          const SizedBox(width: 8),
          const SizedBox(
            child: NMSmallLoadingIndicator(
              color: NMColors.orange,
              size: Size(12, 12),
            ),
          ),
        ],
      ),
    );
  }
}
