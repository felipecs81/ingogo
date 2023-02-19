import 'package:ingogo/domain/models/color_model.dart';

abstract class IColourAPI {
  Future<List<ColorModel>?> getColoursList();
}