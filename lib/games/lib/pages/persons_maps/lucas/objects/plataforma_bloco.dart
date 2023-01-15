import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:site_portfolio/games/lib/pages/persons_maps/lucas/game_lucas.dart';

class PlataformaBloco extends SpriteComponent with HasGameRef<GameLucas> {
  final Vector2 gridPosition;
  double xOffset;

  double objectSpeed = 0.0;
  final Vector2 velocity = Vector2.zero();

  PlataformaBloco({
    required this.gridPosition,
    required this.xOffset,
  }) : super(size: Vector2.all(64), anchor: Anchor.bottomLeft);

  @override
  Future<void> onLoad() async {
    final platformImage = game.images.fromCache('block.png');
    sprite = Sprite(platformImage);
    position = Vector2(
      (gridPosition.x * size.x) + xOffset,
      game.size.y - (gridPosition.y * size.y),
    );
    add(RectangleHitbox()..collisionType = CollisionType.passive);
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
}
