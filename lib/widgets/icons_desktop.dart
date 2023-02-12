// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class IconsDesktop extends StatefulWidget {
  final String name;
  final String icon;
  final bool isAtivo;
  final VoidCallback? onPressed;

  IconsDesktop({
    Key? key,
    required this.name,
    required this.icon,
    required this.isAtivo,
    this.onPressed,
  }) : super(key: key);

  @override
  State<IconsDesktop> createState() => _IconsDesktopState();
}

class _IconsDesktopState extends State<IconsDesktop> {
  Color colorSelected = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: MouseRegion(
          onEnter: (_) => setState(() {
            colorSelected = Colors.blueAccent;
          }),
          onExit: (_) => setState(() {
            colorSelected = Colors.transparent;
          }),
          child: Container(
            color: colorSelected,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 16, bottom: 16, left: 24, right: 24),
              child: Column(
                children: [
                  Image.asset(
                    'assets/assets/images-desktop/${widget.icon}.png',
                    width: 60,
                    height: 60,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
