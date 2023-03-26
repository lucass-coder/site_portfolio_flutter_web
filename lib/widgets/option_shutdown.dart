// ignore_for_file: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'dart:html' as html;

import 'package:site_portfolio/screens/log_off.dart';

class OptionShutdown extends StatefulWidget {
  final String icon;
  final String name;

  const OptionShutdown({
    Key? key,
    required this.icon,
    required this.name,
  }) : super(key: key);

  @override
  State<OptionShutdown> createState() => _OptionShutdowntState();
}

class _OptionShutdowntState extends State<OptionShutdown> {
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
      child: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const LogOff()));
          Future.delayed(
            const Duration(seconds: 3),
            () => html.window.location.href = "https://www.google.com",
          );
        },
        child: Container(
          color: colorSelected,
          child: Column(
            children: [
              const SizedBox(height: 8),
              Container(
                color: colorSelected,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(width: 4),
                    Image.asset(
                      'assets/images-desktop/${widget.icon}.png',
                      width: 30,
                      height: 30,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      widget.name,
                      style: TextStyle(color: textColor),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
