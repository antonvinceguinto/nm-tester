import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:nextminute/core/utils/utils.dart';
import 'package:nextminute/features/wigdets/nm_always_scroll.dart';
import 'package:nextminute/features/wigdets/nm_widgets.dart';

class EditableItem<C extends StateStreamable<S>, S, T> extends StatefulWidget {
  const EditableItem({
    super.key,
    this.status,
    this.nameController,
    required this.onPressed,
  });

  final T? status;
  final TextEditingController? nameController;
  final void Function()? onPressed;

  @override
  State<EditableItem<C, S, T>> createState() => _EditableItemState();
}

class _EditableItemState<C extends StateStreamable<S>, S, T>
    extends State<EditableItem<C, S, T>> {
  late TextEditingController _nameController;

  Color? pickerColor;
  Color? currentColor;

  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(
      text: ((widget.status as dynamic).name ?? '') as String,
    );

    if ((widget.status as dynamic).color != null) {
      currentColor = Color(
        (((widget.status as dynamic).color as dynamic) as String).toHexColor(),
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDeleted = ((widget.status as dynamic).isdeleted ?? false) as bool;

    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: widget.nameController ?? _nameController,
            style: (((widget.status as dynamic).isdeleted ?? false) as bool)
                ? NMTextStyles.b2(context)?.copyWith(
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough,
                  )
                : NMTextStyles.b2(context),
            validator: InputValidator.isEmpty,
            decoration: const InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.fromLTRB(10, 16, 16, 0),
            ),
            onChanged: (value) {
              (context.read<C>() as dynamic)
                  .updateItemName(widget.status!, value);
            },
          ),
        ),
        const SizedBox(width: 8),
        _buildDeleteButton(),
        if (currentColor != null)
          InkWell(
            onTap: isDeleted ? null : _showColorPicker,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: isDeleted ? Colors.transparent : currentColor,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
      ],
    ).paddingSymmetric(horizontal: 16, vertical: 8);
  }

  void _showColorPicker() {
    showDialog<void>(
      builder: (context) => AlertDialog(
        title: const Text('Pick a color!'),
        content: AlwaysScroll(
          child: ColorPicker(
            pickerColor: pickerColor ?? currentColor ?? Colors.blue,
            onColorChanged: changeColor,
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Choose'),
            onPressed: () {
              setState(() => currentColor = pickerColor ?? currentColor);

              final hexValue = '#${currentColor?.value.toRadixString(16)}';

              (context.read<C>() as dynamic)
                  .updateItemColor(widget.status!, hexValue);

              Future.delayed(const Duration(milliseconds: 200), () {
                Navigator.of(context).pop();
              });
            },
          ),
        ],
      ),
      context: context,
    );
  }

  Widget _buildDeleteButton() {
    final isDeleted = ((widget.status as dynamic).isdeleted ?? false) as bool;

    return NMCupertinoButton(
      onPressed: widget.onPressed,
      padding: EdgeInsets.zero,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: Colors.grey.shade400,
          ),
        ),
        child: Text(
          'Delete',
          style: NMTextStyles.b2(context)?.copyWith(
            color: isDeleted ? Colors.grey : Colors.black,
          ),
        ),
      ),
    ).paddingOnly(right: 8);
  }
}
