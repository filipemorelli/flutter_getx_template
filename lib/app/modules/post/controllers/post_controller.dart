import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/data/models/post.dart';
import 'package:flutter_getx_template/app/modules/post/views/new_post.dart';
import 'package:flutter_getx_template/app/repositories/post_repository.dart';
import 'package:flutter_getx_template/app/ui/functions/show_adaptive_dialog.dart';
import 'package:get/get.dart';

class PostController extends GetxController {
  PostController(this._repository);

  final IPostRepository _repository;
  final RxList<Post> posts = <Post>[].obs;
  final GlobalKey<ScaffoldMessengerState> scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController textController = TextEditingController(text: '');
  final RxBool isSaving = false.obs;

  @override
  void onInit() {
    super.onInit();
    isSaving.value = false;
    loadPosts();
  }

  @override
  // ignore: unnecessary_overrides
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
    Get.bottomSheet<void>(
      const NewPostPage(),
      backgroundColor: Colors.black54,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5),
          topRight: Radius.circular(5),
        ),
      ),
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
        Get.back<void>();
        await showAdaptiveDialog(
          title: 'Success',
          content: 'Your post was inserted with success!',
        );
      }
    } catch (e) {
      Get.defaultDialog<void>(title: 'Error', content: Text(e.toString()));
    } finally {
      isSaving.value = false;
    }
  }
}
