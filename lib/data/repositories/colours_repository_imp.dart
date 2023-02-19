import 'package:ingogo/domain/models/color_model.dart';
import 'package:ingogo/domain/remote/colours_api.dart';
import 'package:ingogo/domain/repositories/colours_repository.dart';

class ColoursRepository implements IColoursRepository {
  ColoursRepository(this._colourAPI);

  final IColourAPI _colourAPI;

  @override
  Future<List<ColorModel>?> getColoursList() async {
    return await _colourAPI.getColoursList();
  }
}
