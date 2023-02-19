import 'package:ingogo/domain/models/color_model.dart';
import 'package:ingogo/domain/repositories/colours_repository.dart';

class GetColoursListUseCase {
  GetColoursListUseCase(this._coloursRepository);

  final IColoursRepository _coloursRepository;

  Future<List<ColorModel>?> execute() =>
      _coloursRepository.getColoursList();
}
