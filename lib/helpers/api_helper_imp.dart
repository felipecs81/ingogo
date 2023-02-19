import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:ingogo/helpers/api_helper.dart';
import 'package:ingogo/utils/app_utils.dart';
import 'package:ingogo/utils/constants.dart';

class ApiHelper implements IApiHelper {
  ApiHelper();

  //Network requests

  @override
  Future<dynamic> getData(String url) async {
    _printCall(url, null);
    try {
      return _returnResponse(await http.get(
        _parseAddress(url),
      ));
    } on SocketException {
      throw _getFetchDataError();
    }
  }

  //End network requests

  Uri _parseAddress(String url) {
    return Uri.parse(url);
  }

  void _printCall(String? url, Map? parameters) {
    AppUtils.printInfo('Url $url');
    AppUtils.printInfo('Body ${parameters?.toString()}');
  }

  dynamic _returnResponse(http.Response response) {
    AppUtils.printInfo('Response = ${response.statusCode} - ${response.body}');
    int statusCode = response.statusCode;
    /*
    Informational responses (100–199)
    Successful responses (200–299)
    Redirects (300–399)
    Client errors (400–499)
    Server errors (500–599)
     */

    if (statusCode.isSuccessResponse()) {
      return json.decode(response.body.toString());
    } else if (statusCode.isBadRequestResponse()) {
      throw BadRequestException(statusCode, jsonDecode(response.body)['error'],
          jsonDecode(response.body)['code']);
    } else if (statusCode.isUnauthorisedResponse()) {
      throw UnauthorisedException(
          statusCode,
          jsonDecode(response.body)['error'],
          jsonDecode(response.body)['code']);
    } else if (statusCode.isExceptionResponse()) {
      throw FetchDataException(statusCode,
          'The service is unavailable at the moment. Please try again later.');
    } else {
      return json.decode(jsonDecode(response.body)['error']);
    }
  }

  FetchDataException _getFetchDataError() {
    return FetchDataException(1,
        'It looks there is an issue with your internet connection at the moment. Please try again later.');
  }
}

//Error handler classes

class AppException<T> extends ApiResponse implements Exception {
  final dynamic _message;
  final int? _statusCode;
  final String? _errorCode;

  AppException([this._statusCode, this._message, this._errorCode])
      : super.error(_message, _statusCode, _errorCode);

  @override
  String toString() {
    return kDebugVersion ? '$_message - $_statusCode - $_errorCode' : _message;
  }
}

class FetchDataException extends AppException {
  FetchDataException([
    int? code,
    String? message,
  ]) : super(code, message);
}

class BadRequestException extends AppException {
  BadRequestException([int? code, String? message, String? errorCode])
      : super(code, message, errorCode);
}

class UnauthorisedException extends AppException {
  UnauthorisedException([int? code, String? message, String? errorCode])
      : super(code, message, errorCode);
}

class InvalidInputException extends AppException {
  InvalidInputException([int? code, String? message, String? errorCode])
      : super(code, message, errorCode);
}

class UserCancelledOperationException extends AppException {
  UserCancelledOperationException([int? code, String? message])
      : super(code, message);
}

//End Error handler classes

//Response classes
class ApiResponse<T> {
  Status status;
  T? data;
  String? message;
  int? statusCode;
  String? errorCode;

  ApiResponse.completed(this.data) : status = Status.completed;
  ApiResponse.error(this.message, this.statusCode, this.errorCode)
      : status = Status.error;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}

enum Status { completed, error }

enum APICallType {
  post,
  get,
  patch,
  delete,
}

//End response classes

extension HttpRequestCodeExtensions on int {
  bool isSuccessResponse() {
    return isBetween(200, 299);
  }

  bool isBadRequestResponse() {
    return this == 400;
  }

  bool isUnauthorisedResponse() {
    return isBetween(401, 499);
  }

  bool isExceptionResponse() {
    return isBetween(500, 599);
  }
}

performNetworkCall(Future call, Function(ApiResponse response) onResult,
    {Function(ApiResponse)? onSuccess}) async {
  ApiResponse apiResponse;

  try {
    apiResponse = ApiResponse.completed(await call);
    if (onSuccess != null) onSuccess(apiResponse);
  } catch (e) {
    AppUtils.printInfo(e.toString());
    try {
      apiResponse = ApiResponse.error(
          e.toString(), (e as dynamic).statusCode, (e as dynamic).errorCode);
    } catch (exception) {
      apiResponse = apiResponse = ApiResponse.error(e.toString(), 0, '');
    }
  }
  onResult(apiResponse);
}
