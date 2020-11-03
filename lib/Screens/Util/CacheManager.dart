import 'package:wikisearch/Screens/WikiSearch/Models/SearchResponse.dart';

class CacheManager {
  static final shared = CacheManager._internal();

  factory CacheManager() {
    return shared;
  }

  CacheManager._internal() {
    data = Map<String, List<Pages>>();
  }

  static Map<String, List<Pages>> data;

  cacheResponse(String key, List<Pages> value) {
    data[key] = value;
  }

  getData(
    String key,
  ) {
    return data[key];
  }

  containData(String key) {
    return data.containsKey(key);
  }
}
