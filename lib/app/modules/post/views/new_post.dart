import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/modules/post/controllers/post_controller.dart';
import 'package:flutter_getx_template/app/modules/post/widgets/header_input_text.dart';
import 'package:flutter_getx_template/app/modules/post/widgets/input_text.dart';
import 'package:flutter_getx_template/app/ui/widgets/buttons/button_with_icon_full_size.dart';
import 'package:flutter_getx_template/app/ui/widgets/center_loading.dart';
import 'package:get/get.dart';

class NewPostPage extends GetView<PostController> {
  const NewPostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 300,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5),
          topRight: Radius.circular(5),
        ),
      ),
      child: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const HeaderInputText(text: 'New Post'),
              InputText(
                textEditingController: controller.textController,
                validator: controller.validateTextPost,
              ),
              Obx(
                () => controller.isSaving.value
                    ? const CenterLoading()
                    : ButtonWithIconFullSize(
                        onPressed: controller.saveNewPost,
                        text: 'save',
                        icon: const Icon(Icons.add),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
