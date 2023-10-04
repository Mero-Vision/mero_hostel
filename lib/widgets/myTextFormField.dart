// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyTextFormField extends StatelessWidget {
  MyTextFormField({
    Key? key,
    this.top,
    this.bottom,
    this.left,
    this.right,
    required this.hintText,
    required this.controller,
  }) : super(key: key);
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;
  final String hintText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: top ?? 0,
          bottom: bottom ?? 0,
          left: left ?? 0,
          right: right ?? 0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            hintText: hintText,
            helperStyle: TextStyle(fontSize: 20),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(14))),
      ),
    );
  }
}
