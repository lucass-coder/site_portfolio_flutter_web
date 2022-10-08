// ignore_for_file: prefer_const_constructors, avoid_web_libraries_in_flutter

import 'dart:html' as html;

import 'package:flutter/material.dart';

import 'package:site_portfolio/widgets/bottom_start.dart';
import 'package:site_portfolio/widgets/icons_desktop.dart';
import 'package:site_portfolio/widgets/start_bar.dart';
import 'package:site_portfolio/widgets/time.dart';
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
  String url =
      'https://api.whatsapp.com/send/?phone=5516992438472&text=Olá! Gostaria de falar com você Lucas';
  Color? background = Color(0xff008081);
  String nomeImage = 'image-4';


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() {
        isAtivo = false;
      }),
      child: Scaffold(
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
              Visibility(
                visible: isAtivo2,
                child: WindowImage(
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
                    ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
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
                  Visibility(
                    visible: isAtivo,
                    child: StartBar(),
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