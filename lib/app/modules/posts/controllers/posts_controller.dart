import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/data/models/post.dart';
import 'package:flutter_getx_template/app/repositories/post_repository.dart';
import 'package:get/get.dart';

class PostsController extends GetxController {
  final IPostRepository _repository;

  PostsController(this._repository);

  final posts = <Post>[].obs;
  final GlobalKey<ScaffoldMessengerState> scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();
  @override
  void onInit() {
    super.onInit();
    loadPosts();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<void> loadPosts() async {
    try {
      posts.value = await _repository.getAll();
    } catch (e) {
      scaffoldKey.currentState
          ?.showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
}
