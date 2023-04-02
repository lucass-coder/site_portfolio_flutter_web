import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageIconBarXp extends StatefulWidget {
  const LanguageIconBarXp({Key? key}) : super(key: key);

  @override
  State<LanguageIconBarXp> createState() => _LanguageIconBarXpState();
}

class _LanguageIconBarXpState extends State<LanguageIconBarXp> {
  bool _hovered = false;
  bool _pressed = false;

  Color get filterColor {
    if (_pressed) {
      return Colors.white.withOpacity(0.05);
    }

    if (_hovered) {
      return Colors.white.withOpacity(0.15);
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
    'start_bar'.tr == 'Iniciar'
        ? Get.updateLocale(const Locale('en', 'US'))
        : Get.updateLocale(const Locale('pt', 'BR'));
  }

  bool isAtivo = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: _onEnter,
      onExit: _onExit,
      child: GestureDetector(
        onTap: _onTap,
        onTapDown: _onTapDown,
        onTapUp: _onTapUp,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 30,
              width: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: const Color.fromRGBO(16, 66, 175, 1),
                  width: 1,
                ),
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromRGBO(12, 89, 185, 1),
                    Color.fromRGBO(19, 158, 233, 1),
                    Color.fromRGBO(24, 181, 242, 1),
                    Color.fromRGBO(19, 155, 235, 1),
                    Color.fromRGBO(18, 144, 232, 1),
                    Color.fromRGBO(13, 141, 234, 1),
                    Color.fromRGBO(13, 159, 241, 1),
                    Color.fromRGBO(15, 158, 237, 1),
                    Color.fromRGBO(17, 155, 233, 1),
                    Color.fromRGBO(19, 146, 226, 1),
                    Color.fromRGBO(19, 126, 215, 1),
                    Color.fromRGBO(9, 91, 201, 1)
                  ],
                  stops: [
                    0.01,
                    0.06,
                    0.1,
                    0.14,
                    0.19,
                    0.63,
                    0.81,
                    0.88,
                    0.91,
                    0.94,
                    0.97,
                    1
                  ],
                ),
              ),
              child: ClipRRect(
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(filterColor, BlendMode.lighten),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(right: 0.0),
                            child: Text(
                                'start_bar'.tr == 'Iniciar' ? 'PT' : 'EN',
                                style: const TextStyle(color: Colors.white))),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
