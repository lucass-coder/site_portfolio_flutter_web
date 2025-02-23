import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:site_portfolio/winXp/widgets/start_bar/startup_menu_dialog/startup_bottom.dart';
import 'package:site_portfolio/winXp/widgets/start_bar/startup_menu_dialog/user_header.dart';
import 'package:site_portfolio/winXp/widgets/start_bar/startup_options/options_start_xp.dart';

import '../../../controllers/controller_home_page.dart';

class StartupMenuDialog extends StatelessWidget {
  const StartupMenuDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Color _borderColor = Color.fromRGBO(52, 130, 227, 1);

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          width: 384,
          child: UserHeader(),
        ),
        Row(
          children: [
            Container(
              height: 400,
              width: 192,
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                  left: BorderSide(
                    color: _borderColor,
                    width: 3,
                  ),
                  right: BorderSide(
                    color: Color(0xFFBCD2E0),
                    width: 3,
                  ),
                ),
              ),
            ),
            Container(
              height: 400,
              width: 192,
              decoration: const BoxDecoration(
                color: Color(0xFFD3E5FD),
                border: Border(
                  right: BorderSide(
                    color: _borderColor,
                    width: 3,
                  ),
                ),
              ),
              child: Column(
                children: [
                  // const OptionStartXp(
                  //   icon: 'folder',
                  //   name: 'My Documents',
                  //   isHovered: false,
                  // ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      Get.find<ControllerHomePage>().openImagesWindow();
                    },
                    child: OptionStartXp(
                      icon: 'folder_images',
                      name: 'images'.tr,
                      isHovered: false,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      Get.find<ControllerHomePage>().openGamesWindow();
                    },
                    child: OptionStartXp(
                      icon: 'controller_3',
                      name: 'game'.tr,
                      isHovered: false,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      Get.find<ControllerHomePage>().openAboutWindow();
                    },
                    child: OptionStartXp(
                      icon: 'folder_about',
                      name: 'about'.tr,
                      isHovered: false,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 384,
          child: StartupBottom(),
        ),
        const SizedBox(height: 40)
      ],
    );
  }
}
