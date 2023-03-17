import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageIconBar extends StatefulWidget {
  final String icon;

  const LanguageIconBar({Key? key, required this.icon}) : super(key: key);

  @override
  State<LanguageIconBar> createState() => _LanguageIconBarState();
}

class _LanguageIconBarState extends State<LanguageIconBar> {
  bool isAtivo = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        'start_bar'.tr == 'Iniciar'
            ? Get.updateLocale(const Locale('en', 'US'))
            : Get.updateLocale(const Locale('pt', 'BR'));
      },
      onTapDown: (TapDownDetails details) {
        setState(() {
          isAtivo = true;
        });
      },
      onTapUp: (TapUpDetails details) {
        setState(() {
          isAtivo = false;
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(children: [
            Container(
              height: 30,
              width: 35,
              decoration: BoxDecoration(color: Colors.grey, boxShadow: [
                BoxShadow(
                  color: isAtivo ? Colors.white : Colors.black,
                  spreadRadius: 1,
                  blurRadius: 0,
                  offset: const Offset(1, 1), // changes position of shadow
                ),
              ]),
            ),
            Container(
              height: 30,
              width: 35,
              decoration:
                  BoxDecoration(color: const Color(0xffC0C7C8), boxShadow: [
                BoxShadow(
                  color: isAtivo ? Colors.black : Colors.white,
                  spreadRadius: 1,
                  blurRadius: 0,
                  offset: const Offset(-1, -1), // changes position of shadow
                ),
              ]),
              child: Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 0.0),
                    child: 'start_bar'.tr == 'Iniciar'
                        ? const Text('PT')
                        : const Text('EN'),
                  ),
                ],
              )),
            ),
          ]),
        ],
      ),
    );
  }
}
