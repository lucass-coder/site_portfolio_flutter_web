// ignore_for_file: avoid_web_libraries_in_flutter

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'dart:html' as html;

import 'package:site_portfolio/winXp/screens/shutdown_xp.dart';

class StartUpButton extends StatefulWidget {
  const StartUpButton({Key? key}) : super(key: key);

  @override
  _StartUpButtonState createState() => _StartUpButtonState();
}

class _StartUpButtonState extends State<StartUpButton> {
  bool _hovered = false;
  bool _pressed = false;

  Color get filterColor {
    if (_pressed) {
      return Colors.black.withOpacity(0.05);
    }

    if (_hovered) {
      return Colors.white.withOpacity(0.05);
    }

    return Colors.transparent;
  }

  void _onEnter(PointerEnterEvent _) {
    setState(() {
      _hovered = true;
    });
  }

  void _onExit(PointerExitEvent _) {
    setState(() {
      _hovered = false;
    });
  }

  void _onTapDown(TapDownDetails _) {
    setState(() {
      _pressed = true;
    });
  }

  void _onTapUp(TapUpDetails _) {
    setState(() {
      _pressed = false;
    });
  }

  void _onTap() async {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const ShutdownXp()));
    Future.delayed(
      const Duration(seconds: 3),
      () => html.window.location.href = "https://www.google.com",
    );
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: _onEnter,
      onExit: _onExit,
      child: GestureDetector(
        onTapDown: _onTapDown,
        onTapUp: _onTapUp,
        onTap: _onTap,
        child: ClipRRect(
          child: ColorFiltered(
            colorFilter: ColorFilter.mode(filterColor, BlendMode.lighten),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 30,
                  height: 30,
                  child: Image.asset(
                    'assets/win-xp/images/shutdown.png',
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  'turnOf'.tr,
                  style: TextStyle(
                    decoration: _hovered ? TextDecoration.underline : null,
                    letterSpacing: 1,
                    fontSize: 14,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
