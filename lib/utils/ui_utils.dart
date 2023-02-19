import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:ingogo/resources/colors.dart';
import 'package:ingogo/resources/images.dart';
import 'package:ingogo/resources/styles.dart';
import 'package:ingogo/widgets/image/asset_image_loader.dart';

class UIUtils {
  UIUtils._();

  static void showSnack(BuildContext context, String msg,
      {int? duration, int? gravity, FocusNode? widgetToFocus}) {
    Flushbar(
      backgroundColor: AppColors.main,
      messageText: Text(
        msg,
        style: TextStyles.smallLightStyle,
      ),
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.GROUNDED,
      duration: const Duration(seconds: 3),
      icon: const SizedBox(
          width: 20.0,
          height: 20.0,
          child: AssetImageLoader(
            path: Images.logoImage,
          )),
    ).show(context);
    widgetToFocus?.requestFocus();
  }

}