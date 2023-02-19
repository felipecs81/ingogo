import 'package:flutter/material.dart';
import 'package:ingogo/resources/styles.dart';

class CustomRegularLabel extends StatelessWidget {
  const CustomRegularLabel(this.text, {Key? key}) : super(key: key);

  final String? text;

  @override
  Widget build(BuildContext context) {
    return Text(text ?? '', style: TextStyles.mediumDarkStyle1,);
  }
}
