import 'package:flutter/material.dart';

class AssetImageLoader extends StatelessWidget {
  const AssetImageLoader(
      {Key? key, required this.path, this.width, this.height, this.color})
      : super(key: key);

  final String path;
  final double? width;
  final double? height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
            path,
            width: width,
            height: height,
            color: color,
            fit: BoxFit.cover,
          );
  }
}
