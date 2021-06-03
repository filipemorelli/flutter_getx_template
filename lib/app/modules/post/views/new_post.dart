import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/modules/post/controllers/post_controller.dart';
import 'package:get/get.dart';

class NewPostPage extends GetView<PostController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: MediaQuery.of(context).viewInsets,
      height: 300,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5),
          topRight: Radius.circular(5),
        ),
      ),
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
              child: Text(
                'New Post',
                style: TextStyle(fontSize: 18),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'type the text to you post',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 36,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.add),
                label: Text(
                  'save',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
