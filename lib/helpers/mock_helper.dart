import 'package:ingogo/domain/models/color_model.dart';

class MockHelper {

  static final Map<String, dynamic> _colorApiResponse = {
    "id": 3051543,
    "title": "Happily Halloweeny",
    "userName": "grail143_gmail.com",
    "numViews": 15,
    "numVotes": 1,
    "numComments": 0,
    "numHearts": 0,
    "rank": 0,
    "dateCreated": "2012-10-31 16:48:50",
    "colors": [
      "88AB32",
      "361550",
      "DEA745",
      "91649A",
      "4A1C57"
    ],
    "description": "<a href=\"http://www.colourlovers.com/palette/2285499/Nestled\" target=\"_blank\"><img src=\"http://www.colourlovers.com/images/badges/pw/2285/2285499_Nestled.png\" style=\"width: 240px; height: 120px; border: 0 none;\" alt=\"Nestled\" /></a>\r\n<div style=\"width: 300px; text-align: center;\"><a href=\"http://www.colourlovers.com/contests/moo/minicard/2285499\" target=\"_blank\" style=\"display: block; margin-bottom: 5px; width: 300px; height: 120px; -moz-box-shadow: 0 1px 4px #d1d1d1; -webkit-box-shadow: 0 1px 4px #d1d1d1; box-shadow: 0 1px 4px #d1d1d1; filter: progid:DXImageTransform.Microsoft.Shadow(Strength=1, Direction=180, Color=",
    "url": "http://www.colourlovers.com/pattern/3051543/Happily_Halloweeny",
    "imageUrl": "http://static.colourlovers.com/images/patterns/3051/3051543.png",
    "badgeUrl": "http://www.colourlovers.com/images/badges/n/3051/3051543_Happily_Halloweeny.png",
    "apiUrl": "http://www.colourlovers.com/api/pattern/3051543",
    "template": {
      "title": "Happy Halloween",
      "url": "http://www.colourlovers.com/pattern/template/263611/Happy_Halloween",
      "author": {
        "userName": "grail143_gmail.com",
        "url": "http://www.colourlovers.com/lover/grail143_gmail.com"
      }
    }
  };

  static List<Map<String, dynamic>> getColorSuccessResponseFromJson() {
    return [_colorApiResponse];
  }

  static List<ColorModel> getColorsSuccessResponse() {
    return [
      ColorModel.fromJson(_colorApiResponse),
      ColorModel.fromJson(_colorApiResponse),
      ColorModel.fromJson(_colorApiResponse)
    ];
  }
}
