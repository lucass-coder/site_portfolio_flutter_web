import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StartScreenXp extends StatelessWidget {
  const StartScreenXp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final params = 'turnOf'.tr;
    return SizedBox(
      width: MediaQuery.of(context).size.width * .5,
      height: MediaQuery.of(context).size.height * .5,
      child: params == 'Desligar'
          ? Image.asset(
              'assets/win-xp/gifs/win-xp-start.gif',
              fit: BoxFit.fill,
            )
          : Image.asset(
              'assets/win-xp/gifs/win-xp-start.gif',
              fit: BoxFit.fill,
            ),
    );
  }
}
