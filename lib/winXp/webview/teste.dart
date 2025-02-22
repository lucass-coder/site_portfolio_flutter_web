// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:html';

import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class WebView extends StatelessWidget {
  const WebView({
    Key? key,
  }) : super(key: key);

  final Color _borderColor = const Color.fromRGBO(8, 49, 217, 1);

  @override
  Widget build(BuildContext context) {
    const src = 'https://www.bing.com/?cc=br';
    final IFrameElement _iframeElement = IFrameElement()
      ..src = src
      ..style.border = 'none'
      ..allowFullscreen = false
      ..style.width = '100%'
      ..style.height = '100%';
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      'webview-element',
      (int viewId) => _iframeElement,
    );
    // Atualiza a visualização da webview
    _iframeElement.src = src;
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
          child:
              // Column(
              //   children: [

              //     Stack(
              //       children: [
              //         WindowHeader(
              //           focused: true,
              //           title: 'images'.tr,
              //         ),
              //       ],
              //     ),
              //     LayoutBuilder(
              //       builder: (context, constraints) {
              //         return ConstrainedBox(
              //           constraints:
              //               const BoxConstraints(minHeight: 100, maxHeight: 340),
              //           child: IntrinsicHeight(
              //             child: SingleChildScrollView(
              //               child: Column(
              //                 children: [
              //                   Row(
              //                     children: const [
              //                       ImageBoxXp(
              //                         imageUrl:
              //                             'assets/win-xp/images/wallpapers/windows.webp',
              //                         imageName: 'windows',
              //                       ),
              //                       ImageBoxXp(
              //                         imageUrl:
              //                             'assets/win-xp/images/wallpapers/image-1.webp',
              //                         imageName: 'image-1',
              //                       ),
              //                     ],
              //                   ),
              //                   Row(
              //                     children: const [
              //                       ImageBoxXp(
              //                         imageUrl:
              //                             'assets/win-xp/images/wallpapers/image-2.webp',
              //                         imageName: 'image-2',
              //                       ),
              //                       ImageBoxXp(
              //                         imageUrl:
              //                             'assets/win-xp/images/wallpapers/image-3.webp',
              //                         imageName: 'image-3',
              //                       ),
              //                     ],
              //                   ),
              //                 ],
              //               ),
              //             ),
              //           ),
              //         );
              //       },
              //     ),
              //   ],
              // ),

              const HtmlElementView(viewType: 'webview-element')),
    );
  }
}
