import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/bindings/app_binding.dart';
import 'package:flutter_getx_template/app/routes/app_pages.dart';
import 'package:flutter_getx_template/flavors.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: AppBinding(F.env.serverHost),
      title: F.env.title,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
