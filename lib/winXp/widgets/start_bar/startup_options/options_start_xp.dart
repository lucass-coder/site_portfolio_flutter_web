import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OptionStartXp extends StatefulWidget {
  final String icon;
  final String name;
  final PointerEnterEventListener? onHover;
  final PointerExitEventListener? onExit;
  final bool isHovered;

  const OptionStartXp({
    Key? key,
    required this.icon,
    required this.name,
    this.onHover,
    this.onExit,
    required this.isHovered,
  }) : super(key: key);

  @override
  State<OptionStartXp> createState() => _OptionStartXpState();
}

class _OptionStartXpState extends State<OptionStartXp> {
  var isHovered = false;

  void _onEnter(PointerEnterEvent _) {
    setState(() {
      isHovered = true;
    });
  }

  void _onExit(PointerExitEvent _) {
    setState(() {
      isHovered = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: _onEnter,
      onExit: _onExit,
      child: GestureDetector(
        child: Container(
          height: 40,
          color: isHovered ? Colors.blueAccent : const Color(0xFFD3E5FD),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 4),
              Image.asset(
                'assets/win-xp/icons/${widget.icon}.png',
                width: 30,
                height: 30,
              ),
              const SizedBox(width: 8),
              Text(
                widget.name,
                style: TextStyle(
                    color: widget.isHovered ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              // const Spacer(),
              // const Icon(Icons.arrow_right),
              // const SizedBox(width: 4),
            ],
          ),
        ),
      ),
    );
  }
}
