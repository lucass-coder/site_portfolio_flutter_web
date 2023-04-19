import 'package:flutter/material.dart';
import 'package:site_portfolio/games/domvs_dash/lib/select_person_domvs_dash.dart';
import 'package:site_portfolio/games/lib/selection_person_page.dart';
import 'package:site_portfolio/widgets/image_box.dart';
import 'package:get/get.dart';
import 'package:site_portfolio/winXp/controllers/controller_home_page.dart';

class WindowGames extends StatelessWidget {
  const WindowGames({
    Key? key,
  }) : super(key: key);

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
                    onTap: () {
                      Get.find<ControllerHomePage>().closeGamesWindow();
                    },
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
                              GestureDetector(
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SelectionPersonPage(
                                            originXp: false,
                                          )),
                                ),
                                child: const ImageBox(
                                  imageUrl:
                                      'assets/images-desktop/domvs-bros.png',
                                ),
                              ),
                              GestureDetector(
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const SelectPersonDomvsDash(
                                      title: 'Domvs Dash',
                                      originXp: false,
                                    ),
                                  ),
                                ),
                                child: const ImageBox(
                                  imageUrl:
                                      'assets/images-desktop/jump-game.png',
                                ),
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
