import 'package:dio/dio.dart';
import 'package:flutter_getx_template/app/data/api.dart';
import 'package:get/get.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Dio>(() => Api().init());
  }
}
