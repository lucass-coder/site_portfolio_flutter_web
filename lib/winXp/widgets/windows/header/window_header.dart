import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:site_portfolio/winXp/controllers/controller_home_page.dart';
import 'package:site_portfolio/winXp/widgets/windows/header/header_background.dart';

class WindowHeader extends StatelessWidget {
  final bool focused;
  final String title;

  const WindowHeader({
    Key? key,
    required this.focused,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 28,
      child: Stack(
        children: [
          HeaderBackground(
            focused: focused,
          ),
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: 4,
                ),
                Image.asset(
                  'assets/win-xp/icons/my_profile_folder.png',
                  width: 15,
                  height: 15,
                ),
                const SizedBox(
                  width: 3,
                ),
                Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: const TextStyle(color: Colors.white),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    if (title == 'Sobre') {
                      Get.find<ControllerHomePage>().closeAboutWindow();
                    }
                    if (title == 'Imagens') {
                      Get.find<ControllerHomePage>().closeImagesWindow();
                    }
                    if (title == 'Jogos') {
                      Get.find<ControllerHomePage>().closeGamesWindow();
                    }
                  },
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Container(
                      height: 20,
                      decoration: const BoxDecoration(
                        gradient: RadialGradient(
                          center: Alignment(0.9, 0.9),
                          radius: 1.4,
                          colors: [
                            Color.fromRGBO(204, 70, 0, 1),
                            Color.fromRGBO(220, 101, 39, 1),
                            Color.fromRGBO(205, 117, 70, 1),
                            Color.fromRGBO(255, 204, 178, 1),
                            Color.fromRGBO(255, 255, 255, 1)
                          ],
                          stops: [0, 0.55, 0.7, 0.9, 1],
                        ),
                      ),
                      child: const Center(
                          child: Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 20,
                      )
                          // SvgPicture.asset(
                          //   'assets/icons/close.svg',
                          //   color: Colors.white,
                          //   width: 24,
                          //   height: 24,
                          // ),
                          ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 6,
                ),

                // Opacity(
                //   opacity: focused ? 1 : 0.6,
                //   child: const HeaderActionButtons(),
                // ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: Container(
              width: 3,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  stops: [
                    0,
                    1,
                  ],
                  colors: [
                    Color.fromRGBO(22, 56, 230, 0.4),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: Container(
              width: 3,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  stops: [
                    0,
                    1,
                  ],
                  colors: [
                    Color.fromRGBO(22, 56, 230, 0.4),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
