import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:wikisearch/Screens/Constants/Constants.dart';
import 'ApiResponse.dart';
import 'AppException.dart';
import 'StringConstants.dart';

abstract class ApiBase {
  final String url;
  ApiBase({this.url});

  Future<dynamic> get() async {
    final headers = {"contennt-type": "application/json"};
    try {
      final response = await http.get(url, headers: headers);
      final ApiResponse responseJson = _processResponse(response);
      return responseJson;
    } on SocketException {
      throw FetchDataException(StringConstants.noInternetConnection);
    } catch (error) {
      throw Exception(error);
    }
  }

  ApiResponse _processResponse(http.Response response) {
    ApiResponse apiResponse = ApiResponse.error(response.body.toString());
    switch (response.statusCode) {
      case HttpStatus.created:
      case HttpStatus.ok:
        final data = response.body != null && response.body.length > 0
            ? json.decode(response.body)
            : "";
        apiResponse = ApiResponse.complete(data);
        break;
      case HttpStatus.badRequest:
        throw BadRequestException(response.body.toString());

      case HttpStatus.unauthorized:
        throw UnauthorisedException(response.body.toString());

      case HttpStatus.forbidden:
        throw UnauthorisedException(response.body.toString());

      case HttpStatus.notFound:
        throw UnauthorisedException(StringConstants.notFound);
        break;

      case HttpStatus.internalServerError:
        throw UnauthorisedException(response.body.toString());

      case HttpStatus.serviceUnavailable:
        throw UnauthorisedException(StringConstants.serviceUnavailable);

      default:
        final data = response.body != null && response.body.length > 0
            ? json.decode(response.body)
            : "";
        apiResponse = ApiResponse.error("Something went wrong");
        print("error: $data");
    }
    return apiResponse;
  }
}

class APIServiceManager extends ApiBase {
  APIServiceManager(serviceUrl) : super(url: BASE_URL + serviceUrl);
}
