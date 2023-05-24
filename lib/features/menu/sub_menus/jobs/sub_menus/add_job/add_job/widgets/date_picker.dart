import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:nextminute/core/utils/helpers.dart';
import 'package:nextminute/core/utils/theme/nm_text_styles.dart';
import 'package:nextminute/features/wigdets/nm_widgets.dart';

class AddJobDatePicker extends StatelessWidget {
  const AddJobDatePicker({
    super.key,
    required this.label,
    required this.isAllDay,
    this.dateTime,
    required this.onDateTimeChanged,
    this.datePickerMode,
  });

  final bool isAllDay;
  final String label;
  final DateTime? dateTime;
  final void Function(DateTime) onDateTimeChanged;
  final CupertinoDatePickerMode? datePickerMode;

  @override
  Widget build(BuildContext context) {
    DateFormat formatter;

    if (isAllDay) {
      formatter = DateFormat('dd/MM/yyyy');
    } else {
      if (datePickerMode == CupertinoDatePickerMode.date) {
        formatter = DateFormat('dd/MM/yyyy');
      } else {
        formatter = DateFormat('dd/MM/yyyy ').add_jm();
      }
    }

    return IgnorePointer(
      ignoring: isAllDay,
      child: InkWell(
        onTap: () async {
          await showCupertinoModalBottomSheet<void>(
            context: context,
            builder: (context) {
              return SizedBox(
                height: 350,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        const Spacer(),
                        Expanded(
                          child: Text(label),
                        ),
                        NMCupertinoButton(
                          onPressed: Navigator.of(context).pop,
                          child: const Icon(
                            Icons.close,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Theme(
                        data: Theme.of(context).copyWith(
                          cupertinoOverrideTheme: const CupertinoThemeData(
                            primaryColor: Colors.black,
                          ),
                        ),
                        child: CupertinoDatePicker(
                          minimumDate: DateTime(2021),
                          maximumDate: DateTime(2025),
                          minuteInterval: 15,
                          initialDateTime: Helpers.roundToMinuteInterval(
                            DateTime.now(),
                            15,
                          ),
                          mode: datePickerMode ??
                              CupertinoDatePickerMode.dateAndTime,
                          onDateTimeChanged: onDateTimeChanged,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: NMCupertinoButton(
                        child: const Text(
                          'Today',
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                        onPressed: () {
                          onDateTimeChanged(DateTime.now());
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    SizedBox(height: Platform.isIOS ? 24 : 8),
                  ],
                ),
              );
            },
          );
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.5,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.shade400,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            dateTime == null
                ? 'dd/mm/yyyy'
                : formatter.format(dateTime!.toLocal()),
            style: NMTextStyles.b2(context)?.copyWith(
              color: dateTime == null ? Colors.grey : Colors.blue.shade900,
            ),
          ),
        ),
      ),
    );
  }
}
