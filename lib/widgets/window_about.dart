import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WindowAbout extends StatefulWidget {
  final VoidCallback? onPressed;
  const WindowAbout({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  @override
  State<WindowAbout> createState() => _WindowAboutState();
}

class _WindowAboutState extends State<WindowAbout> {
  double selecionado = 1;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 440,
        height: 440,
        color: const Color(0xffC0C7C8),
        child: Column(
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: const Color(0xff181883),
                    width: 424,
                    height: 40,
                    child: Center(
                      child: Text(
                        'about'.tr,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 14.0, bottom: 14.0, left: 394.0, right: 14.0),
                  child: GestureDetector(
                    onTap: widget.onPressed,
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Container(
                        width: 30,
                        height: 28,
                        color: const Color(0xffC0C7C8),
                        child: const Icon(Icons.close),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              color: Colors.black,
              height: 374,
              width: 424,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'about_description'.tr,
                      textStyle: const TextStyle(
                          height: 2,
                          fontSize: 16.4,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Sans Serif',
                          color: Colors.white),
                      speed: const Duration(milliseconds: 30),
                    ),
                  ],
                  isRepeatingAnimation: false,
                  pause: const Duration(milliseconds: 1000),
                  stopPauseOnTap: true,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
