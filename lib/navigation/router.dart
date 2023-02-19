import 'package:flutter/material.dart';
import 'package:ingogo/navigation/routes_const.dart';
import 'package:ingogo/presentation/color_details_screen.dart';
import 'package:ingogo/presentation/colors_list_screen.dart';

class CustomRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case mainRoute:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const ColorsListScreen());
      case colorsDetailsRoute:
        return MaterialPageRoute(
            settings: settings,
            builder: (_) =>
                ColorDetailsScreen(
                  arguments: settings.arguments as Map<dynamic, dynamic>?,));
      default:
        return null;
    }
  }
}
