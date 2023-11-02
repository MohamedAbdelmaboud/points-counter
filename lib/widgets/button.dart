// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, library_private_types_in_public_api
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  //variables
  final Color color;
  final String text;
  final void Function() onPressed;
  const MyButton(
      {required this.color, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shadowColor: const Color.fromARGB(255, 0, 217, 255),
          elevation: 5,
          minimumSize: const Size(70, 40)),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
            fontFamily: "zilla", fontSize: 15, fontWeight: FontWeight.bold),
      ),
    );
  }
}
