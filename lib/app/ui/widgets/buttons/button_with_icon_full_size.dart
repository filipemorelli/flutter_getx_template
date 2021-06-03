import 'package:flutter/material.dart';

class ButtonWithIconFullSize extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  final Icon icon;

  const ButtonWithIconFullSize({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 36,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: icon,
        label: Text(
          text,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
