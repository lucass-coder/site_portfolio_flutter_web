import 'package:flutter/material.dart';

class ImageBox extends StatefulWidget {
  final String imageUrl;

  const ImageBox({Key? key, required this.imageUrl}) : super(key: key);

  @override
  State<ImageBox> createState() => _ImageBoxState();
}

class _ImageBoxState extends State<ImageBox> {
  double selecionado = 1;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => selecionado = 0.5),
      onExit: (_) => setState(() => selecionado = 1.0),
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
    );
  }
}
