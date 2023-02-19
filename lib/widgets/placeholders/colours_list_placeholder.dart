import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:ingogo/domain/models/color_model.dart';
import 'package:ingogo/resources/dimensions.dart';
import 'package:ingogo/resources/strings.dart';
import 'package:ingogo/utils/app_enums.dart';
import 'package:ingogo/widgets/labels/custom_small_label.dart';

class ColoursListPlaceHolder extends StatelessWidget {
  const ColoursListPlaceHolder(
      {Key? key, required this.colorModel, required this.onClick})
      : super(key: key);

  final ColorModel colorModel;
  final Function() onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Column(children: [
        colorModel.layout == ColourListLayoutAlignment.top && _hasImageUrl() ? Padding(
          padding: const EdgeInsets.only(bottom: 4.0),
          child: Image.network(colorModel.imageUrl!, width: 100.0, height: 100.0,),
        ) : const SizedBox(),
        Row(
          children: [
            colorModel.layout == ColourListLayoutAlignment.left && _hasImageUrl() ? Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: Image.network(colorModel.imageUrl!, width: 100.0, height: 100.0,),
            ) : const SizedBox(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomSmallLabel('${Strings.title}: ${colorModel.title}'),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: Dimensions.defaultItemsDistance),
                    child: CustomSmallLabel('${Strings.author}: ${colorModel.userName}'),
                  ),
                  IgnorePointer(child: Html(data: colorModel.description)),
                ],
              ),
            ),
            colorModel.layout == ColourListLayoutAlignment.right && _hasImageUrl() ? Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Image.network(colorModel.imageUrl!, width: 100.0, height: 100.0,),
            ) : const SizedBox(),
          ],
        )
      ],),
    );
  }

  bool _hasImageUrl(){
    return colorModel.imageUrl != null;
  }
}
