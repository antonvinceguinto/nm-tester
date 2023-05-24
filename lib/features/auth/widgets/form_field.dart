import 'package:flutter/material.dart';
import 'package:nextminute/core/utils/input_validator.dart';

class NMFormField extends StatelessWidget {
  const NMFormField({
    super.key,
    required this.controller,
    required this.label,
    this.obscureText = false,
  });

  final TextEditingController controller;
  final String label;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    final isEmail = label == 'Email';

    return SizedBox(
      width: 500,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Required*';
          }

          if (isEmail) {
            return InputValidator.isEmail(value);
          }

          return null;
        },
        decoration: InputDecoration(
          hintText: label,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 16,
          ),
        ),
      ),
    );
  }
}
