import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:site_portfolio/games/lib/pages/persons_maps/ninja/game_ninja.dart';

class MainMenu extends StatelessWidget {
  final GameNinja game;

  const MainMenu({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    const blackTextColor = Color.fromRGBO(0, 0, 0, 1.0);
    const whiteTextColor = Color.fromRGBO(255, 255, 255, 1.0);

    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          height: 300,
          width: 300,
          decoration: const BoxDecoration(
            color: blackTextColor,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Segue a dica!',
                style: TextStyle(
                  color: whiteTextColor,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                'Use  <- ->  para se mover. \n Barra de Espaço para Pular. \n E NÃO SEJA ATINGIDO! \n\nBom divertimento!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: whiteTextColor,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 200,
                height: 75,
                child: ElevatedButton(
                  onPressed: () {
                    game.overlays.remove('MainMenu');
                    FlameAudio.bgm.play('ninja_theme.mp3');
                    game.overlays.add('pauseNinja');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: whiteTextColor,
                  ),
                  child: const Text(
                    'Jogar',
                    style: TextStyle(
                      fontSize: 40.0,
                      color: blackTextColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
