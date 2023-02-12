import 'package:flutter/material.dart';

class LogOff extends StatelessWidget {
  const LogOff({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final params = ModalRoute.of(context)?.settings.arguments ?? 'Desligar';
    return SizedBox(
      width: MediaQuery.of(context).size.width * .5,
      height: MediaQuery.of(context).size.height * .5,
      child: params == 'Desligar'
          ? Image.asset(
              'assets/images-desktop/gif-portuguese.gif',
              fit: BoxFit.fill,
            )
          : Image.asset(
              'assets/images-desktop/gif-english.gif',
              fit: BoxFit.fill,
            ),
    );
  }
}
