import "package:flutter_test/flutter_test.dart";
import "package:ingogo/data/remote/api_addresses.dart";
import "package:ingogo/data/remote/colours_api_imp.dart";
import "package:ingogo/domain/models/color_model.dart";
import "package:ingogo/domain/remote/colours_api.dart";
import "package:ingogo/helpers/api_helper_imp.dart";
import "package:ingogo/helpers/mock_helper.dart";
import "package:mockito/annotations.dart";
import "package:mockito/mockito.dart";

import "colours_api_test.mocks.dart";

@GenerateNiceMocks([MockSpec<ApiHelper>()])
void main() {
  group("Colours API tests", () {
    test("Get colours and return success", () async {
      //Arrange
      ApiHelper apiHelper = MockApiHelper();
      IColourAPI colourAPI =
      ColourAPI(apiHelper);
      when(apiHelper.getData(ApiAddresses.colours))
          .thenAnswer((_) async =>
          MockHelper.getColorSuccessResponseFromJson());
      //Act
      final result = await colourAPI.getColoursList();
      //Assert
      expect(result, isInstanceOf<List<ColorModel>>());
    });

    test("Get colour and return error", () async {
      //Arrange
      ApiHelper apiHelper = MockApiHelper();
      IColourAPI colourAPI = ColourAPI(apiHelper);

      when(apiHelper.getData(ApiAddresses.colours))
          .thenThrow(AppException(404, "Error", "Error"));
      //Assert
      expect(() async => await colourAPI.getColoursList(), throwsException);
    });
  });
}
