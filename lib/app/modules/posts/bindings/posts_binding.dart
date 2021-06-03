import 'package:dio/dio.dart';
import 'package:flutter_getx_template/app/repositories/post_repository.dart';
import 'package:get/get.dart';

import '../controllers/posts_controller.dart';

class PostsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PostRepository>(() => PostRepository(Get.find<Dio>()));
    Get.lazyPut<PostsController>(
        () => PostsController(Get.find<PostRepository>()));
  }
}
