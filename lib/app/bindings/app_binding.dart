import 'package:dio/dio.dart';
import 'package:flutter_getx_template/app/data/api.dart';
import 'package:get/get.dart';

class AppBinding implements Bindings {
  String _baseUrl;

  AppBinding(this._baseUrl);

  @override
  void dependencies() {
    Get.lazyPut<Dio>(() => Api(_baseUrl).init());
  }
}
