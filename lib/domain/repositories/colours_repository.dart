import 'package:ingogo/domain/models/color_model.dart';

abstract class IColoursRepository {
  Future<List<ColorModel>?> getColoursList();
}
