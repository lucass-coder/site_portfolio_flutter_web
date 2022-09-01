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

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() {
        colorSelected = Colors.blueAccent;
        //isHovered = newIsHovered;
      }),
      onExit: (_) => setState(() {
        colorSelected = const Color(0xffC0C7C8);
        //isHovered = newIsHovered;
      }),
      child: Container(
        color: colorSelected,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/${widget.icon}.png',
              width: 30,
              height: 30,
            ),
            const SizedBox(width: 4),
            Text(widget.name),
            const Spacer(),
            const Icon(Icons.arrow_right),
            const SizedBox(width: 4),
          ],
        ),
      ),
    );
  }
}
