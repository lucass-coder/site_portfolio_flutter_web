import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:site_portfolio/games/lib/managers/segment_manager.dart';
import 'package:site_portfolio/games/lib/pages/persons_maps/ninja/actors/dino_inimigo.dart';
import 'package:site_portfolio/games/lib/pages/persons_maps/ninja/actors/ninja.dart';
import 'package:site_portfolio/games/lib/pages/persons_maps/ninja/objects/chao_bloco.dart';
import 'package:site_portfolio/games/lib/pages/persons_maps/ninja/objects/estrela.dart';
import 'package:site_portfolio/games/lib/pages/persons_maps/ninja/objects/plataforma_bloco.dart';
import 'package:site_portfolio/games/lib/pages/persons_maps/ninja/overlays/hud.dart';

class GameNinja extends FlameGame
    with HasCollisionDetection, HasKeyboardHandlerComponents {
  GameNinja();

  Ninja _lucas = Ninja();

  double objectSpeed = 0.0;
  int starsCollected = 0;
  int health = 3;
  Vector2 velocity = Vector2(0, 0);
  late double lastBlockXPosition = 0.0;
  late UniqueKey lastBlockKey;

  @override
  Future<void> onLoad() async {
    await images.loadAll([
      'block.png',
      'ember.png',
      'chao.png',
      'heart_half.png',
      'heart.png',
      'star.png',
      'water_enemy.png',
      'meteor.png',
    ]);

    FlameAudio.bgm.initialize();

    add(SpriteComponent()
      ..sprite = await loadSprite('floresta.png')
      ..size = size);

    initializeGame(true);

    add(Hud());
  }

  void loadGameSegments(int segmentIndex, double xPositionOffset) {
    for (final block in segments[segmentIndex]) {
      switch (block.blockType) {
        case ChaoBloco:
          add(ChaoBloco(
            gridPosition: block.gridPosition,
            xOffset: xPositionOffset,
          ));
          break;
        case PlataformaBloco:
          add(PlataformaBloco(
            gridPosition: block.gridPosition,
            xOffset: xPositionOffset,
          ));
          break;
        case Estrela:
          add(Estrela(
            gridPosition: block.gridPosition,
            xOffset: xPositionOffset,
          ));
          break;
        case DinoInimigo:
          add(DinoInimigo(
            gridPosition: block.gridPosition,
            xOffset: xPositionOffset,
          ));
          break;
      }
    }
  }

  void togglePauseState() {
    if (paused) {
      resumeEngine();
    } else {
      pauseEngine();
    }
  }

  void initializeGame(bool loadHud) {
    // Assume that size.x < 3200

    final segmentsToLoad = (size.x / 640).ceil();
    segmentsToLoad.clamp(0, segments.length);

    for (var i = 0; i <= segmentsToLoad; i++) {
      loadGameSegments(i, (640 * i).toDouble());
    }

    _lucas = Ninja(
      position: Vector2(128, canvasSize.y - 128),
    );

    add(_lucas);

    if (loadHud) {
      add(Hud());
    }
  }

  @override
  void update(double dt) {
    //  if (starsCollected == 20) {
    // overlays.add('LucasFinish');
    // overlays.remove('gameOverlay');
    // overlays.remove('gameOverlay');
    // }

    if (overlays.isActive('MainMenu')) {
      overlays.remove('pauseNinja');
    }
    if (health <= 0 && starsCollected != 20) {
      overlays.add('GameOver');
      overlays.remove('pauseNinja');
    }

    // if (health <= 0) {
    //   overlays.add('GameOver');
    // }
    super.update(dt);
  }

  void reset() {
    starsCollected = 0;
    health = 3;
    FlameAudio.bgm.dispose();
    initializeGame(false);
  }

  @override
  KeyEventResult onKeyEvent(
      RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    super.onKeyEvent(event, keysPressed);

    if (!overlays.isActive('MainMenu')) {
      if (event is RawKeyDownEvent) {
        if (event.logicalKey == LogicalKeyboardKey.keyW) {
          // _lucas.jump();
        }
      }

      if (keysPressed.contains(LogicalKeyboardKey.keyD)) {
        if (keysPressed.contains(LogicalKeyboardKey.space)) {
          _lucas.pulo();
        } else {
          _lucas.walkRight();
        }
      } else if (keysPressed.contains(LogicalKeyboardKey.keyA)) {
        if (keysPressed.contains(LogicalKeyboardKey.space)) {
          _lucas.pulo();
        } else {
          _lucas.walkLeft();
        }
      } else if (keysPressed.contains(LogicalKeyboardKey.keyS)) {
        _lucas.idle();
      } else if (keysPressed.contains(LogicalKeyboardKey.space)) {
        _lucas.pulo();
      } else {
        _lucas.idle();
      }
    }
    return KeyEventResult.handled;
  }
}
