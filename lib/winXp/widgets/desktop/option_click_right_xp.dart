import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:site_portfolio/winXp/controllers/controller_home_page.dart';

class OptionCLickRightXp extends StatefulWidget {
  final String name;

  const OptionCLickRightXp({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  State<OptionCLickRightXp> createState() => _OptionCLickRightXpState();
}

class _OptionCLickRightXpState extends State<OptionCLickRightXp> {
  bool isHovered = false;
  Color colorSelected = Colors.white;
  Color textColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() {
        colorSelected = Colors.blueAccent;
        textColor = Colors.white;
      }),
      onExit: (_) => setState(() {
        colorSelected = Colors.white;
        textColor = Colors.black;
      }),
      child: GestureDetector(
        onTap: () => Get.find<ControllerHomePage>().openImagesWindow(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(children: [
              Container(
                height: 24,
                width: 140,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white,
                      spreadRadius: 1,
                      blurRadius: 0,
                      offset: Offset(0, 0), // changes position of shadow
                    ),
                  ],
                ),
              ),
              Container(
                height: 24,
                width: 140,
                decoration: const BoxDecoration(
                  color: Colors.black26,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white,
                      spreadRadius: 0.5,
                      blurRadius: 0,
                      offset: Offset(-1, -1), // changes position of shadow
                    ),
                  ],
                ),
                child: Container(
                  color: colorSelected,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        style: TextStyle(fontSize: 12, color: textColor),
                      ),
                      const SizedBox(width: 4),
                    ],
                  ),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
