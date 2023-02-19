import 'package:ingogo/data/remote/api_addresses.dart';
import 'package:ingogo/domain/models/color_model.dart';
import 'package:ingogo/domain/remote/colours_api.dart';
import 'package:ingogo/helpers/api_helper.dart';
import 'package:ingogo/utils/app_utils.dart';

class ColourAPI implements IColourAPI {
  ColourAPI(this._apiHelper);

  final IApiHelper _apiHelper;

  @override
  Future<List<ColorModel>?> getColoursList() async {
    final response = await _apiHelper.getData(ApiAddresses.colours);
    AppUtils.printInfo('Get colours $response');
    return (response as List?)?.map((i) => ColorModel.fromJson(i)).toList();
  }
}
