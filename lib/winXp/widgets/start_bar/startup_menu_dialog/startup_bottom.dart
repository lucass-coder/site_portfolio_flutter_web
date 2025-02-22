import 'package:flutter/material.dart';
import 'package:site_portfolio/winXp/widgets/start_bar/startup_menu_dialog/startup_button.dart';

class StartupBottom extends StatelessWidget {
  const StartupBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Color _borderColor = Color.fromRGBO(52, 130, 227, 1);
    return Stack(
      children: [
        Container(
          height: 44,
          padding: const EdgeInsets.only(
            top: 6,
            right: 5,
            bottom: 5,
            left: 5,
          ),
          decoration: const BoxDecoration(
            border: Border(
              left: BorderSide(
                color: _borderColor,
                width: 3,
              ),
              right: BorderSide(
                color: _borderColor,
                width: 3,
              ),
            ),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(24, 104, 206, 1),
                Color.fromRGBO(14, 96, 203, 1),
                Color.fromRGBO(14, 96, 203, 1),
                Color.fromRGBO(17, 100, 207, 1),
                Color.fromRGBO(22, 103, 207, 1),
                Color.fromRGBO(27, 108, 211, 1),
                Color.fromRGBO(30, 112, 217, 1),
                Color.fromRGBO(36, 118, 220, 1),
                Color.fromRGBO(41, 122, 224, 1),
                Color.fromRGBO(52, 130, 227, 1),
                Color.fromRGBO(55, 134, 229, 1),
                Color.fromRGBO(66, 142, 233, 1),
                Color.fromRGBO(71, 145, 235, 1),
              ],
              stops: [
                0,
                0.12,
                0.2,
                0.32,
                0.33,
                0.47,
                0.54,
                0.6,
                0.65,
                0.77,
                0.79,
                0.9,
                1,
              ],
            ),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              StartUpButton(),
            ],
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 2,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Colors.transparent,
                  Color.fromRGBO(255, 255, 255, 0.3),
                  Color.fromRGBO(255, 255, 255, 0.5),
                  Color.fromRGBO(255, 255, 255, 0.5),
                  Color.fromRGBO(255, 255, 255, 0.3),
                  Color.fromRGBO(255, 255, 255, 0.2),
                  Colors.transparent
                ],
                stops: [0, 0.01, 0.02, 0.95, 0.98, 0.99, 1],
              ),
            ),
          ),
        )
      ],
    );
  }
}
