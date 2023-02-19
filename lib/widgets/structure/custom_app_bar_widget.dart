import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ingogo/resources/colors.dart';
import 'package:ingogo/resources/styles.dart';

class CustomAppBarWidget extends StatelessWidget with PreferredSizeWidget {
  CustomAppBarWidget(
      {Key? key,
      this.title,
      this.actionList,
      this.showBackButton = true,
      this.child,
      this.elevation = 1.0,
      this.backgroundColor = Colors.white,
      this.centerTitle = true})
      : super(key: key);

  final List<Widget>? actionList;
  final String? title;
  final bool showBackButton;
  final Color backgroundColor;
  final Widget? child;
  final double elevation;
  final bool centerTitle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shadowColor: AppColors.grey,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarIconBrightness:
            Brightness.dark, //<-- For Android SEE HERE (dark icons)
        statusBarBrightness:
            Brightness.light, //<-- For iOS SEE HERE (dark icons)
      ),
      automaticallyImplyLeading: showBackButton,
      iconTheme: const IconThemeData(
        color: AppColors.main, //change your color here
      ),
      elevation: elevation,
      leading: showBackButton ? const BackButton() : null,
      centerTitle: centerTitle,
      actions: _getActionList(),
      backgroundColor: backgroundColor,
      surfaceTintColor: Colors.white,
      title: child ??
          Text(
            title ?? '',
            style: TextStyles.appBarTitleStyle,
          ),
    );
  }

  List<Widget>? _getActionList() {
    if (actionList != null) {
      actionList!.add(const SizedBox(
        width: 12.0,
      ));
    }
    return actionList;
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
