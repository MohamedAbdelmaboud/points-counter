import 'package:flutter/material.dart';
import 'package:fourth_project/widgets/button.dart';

class CustomColumn extends StatefulWidget {
  const CustomColumn({
    super.key,
    required this.teamName,
    required this.imagePath,
    required this.variable,
    required this.onPressed1,
    required this.onPressed2,
    required this.onPressed3,
  });
  final String teamName;
  final String imagePath;
  final String variable;
  final void Function() onPressed1;
  final void Function() onPressed2;
  final void Function() onPressed3;

  @override
  State<CustomColumn> createState() => _CustomColumnState();
}

class _CustomColumnState extends State<CustomColumn> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.teamName,
          style: const TextStyle(
              fontSize: 20, fontFamily: "pac", color: Colors.white),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Image(
            image: AssetImage(widget.imagePath),
            width: 78,
            height: 131,
          ),
        ),
        Text(
          widget.variable,
          style: const TextStyle(fontSize: 70, color: Colors.white),
        ),
        MyButton(
            color: Colors.cyan,
            text: "Add 1 Points",
            onPressed: widget.onPressed1),
        const SizedBox(
          height: 5,
        ),
        MyButton(
            color: Colors.cyan,
            text: "Add 2 Points",
            onPressed: widget.onPressed2),
        const SizedBox(
          height: 5,
        ),
        MyButton(
            color: Colors.cyan,
            text: "Add 3 Points",
            onPressed: widget.onPressed3)
      ],
    );
  }
}
