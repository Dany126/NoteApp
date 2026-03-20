import 'package:flutter/material.dart';
import 'package:note_app/constant.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.maxLines = 1,
    required this.hint,
    this.onChanged, // Renamed from onChanging for convention
    this.validator,
    this.onSaved,
    this.initialValue, // Added onSaved for form submission
  });

  final int maxLines;
  final String hint;
  final String? initialValue;

  final void Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved; // Added for form saving

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: widget.initialValue,
      // Removed the Form wrapper!
      style: const TextStyle(color: Colors.white),
      maxLines: widget.maxLines,
      cursorColor: kPrimaryColor,
      onChanged: widget.onChanged,
      validator: widget.validator,
      onSaved: widget.onSaved, // Added onSaved
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: const TextStyle(color: Colors.grey),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: kPrimaryColor),
        ),
        errorBorder: OutlineInputBorder(
          // Added for validation errors
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          // Added for validation errors
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}
