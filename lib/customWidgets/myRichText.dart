// ignore: file_names
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:mero_hostel/utils/constant.dart';

class MyRichText extends StatelessWidget {
  const MyRichText({
    Key? key,
    required this.text1,
    required this.text2,
    this.top,
    this.left,
    this.right,
    this.bottom,
  }) : super(key: key);
  final String text1;
  final String text2;
  final double? top;
  final double? left;
  final double? right;
  final double? bottom;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: top ?? 0,
          right: right ?? 0,
          left: left ?? 0,
          bottom: bottom ?? 0),
      child: RichText(
        text: TextSpan(
            text: text1,
            style: TextStyle(
                color: AppColor.KTextColor,
                fontWeight: FontWeight.normal,
                fontSize: 18),
            children: [
              TextSpan(
                  text: text2,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.red.shade400,
                      fontWeight: FontWeight.bold))
            ]),
      ),
    );
  }
}
