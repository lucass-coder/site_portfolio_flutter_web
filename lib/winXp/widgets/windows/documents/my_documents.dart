import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:site_portfolio/winXp/widgets/windows/documents/icon_my_documents.dart';
import 'package:site_portfolio/winXp/widgets/windows/header/window_header.dart';

class MyDocuments extends StatelessWidget {
  const MyDocuments({Key? key}) : super(key: key);

  final Color _borderColor = const Color.fromRGBO(8, 49, 217, 1);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 406,
        height: 380,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
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
            const WindowHeader(
              focused: true,
              // title: 'images'.tr,
              title: 'Documentos',
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
                          IconMyDocument(
                            name: 'images'.tr,
                            icon: 'folder_images',
                          ),
                          IconMyDocument(
                            name: 'images'.tr,
                            icon: 'folder_images',
                          ),
                          IconMyDocument(
                            name: 'images'.tr,
                            icon: 'folder_images',
                          ),
                          IconMyDocument(
                            name: 'images'.tr,
                            icon: 'folder_images',
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
