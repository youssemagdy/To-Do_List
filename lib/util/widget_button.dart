import 'package:flutter/material.dart';

// ignore: must_be_immutable
class WidgetButton extends StatelessWidget {
  WidgetButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) :
    super(key: key);

  final String text;
  VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
      child: Text(text, style: const TextStyle(color: Colors.white),),
    );
  }
}
