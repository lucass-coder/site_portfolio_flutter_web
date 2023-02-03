import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OptionStart extends StatelessWidget {
  final String icon;
  final String name;
  final PointerEnterEventListener? onHover;
  final PointerExitEventListener? onExit;
  final bool isHovered;

  const OptionStart({
    Key? key,
    required this.icon,
    required this.name,
    this.onHover,
    this.onExit,
    required this.isHovered,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: onHover,
      onExit: onExit,
      child: GestureDetector(
        // onTap: widget.onExit,
        child: Container(
          color: isHovered ? Colors.blueAccent : const Color(0xffC0C7C8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 4),
              Image.asset(
                'assets/images-desktop/$icon.png',
                width: 30,
                height: 30,
              ),
              const SizedBox(width: 4),
              Text(
                name,
                style:
                    TextStyle(color: isHovered ? Colors.white : Colors.black),
              ),
              const Spacer(),
              const Icon(Icons.arrow_right),
              const SizedBox(width: 4),
            ],
          ),
        ),
      ),
    );
  }
}
