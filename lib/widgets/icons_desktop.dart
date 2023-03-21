// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

enum DesktopIcon {
  icon95,
  iconxp,
}

extension DesktopIconExtension on DesktopIcon {
  String get assetUrl {
    switch (this) {
      case DesktopIcon.icon95:
        return 'assets/images-desktop/';
      case DesktopIcon.iconxp:
        return 'assets/win-xp/icons/';
      default:
        throw Exception('Icone Enum inválido!');
    }
  }
}

class IconsDesktop extends StatefulWidget {
  final String name;
  final String icon;
  final DesktopIcon iconSystem;
  final bool isAtivo;
  final VoidCallback? onPressed;

  IconsDesktop({
    Key? key,
    required this.name,
    required this.icon,
    required this.iconSystem,
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
    double sizeIcon = 0;

    switch (widget.iconSystem) {
      case DesktopIcon.icon95:
        sizeIcon = 60;
        break;
      case DesktopIcon.iconxp:
        sizeIcon = 45;
        break;
      default:
        throw Exception('Icone Enum inválido!');
    }
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
                    '${widget.iconSystem.assetUrl}${widget.icon}.png',
                    width: sizeIcon,
                    height: sizeIcon,
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
