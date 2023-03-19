import 'package:flutter/material.dart';

class ToolbarIcons extends StatelessWidget {
  const ToolbarIcons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double iconSize = 20;
    double spaceIcons = 10;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          'assets/win-xp/icons_startbar/github_icon.png',
          width: iconSize,
          height: iconSize,
        ),
        SizedBox(
          width: spaceIcons,
        ),
        Image.asset(
          'assets/win-xp/icons_startbar/linkedin_icon.png',
          width: iconSize,
          height: iconSize,
        ),
        SizedBox(
          width: spaceIcons,
        ),
        Image.asset(
          'assets/win-xp/icons_startbar/instagram_icon.png',
          width: iconSize,
          height: iconSize,
        ),
        const SizedBox(
          width: 6,
        ),
      ],
    );
  }
}
