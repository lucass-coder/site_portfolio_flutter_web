import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:site_portfolio/games/lib/pages/persons_maps/lucas/game_lucas.dart';
import 'package:site_portfolio/games/lib/pages/persons_maps/lucas/overlays/lucas_coracao.dart';

class LucasHud extends PositionComponent with HasGameRef<GameLucas> {
  LucasHud({
    super.position,
    super.size,
    super.scale,
    super.angle,
    super.anchor,
    super.children,
    super.priority = 5,
  }) {
    positionType = PositionType.viewport;
  }

  late TextComponent _scoreTextComponent;
  late Sprite frango;
  late Sprite fortinho;
  late Sprite maromba;
  late SpriteComponent atual;

  @override
  Future<void>? onLoad() async {
    _scoreTextComponent = TextComponent(
      text: 'Maromba',
      textRenderer: TextPaint(
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 32,
          color: Colors.red,
          shadows: <Shadow>[
            Shadow(
              offset: Offset(4.0, 4.0),
              blurRadius: 3.0,
              color: Colors.white,
            ),
            Shadow(
              offset: Offset(4.0, 4.0),
              blurRadius: 8.0,
              color: Colors.white,
            ),
          ],
        ),
      ),
      anchor: Anchor.center,
      position: Vector2(game.size.x - 80, 30),
    );
    add(_scoreTextComponent);

    frango = await game.loadSprite('frango.png');
    fortinho = await game.loadSprite('fortinho.png');
    maromba = await game.loadSprite('maromba.png');

    atual = SpriteComponent(
      sprite: frango,
      position: Vector2(game.size.x - 160, 20),
      size: Vector2.all(32),
      anchor: Anchor.center,
    );
    add(atual);

    for (var i = 1; i <= game.health; i++) {
      final positionX = 40 * i;
      await add(
        VidaComponent(
          heartNumber: i,
          position: Vector2(positionX.toDouble(), 20),
          size: Vector2.all(32),
        ),
      );
    }

    return super.onLoad();
  }

  @override
  void update(double dt) {
    if (game.starsCollected <= 5) {
      _scoreTextComponent.text = 'Frango';
      remove(atual);

      atual = SpriteComponent(
        sprite: frango,
        position: Vector2(game.size.x - 180, 20),
        size: Vector2.all(48),
        anchor: Anchor.center,
      );
      add(atual);
    } else if (game.starsCollected > 5 && game.starsCollected <= 10) {
      _scoreTextComponent.text = 'Fortinho';
      remove(atual);
      atual = SpriteComponent(
        sprite: fortinho,
        position: Vector2(game.size.x - 180, 20),
        size: Vector2.all(32),
        anchor: Anchor.center,
      );
      add(atual);
    } else if (game.starsCollected > 10) {
      _scoreTextComponent.text = 'Maromba';
      remove(atual);
      atual = SpriteComponent(
        sprite: maromba,
        position: Vector2(game.size.x - 180, 30),
        size: Vector2.all(48),
        anchor: Anchor.center,
      );
      add(atual);
    }
    super.update(dt);
  }
}
