import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:site_portfolio/games/lib/managers/lucas_segment_manager.dart';
import 'package:site_portfolio/games/lib/pages/persons_maps/lucas/actors/lucas.dart';
import 'package:site_portfolio/games/lib/pages/persons_maps/lucas/actors/maromba_inimigo.dart';
import 'package:site_portfolio/games/lib/pages/persons_maps/lucas/objects/chao_bloco.dart';
import 'package:site_portfolio/games/lib/pages/persons_maps/lucas/objects/creatina.dart';
import 'package:site_portfolio/games/lib/pages/persons_maps/lucas/objects/plataforma_bloco.dart';
import 'package:site_portfolio/games/lib/pages/persons_maps/lucas/objects/whey.dart';
import 'package:site_portfolio/games/lib/pages/persons_maps/lucas/overlays/lucas_hud.dart';

class GameLucas extends FlameGame with HasCollisionDetection, HasKeyboardHandlerComponents {
  GameLucas();

  Lucas _lucas = Lucas();

  double objectSpeed = 0.0;
  int starsCollected = 0;
  int health = 15;
  Vector2 velocity = Vector2(0, 0);
  late double lastBlockXPosition = 0.0;
  late UniqueKey lastBlockKey;
  Vector2 sizeLucas = Vector2(38, 73);

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
      'lucas.png',
      'whey.png',
      'creatina.png',
      'frango.png',
      'fortinho.png',
      'maromba.png',
    ]);

    FlameAudio.bgm.initialize();

    // add(SpriteComponent()
    //   ..sprite = await loadSprite('floresta.png')
    //   ..size = size);

    initializeGame(true);

    add(LucasHud());
  }

  @override
  Color backgroundColor() {
    return const Color.fromARGB(255, 173, 223, 247);
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
        case Creatina:
          add(Creatina(
            gridPosition: block.gridPosition,
            xOffset: xPositionOffset,
          ));
          break;
        case Whey:
          add(Whey(
            gridPosition: block.gridPosition,
            xOffset: xPositionOffset,
          ));
          break;
        case MarombaInimigo:
          add(MarombaInimigo(
            gridPosition: block.gridPosition,
            xOffset: xPositionOffset,
          ));
          break;
      }
    }
  }

  void initializeGame(bool loadHud) {
    // Assume that size.x < 3200

    final segmentsToLoad = (size.x / 640).ceil();
    segmentsToLoad.clamp(0, segments.length);

    for (var i = 0; i <= segmentsToLoad; i++) {
      loadGameSegments(i, (640 * i).toDouble());
    }

    _lucas = Lucas(
      position: Vector2(128, canvasSize.y - 128),
      size: sizeLucas,
    );

    add(_lucas);

    if (loadHud) {
      add(LucasHud());
    }
  }

  void togglePauseState() {
    if (paused) {
      resumeEngine();
    } else {
      pauseEngine();
    }
  }

  @override
  void update(double dt) {
    if (starsCollected == 20) {
      overlays.add('LucasFinish');
      overlays.remove('gameOverlay');
      overlays.remove('gameOverlay');
    }

    if (overlays.isActive('LucasMainMenu')) {
      overlays.remove('gameOverlay');
    }
    if (health <= 0 && starsCollected != 20) {
      overlays.add('LucasGameOver');
      overlays.remove('gameOverlay');
    }
    super.update(dt);
  }

  void reset2() {
    starsCollected = 0;
    health = 15;
    FlameAudio.bgm.dispose();
    initializeGame(false);
  }

  @override
  KeyEventResult onKeyEvent(RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    super.onKeyEvent(event, keysPressed);

    if (!overlays.isActive('LucasMainMenu')) {
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
        sizeLucas = Vector2(sizeLucas.x + 10, sizeLucas.y + 10);
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
