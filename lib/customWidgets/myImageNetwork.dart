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
  }) : super(key: key);
  final String imageUrl;
  final BoxFit boxFit;
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit:boxFit ,
      height: height,
      width: width,
      placeholder: (context, url) =>
          const CircularProgressIndicator(), // Placeholder widget while the image is loading
      errorWidget: (context, url, error) =>
          const Icon(Icons.error), // Widget to display in case of an error
    );
  }
}
