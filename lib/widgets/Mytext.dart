// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:mero_hostel/utils/constant.dart';

class MyText extends StatelessWidget {
  MyText({
    Key? key,
    required this.text,
    this.color,
    required this.size,
    this.top,
    this.bottom,
    this.left,
    this.right,
    this.ontap,
  }) : super(key: key);
  //initializing variables
  final String text;
  final Color? color;
  final double size;
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;
  final void Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.only(
            top: top ?? 0,
            bottom: bottom ?? 0,
            left: left ?? 0,
            right: right ?? 0),
        child: Text(
          text,
          style: TextStyle(color: color ?? KTextColor, fontSize: size),
        ),
      ),
    );
  }
}
