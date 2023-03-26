// ignore_for_file: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import 'package:flutter/material.dart';

import 'package:site_portfolio/widgets/icons_desktop.dart';
import 'package:site_portfolio/widgets/option_click_right.dart';
import 'package:get/get.dart';
import 'package:site_portfolio/winXp/controllers/controller_home_page.dart';
import 'package:site_portfolio/winXp/widgets/startup_bar.dart';
import 'package:site_portfolio/winXp/widgets/windows/games/window_games_xp.dart';
import 'package:site_portfolio/winXp/widgets/windows/images/window_image_xp.dart';
import 'package:site_portfolio/winXp/widgets/windows/window_about_xp.dart';

class HomePageXp extends StatefulWidget {
  const HomePageXp({Key? key}) : super(key: key);

  @override
  State<HomePageXp> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePageXp>
    with SingleTickerProviderStateMixin {
  bool isAtivo = false;
  bool isAtivo2 = false;
  bool visible = false;

  Color? background = const Color(0xff008081);
  double x = 0.0;
  double y = 0.0;

  void _updateLocation(PointerEvent details) {
    if (details.original?.buttons == 2) {
      setState(() {
        x = details.position.dx;
        y = details.position.dy;
        visible = !visible;
        isAtivo = false;
      });
    }
  }

  @override
  void initState() {
    html.document.body!
        .addEventListener('contextmenu', (event) => event.preventDefault());
    super.initState();
  }

  final controller = Get.put(ControllerHomePage());

  @override
  Widget build(BuildContext context) {
    String url =
        'https://api.whatsapp.com/send/?phone=5516992438472&text=${'whatsapp_message'.tr}';
    return Listener(
      onPointerDown: _updateLocation,
      child: GestureDetector(
        onTap: () => setState(() {
          isAtivo = false;
          visible = false;
        }),
        child: Scaffold(
          body: Obx(
            () => AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: Container(
                key: ValueKey(controller.nomeImage.value),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/win-xp/images/wallpapers/${controller.nomeImage}.webp'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: x,
                      top: y,
                      child: Visibility(
                        visible: visible,
                        child: OptionCLickRight(
                          name: 'change_wallpalper'.tr,
                          onPressed: () => setState(() {
                            isAtivo2 = !isAtivo2;
                            visible = false;
                          }),
                        ),
                      ),
                    ),
                    Obx(
                      () => Visibility(
                        visible: controller.isImage.value,
                        child: const WindowImageXp(),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.openGamesWindow();
                      },
                      child: Visibility(
                        visible: controller.isGame.value && isAtivo2 == false,
                        child: const WindowGamesXp(),
                      ),
                    ),
                    Obx(() => Visibility(
                          visible: controller.isAbout.value == true &&
                              isAtivo2 == false,
                          child: const WindowAboutXp(),
                        )),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () => controller.openGamesWindow(),
                              child: IconsDesktop(
                                name: 'game'.tr,
                                icon: 'controller_3',
                                iconSystem: DesktopIcon.iconxp,
                                isAtivo: false,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.openImagesWindow();
                              },
                              child: IconsDesktop(
                                name: 'images'.tr,
                                icon: 'folder_images',
                                iconSystem: DesktopIcon.iconxp,
                                isAtivo: false,
                              ),
                            ),
                            IconsDesktop(
                              name: 'WhattsApp',
                              icon: 'whatsapp',
                              iconSystem: DesktopIcon.iconxp,
                              isAtivo: false,
                              onPressed: () => html.window.open(url, 'new tab'),
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.openAboutWindow();
                              },
                              child: IconsDesktop(
                                name: 'about'.tr,
                                icon: 'my_profile_folder',
                                iconSystem: DesktopIcon.iconxp,
                                isAtivo: false,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Align(
                      alignment: Alignment.bottomCenter,
                      child: StartupBar(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
