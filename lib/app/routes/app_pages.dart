import 'package:get/get.dart';

import 'package:flutter_getx_template/app/modules/posts/bindings/posts_binding.dart';
import 'package:flutter_getx_template/app/modules/posts/views/posts_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.POSTS;

  static final routes = [
    GetPage(
      name: _Paths.POSTS,
      page: () => PostsView(),
      binding: PostsBinding(),
    ),
  ];
}
