import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:site_portfolio/games/lib/widgets/selection_person_area.dart';

class SelectionPersonPage extends StatefulWidget {
  const SelectionPersonPage({super.key});

  @override
  State<SelectionPersonPage> createState() => _SelectionPersonPageState();
}

class _SelectionPersonPageState extends State<SelectionPersonPage> {
  List<SelectionPersonArea> personagens = [
    SelectionPersonArea(person: Person.lucas),
    SelectionPersonArea(person: Person.ninja),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        FlameAudio.bgm.stop();
        Navigator.pop(context);
        return Future.delayed(
          const Duration(seconds: 1),
        );
      },
      child: Scaffold(
        backgroundColor: Colors.blueAccent,
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              const SizedBox(height: 50),
              Text(
                'Escolha seu personagem',
                style: TextStyle(
                  fontSize: 32,
                  height: 1.2,
                  //line height 150% of actual height
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      offset: const Offset(2.0, 2.0), //position of shadow
                      blurRadius: 6.0, //blur intensity of shadow
                      color: Colors.black
                          .withOpacity(0.8), //color of shadow with opacity
                    ),

                    //add more shadow with different position offset here
                  ],
                ),
              ),
              const SizedBox(height: 60),
              Expanded(
                child: CarouselSlider.builder(
                  unlimitedMode: true,
                  slideBuilder: (index) {
                    return Container(child: personagens[index]);
                  },
                  // slideTransform: BackgroundToForegroundTransform(),
                  slideIndicator: CircularSlideIndicator(
                    currentIndicatorColor: Colors.blueAccent,
                    padding: const EdgeInsets.only(bottom: 32),
                    indicatorBorderColor: Colors.white,
                  ),
                  itemCount: personagens.length,
                  initialPage: 0,
                  enableAutoSlider: true,
                ),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   children: [
              //     SelectionPersonArea(),
              //     SelectionPersonArea(),
              //     SelectionPersonArea(),
              //     SelectionPersonArea(),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
