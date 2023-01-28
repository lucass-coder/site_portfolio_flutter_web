// ignore_for_file: prefer_const_constructors, avoid_web_libraries_in_flutter

import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:site_portfolio/widgets/bar_window.dart';

import 'package:site_portfolio/widgets/bottom_start.dart';
import 'package:site_portfolio/widgets/icons_desktop.dart';
import 'package:site_portfolio/widgets/option_click_right.dart';
import 'package:site_portfolio/widgets/start_bar.dart';
import 'package:site_portfolio/widgets/time.dart';
import 'package:site_portfolio/widgets/window_about.dart';
import 'package:site_portfolio/widgets/window_games.dart';
import 'package:site_portfolio/widgets/window_image.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  String mensagem = 'Olá! Gostaria de falar com você Lucas';
  bool isAtivo = false;
  bool isAtivo2 = false;
  bool isGame = false;
  bool isAbout = false;
  bool visible = false;
  String url =
      'https://api.whatsapp.com/send/?phone=5516992438472&text=Olá! Gostaria de falar com você Lucas';
  Color? background = Color(0xff008081);
  String nomeImage = 'image-4';
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
    return Listener(
      onPointerDown: _updateLocation,
      // onPointerMove: _updateLocation,
      child: GestureDetector(
        onTap: () => setState(() {
          isAtivo = false;
          visible = false;
        }),
        child: Scaffold(
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images-desktop/$nomeImage.png'),
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
                      name: ' Trocar plano de fundo',
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
                          name: 'Jogos',
                          icon: 'computer',
                          isAtivo: false,
                          onPressed: () => setState(() {
                            isAtivo2 ? null : isGame = !isGame;
                          }),
                        ),
                        IconsDesktop(
                          name: 'imagens',
                          icon: 'folder',
                          isAtivo: false,
                          onPressed: () => setState(() {
                            isAtivo2 = !isAtivo2;
                          }),
                        ),
                        IconsDesktop(
                          name: 'WhattsApp',
                          icon: 'phone',
                          isAtivo: false,
                          onPressed: () => html.window.open(url, 'new tab'),
                        ),
                        IconsDesktop(
                          name: 'Sobre',
                          icon: 'cmd',
                          isAtivo: false,
                          onPressed: () => setState(() {
                            isAbout = !isAbout;
                          }),
                        ),
                      ],
                    )
                  ],
                ),
                //Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Visibility(
                      visible: isAtivo,
                      child: StartBar(),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        color: const Color(0xffC0C7C8),
                        width: MediaQuery.of(context).size.width,
                        height: 40,
                        child: Row(
                          children: [
                            SizedBox(width: 20),
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
                              visible: isGame,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: BarWindow(
                                  isAtivo: isGame,
                                  icon: 'game',
                                  name: 'Jogos',
                                ),
                              ),
                            ),
                            Visibility(
                              visible: isAtivo2,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: BarWindow(
                                    isAtivo: isAtivo2,
                                    icon: 'folder',
                                    name: 'Imagens'),
                              ),
                            ),
                            Spacer(),
                            Time(),
                            SizedBox(width: 16),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
