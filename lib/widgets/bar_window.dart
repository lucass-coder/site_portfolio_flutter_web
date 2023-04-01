import 'package:flutter/material.dart';

class BarWindow extends StatefulWidget {
  final String icon;
  final String name;

  const BarWindow({Key? key, required this.icon, required this.name})
      : super(key: key);

  @override
  State<BarWindow> createState() => _BarWindowState();
}

class _BarWindowState extends State<BarWindow> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(children: [
            Container(
              height: 32,
              width: 130,
              decoration: const BoxDecoration(color: Colors.grey, boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  spreadRadius: 1,
                  blurRadius: 0,
                  offset: Offset(1, 1), // changes position of shadow
                ),
              ]),
            ),
            Container(
              height: 32,
              width: 130,
              decoration:
                  const BoxDecoration(color: Color(0xffC0C7C8), boxShadow: [
                BoxShadow(
                  color: Colors.white,
                  spreadRadius: 1,
                  blurRadius: 0,
                  offset: Offset(-1, -1), // changes position of shadow
                ),
              ]),
              child: Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 3.0),
                    child: Image.asset(
                      'assets/images-desktop/${widget.icon}.png',
                      height: 50,
                      width: 25,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text(widget.name),
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
