import 'package:flutter/material.dart';
import 'package:nextminute/core/utils/utils.dart';

class STDateSelection extends StatefulWidget {
  const STDateSelection({
    super.key,
    required this.onDateSelect,
  });

  final void Function(String) onDateSelect;

  @override
  State<STDateSelection> createState() => _STDateSelectionState();
}

class _STDateSelectionState extends State<STDateSelection> {
  String _selectedChoice = 'Daily';

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Select date view'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  RadioListTile(
                    title: const Text('Daily'),
                    contentPadding: EdgeInsets.zero,
                    value: 'Daily',
                    groupValue: _selectedChoice,
                    onChanged: (value) {
                      setState(() {
                        _selectedChoice = value!;
                      });
                      widget.onDateSelect.call(_selectedChoice);
                      Navigator.pop(context);
                    },
                  ),
                  RadioListTile(
                    title: const Text('Weekly'),
                    contentPadding: EdgeInsets.zero,
                    value: 'Weekly',
                    groupValue: _selectedChoice,
                    onChanged: (value) {
                      setState(() {
                        _selectedChoice = value!;
                      });
                      widget.onDateSelect.call(_selectedChoice);
                      Navigator.pop(context);
                    },
                  ),
                  RadioListTile(
                    title: const Text('Monthly'),
                    contentPadding: EdgeInsets.zero,
                    value: 'Monthly',
                    groupValue: _selectedChoice,
                    onChanged: (value) {
                      setState(() {
                        _selectedChoice = value!;
                      });
                      widget.onDateSelect.call(_selectedChoice);
                      Navigator.pop(context);
                    },
                  ),
                  RadioListTile(
                    title: const Text('All'),
                    contentPadding: EdgeInsets.zero,
                    value: 'All',
                    groupValue: _selectedChoice,
                    onChanged: (value) {
                      setState(() {
                        _selectedChoice = value!;
                      });
                      widget.onDateSelect.call(_selectedChoice);
                      Navigator.pop(context);
                    },
                  ),
                  RadioListTile(
                    title: const Text('Archived'),
                    contentPadding: EdgeInsets.zero,
                    value: 'Archived',
                    groupValue: _selectedChoice,
                    onChanged: (value) {
                      setState(() {
                        _selectedChoice = value!;
                      });
                      widget.onDateSelect.call(_selectedChoice);
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: NMColors.orange,
          ),
        ),
        child: Text(
          _selectedChoice,
          style: NMTextStyles.btn(context)?.copyWith(
            color: NMColors.orange,
          ),
        ),
      ),
    );
  }
}
