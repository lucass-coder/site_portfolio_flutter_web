// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class OptionsStart extends StatefulWidget {
  final String icon;
  final String name;

  OptionsStart({
    Key? key,
    required this.icon,
    required this.name,
  }) : super(key: key);

  @override
  State<OptionsStart> createState() => _OptionsStartState();
}

class _OptionsStartState extends State<OptionsStart> {
  bool isHovered = false;
  Color colorSelected = const Color(0xffC0C7C8);
  Color textColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() {
        colorSelected = Colors.blueAccent;
        textColor = Colors.white;
      }),
      onExit: (_) => setState(() {
        colorSelected = const Color(0xffC0C7C8);
        textColor = Colors.black;
      }),
      child: Container(
        color: colorSelected,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 4),
            Image.asset(
              'assets/images/${widget.icon}.png',
              width: 30,
              height: 30,
            ),
            const SizedBox(width: 4),
            Text(
              widget.name,
              style: TextStyle(color: textColor),
            ),
            const Spacer(),
            const Icon(Icons.arrow_right),
            const SizedBox(width: 4),
          ],
        ),
      ),
    );
  }
}
