import 'package:dio/dio.dart';
import 'package:flutter_getx_template/app/modules/post/controllers/post_controller.dart';
import 'package:flutter_getx_template/app/repositories/post_repository.dart';
import 'package:get/get.dart';

class PostBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PostRepository>(() => PostRepository(Get.find<Dio>()));
    Get.lazyPut<PostController>(
        () => PostController(Get.find<PostRepository>()));
  }
}
