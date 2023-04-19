// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

enum DocumentsIcon {
  icon95,
  iconxp,
}

extension DocumentsIconExtension on DocumentsIcon {
  String get assetUrl {
    switch (this) {
      case DocumentsIcon.icon95:
        return 'assets/images-desktop/';
      case DocumentsIcon.iconxp:
        return 'assets/win-xp/icons/';
      default:
        throw Exception('Icone Enum inválido!');
    }
  }
}

class IconMyDocument extends StatefulWidget {
  final String name;
  final String icon;

  IconMyDocument({
    Key? key,
    required this.name,
    required this.icon,
  }) : super(key: key);

  @override
  State<IconMyDocument> createState() => _IconMyDocumentState();
}

class _IconMyDocumentState extends State<IconMyDocument> {
  Color colorSelected = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    double sizeIcon = 32;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {},
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
                  Row(
                    children: [
                      Image.asset(
                        'win-xp/icons/${widget.icon}.png',
                        width: sizeIcon,
                        height: sizeIcon,
                      ),
                      Text(
                        widget.name,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
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
