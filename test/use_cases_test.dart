import "package:flutter_test/flutter_test.dart";
import "package:ingogo/data/repositories/colours_repository_imp.dart";
import "package:ingogo/domain/models/color_model.dart";
import "package:ingogo/domain/usecases/get_colours_list_use_case.dart";
import "package:ingogo/helpers/api_helper_imp.dart";
import "package:ingogo/helpers/mock_helper.dart";
import "package:mockito/annotations.dart";
import "package:mockito/mockito.dart";

import 'use_cases_test.mocks.dart';

@GenerateNiceMocks([MockSpec<ColoursRepository>()])
void main() {
  group("Colours use cases tests", () {
    test("Get colours and return a list of colours", () async {
      //Arrange
      GetColoursListUseCase getColoursListUseCase = GetColoursListUseCase(
          MockColoursRepository());
      when(getColoursListUseCase.execute())
          .thenAnswer((_) async => MockHelper.getColorsSuccessResponse());

      //Act
      final result = await getColoursListUseCase.execute();
      //Assert
      expect(result, isInstanceOf<List<ColorModel>>());
    });

    test("Get colours and return error", () async {
      //Arrange
      GetColoursListUseCase getColoursListUseCase = GetColoursListUseCase(
          MockColoursRepository());
      when(getColoursListUseCase.execute())
          .thenThrow(AppException(404, "Error", "Error"));
      //Assert
      expect(() async => await getColoursListUseCase.execute(),
          throwsException);
    });
  });
}
