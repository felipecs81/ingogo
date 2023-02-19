import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ingogo/helpers/api_helper_imp.dart';
import 'package:ingogo/utils/app_enums.dart';
import 'package:ingogo/utils/constants.dart';
import 'package:ingogo/utils/ui_utils.dart';
import 'package:provider/provider.dart';

class AppUtils {

  AppUtils._();

  static void printInfo(String info) {
    if (kDebugVersion) {
      debugPrint(info);
    }
  }

  static Function(ApiResponse response) getResponseHandler(BuildContext context,
      {required Function(ApiResponse) onSuccess,
        Function(ApiResponse)? onError,
        bool showErrorMessage = true,
        String? loadingMessage}) {
    return (ApiResponse response) {
      switch (response.status) {
        case Status.completed:
          try {
            context.widget;
            onSuccess(response);
          } catch (e) {
            AppUtils.printInfo('Ignoring error because screen was closed $e');
          }
          break;
        case Status.error:
          try {
            context.widget;
            if (showErrorMessage) {
              UIUtils.showSnack(context, response.message!);
            }
            if (onError != null) {
              onError(response);
            }
          } catch (e) {
            AppUtils.printInfo('Ignoring error because screen was closed');
          }
          break;
      }
    };
  }

  static performActionWithDelay(Function action, {int delayInMs = 300}) {
    Future.delayed(Duration(milliseconds: delayInMs), () {
      action();
    });
  }

  static int getIntBetweenRange(int min, int max){
    final random = Random();
    return min + random.nextInt(max - min);
  }
}

T injectProvider<T>(BuildContext context, {bool listen = true}) {
  return Provider.of<T>(context, listen: listen);
}

extension Range on num {
  bool isBetween(num from, num to) {
    return from <= this && this <= to;
  }
}

extension MapExtensions on Map {
  getParameter(ParameterNames parameterName) {
    return this[parameterName];
  }
}