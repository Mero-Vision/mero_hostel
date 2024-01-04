// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField({
    Key? key,
    this.top,
    this.bottom,
    this.validator,
    this.left,
    this.right,
    required this.hintText,
    required this.controller,
    this.obscureText,
    this.prefix,
    this.onChanged,
  }) : super(key: key);
  final double? top;
  final double? bottom;
  final String? Function(String?)? validator;
  final double? left;
  final double? right;
  final String hintText;
  final TextEditingController controller;
  final bool? obscureText;
  final Icon? prefix;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: top ?? 0,
          bottom: bottom ?? 0,
          left: left ?? 0,
          right: right ?? 0),
      child: TextFormField(
        onChanged: onChanged,
        obscureText: obscureText ?? false,
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
            prefixIcon: prefix,
            contentPadding: const EdgeInsets.all(10),
            hintText: hintText,
            helperStyle: const TextStyle(fontSize: 20),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(14))),
      ),
    );
  }
}
