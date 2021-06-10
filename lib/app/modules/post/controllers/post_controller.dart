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
  void onClose() {
    posts.close();
    isSaving.close();
  }

  Future<void> loadPosts() async {
    try {
      await getPosts();
    } catch (e) {
      Get.rawSnackbar(
        messageText: Text(
          e.toString(),
          style: const TextStyle(color: Colors.white),
        ),
      );
    }
  }

  Future<void> getPosts() async {
    try {
      posts.value = await _repository.getAll();
    } catch (e) {
      return Future<void>.error(e);
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

  Future<void> addNewPost() async {
    try {
      isSaving.value = true;
      if (formKey.currentState!.validate()) {
        await addPost();
        textController.clear(); // empty TextEditingController
        await getPosts();
        Get.back<void>(); // close bottomsheet
        await showAdaptiveDialog(
          title: 'Success',
          content: 'Your post was inserted with success!',
        );
      }
    } catch (e) {
      showAdaptiveDialog(title: 'Error', content: e.toString());
    } finally {
      isSaving.value = false;
    }
  }

  Future<Post> addPost() async {
    try {
      return _repository.add(
        text: textController.text,
        creationDate: DateTime.now().toString(),
      );
    } catch (e, stackTrace) {
      return Future<Post>.error(e, stackTrace);
    }
  }
}
