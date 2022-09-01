// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:site_portfolio/widgets/bottom_start.dart';
import 'package:site_portfolio/widgets/horario.dart';
import 'package:site_portfolio/widgets/options_start.dart';

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
    return Scaffold(
      backgroundColor: Color(0xff008081),
      body: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Image.asset(
                  'assets/images/computer.png',
                  width: 70,
                  height: 70,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Image.asset(
                  'assets/images/phone.png',
                  width: 70,
                  height: 70,
                ),
              ),
              Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(children: [
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
                  ]),
                  Container(
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
                        Horario(),
                        SizedBox(width: 16),
                      ],
                    ),
                  ),
                ],
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
    );
  }
}
