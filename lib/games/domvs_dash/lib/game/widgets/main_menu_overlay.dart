import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:site_portfolio/screens/home_page.dart';
import 'package:site_portfolio/winXp/home_page_xp.dart';

import '../doodle_dash.dart';

class MainMenuOverlay extends StatefulWidget {
  final bool originXp;
  const MainMenuOverlay(this.game, {super.key, required this.originXp});

  final Game game;

  @override
  State<MainMenuOverlay> createState() => _MainMenuOverlayState();
}

class _MainMenuOverlayState extends State<MainMenuOverlay> {
  Character character = Character.dash;
  String labelLevel = 'Bebe';

  @override
  Widget build(BuildContext context) {
    DoodleDash game = widget.game as DoodleDash;

    return LayoutBuilder(builder: (context, constraints) {
      final characterWidth = constraints.maxWidth / 5;

      final TextStyle titleStyle = (constraints.maxWidth > 830)
          ? Theme.of(context).textTheme.displayLarge!
          : Theme.of(context).textTheme.displaySmall!;

      final bool screenHeightIsSmall = constraints.maxHeight < 760;

      return Material(
        color: Theme.of(context).colorScheme.background,
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Escalada do Sucesso!',
                    style: titleStyle.copyWith(
                      height: .8,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const WhiteSpace(),
                  Align(
                    alignment: Alignment.center,
                    child: Text('Selecione seu personagem:',
                        style: Theme.of(context).textTheme.headlineSmall!),
                  ),
                  if (!screenHeightIsSmall) const WhiteSpace(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CharacterButton(
                        character: Character.dash,
                        selected: character == Character.dash,
                        name: 'Dash',
                        onSelectChar: () {
                          setState(() {
                            character = Character.dash;
                          });
                        },
                        characterWidth: characterWidth,
                      ),
                      CharacterButton(
                        character: Character.sparky,
                        selected: character == Character.sparky,
                        name: 'Lucas',
                        onSelectChar: () {
                          setState(() {
                            character = Character.sparky;
                          });
                        },
                        characterWidth: characterWidth,
                      ),
                    ],
                  ),
                  if (!screenHeightIsSmall) const WhiteSpace(height: 50),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Dificuldade:',
                            style: Theme.of(context).textTheme.bodyLarge!),
                        LevelPicker(
                          level: game.levelManager.selectedLevel.toDouble(),
                          label: labelLevel,
                          onChanged: ((value) {
                            switch (value.toInt()) {
                              case 1:
                                labelLevel = 'Bebe';
                                break;
                              case 2:
                                labelLevel = 'Ta brincando?';
                                break;
                              case 3:
                                labelLevel = 'Ok!';
                                break;
                              case 4:
                                labelLevel = 'Cuidado!';
                                break;
                              case 5:
                                labelLevel = 'Masoquista';
                                break;
                              default:
                                // O que fazer quando o valor não corresponder a nenhum dos casos acima?
                                break;
                            }
                            setState(() {
                              game.levelManager.selectLevel(value.toInt());
                            });
                          }),
                        ),
                      ],
                    ),
                  ),
                  if (!screenHeightIsSmall) const WhiteSpace(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          game.gameManager.selectCharacter(character);
                          game.startGame();
                        },
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(
                            const Size(100, 50),
                          ),
                          textStyle: MaterialStateProperty.all(
                              Theme.of(context).textTheme.titleLarge),
                        ),
                        child: const Text('Começar'),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          if (widget.originXp == true) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomePageXp()),
                            );
                          } else {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomePage()),
                            );
                          }
                        },
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(
                            const Size(100, 50),
                          ),
                          textStyle: MaterialStateProperty.all(
                              Theme.of(context).textTheme.titleLarge),
                        ),
                        child: const Text('Voltar a área de trabalho'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}

class LevelPicker extends StatelessWidget {
  const LevelPicker({
    super.key,
    required this.level,
    required this.label,
    required this.onChanged,
  });

  final double level;
  final String label;
  final void Function(double) onChanged;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Slider(
      value: level,
      max: 5,
      min: 1,
      divisions: 4,
      label: label,
      onChanged: onChanged,
    ));
  }
}

class CharacterButton extends StatelessWidget {
  final Character character;
  final bool selected;
  final void Function() onSelectChar;
  final double characterWidth;
  final String name;

  const CharacterButton(
      {super.key,
      required this.character,
      this.selected = false,
      required this.onSelectChar,
      required this.characterWidth,
      required this.name});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: (selected)
          ? ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  const Color.fromARGB(31, 64, 195, 255)))
          : null,
      onPressed: onSelectChar,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Image.asset(
              'assets/images/game/${character.name}_center.png',
              height: characterWidth,
              width: characterWidth,
            ),
            const WhiteSpace(height: 18),
            Text(
              name,
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}

class WhiteSpace extends StatelessWidget {
  const WhiteSpace({super.key, this.height = 100});

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}
