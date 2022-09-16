// ignore_for_file: unused_local_variable, prefer_const_constructors, prefer_typing_uninitialized_variables, avoid_web_libraries_in_flutter

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:site_portfolio/cubit/time/time_controller.dart';

import 'package:site_portfolio/widgets/icons_menu_bar.dart';

class Time extends StatefulWidget {
  const Time({Key? key}) : super(key: key);

  @override
  State<Time> createState() => _BottomStartState();
}

class _BottomStartState extends State<Time> {
  var now = DateTime.now();

  @override
  void initState() {
    super.initState();
    StreamSubscription periodicSub =
        Stream.periodic(Duration(milliseconds: 500), (v) => v)
            .listen((count) => setState(() {
                  now = DateTime.now();
                }));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //onLongPress: () => log('on Long Press'),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(children: [
            Container(
              height: 36,
              width: 180,
              // ignore: prefer_const_literals_to_create_immutables
              decoration: BoxDecoration(color: Colors.grey, boxShadow: [
                BoxShadow(
                  color: Colors.white,
                  spreadRadius: 1,
                  blurRadius: 0,
                  offset: Offset(1, 1), // changes position of shadow
                ),
              ]),
            ),
            Container(
              height: 36,
              width: 180,
              decoration: BoxDecoration(color: Color(0xffC0C7C8),
                  //color: cor1,
                  // ignore: prefer_const_literals_to_create_immutables
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black45,
                      spreadRadius: 1,
                      blurRadius: 0,
                      offset: Offset(-1, -1), // changes position of shadow
                    ),
                  ]),
              child: Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconsMenuBar(
                    url: 'https://github.com/lucass-coder',
                    socialNetwork: 'github',
                  ),
                  IconsMenuBar(
                    url: 'https://www.linkedin.com/in/lucas-santana-bb3a801b4/',
                    socialNetwork: 'linkedin',
                  ),
                  IconsMenuBar(
                    url: 'https://www.instagram.com/lucaso.santana/',
                    socialNetwork: 'instagram',
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: Text('${now.hour}:${now.minute}:${now.second}'),
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
