import 'package:dio/dio.dart';

class Api {
  late Dio _dio;

  Api() {
    _dio = Dio(BaseOptions(baseUrl: 'http://localhost:3000'));
    _interceptors();
  }

  void _interceptors() {}

  Dio init() => _dio;
}
