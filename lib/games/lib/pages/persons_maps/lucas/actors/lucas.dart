import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:site_portfolio/games/lib/pages/persons_maps/lucas/actors/maromba_inimigo.dart';
import 'package:site_portfolio/games/lib/pages/persons_maps/lucas/game_lucas.dart';
import 'package:site_portfolio/games/lib/pages/persons_maps/lucas/objects/chao_bloco.dart';
import 'package:site_portfolio/games/lib/pages/persons_maps/lucas/objects/creatina.dart';
import 'package:site_portfolio/games/lib/pages/persons_maps/lucas/objects/plataforma_bloco.dart';
import 'package:site_portfolio/games/lib/pages/persons_maps/lucas/objects/whey.dart';

enum LucasState {
  parado,
  andando,
  pulando,
}

class Lucas extends SpriteAnimationComponent
    with KeyboardHandler, CollisionCallbacks, HasGameRef<GameLucas> {
  Lucas({super.position, super.size})
      : super(
          anchor: Anchor.center,
        ) {
    debugMode = false;
  }

  LucasState state = LucasState.parado;

  late final SpriteAnimationComponent caminharComponent;
  late final SpriteComponent puloComponent;
  late final SpriteComponent paradoComponent;

  late Component currentComponent;

  int accelerationX = 0;
  final double gravity = 15;

  int horizontalDirection = 0;
  final Vector2 velocity = Vector2.zero();
  final double moveSpeed = 200;

  final double jumpSpeed = 800;
  double terminalVelocity = 300;
  bool hasJumped = false;
  bool isOnGround = false;
  final Vector2 fromAbove = Vector2(0, -73);
  bool hitByEnemy = false;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    final paradoImgem = await gameRef.loadSprite('persons/lucas/parado.png');
    List<Sprite> caminharAnimacaoList = [];
    final jump = await gameRef.loadSprite('persons/lucas/parado.png');

    for (int i = 1; i <= 8; i++) {
      caminharAnimacaoList
          .add(await gameRef.loadSprite('persons/lucas/run_$i.png'));
    }
    final SpriteAnimation caminharAnimacao = SpriteAnimation.spriteList(
        caminharAnimacaoList,
        stepTime: 0.10,
        loop: true);

    paradoComponent =
        SpriteComponent(sprite: paradoImgem, size: Vector2(38, 73));

    caminharComponent = SpriteAnimationComponent(
      animation: caminharAnimacao,
      size: Vector2(38, 73),
      scale: Vector2.all(1),
    );

    puloComponent = SpriteComponent(
      sprite: jump,
      size: Vector2(38, 73),
    );

    currentComponent = paradoComponent;

    add(paradoComponent);
    add(
      RectangleHitbox(),
    );
  }

  void idle() {
    horizontalDirection = 0;
    _setComponent(paradoComponent);
  }

  void walkLeft() {
    horizontalDirection = 0;
    horizontalDirection -= 1;
    _setComponent(caminharComponent);
  }

  void walkRight() {
    horizontalDirection = 0;
    horizontalDirection += 1;
    _setComponent(caminharComponent);
  }

  void pulo() {
    if (state == LucasState.pulando) return;
    terminalVelocity = 300;
    state = LucasState.pulando;
    _setComponent(puloComponent);
    velocity.y = -jumpSpeed;
    hasJumped = false;
  }

  @override
  void update(double dt) {
    super.update(dt);
    game.objectSpeed = 0;
    velocity.x = horizontalDirection * moveSpeed;

    velocity.y += gravity;

    if (position.x - 36 <= 0 && horizontalDirection < 0) {
      velocity.x = 0;
    }

    if (position.x + 64 >= game.size.x / 2 && horizontalDirection > 0) {
      velocity.x = 0;
      game.objectSpeed = -moveSpeed;
    }

    position += velocity * dt;

    velocity.y = velocity.y.clamp(-jumpSpeed, terminalVelocity);

    if (position.y > game.size.y + size.y) {
      game.health = 0;
    }

    if (game.health <= 0 || game.starsCollected == 20) {
      removeFromParent();
    }
  }

  void _setComponent(PositionComponent component) {
    if (horizontalDirection < 0 && scale.x > 0) {
      flipHorizontally();
    } else if (horizontalDirection > 0 && scale.x < 0) {
      flipHorizontally();
    }

    if (component == currentComponent) return;
    remove(currentComponent);
    currentComponent = component;
    add(component);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is ChaoBloco || other is PlataformaBloco) {
      terminalVelocity = 100;
      if (intersectionPoints.length == 2) {
        final mid = (intersectionPoints.elementAt(0) +
                intersectionPoints.elementAt(1)) /
            2;

        final collisionNormal = absoluteCenter - mid;
        final separationDistance = (size.x) - collisionNormal.length;
        collisionNormal.normalize();

        // Detecta Boneco no chão
        if (fromAbove.dot(collisionNormal) > 0.1) {
          state = LucasState.parado;
          isOnGround = true;
        }

        position += collisionNormal.scaled(separationDistance);
      }
    }

    if (other is MarombaInimigo) {
      hit();
    }

    if (other is Whey) {
      other.removeFromParent();
      game.starsCollected++;
      size = Vector2(size.x + 4, size.y + 8);
      paradoComponent.size = size;
      caminharComponent.size = size;
      puloComponent.size = size;
    }
    if (other is Creatina) {
      other.removeFromParent();
      game.starsCollected++;
      size = Vector2(size.x + 4, size.y + 8);
      paradoComponent.size = size;
      caminharComponent.size = size;
      puloComponent.size = size;
    }
    isOnGround = true;

    super.onCollision(intersectionPoints, other);
  }

  void hit() {
    if (!hitByEnemy) {
      game.health--;
      hitByEnemy = true;
    }

    final effect = GlowEffect(
      1000.0,
      EffectController(
        alternate: true,
        duration: 0.2,
        repeatCount: 5,
      ),
    )..onComplete = () {
        hitByEnemy = false;
      };

    add(effect);
  }
}
