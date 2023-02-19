import 'package:flutter/material.dart';
import 'package:ingogo/resources/colors.dart';
import 'package:ingogo/resources/styles.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.isSolidColor = true,
    this.height = 50,
    this.width = double.infinity,
    this.isEnabled = true,
    this.child,
    this.radius = 14.0,
    this.applyBorder = false,
  }) : super(key: key);

  final Function() onPressed;
  final String text;
  final bool isSolidColor;
  final double height;
  final double width;
  final bool isEnabled;
  final Widget? child;
  final double radius;
  final bool applyBorder;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                isSolidColor ? AppColors.main : Colors.white),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                side: BorderSide(
                    color: AppColors.main,
                    width: 1.0,
                    style: applyBorder ? BorderStyle.solid : BorderStyle.none),
                borderRadius: BorderRadius.circular(radius),
              ),
            )),
        onPressed: !isEnabled ? null : onPressed,
        child: child ??
            Text(
              text,
              style: isSolidColor
                  ? TextStyles.mediumLightStyle1
                  : TextStyles.mediumMainStyle,
            ),
      ),
    );
  }
}
