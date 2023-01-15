// ignore_for_file: override_on_non_overriding_member

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:site_portfolio/games/lib/pages/persons_maps/lucas/game_lucas.dart';
import 'package:site_portfolio/games/lib/pages/persons_maps/lucas/objects/chao_bloco.dart';
import 'package:site_portfolio/games/lib/pages/persons_maps/lucas/objects/plataforma_bloco.dart';

class MarombaInimigo extends SpriteAnimationComponent
    with HasGameRef<GameLucas> {
  final Vector2 gridPosition;
  double xOffset;

  final Vector2 velocity = Vector2.zero();
  final double gravity = 15;

  MarombaInimigo({
    required this.gridPosition,
    required this.xOffset,
  }) : super(
          size: Vector2(68, 111),
        ) {
    // debugMode = true;
  }

  final Vector2 fromAbove = Vector2(0, -1);
  bool isOnGround = false;

  @override
  Future<void> onLoad() async {
    final parado0 = await gameRef.loadSprite('persons/maromba/maromba_1.png');
    final parado1 = await gameRef.loadSprite('persons/maromba/maromba_2.png');
    final parado2 = await gameRef.loadSprite('persons/maromba/maromba_3.png');
    final parado3 = await gameRef.loadSprite('persons/maromba/maromba_4.png');
    final parado4 = await gameRef.loadSprite('persons/maromba/maromba_5.png');
    final parado5 = await gameRef.loadSprite('persons/maromba/maromba_6.png');
    final parado6 = await gameRef.loadSprite('persons/maromba/maromba_7.png');
    final parado7 = await gameRef.loadSprite('persons/maromba/maromba_8.png');

    final paradoAnimacao = SpriteAnimation.spriteList([
      parado0,
      parado1,
      parado2,
      parado3,
      parado4,
      parado5,
      parado6,
      parado7,
    ], stepTime: 0.05, loop: true);

    final marombaComponent = SpriteAnimationComponent(
        animation: paradoAnimacao,
        anchor: Anchor.topCenter,
        size: size,
        removeOnFinish: false);

    // marombaComponent.flipHorizontally();

    add(marombaComponent);

    position = Vector2(
      (gridPosition.x * size.x) + xOffset + (size.x / 2),
      game.size.y - (gridPosition.y * size.y) - (size.y / 0.42),
    );
    add(RectangleHitbox()..collisionType = CollisionType.passive);
    add(
      MoveEffect.by(
        Vector2(-2 * size.x, 0),
        EffectController(
          duration: 3,
          alternate: true,
          infinite: true,
          onMax: () {
            // remove(marombaComponent);
            marombaComponent.flipHorizontally();
          },
          onMin: () => marombaComponent.flipHorizontally(),
        ),
      ),
    );
  }

  @override
  void update(double dt) {
    velocity.x = game.objectSpeed;
    position += velocity * dt;

    if (position.x < -size.x) removeFromParent();

    if (position.x < -size.x || game.health <= 0 || game.starsCollected == 20) {
      removeFromParent();
    }

    super.update(dt);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is ChaoBloco || other is PlataformaBloco) {
      if (intersectionPoints.length == 2) {
        // Calculate the collision normal and separation distance.
        final mid = (intersectionPoints.elementAt(0) +
                intersectionPoints.elementAt(1)) /
            2;

        final collisionNormal = absoluteCenter - mid;
        final separationDistance = (size.x / 2) - collisionNormal.length;
        collisionNormal.normalize();

        // If collision normal is almost upwards,
        // ember must be on ground.
        if (fromAbove.dot(collisionNormal) > 0.9) {
          isOnGround = true;
        }

        // Resolve collision by moving ember along
        // collision normal by separation distance.
        position += collisionNormal.scaled(separationDistance);
      }
    }
  }
}
