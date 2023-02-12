import 'package:flutter/material.dart';
import 'package:site_portfolio/games/lib/selection_person_page.dart';
import 'package:site_portfolio/widgets/image_box.dart';
import 'package:get/get.dart';

class WindowGames extends StatefulWidget {
  final VoidCallback? onPressed;
  const WindowGames({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  @override
  State<WindowGames> createState() => _WindowGamesState();
}

class _WindowGamesState extends State<WindowGames> {
  double selecionado = 1;
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
                        'game'.tr,
                        style: const TextStyle(
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
            LayoutBuilder(
              builder: (context, constraints) {
                return ConstrainedBox(
                  constraints:
                      const BoxConstraints(minHeight: 100, maxHeight: 340),
                  child: IntrinsicHeight(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              ImageBox(
                                onChangeImage: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SelectionPersonPage()),
                                  );
                                },
                                imageUrl:
                                    'assets/images-desktop/domvs-bros.png',
                              ),
                              ImageBox(
                                onChangeImage: () {},
                                imageUrl:
                                    'assets/images-desktop/jump-game-comming.webp',
                              ),
                            ],
                          ),
                          // Row(
                          //   children: [
                          //     ImageBox(
                          //       onChangeImage: () {},
                          //       imageUrl: 'assets/images/image-3.png',
                          //     ),
                          //     ImageBox(
                          //       onChangeImage: () {},
                          //       imageUrl: 'assets/images/image-4.png',
                          //     ),
                          //   ],
                          // ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
