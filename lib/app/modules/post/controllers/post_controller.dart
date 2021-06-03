import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/data/models/post.dart';
import 'package:flutter_getx_template/app/modules/post/views/new_post.dart';
import 'package:flutter_getx_template/app/repositories/post_repository.dart';
import 'package:flutter_getx_template/app/ui/functions/show_adaptive_dialog.dart';
import 'package:get/get.dart';

class PostController extends GetxController {
  final IPostRepository _repository;
  final posts = <Post>[].obs;
  final GlobalKey<ScaffoldMessengerState> scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController textController = TextEditingController(text: '');
  final isSaving = false.obs;

  PostController(this._repository);

  @override
  void onInit() {
    super.onInit();
    isSaving.value = false;
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

  String? validateTextPost(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please insert a message to your new post';
    }
    return null;
  }

  void openNewPostBottomSheet() {
    Get.bottomSheet(
      NewPostPage(),
      backgroundColor: Colors.black54,
    );
  }

  Future<void> saveNewPost() async {
    try {
      isSaving.value = true;
      if (formKey.currentState!.validate()) {
        await _repository.add(
          text: textController.text,
          createdAt: DateTime.now().millisecondsSinceEpoch,
        );
        textController.clear();
        await loadPosts();
        Get.back();
        await showAdaptiveDialog(
          title: 'Success',
          content: 'Your post was inserted with success!',
        );
      }
    } catch (e) {
      Get.defaultDialog(title: 'Error', content: Text(e.toString()));
    } finally {
      isSaving.value = false;
    }
  }
}
