import 'package:flame/components.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/material.dart';

import './doodle_dash.dart';

class World extends ParallaxComponent<DoodleDash> {
  @override
  Future<void> onLoad() async {
    parallax = await gameRef.loadParallax(
      [
        ParallaxImageData('game/06_Background_Solid.png'),
        ParallaxImageData('game/05_Background_Small_Stars.png'),
        ParallaxImageData('game/04_Background_Big_Stars.png'),
        ParallaxImageData('game/02_Background_Orbs.png'),
        ParallaxImageData('game/03_Background_Block_Shapes.png'),
        ParallaxImageData('game/01_Background_Squiggles.png'),
      ],
      fill: LayerFill.width,
      repeat: ImageRepeat.repeat,
      baseVelocity: Vector2(0, -5),
      velocityMultiplierDelta: Vector2(0, 1.2),
    );
  }
}
