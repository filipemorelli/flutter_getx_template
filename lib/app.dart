import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/bindings/app_binding.dart';
import 'package:flutter_getx_template/app/env/env.dart';
import 'package:flutter_getx_template/app/routes/app_pages.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: AppBinding(Env.serverHost),
      title: Env.title,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
