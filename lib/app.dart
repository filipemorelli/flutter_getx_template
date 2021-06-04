import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/bindings/app_binding.dart';
import 'package:flutter_getx_template/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'flavors.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AppBinding(),
      title: F.title,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
