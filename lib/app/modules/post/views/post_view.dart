import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/data/models/post.dart';
import 'package:flutter_getx_template/app/modules/post/controllers/post_controller.dart';
import 'package:flutter_getx_template/app/modules/post/widgets/post_card_item.dart';
import 'package:flutter_getx_template/app/ui/widgets/refresh_list_adaptive.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PostView extends GetView<PostController> {
  const PostView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ScreetWall App'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: controller.openNewPostBottomSheet,
            icon: const Icon(Icons.add),
            tooltip: 'Insert new post',
          ),
        ],
      ),
      body: Obx(
        () => RefreshListAdaptive(
          onRefresh: controller.loadPosts,
          itemCount: controller.posts.length,
          itemBuilder: (BuildContext context, int i) {
            final Post post = controller.posts.reversed.toList()[i];
            return PostCardItem(
              key: Key(post.id.toString()),
              id: post.id.toString(),
              text: post.text,
              createdAt:
                  DateFormat.yMd().add_Hms().format(post.createdAtDatetime),
            );
          },
        ),
      ),
    );
  }
}
