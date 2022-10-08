import 'package:flutter/material.dart';
import 'package:site_portfolio/widgets/image_box.dart';

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
                    child: const Center(
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
                constraints:
                    const BoxConstraints(minHeight: 100, maxHeight: 340),
                child: IntrinsicHeight(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            ImageBox(onChangeImage: widget.onChangeImage1, imageUrl: 'https://github.com/lucass-coder/lucass-coder.github.io/blob/main/assets/assets/images/image-1.png?raw=true',),
                            ImageBox(onChangeImage: widget.onChangeImage2, imageUrl: 'assets/images/image-2.png',),
                          ],
                        ),
                        Row(
                          children: [
                           ImageBox(onChangeImage: widget.onChangeImage3, imageUrl: 'assets/images/image-3.png',),
                            ImageBox(onChangeImage: widget.onChangeImage4, imageUrl: 'assets/images/image-4.png',),
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
