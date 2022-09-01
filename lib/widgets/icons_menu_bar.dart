import 'package:flutter/material.dart';
import 'dart:html' as html;

class IconsMenuBar extends StatelessWidget {
  final String url;
  final String socialNetwork;

  const IconsMenuBar({Key? key, required this.url, required this.socialNetwork})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        html.window.open(url, 'new tab');
      },
      child: Image.asset(
        'assets/images/$socialNetwork.png',
        height: 20,
        width: 25,
      ),
    );
  }
}
