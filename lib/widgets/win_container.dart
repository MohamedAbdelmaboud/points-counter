// ignore_for_file: use_key_in_widget_constructors
import 'package:flutter/material.dart';

class WinContainer extends StatelessWidget {
  final String text;
  const WinContainer({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        backgroundBlendMode: BlendMode.color,
        borderRadius: BorderRadius.circular(17),
        gradient: const LinearGradient(
            colors:  [Colors.cyan, Color.fromARGB(255, 231, 4, 174)],
            begin: Alignment.bottomRight,
            end: Alignment.bottomLeft),
      ),
      width: 330,
      height: 50,
      child: Center(
          child: Text(text,
              style: const TextStyle(
                  fontSize: 15, color: Colors.white, fontFamily: "pac"))),
    );
  }
}
