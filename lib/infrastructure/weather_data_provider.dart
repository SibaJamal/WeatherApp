import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'dart:convert';
import '../core/exceptions.dart';

class NetworkHelper {
  final String url;
  NetworkHelper(this.url);

  Future fetchData() async {
    try {
      var dio = Dio();
      dio.interceptors.add(DioCacheManager(CacheConfig(baseUrl: url)).interceptor);
      Response response = await dio.get(url, options: buildCacheOptions(const Duration(days: 1), forceRefresh: true,),);
      if (response.statusCode == 200) {
        var data = jsonDecode(jsonEncode(response.data)) as Map<String, dynamic>;
        return data;
      }
    } catch (e){
      throw ConnectionException(e.toString());
    }
  }
}

