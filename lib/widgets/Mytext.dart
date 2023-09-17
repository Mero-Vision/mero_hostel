// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  const MyText({
    Key? key,
    required this.text,
    required this.color,
  }) : super(key: key);
  //initializing variables
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: TextStyle(color: color),
      ),
    );
  }
}
