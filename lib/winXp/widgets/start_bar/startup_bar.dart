import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:site_portfolio/winXp/widgets/start_bar/language_icon_bar_xp.dart';

import 'package:site_portfolio/winXp/widgets/start_bar/start_button.dart';
import 'package:site_portfolio/winXp/widgets/start_bar/startup_menu_dialog/startup_window_icon.dart';
import 'package:site_portfolio/winXp/widgets/start_bar/startup_toolbar/startup_toolbar.dart';

class StartupBar extends StatelessWidget {
  final bool isGame;
  final bool isImage;
  final bool isAbout;
  const StartupBar(
      {Key? key,
      required this.isGame,
      required this.isImage,
      required this.isAbout})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromRGBO(31, 47, 134, 1),
            Color.fromRGBO(49, 101, 196, 1),
            Color.fromRGBO(54, 130, 229, 1),
            Color.fromRGBO(68, 144, 230, 1),
            Color.fromRGBO(56, 131, 229, 1),
            Color.fromRGBO(43, 113, 224, 1),
            Color.fromRGBO(38, 99, 218, 1),
            Color.fromRGBO(35, 91, 214, 1),
            Color.fromRGBO(34, 88, 213, 1),
            Color.fromRGBO(33, 87, 214, 1),
            Color.fromRGBO(36, 93, 219, 1),
            Color.fromRGBO(37, 98, 223, 1),
            Color.fromRGBO(36, 95, 220, 1),
            Color.fromRGBO(33, 88, 212, 1),
            Color.fromRGBO(29, 78, 192, 1),
            Color.fromRGBO(25, 65, 165, 1),
          ],
          stops: [
            0,
            0.03,
            0.06,
            0.1,
            0.12,
            0.15,
            0.18,
            0.2,
            0.23,
            0.38,
            0.54,
            0.86,
            0.89,
            0.92,
            0.95,
            0.98,
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              const SizedBox(width: 126, child: StartButton()),
              const SizedBox(width: 10),
              Visibility(
                visible: isGame,
                child: StartupWindowIcon(icon: 'controller_3', name: 'game'.tr),
              ),
              const SizedBox(width: 2),
              Visibility(
                visible: isImage,
                child:
                    StartupWindowIcon(icon: 'folder_images', name: 'images'.tr),
              ),
              const SizedBox(width: 2),
              Visibility(
                visible: isAbout,
                child:
                    StartupWindowIcon(icon: 'folder_about', name: 'about'.tr),
              ),
            ],
          ),
          const Spacer(),
          const LanguageIconBarXp(),
          const SizedBox(
            width: 8,
          ),
          const StartupToolbar(),
        ],
      ),
    );
  }
}
