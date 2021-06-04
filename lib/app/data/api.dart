import 'package:dio/dio.dart';

class Api {
  late Dio _dio;

  Api(String baseUrl) {
    _dio = Dio(BaseOptions(baseUrl: baseUrl));
    _interceptors();
  }

  void _interceptors() {}

  Dio init() => _dio;
}
