import 'package:flutter/material.dart';

class Window extends StatelessWidget {
  const Window({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            width: 400,
            height: 400,
            color: const Color(0xffC0C7C8),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Color(0xff181883),
              width: 384,
              height: 40,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 14.0, bottom: 14.0, left: 350.0, right: 14.0),
            child: Container(
              width: 30,
              height: 28,
              color: const Color(0xffC0C7C8),
              child: Icon(Icons.close),
            ),
          )
        ],
      ),
    );
  }
}
