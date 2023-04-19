import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:site_portfolio/games/domvs_dash/lib/select_person_domvs_dash.dart';
import 'package:site_portfolio/games/lib/selection_person_page.dart';
import 'package:site_portfolio/widgets/image_box.dart';
import 'package:site_portfolio/winXp/widgets/windows/header/window_header.dart';

class WindowGamesXp extends StatelessWidget {
  const WindowGamesXp({
    Key? key,
  }) : super(key: key);

  final Color _borderColor = const Color.fromRGBO(8, 49, 217, 1);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 406,
        height: 380,
        decoration: BoxDecoration(
          color: const Color(0xFFD3E5FD),
          border: Border(
            left: BorderSide(
              color: _borderColor,
              width: 3,
            ),
            right: BorderSide(
              color: _borderColor,
              width: 3,
            ),
            bottom: BorderSide(
              color: _borderColor,
              width: 3,
            ),
          ),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                WindowHeader(
                  focused: true,
                  title: 'game'.tr,
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
                                            originXp: true,
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
                                      originXp: true,
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
