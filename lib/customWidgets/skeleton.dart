// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Skeleton extends StatelessWidget {
  const Skeleton({
    Key? key,
    required this.widget,
  }) : super(key: key);
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      child: widget,
      baseColor: Colors.grey.shade400,
      highlightColor: Colors.grey.shade300,
    );
  }
}
