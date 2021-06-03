import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/bindings/app_binding.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      initialBinding: AppBinding(),
      title: "ScreetWall App",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
