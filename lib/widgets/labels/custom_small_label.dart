import 'package:flutter/material.dart';
import 'package:ingogo/resources/styles.dart';

class CustomSmallLabel extends StatelessWidget {
  const CustomSmallLabel(this.text, {Key? key}) : super(key: key);

  final String? text;

  @override
  Widget build(BuildContext context) {
    return Text(text ?? '', style: TextStyles.smallDarkStyle,);
  }
}
