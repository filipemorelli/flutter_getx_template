import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/extensions/capitalize.dart';

class PostCardItem extends StatelessWidget {
  final String id;
  final String text;
  final String createdAt;

  const PostCardItem({
    Key? key,
    required this.id,
    required this.text,
    required this.createdAt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
      child: ListTile(
        key: Key(id),
        title: Text(text.capitalizeFirst),
        subtitle: Text(createdAt),
      ),
    );
  }
}
