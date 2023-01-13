import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:site_portfolio/games/lib/pages/persons_maps/ninja/game_ninja.dart';
import 'package:site_portfolio/games/lib/pages/persons_maps/ninja/objects/chao_bloco.dart';
import 'package:site_portfolio/games/lib/pages/persons_maps/ninja/objects/plataforma_bloco.dart';

class DinoInimigo extends SpriteAnimationComponent with HasGameRef<GameNinja> {
  final Vector2 gridPosition;
  double xOffset;

  final Vector2 velocity = Vector2.zero();
  final _size = Vector2(58, 109);

  DinoInimigo({
    required this.gridPosition,
    required this.xOffset,
  }) : super(size: Vector2(68, 47), anchor: Anchor.bottomLeft);

  final Vector2 fromAbove = Vector2(0, -1);
  bool isOnGround = false;

  @override
  Future<void> onLoad() async {
    final parado0 = await gameRef.loadSprite('persons/dino/dino0.png');
    final parado1 = await gameRef.loadSprite('persons/dino/dino1.png');
    final parado2 = await gameRef.loadSprite('persons/dino/dino2.png');
    final parado3 = await gameRef.loadSprite('persons/dino/dino3.png');
    final parado4 = await gameRef.loadSprite('persons/dino/dino4.png');
    final parado5 = await gameRef.loadSprite('persons/dino/dino5.png');
    final parado6 = await gameRef.loadSprite('persons/dino/dino6.png');
    final parado7 = await gameRef.loadSprite('persons/dino/dino7.png');
    final parado8 = await gameRef.loadSprite('persons/dino/dino8.png');
    final parado9 = await gameRef.loadSprite('persons/dino/dino9.png');

    final paradoAnimacao = SpriteAnimation.spriteList([
      parado0,
      parado1,
      parado2,
      parado3,
      parado4,
      parado5,
      parado6,
      parado7,
      parado8,
      parado9,
    ], stepTime: 0.05, loop: true);

    final paradoComponent = SpriteAnimationComponent(
        animation: paradoAnimacao,
        anchor: Anchor.center,
        size: _size,
        removeOnFinish: false);

    paradoComponent.flipHorizontally();

    add(paradoComponent);

    position = Vector2(
      (gridPosition.x * size.x) + xOffset + (size.x / 3),
      game.size.y - (gridPosition.y * size.y) - (size.y / 0.48),
    );
    add(RectangleHitbox()..collisionType = CollisionType.passive);
    add(
      MoveEffect.by(
        Vector2(-2 * size.x, 0),
        EffectController(
          duration: 3,
          alternate: true,
          infinite: true,
          onMax: () => paradoComponent.flipHorizontally(),
          onMin: () => paradoComponent.flipHorizontally(),
        ),
      ),
    );
  }

  @override
  void update(double dt) {
    velocity.x = game.objectSpeed;
    position += velocity * dt;

    if (position.x < -size.x) removeFromParent();

    if (position.x < -size.x || game.health <= 0) {
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
