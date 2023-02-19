import 'package:flutter/material.dart';
import 'package:ingogo/domain/models/color_model.dart';
import 'package:ingogo/navigation/routes_const.dart';
import 'package:ingogo/utils/app_enums.dart';

class NavigationUtils {
  NavigationUtils._();

  static Future openColorDetailsScreen(BuildContext context,
  {required ColorModel colorModel,}) {
    return Navigator.pushNamed(context, colorsDetailsRoute,
      arguments: {
        ParameterNames.colorModel: colorModel,
      },);
  }
}
