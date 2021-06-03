import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<dynamic> showAdaptiveDialog({
  required String title,
  required String content,
}) {
  Widget dialog;
  if (Platform.isIOS) {
    dialog = CupertinoAlertDialog(
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        CupertinoDialogAction(
          child: Text('ok'),
          onPressed: Get.back,
        )
      ],
    );
  } else {
    dialog = AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        TextButton(
          child: Text('ok'),
          onPressed: Get.back,
        )
      ],
    );
  }

  return Get.dialog(dialog);
}
