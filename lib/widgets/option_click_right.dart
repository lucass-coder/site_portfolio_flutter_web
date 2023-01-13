import 'package:flutter/material.dart';

class OptionCLickRight extends StatefulWidget {
  final String name;
  final VoidCallback onPressed;

  const OptionCLickRight({
    Key? key,
    required this.name,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<OptionCLickRight> createState() => _OptionCLickRightState();
}

class _OptionCLickRightState extends State<OptionCLickRight> {
  bool isHovered = false;
  Color colorSelected = const Color(0xffC0C7C8);
  Color textColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() {
        colorSelected = Colors.blueAccent;
        textColor = Colors.white;
      }),
      onExit: (_) => setState(() {
        colorSelected = const Color(0xffC0C7C8);
        textColor = Colors.black;
      }),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(children: [
              Container(
                height: 24,
                width: 140,
                decoration:
                    const BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 65, 64, 64),
                    spreadRadius: 1,
                    blurRadius: 0,
                    offset: Offset(0, 0), // changes position of shadow
                  ),
                ]),
              ),
              Container(
                height: 24,
                width: 140,
                decoration:
                    const BoxDecoration(color: Color(0xffC0C7C8), boxShadow: [
                  BoxShadow(
                    color: Colors.white,
                    spreadRadius: 0.5,
                    blurRadius: 0,
                    offset: Offset(-1, -1), // changes position of shadow
                  ),
                ]),
                child: Container(
                  color: colorSelected,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // const SizedBox(width: 4),
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
      // Container(
      //   width: 150,
      //   height: 20,
      //   color: colorSelected,
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     children: [
      //       // const SizedBox(width: 4),
      //       Text(widget.name),
      //       const Spacer(),
      //       const Icon(Icons.arrow_right),
      //       const SizedBox(width: 4),
      //     ],
      //   ),
      // ),
    );
  }
}
