import 'dart:developer';

import 'package:get/get.dart';
import 'package:hacker_news_app/models/models.dart';
import 'package:hacker_news_app/utils/constants/constants.dart';

class ApiResponseHandler {
  final Response _response;
  final Function(Response) _successCallback;

  ApiResponseHandler(this._response, {Function(Response)? successCallback})
      : _successCallback = successCallback ?? _handleSuccess;

  ResponseModel handleResponse() {
    late ResponseModel responseModel;

    switch (_response.statusCode) {
      case 200:
        responseModel = _successCallback(_response);
        break;
      case 400:
      case 404:
      case 422:
      case 401:
      case 403:
        responseModel = _handleClientError();
        break;
      case 500:
        responseModel = _handleServerError();
        break;
      default:
        responseModel = _handleUnknownError();
        break;
    }

    return responseModel;
  }

  static ResponseModel _handleSuccess(Response response) {
    var responseJson = response.body;
    var msg = responseJson['message'];
    return ResponseModel(true, msg);
  }

  ResponseModel _handleClientError() {
    var responseJson = _response.body;
    String errorMsg = responseJson['message'];
    return ResponseModel(false, errorMsg);
  }

  ResponseModel _handleServerError() {
    var responseJson = _response.body;
    String errorMsg = responseJson['message'];
    return ResponseModel(false, errorMsg);
  }

  ResponseModel _handleUnknownError() {
    return ResponseModel(false, Strings.unknownError);
  }
}
