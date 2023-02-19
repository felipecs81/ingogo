import 'package:flutter/material.dart';
import 'package:ingogo/di/di_components.dart';
import 'package:ingogo/navigation/router.dart';
import 'package:ingogo/navigation/routes_const.dart';
import 'package:ingogo/presentation/colors_list_screen.dart';
import 'package:ingogo/resources/colors.dart';
import 'package:ingogo/resources/strings.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: DIComponents.inject(),
      child: MaterialApp(
        title: Strings.appName,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            useMaterial3: true,
            primaryColor: AppColors.main,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            pageTransitionsTheme: const PageTransitionsTheme(builders: {
              TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
              TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            })),
        onGenerateRoute: CustomRouter.generateRoute,
        onUnknownRoute: (RouteSettings settings) {
          return MaterialPageRoute(builder: (_) => const ColorsListScreen());
        },
        initialRoute: mainRoute,
      ),
    );
  }
}