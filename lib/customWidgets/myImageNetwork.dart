// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MyImageNetwork extends StatelessWidget {
  const MyImageNetwork({
    Key? key,
    required this.imageUrl,
    required this.boxFit,
    required this.height,
    required this.width,
    this.color,
    this.blendMode,
  }) : super(key: key);
  final String imageUrl;
  final BoxFit boxFit;
  final double height;
  final double width;
  final Color? color;
  final BlendMode? blendMode;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: boxFit,
      height: height,
      width: width,
      color: color ,// Adjust the last value (opacity) as needed
      colorBlendMode: blendMode,

      placeholder: (context, url) =>
          const SizedBox(), // Placeholder widget while the image is loading
      errorWidget: (context, url, error) =>
          const Icon(Icons.error), // Widget to display in case of an error
    );
  }
}
