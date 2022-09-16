// ignore_for_file: prefer_const_constructors, avoid_web_libraries_in_flutter

import 'dart:html' as html;

import 'package:flutter/material.dart';

import 'package:site_portfolio/widgets/bottom_start.dart';
import 'package:site_portfolio/widgets/icons_desktop.dart';
import 'package:site_portfolio/widgets/options_start.dart';
import 'package:site_portfolio/widgets/time.dart';
import 'package:site_portfolio/widgets/window.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  String mensagem = 'Olá! Gostaria de falar com você Lucas';
  bool isAtivo = false;
  bool isAtivo2 = false;
  String url =
      'https://api.whatsapp.com/send/?phone=5516992438472&text=Olá! Gostaria de falar com você Lucas';
  Color? background = Color(0xff008081);
  String nomeImage = 'image-4';

  // void _incrementCounter() {
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() {
        isAtivo = false;
      }),
      child: Scaffold(
        //backgroundColor: Color(0xff008081),
        // backgroundColor: background,

        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage('assets/images/$nomeImage.png'),
              // 'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              isAtivo2
                  ? WindowImage(
                      onPressed: () => setState(() {
                        isAtivo2 = !isAtivo2;
                      }),
                      onChangeImage1: () => setState(() {
                        //background = Colors.green;
                        nomeImage = 'image-1';
                      }),
                      onChangeImage2: () => setState(() {
                        //background = Colors.blue;
                        nomeImage = 'image-2';
                      }),
                      onChangeImage3: () => setState(() {
                        //background = Colors.blue;
                        nomeImage = 'image-3';
                      }),
                      onChangeImage4: () => setState(() {
                        //background = Colors.blue;
                        nomeImage = 'image-4';
                      }),
                    )
                  : Container(),
              Column(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      IconsDesktop(
                        name: 'Computador',
                        icon: 'computer',
                        isAtivo: false,
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
                    ],
                  )
                ],
              ),
              //Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  isAtivo
                      ? Container(
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
                                    '  LUCAS 98',
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
                                    OptionsStart(
                                        icon: 'icon_programs',
                                        name: 'Programs'),
                                    SizedBox(height: 8),
                                    OptionsStart(
                                        icon: 'folder', name: 'Documents'),
                                    SizedBox(height: 8),
                                    OptionsStart(
                                        icon: 'icon_programs',
                                        name: 'Settings'),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      : Container(
                          color: Colors.red,
                        ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      //color: Colors.grey[400],
                      color: const Color(0xffC0C7C8),
                      width: MediaQuery.of(context).size.width,
                      height: 46,
                      child: Row(
                        children: [
                          SizedBox(width: 20),
                          GestureDetector(
                            onTap: () => {
                              setState(() {
                                if (isAtivo == true) {
                                  isAtivo = false;
                                } else {
                                  isAtivo = true;
                                }
                              })
                            },
                            child: BottomStart(isAtivo: isAtivo),
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
    );
  }
}

class WindowImage extends StatefulWidget {
  final VoidCallback? onPressed;
  final VoidCallback? onChangeImage1;
  final VoidCallback? onChangeImage2;
  final VoidCallback? onChangeImage3;
  final VoidCallback? onChangeImage4;

  const WindowImage(
      {Key? key,
      this.onPressed,
      this.onChangeImage1,
      this.onChangeImage2,
      this.onChangeImage3,
      this.onChangeImage4})
      : super(key: key);

  @override
  State<WindowImage> createState() => _WindowImageState();
}

class _WindowImageState extends State<WindowImage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 400,
        height: 400,
        color: const Color(0xffC0C7C8),
        child: Column(
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: const Color(0xff181883),
                    width: 384,
                    height: 40,
                    child: Center(
                      child: Text(
                        'Wallpaper',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 14.0, bottom: 14.0, left: 354.0, right: 14.0),
                  child: GestureDetector(
                    onTap: widget.onPressed,
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Container(
                        width: 30,
                        height: 28,
                        color: const Color(0xffC0C7C8),
                        child: const Icon(Icons.close),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            //Text('JFDF432R2RLJSAFLJDSFL'),
            LayoutBuilder(builder: (context, constraints) {
              return ConstrainedBox(
                constraints: BoxConstraints(minHeight: 100, maxHeight: 340),
                child: IntrinsicHeight(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: widget.onChangeImage1,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  height: 150,
                                  width: 180,
                                  //color: Colors.green,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          'assets/images/image-1.png'),
                                      // 'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: widget.onChangeImage2,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  height: 150,
                                  width: 180,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          'assets/images/image-2.png'),
                                      // 'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: widget.onChangeImage3,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  height: 150,
                                  width: 180,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          'assets/images/image-3.png'),
                                      // 'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: widget.onChangeImage4,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  height: 150,
                                  width: 180,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          'assets/images/image-4.png'),
                                      // 'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: widget.onChangeImage1,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  height: 150,
                                  width: 180,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: widget.onChangeImage2,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  height: 150,
                                  width: 180,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
