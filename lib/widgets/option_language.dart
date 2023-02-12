// ignore_for_file: prefer_const_constructors_in_immutables, avoid_web_libraries_in_flutter, unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OptionLanguage extends StatefulWidget {
  final String icon;
  final String name;
  final Function? onPressed;
  final bool translate;

  OptionLanguage({
    Key? key,
    required this.icon,
    required this.name,
    this.onPressed,
    this.translate = false,
  }) : super(key: key);

  @override
  State<OptionLanguage> createState() => _OptionShutdowntState();
}

class _OptionShutdowntState extends State<OptionLanguage> {
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
          widget.translate
              ? Get.updateLocale(const Locale('en', 'US'))
              : Get.updateLocale(const Locale('pt', 'BR'));
        },
        child: Container(
          width: 130,
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
