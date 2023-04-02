import 'package:flutter/material.dart';

class StartupWindowIcon extends StatefulWidget {
  final String icon;
  final String name;

  const StartupWindowIcon({Key? key, required this.icon, required this.name})
      : super(key: key);

  @override
  State<StartupWindowIcon> createState() => _StartupWindowIconState();
}

class _StartupWindowIconState extends State<StartupWindowIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: 130,
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
      child: Center(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Image.asset(
                'assets/win-xp/icons/${widget.icon}.png',
                height: 50,
                width: 25,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                widget.name,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
