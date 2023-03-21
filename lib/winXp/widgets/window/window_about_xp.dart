import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:site_portfolio/winXp/widgets/window/header/window_header.dart';

class WindowAboutXp extends StatelessWidget {
  final VoidCallback? onPressed;

  const WindowAboutXp({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  final Color _borderColor = const Color.fromRGBO(8, 49, 217, 1);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
        child: Stack(
          children: [
            SizedBox(
              width: 440,
              height: 440,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const WindowHeader(
                    focused: true,
                  ),

                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          color: _borderColor,
                          width: 3,
                        ),
                        right: BorderSide(
                          color: _borderColor,
                          width: 3,
                        ),
                        bottom: BorderSide(
                          color: _borderColor,
                          width: 3,
                        ),
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          color: Colors.black,
                          height: 390,
                          width: 440,
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
                        ),
                      ],
                    ),
                  ),
                  // Container(
                  //   color: Colors.white,
                  //   height: 390,
                  // )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
