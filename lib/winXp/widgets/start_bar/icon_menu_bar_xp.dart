// ignore_for_file: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'dart:html' as html;

class IconMenuBarXp extends StatelessWidget {
  final String url;
  final String socialNetwork;

  const IconMenuBarXp(
      {Key? key, required this.url, required this.socialNetwork})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double iconSize = 20;

    return GestureDetector(
      onTap: () {
        html.window.open(url, 'new tab');
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Image.asset(
          'assets/win-xp/icons_startbar/${socialNetwork}_icon.png',
          width: iconSize,
          height: iconSize,
        ),
      ),
    );
  }
}
