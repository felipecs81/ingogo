import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:ingogo/domain/models/color_model.dart';
import 'package:ingogo/domain/usecases/get_colours_list_use_case.dart';
import 'package:ingogo/helpers/api_helper_imp.dart';

class ColorsListViewModel extends ChangeNotifier {
  ColorsListViewModel(this._getColoursListUseCase);

  final GetColoursListUseCase _getColoursListUseCase;

  final List<ColorModel> _coloursList = [];
  UnmodifiableListView<ColorModel> get coloursList =>
      UnmodifiableListView(_coloursList);

  void addColour(List<ColorModel> colours){
    _coloursList.addAll(colours);
  }

  void getColoursList(Function(ApiResponse response) onResult) async {
    performNetworkCall(
        _getColoursListUseCase.execute(), onResult);
  }
}
