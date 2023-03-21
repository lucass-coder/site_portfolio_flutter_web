import 'package:flutter/material.dart';
import 'package:site_portfolio/winXp/widgets/icon_menu_bar_xp.dart';

class ToolbarIcons extends StatelessWidget {
  const ToolbarIcons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double iconSize = 20;
    double spaceIcons = 10;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const IconMenuBarXp(
          url: 'https://github.com/lucass-coder',
          socialNetwork: 'github',
        ),
        SizedBox(width: spaceIcons),
        const IconMenuBarXp(
          url: 'https://www.linkedin.com/in/lucas-santana-bb3a801b4/',
          socialNetwork: 'linkedin',
        ),
        SizedBox(width: spaceIcons),
        const IconMenuBarXp(
          url: 'https://www.instagram.com/lucaso.santana/',
          socialNetwork: 'instagram',
        ),
        const SizedBox(
          width: 6,
        ),
      ],
    );
  }
}
