import 'package:flutter/material.dart';

class HeaderInputText extends StatelessWidget {
  final String text;

  HeaderInputText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
      child: Text(
        text,
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
