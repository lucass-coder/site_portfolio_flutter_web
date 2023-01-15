import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:site_portfolio/games/lib/pages/persons_maps/lucas/game_lucas.dart';

class LucasFinish extends StatelessWidget {
  final GameLucas game;

  const LucasFinish({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          height: 400,
          width: 300,
          decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Parabéns!! '
                '\n O MONSTRO SAIU DA JAULA!!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 20),
              Image.asset(
                'assets/images/jaula.gif',
                height: 150,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    game.reset2();
                    game.overlays.remove('LucasFinish');
                    FlameAudio.bgm.play('musica_maromba.mp3');
                    game.overlays.add('gameOverlay');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  child: const Text(
                    'Jogar Novamente',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
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
