// ignore_for_file: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import 'package:flutter/material.dart';

import 'package:site_portfolio/widgets/icons_desktop.dart';
import 'package:site_portfolio/widgets/option_click_right.dart';
import 'package:site_portfolio/widgets/window_about.dart';
import 'package:site_portfolio/widgets/window_games.dart';
import 'package:site_portfolio/widgets/window_image.dart';
import 'package:get/get.dart';
import 'package:site_portfolio/winXp/widgets/startup_bar.dart';

class HomePageXp extends StatefulWidget {
  const HomePageXp({Key? key}) : super(key: key);

  @override
  State<HomePageXp> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePageXp>
    with SingleTickerProviderStateMixin {
  bool isAtivo = false;
  bool isAtivo2 = false;
  bool isGame = false;
  bool isAbout = false;
  bool visible = false;

  Color? background = const Color(0xff008081);
  String nomeImage = 'windows-xp';
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
          body: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: Container(
              key: ValueKey(nomeImage),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/win-xp/images/wallpapers/$nomeImage.webp'),
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
                  Visibility(
                    visible: isAtivo2,
                    child: WindowImage(
                      onPressed: () => setState(() {
                        isAtivo2 = !isAtivo2;
                      }),
                      onChangeImage1: () => setState(() {
                        nomeImage = 'image-1';
                      }),
                      onChangeImage2: () => setState(() {
                        nomeImage = 'image-2';
                      }),
                      onChangeImage3: () => setState(() {
                        nomeImage = 'image-3';
                      }),
                      onChangeImage4: () => setState(() {
                        nomeImage = 'image-4';
                      }),
                    ),
                  ),
                  Visibility(
                    visible: isGame && isAtivo2 == false,
                    child: WindowGames(
                      onPressed: () => setState(() {
                        isGame = !isGame;
                      }),
                    ),
                  ),
                  Visibility(
                    visible: isAbout && isAtivo2 == false,
                    child: WindowAbout(
                      onPressed: () => setState(() {
                        isAbout = !isAbout;
                      }),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          IconsDesktop(
                            name: 'game'.tr,
                            icon: 'controller',
                            iconSystem: DesktopIcon.iconxp,
                            isAtivo: false,
                            onPressed: () => setState(() {
                              isAtivo2 ? null : isGame = !isGame;
                            }),
                          ),
                          IconsDesktop(
                            name: 'images'.tr,
                            icon: 'folder_images',
                            iconSystem: DesktopIcon.iconxp,
                            isAtivo: false,
                            onPressed: () => setState(() {
                              isAtivo2 = !isAtivo2;
                            }),
                          ),
                          IconsDesktop(
                            name: 'WhattsApp',
                            icon: 'whatsapp',
                            iconSystem: DesktopIcon.iconxp,
                            isAtivo: false,
                            onPressed: () => html.window.open(url, 'new tab'),
                          ),
                          IconsDesktop(
                            name: 'about'.tr,
                            icon: 'my_profile_folder',
                            iconSystem: DesktopIcon.iconxp,
                            isAtivo: false,
                            onPressed: () => setState(() {
                              isAbout = !isAbout;
                            }),
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
    );
  }
}
