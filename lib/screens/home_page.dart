// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:site_portfolio/widgets/bottom_start.dart';
import 'package:site_portfolio/widgets/time.dart';
import 'package:site_portfolio/widgets/icons_desktop.dart';
import 'package:site_portfolio/widgets/options_start.dart';
import 'package:site_portfolio/widgets/window.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  bool isAtivo = false;

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
        backgroundColor: Color(0xff008081),
        body: Stack(
          children: [
            Window(),
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
                    ),
                    IconsDesktop(
                      name: 'WhattsApp',
                      icon: 'phone',
                      isAtivo: false,
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
                              height: 400,
                              width: 50,
                              decoration: const BoxDecoration(
                                color: Colors.grey,
                              ),
                              child: RotatedBox(
                                quarterTurns: 3,
                                child: Text(
                                  'FlutterMan',
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(height: 8),
                                  OptionsStart(
                                      icon: 'icon_programs', name: 'Programs'),
                                  SizedBox(height: 8),
                                  OptionsStart(
                                      icon: 'folder', name: 'Documents'),
                                  SizedBox(height: 8),
                                  OptionsStart(
                                      icon: 'icon_programs', name: 'Settings'),
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

        // bottomNavigationBar: Column(
        //   mainAxisAlignment: MainAxisAlignment.end,
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     Stack(children: [
        //       isAtivo
        //           ? Container(
        //               width: 224,
        //               height: 400,
        //               decoration: BoxDecoration(
        //                 color: const Color(0xffC0C7C8),
        //                 border: Border.all(),
        //               ),
        //               child: Row(
        //                 children: [
        //                   Container(
        //                     height: 400,
        //                     width: 50,
        //                     decoration: const BoxDecoration(
        //                       color: Colors.grey,
        //                     ),
        //                     child: RotatedBox(
        //                       quarterTurns: 3,
        //                       child: Text(
        //                         'FlutterMan',
        //                       ),
        //                     ),
        //                   ),
        //                   Expanded(
        //                     child: Column(
        //                       mainAxisAlignment: MainAxisAlignment.start,
        //                       children: [
        //                         SizedBox(height: 8),
        //                         OptionsStart(
        //                             icon: 'icon_programs', name: 'Programs'),
        //                         SizedBox(height: 8),
        //                         OptionsStart(icon: 'folder', name: 'Documents'),
        //                         SizedBox(height: 8),
        //                         OptionsStart(
        //                             icon: 'icon_programs', name: 'Settings'),
        //                       ],
        //                     ),
        //                   )
        //                 ],
        //               ),
        //             )
        //           : Container(
        //               color: Colors.red,
        //             ),
        //     ]),
        //     Container(
        //       //color: Colors.grey[400],
        //       color: const Color(0xffC0C7C8),
        //       width: MediaQuery.of(context).size.width,
        //       height: 46,
        //       child: Row(
        //         children: [
        //           SizedBox(width: 20),
        //           GestureDetector(
        //             onTap: () => {
        //               setState(() {
        //                 if (isAtivo == true) {
        //                   isAtivo = false;
        //                 } else {
        //                   isAtivo = true;
        //                 }
        //               })
        //             },
        //             child: BottomStart(isAtivo: isAtivo),
        //           ),
        //           Spacer(),
        //           Horario(),
        //           SizedBox(width: 16),
        //         ],
        //       ),
        //     ),
        //   ],
        // ),

        // floatingActionButton: FloatingActionButton(
        //   onPressed: _incrementCounter,
        //   tooltip: 'Increment',
        //   child: const Icon(Icons.add),
        // ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
