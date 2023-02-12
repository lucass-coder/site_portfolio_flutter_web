// ignore_for_file: avoid_web_libraries_in_flutter

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;

class OptionProject extends StatefulWidget {
  final String icon;
  final String name;
  final String url;

  const OptionProject({
    Key? key,
    required this.icon,
    required this.name,
    required this.url,
  }) : super(key: key);

  @override
  State<OptionProject> createState() => _OptionShutdowntState();
}

class _OptionShutdowntState extends State<OptionProject> {
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
          // html.window.location.href = widget.url;
          html.window.open(widget.url, 'new tab');
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
                    CachedNetworkImage(
                      imageUrl: 'assets/images-desktop/${widget.icon}.png',
                      // placeholder: (context, url) =>
                      //     const CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
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
