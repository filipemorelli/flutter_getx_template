import 'package:get/get.dart';

import 'package:flutter_getx_template/app/modules/post/bindings/post_binding.dart';
import 'package:flutter_getx_template/app/modules/post/views/post_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const String INITIAL = Routes.POSTS;

  static final List<GetPage<dynamic>> routes = <GetPage<dynamic>>[
    GetPage<dynamic>(
      name: _Paths.POSTS,
      page: () => const PostView(),
      binding: PostBinding(),
    ),
  ];
}
