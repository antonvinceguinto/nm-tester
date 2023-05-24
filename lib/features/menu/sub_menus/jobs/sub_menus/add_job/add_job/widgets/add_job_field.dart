import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nextminute/core/utils/input_validator.dart';
import 'package:nextminute/core/utils/theme/nm_text_styles.dart';

class AddJobField extends StatelessWidget {
  const AddJobField({
    super.key,
    required this.hint,
    required this.controller,
    this.maxLines = 1,
    this.maxLength = 100,
    this.inputFormatters,
    this.onChanged,
    this.keyboardType = TextInputType.text,
  });

  final String hint;
  final TextEditingController controller;
  final int? maxLines;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType keyboardType;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      maxLength: maxLength,
      style: NMTextStyles.b2(context),
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hint,
        counterText: '',
        alignLabelWithHint: true,
      ),
      onChanged: onChanged,
      validator: hint.contains('*') ? InputValidator.isEmpty : null,
    );
  }
}
