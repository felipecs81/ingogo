import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:ingogo/domain/models/color_model.dart';
import 'package:ingogo/resources/dimensions.dart';
import 'package:ingogo/resources/strings.dart';
import 'package:ingogo/utils/app_enums.dart';
import 'package:ingogo/utils/app_utils.dart';
import 'package:ingogo/widgets/labels/custom_regular_label.dart';
import 'package:ingogo/widgets/structure/custom_app_bar_widget.dart';
import 'package:ingogo/widgets/structure/custom_scaffold.dart';

class ColorDetailsScreen extends StatefulWidget {
  const ColorDetailsScreen({Key? key, this.arguments}) : super(key: key);

  final Map? arguments;

  @override
  State<ColorDetailsScreen> createState() => _ColorDetailsScreenState();
}

class _ColorDetailsScreenState extends State<ColorDetailsScreen> {

  ColorModel? _colorModel;

  //Region override

  @override
  void initState() {
    _getInitialParams();
    super.initState();
  }

  //End region override

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBarWidget(
        title: _colorModel?.title ?? Strings.colourDetailsScreenTitle,),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Dimensions.defaultMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomRegularLabel('${Strings.author}: ${_colorModel?.userName}'),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: Dimensions.defaultItemsDistance),
                child: CustomRegularLabel('${Strings.views}: ${_colorModel?.numViews}'),
              ),
              CustomRegularLabel('${Strings.votes}: ${_colorModel?.numVotes}'),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: Dimensions.defaultItemsDistance),
                child: Html(data: _colorModel?.description),
              ),
              _hasImage()
                  ? Image.network(_colorModel!.imageUrl!)
                  : const SizedBox(),
            ],),
        ),
      ),);
  }

  bool _hasImage() {
    return _colorModel?.imageUrl != null;
  }

  void _getInitialParams() {
    _colorModel = widget.arguments?.getParameter(ParameterNames.colorModel);
  }
}

