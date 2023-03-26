import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:site_portfolio/winXp/controllers/controller_home_page.dart';

class ImageBoxXp extends StatefulWidget {
  final String imageUrl;
  final String imageName;

  const ImageBoxXp({Key? key, required this.imageUrl, required this.imageName})
      : super(key: key);

  @override
  State<ImageBoxXp> createState() => _ImageBoxXpState();
}

class _ImageBoxXpState extends State<ImageBoxXp> {
  double selecionado = 1;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => selecionado = 0.5),
      onExit: (_) => setState(() => selecionado = 1.0),
      child: GestureDetector(
        onTap: () {
          Get.find<ControllerHomePage>().setImageBackground(widget.imageName);
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 150,
            width: 180,
            decoration: BoxDecoration(
              image: DecorationImage(
                opacity: selecionado,
                image: AssetImage(widget.imageUrl),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
