import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:site_portfolio/games/lib/pages/persons_maps/ninja/game_ninja.dart';
import 'package:site_portfolio/games/lib/routes.dart';

class PauseNinja extends StatefulWidget {
  final GameNinja game;

  const PauseNinja({super.key, required this.game});

  @override
  State<PauseNinja> createState() => _PauseNinjaState();
}

class _PauseNinjaState extends State<PauseNinja> {
  bool isPaused = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isPaused ? Colors.black54 : Colors.transparent,
      child: Stack(
        children: [
          Positioned(
            top: 60,
            right: 30,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
              onPressed: () {
                widget.game.togglePauseState();
                isPaused ? FlameAudio.bgm.resume() : FlameAudio.bgm.pause();
                setState(
                  () {
                    isPaused = !isPaused;
                  },
                );
              },
              child: isPaused
                  ? const Icon(
                      Icons.play_arrow,
                      size: 48,
                    )
                  : const Icon(
                      Icons.pause,
                      size: 48,
                    ),
            ),
          ),
          if (isPaused)
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    onPressed: () {
                      widget.game.togglePauseState();
                      setState(() {
                        isPaused = !isPaused;
                      });
                      widget.game.health = 0;
                    },
                    child: const Icon(
                      Icons.restart_alt,
                      size: 48,
                    ),
                  ),
                  const SizedBox(width: 20),
                  SizedBox(
                    height: 48,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      onPressed: () {
                        FlameAudio.bgm.stop();
                        Navigator.pushReplacementNamed(context, Routes.menu);
                      },
                      child: const Text(
                        'Voltar para a página inicial',
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
