import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/data/models/post.dart';

import 'package:get/get.dart';

import '../controllers/posts_controller.dart';

class PostsView extends GetView<PostsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      appBar: AppBar(
        title: Text('ScreetWall App'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.add)),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: controller.loadPosts,
        child: Obx(
          () => ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.all(10),
            itemCount: controller.posts.length,
            itemBuilder: (context, i) {
              Post post = controller.posts[i];
              return Card(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: ListTile(
                  key: Key('${post.id}'),
                  title: Text(post.text),
                  subtitle: Text(post.createdAt.toString()),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
