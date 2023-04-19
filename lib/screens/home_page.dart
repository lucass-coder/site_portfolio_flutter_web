// ignore_for_file: avoid_web_libraries_in_flutter, unrelated_type_equality_checks

import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:site_portfolio/widgets/bar_window.dart';

import 'package:site_portfolio/widgets/bottom_start.dart';
import 'package:site_portfolio/widgets/icons_desktop.dart';
import 'package:site_portfolio/widgets/language_icon_bar.dart';
import 'package:site_portfolio/widgets/option_click_right.dart';
import 'package:site_portfolio/widgets/start_bar.dart';
import 'package:site_portfolio/widgets/time.dart';
import 'package:site_portfolio/widgets/window_about.dart';
import 'package:site_portfolio/widgets/window_games.dart';
import 'package:site_portfolio/widgets/window_image.dart';
import 'package:get/get.dart';
import 'package:site_portfolio/winXp/controllers/controller_home_page.dart';
import 'package:site_portfolio/winXp/home_page_xp.dart';
import 'package:site_portfolio/winXp/screens/start_screen_xp.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  bool isAtivo = false;
  bool isAtivo2 = false;
  bool isGame = false;
  bool visible = false;

  Color? background = const Color(0xff008081);
  // String nomeImage = 'image-4';
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
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            body: Obx(
              () => AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                child: Container(
                  key: ValueKey(controller.nomeImage.value),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/images-desktop/${controller.nomeImage}.png'),
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
                      Obx(() => Visibility(
                            visible: controller.isImage.value,
                            child: WindowImage(
                              onPressed: () => setState(() {
                                isAtivo2 = !isAtivo2;
                              }),
                            ),
                          )),
                      GestureDetector(
                        onTap: () => controller.openGamesWindow(),
                        child: Visibility(
                          visible: controller.isGame.value && isAtivo2 == false,
                          child: const WindowGames(),
                        ),
                      ),
                      Obx(() => Visibility(
                            visible: controller.isAbout.value == true &&
                                isAtivo2 == false,
                            child: const WindowAbout(),
                          )),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: () => controller.openGamesWindow(),
                                    child: IconsDesktop(
                                      name: 'game'.tr,
                                      icon: 'computer',
                                      iconSystem: DesktopIcon.icon95,
                                      isAtivo: false,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      controller.openImagesWindow();
                                    },
                                    child: IconsDesktop(
                                      name: 'images'.tr,
                                      icon: 'folder',
                                      iconSystem: DesktopIcon.icon95,
                                      isAtivo: false,
                                    ),
                                  ),
                                  IconsDesktop(
                                    name: 'WhattsApp',
                                    icon: 'phone',
                                    iconSystem: DesktopIcon.icon95,
                                    isAtivo: false,
                                    onPressed: () =>
                                        html.window.open(url, 'new tab'),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      controller.openAboutWindow();
                                      // Get.find<ControllerHomePage>().openAboutWindow();
                                    },
                                    child: IconsDesktop(
                                      name: 'about'.tr,
                                      icon: 'cmd',
                                      isAtivo: false,
                                      iconSystem: DesktopIcon.icon95,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  IconsDesktop(
                                    name: 'win-xp',
                                    icon: 'windows_update',
                                    iconSystem: DesktopIcon.icon95,
                                    isAtivo: false,
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const StartScreenXp()));
                                      Future.delayed(
                                        const Duration(seconds: 6),
                                        () => Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const HomePageXp())),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AnimatedOpacity(
                                opacity: isAtivo ? 1.0 : 0.0,
                                duration: const Duration(milliseconds: 300),
                                child: Visibility(
                                  visible: isAtivo,
                                  child: const StartBar(),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  color: const Color(0xffC0C7C8),
                                  width: MediaQuery.of(context).size.width,
                                  height: 40,
                                  child: Row(
                                    children: [
                                      const SizedBox(width: 20),
                                      GestureDetector(
                                        onTap: () => {
                                          setState(() {
                                            visible = false;
                                            if (isAtivo == true) {
                                              isAtivo = false;
                                            } else {
                                              isAtivo = true;
                                            }
                                          })
                                        },
                                        child: BottomStart(isAtivo: isAtivo),
                                      ),
                                      Visibility(
                                        visible: controller.isGame == true,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: BarWindow(
                                            icon: 'game',
                                            name: 'game'.tr,
                                          ),
                                        ),
                                      ),
                                      Visibility(
                                        visible: controller.isImage == true,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: BarWindow(
                                              icon: 'folder',
                                              name: 'images'.tr),
                                        ),
                                      ),
                                      const Spacer(),
                                      const LanguageIconBar(),
                                      const SizedBox(width: 20),
                                      const Time(),
                                      const SizedBox(width: 16),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
