import 'package:ingogo/utils/app_enums.dart';

/// id : 3051543
/// title : "Happily Halloweeny"
/// userName : "grail143_gmail.com"
/// numViews : 15
/// numVotes : 1
/// numComments : 0
/// numHearts : 0
/// rank : 0
/// dateCreated : "2012-10-31 16:48:50"
/// colors : ["88AB32","361550","DEA745","91649A","4A1C57"]
/// description : "<a href=\"http://www.colourlovers.com/palette/2285499/Nestled\" target=\"_blank\"><img src=\"http://www.colourlovers.com/images/badges/pw/2285/2285499_Nestled.png\" style=\"width: 240px; height: 120px; border: 0 none;\" alt=\"Nestled\" /></a>\r\n<div style=\"width: 300px; text-align: center;\"><a href=\"http://www.colourlovers.com/contests/moo/minicard/2285499\" target=\"_blank\" style=\"display: block; margin-bottom: 5px; width: 300px; height: 120px; -moz-box-shadow: 0 1px 4px #d1d1d1; -webkit-box-shadow: 0 1px 4px #d1d1d1; box-shadow: 0 1px 4px #d1d1d1; filter: progid:DXImageTransform.Microsoft.Shadow(Strength=1, Direction=180, Color="
/// url : "http://www.colourlovers.com/pattern/3051543/Happily_Halloweeny"
/// imageUrl : "http://static.colourlovers.com/images/patterns/3051/3051543.png"
/// badgeUrl : "http://www.colourlovers.com/images/badges/n/3051/3051543_Happily_Halloweeny.png"
/// apiUrl : "http://www.colourlovers.com/api/pattern/3051543"
/// template : {"title":"Happy Halloween","url":"http://www.colourlovers.com/pattern/template/263611/Happy_Halloween","author":{"userName":"grail143_gmail.com","url":"http://www.colourlovers.com/lover/grail143_gmail.com"}}

class ColorModel {
  ColorModel({
      num? id, 
      String? title, 
      String? userName, 
      num? numViews, 
      num? numVotes, 
      num? numComments, 
      num? numHearts, 
      num? rank, 
      String? dateCreated, 
      List<String>? colors, 
      String? description, 
      String? url, 
      String? imageUrl, 
      String? badgeUrl, 
      String? apiUrl, 
      Template? template,}){
    _id = id;
    _title = title;
    _userName = userName;
    _numViews = numViews;
    _numVotes = numVotes;
    _numComments = numComments;
    _numHearts = numHearts;
    _rank = rank;
    _dateCreated = dateCreated;
    _colors = colors;
    _description = description;
    _url = url;
    _imageUrl = imageUrl;
    _badgeUrl = badgeUrl;
    _apiUrl = apiUrl;
    _template = template;
}

  ColorModel.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _userName = json['userName'];
    _numViews = json['numViews'];
    _numVotes = json['numVotes'];
    _numComments = json['numComments'];
    _numHearts = json['numHearts'];
    _rank = json['rank'];
    _dateCreated = json['dateCreated'];
    _colors = json['colors'] != null ? json['colors'].cast<String>() : [];
    _description = json['description'];
    _url = json['url'];
    _imageUrl = json['imageUrl'];
    _badgeUrl = json['badgeUrl'];
    _apiUrl = json['apiUrl'];
    _template = json['template'] != null ? Template.fromJson(json['template']) : null;
  }

  num? _id;
  String? _title;
  String? _userName;
  num? _numViews;
  num? _numVotes;
  num? _numComments;
  num? _numHearts;
  num? _rank;
  String? _dateCreated;
  List<String>? _colors;
  String? _description;
  String? _url;
  String? _imageUrl;
  String? _badgeUrl;
  String? _apiUrl;
  Template? _template;
  ColourListLayoutAlignment? layout;

ColorModel copyWith({  num? id,
  String? title,
  String? userName,
  num? numViews,
  num? numVotes,
  num? numComments,
  num? numHearts,
  num? rank,
  String? dateCreated,
  List<String>? colors,
  String? description,
  String? url,
  String? imageUrl,
  String? badgeUrl,
  String? apiUrl,
  Template? template,
}) => ColorModel(  id: id ?? _id,
  title: title ?? _title,
  userName: userName ?? _userName,
  numViews: numViews ?? _numViews,
  numVotes: numVotes ?? _numVotes,
  numComments: numComments ?? _numComments,
  numHearts: numHearts ?? _numHearts,
  rank: rank ?? _rank,
  dateCreated: dateCreated ?? _dateCreated,
  colors: colors ?? _colors,
  description: description ?? _description,
  url: url ?? _url,
  imageUrl: imageUrl ?? _imageUrl,
  badgeUrl: badgeUrl ?? _badgeUrl,
  apiUrl: apiUrl ?? _apiUrl,
  template: template ?? _template,
);
  num? get id => _id;
  String? get title => _title;
  String? get userName => _userName;
  num? get numViews => _numViews;
  num? get numVotes => _numVotes;
  num? get numComments => _numComments;
  num? get numHearts => _numHearts;
  num? get rank => _rank;
  String? get dateCreated => _dateCreated;
  List<String>? get colors => _colors;
  String? get description => _description;
  String? get url => _url;
  String? get imageUrl => _imageUrl;
  String? get badgeUrl => _badgeUrl;
  String? get apiUrl => _apiUrl;
  Template? get template => _template;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['userName'] = _userName;
    map['numViews'] = _numViews;
    map['numVotes'] = _numVotes;
    map['numComments'] = _numComments;
    map['numHearts'] = _numHearts;
    map['rank'] = _rank;
    map['dateCreated'] = _dateCreated;
    map['colors'] = _colors;
    map['description'] = _description;
    map['url'] = _url;
    map['imageUrl'] = _imageUrl;
    map['badgeUrl'] = _badgeUrl;
    map['apiUrl'] = _apiUrl;
    if (_template != null) {
      map['template'] = _template?.toJson();
    }
    return map;
  }

}

/// title : "Happy Halloween"
/// url : "http://www.colourlovers.com/pattern/template/263611/Happy_Halloween"
/// author : {"userName":"grail143_gmail.com","url":"http://www.colourlovers.com/lover/grail143_gmail.com"}

class Template {
  Template({
      String? title, 
      String? url, 
      Author? author,}){
    _title = title;
    _url = url;
    _author = author;
}

  Template.fromJson(dynamic json) {
    _title = json['title'];
    _url = json['url'];
    _author = json['author'] != null ? Author.fromJson(json['author']) : null;
  }
  String? _title;
  String? _url;
  Author? _author;

Template copyWith({  String? title,
  String? url,
  Author? author,
}) => Template(  title: title ?? _title,
  url: url ?? _url,
  author: author ?? _author,
);
  String? get title => _title;
  String? get url => _url;
  Author? get author => _author;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['url'] = _url;
    if (_author != null) {
      map['author'] = _author?.toJson();
    }
    return map;
  }

}

/// userName : "grail143_gmail.com"
/// url : "http://www.colourlovers.com/lover/grail143_gmail.com"

class Author {
  Author({
      String? userName, 
      String? url,}){
    _userName = userName;
    _url = url;
}

  Author.fromJson(dynamic json) {
    _userName = json['userName'];
    _url = json['url'];
  }
  String? _userName;
  String? _url;

Author copyWith({  String? userName,
  String? url,
}) => Author(  userName: userName ?? _userName,
  url: url ?? _url,
);
  String? get userName => _userName;
  String? get url => _url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userName'] = _userName;
    map['url'] = _url;
    return map;
  }
}