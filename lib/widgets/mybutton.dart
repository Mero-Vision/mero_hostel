// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:mero_hostel/utils/constant.dart';

class MyButton extends StatelessWidget {
  MyButton({
    Key? key,
    required this.text,
    required this.ontap,
    this.height,
    this.width,
    this.radius,
    this.color,
    this.fontsize,
    this.fontWeight,
  }) : super(key: key);
  final String text;
  final void Function() ontap;
  final double? height;
  final double? width;
  final double? radius;
  final Color? color;
  final double? fontsize;
  final FontWeight? fontWeight;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: ontap,
        style: ButtonStyle(
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius ?? 14))),
            fixedSize:
                MaterialStatePropertyAll(Size(height ?? 350, width ?? 55)),
            backgroundColor: MaterialStatePropertyAll(color ?? KButtonColor)),
        child: Text(
          text,
          style: TextStyle(
              fontSize: fontsize ?? 20,
              fontWeight: fontWeight ?? FontWeight.w600),
        ));
  }
}
