import 'package:flutter/material.dart';
import 'package:notes_application/utils/constants/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.hintText,
      this.maxLines = 1,
      this.onSaved,
      this.controller,
      this.onChanged});
  final int maxLines;
  final String hintText;
  final void Function(String?)? onSaved;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      onSaved: onSaved,
      controller: controller,
      validator: (value) {
        if (value!.isEmpty) {
          return "Empty Fields!";
        } else {
          return null;
        }
      },
      maxLines: maxLines,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: KprimaryColor),
          border: customBorder(),
          enabledBorder: customBorder(),
          focusedBorder: customBorder(KprimaryColor)),
    );
  }
}

OutlineInputBorder customBorder([color]) {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: color ?? Colors.white));
}
