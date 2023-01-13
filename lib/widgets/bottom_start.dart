// ignore_for_file: unused_local_variable, prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class BottomStart extends StatefulWidget {
  final bool isAtivo;

  const BottomStart({Key? key, required this.isAtivo}) : super(key: key);

  @override
  State<BottomStart> createState() => _BottomStartState();
}

class _BottomStartState extends State<BottomStart> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //onLongPress: () => log('on Long Press'),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(children: [
            Container(
              height: 32,
              width: 90,
              // ignore: prefer_const_literals_to_create_immutables
              decoration: BoxDecoration(color: Colors.grey, boxShadow: [
                BoxShadow(
                  color: widget.isAtivo ? Colors.white : Colors.black,
                  spreadRadius: 1,
                  blurRadius: 0,
                  offset: Offset(1, 1), // changes position of shadow
                ),
              ]),
            ),
            Container(
              height: 32,
              width: 90,
              decoration: BoxDecoration(color: Color(0xffC0C7C8),
                  //color: cor1,
                  // ignore: prefer_const_literals_to_create_immutables
                  boxShadow: [
                    BoxShadow(
                      color: widget.isAtivo ? Colors.black : Colors.white,
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
                      'assets/images-desktop/logo.png',
                      height: 20,
                      width: 25,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: Text('Start'),
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
