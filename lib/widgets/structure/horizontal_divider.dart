import 'package:flutter/material.dart';

class HorizontalDivider extends StatelessWidget {
  const HorizontalDivider({Key? key, this.color = Colors.grey})
      : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 0.0,
      thickness: 0.8,
      color: color,
    );
  }
}
