import 'package:wikisearch/Screens/Constants/Constants.dart';
import 'ApiBase.dart';
import 'ApiResponse.dart';

class AppApi extends ApiBase {
  static final AppApi _shared = AppApi._internal();
  factory AppApi() {
    return _shared;
  }
  AppApi._internal();

  getSearchfor(String text) async {
    final url = SEARCH + text;
    try {
      APIServiceManager api = APIServiceManager(url);
      ApiResponse response = await api.get();
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
