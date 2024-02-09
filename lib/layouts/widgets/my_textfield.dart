import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    required this.controller,
    this.minLines,
    this.maxLines,
    required this.label,
    this.isDark = true,
    required this.keyboardType,
    required this.validator,
  });

  final TextEditingController controller;
  final int? minLines, maxLines;
  final String label;
  final bool isDark;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      minLines: minLines,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        label: Text(label),
        alignLabelWithHint: true,
        border: UnderlineInputBorder(
          // borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: isDark ? Colors.white70 : Colors.black87,
          ),
        ),
      ),
    );
  }
}
