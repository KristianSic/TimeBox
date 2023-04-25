import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class API {
  Dio dio = Dio();
  String? token;
  String host = 'http://localhost:8080';
  String version = 'v1';
  final storage = const FlutterSecureStorage();

  API() {
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      token = await storage.read(key: 'token');
      options.headers['Authorization'] = 'Bearer $token';
      return handler.next(options);
    }, onError: (error, handler) async {
      if (error.response?.statusCode == 401) {}

      return handler.next(error);
    }));
  }

  path(endpoint) {
    return '$host/api/$version/$endpoint';
  }

  get(endpoint) async {
    return await dio.get(path(endpoint));
  }

  post(endpoint, data) async {
    return await dio.post(path(endpoint), data: data);
  }
}
