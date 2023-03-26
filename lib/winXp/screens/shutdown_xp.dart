import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShutdownXp extends StatelessWidget {
  const ShutdownXp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final params = 'turnOf'.tr;
    return SizedBox(
      width: MediaQuery.of(context).size.width * .5,
      height: MediaQuery.of(context).size.height * .5,
      child: params == 'Desligar'
          ? Image.asset(
              'assets/win-xp/gifs/win-xp-end.gif',
              fit: BoxFit.fill,
            )
          : Image.asset(
              'assets/win-xp/gifs/win-xp-end.gif',
              fit: BoxFit.fill,
            ),
    );
  }
}
