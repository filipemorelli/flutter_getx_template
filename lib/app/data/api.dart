import 'package:dio/dio.dart';

class Api {
  late Dio _dio;

  Api() {
    _dio = Dio(BaseOptions(baseUrl: 'http://192.168.2.110:3000'));
    _interceptors();
  }

  void _interceptors() {}

  Dio init() => _dio;
}
