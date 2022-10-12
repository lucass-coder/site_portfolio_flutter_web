// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:site_portfolio/widgets/option_shutdown.dart';
import 'package:site_portfolio/widgets/options_start.dart';

class StartBar extends StatelessWidget {
  const StartBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 224,
      height: 400,
      decoration: BoxDecoration(
        color: const Color(0xffC0C7C8),
        border: Border.all(),
      ),
      child: Row(
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            height: 400,
            width: 50,
            decoration: const BoxDecoration(
              color: Colors.grey,
            ),
            child: RotatedBox(
              quarterTurns: 3,
              child: Text(
                '  LUCAS 95',
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 24,
                    letterSpacing: 10,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 8),
                OptionsStart(icon: 'icon_programs', name: 'Programas'),
                SizedBox(height: 8),
                OptionsStart(icon: 'folder', name: 'Projetos'),
                SizedBox(height: 8),
                OptionsStart(icon: 'icon_programs', name: 'Idioma'),
                Spacer(),
                Divider(),
                OptionShutdown(icon: 'icon_shutdown', name: 'Desligar'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
