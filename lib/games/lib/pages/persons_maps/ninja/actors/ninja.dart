import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:site_portfolio/games/lib/pages/persons_maps/ninja/actors/dino_inimigo.dart';
import 'package:site_portfolio/games/lib/pages/persons_maps/ninja/game_ninja.dart';
import 'package:site_portfolio/games/lib/pages/persons_maps/ninja/objects/chao_bloco.dart';
import 'package:site_portfolio/games/lib/pages/persons_maps/ninja/objects/estrela.dart';
import 'package:site_portfolio/games/lib/pages/persons_maps/ninja/objects/plataforma_bloco.dart';

enum NinjaState {
  parado,
  andando,
  pulando,
}

class Ninja extends SpriteAnimationComponent
    with KeyboardHandler, CollisionCallbacks, HasGameRef<GameNinja> {
  Ninja({super.position})
      : super(
          // position: Vector2(400, 150),
          size: Vector2(77, 146),
          anchor: Anchor.center,
        ) {
    debugMode = false;
  }

  NinjaState state = NinjaState.parado;

  late final SpriteAnimationComponent paradoComponent;
  late final SpriteAnimationComponent caminharComponent;
  late final SpriteComponent puloComponent;

  late Component currentComponent;

  int accelerationX = 0;
  final double gravity = 10;

  int horizontalDirection = 0;
  final Vector2 velocity = Vector2.zero();
  final double moveSpeed = 200;

  final double jumpSpeed = 600;
  final double terminalVelocity = 150;
  bool hasJumped = false;
  bool isOnGround = false;
  final Vector2 fromAbove = Vector2(0, -100);
  bool hitByEnemy = false;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    List<Sprite> paradoAnimacaoList = [];
    List<Sprite> caminharAnimacaoList = [];
    final jump = await gameRef.loadSprite('persons/ninja/jump.png');

    for (int i = 0; i < 10; i++) {
      paradoAnimacaoList
          .add(await gameRef.loadSprite('persons/ninja/Idle__00$i.png'));
    }

    for (int i = 0; i < 10; i++) {
      // caminharAnimacaoList.add(await gameRef.loadSprite('persons/ninja/Run__00$i.png'));
      caminharAnimacaoList
          .add(await gameRef.loadSprite('persons/ninja/Run__00$i.png'));
    }

    final SpriteAnimation paradoAnimacao = SpriteAnimation.spriteList(
        paradoAnimacaoList,
        stepTime: 0.05,
        loop: true);
    final SpriteAnimation caminharAnimacao = SpriteAnimation.spriteList(
        caminharAnimacaoList,
        stepTime: 0.05,
        loop: true);

    paradoComponent = SpriteAnimationComponent(
      playing: true,
      animation: paradoAnimacao,
      size: Vector2(66, 113),
      scale: Vector2.all(1),
    );

    caminharComponent = SpriteAnimationComponent(
      animation: caminharAnimacao,
      size: Vector2(77, 113),
    );

    puloComponent = SpriteComponent(
      sprite: jump,
      size: Vector2(77, 113),
    );

    currentComponent = paradoComponent;

    add(paradoComponent);
    // final effect = ScaleEffect.by(
    //   Vector2.all(1.5),
    //   EffectController(duration: 0.3),
    // );
    //   ..onComplete = () {
    //   hitByEnemy = false;
    // };

    // add(effect);

    add(
      CircleHitbox(),
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
    if (state == NinjaState.pulando) return;
    state = NinjaState.pulando;
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

    // print('ANDANDO');
    // Prevent ember from going backwards at screen edge.
    if (position.x - 36 <= 0 && horizontalDirection < 0) {
      velocity.x = 0;
    }
    // Avança a tela
    // Se eu remover o IF a tela permanece acelerando sem parar
    if (position.x + 64 >= game.size.x / 2 && horizontalDirection > 0) {
      velocity.x = 0;
      game.objectSpeed = -moveSpeed;
    }

    // velocity.x = horizontalDirection * moveSpeed;
    position += velocity * dt;

    velocity.y = velocity.y.clamp(-jumpSpeed, terminalVelocity);

    // If ember fell in pit, then game over.
    if (position.y > game.size.y + size.y) {
      game.health = 0;
    }

    if (game.health <= 0) {
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
      if (intersectionPoints.length == 2) {
        final mid = (intersectionPoints.elementAt(0) +
                intersectionPoints.elementAt(1)) /
            2;

        final collisionNormal = absoluteCenter - mid;
        final separationDistance = (size.x / 2) - collisionNormal.length;
        collisionNormal.normalize();

        // If collision normal is almost upwards,
        // Detecta Boneco no chão
        if (fromAbove.dot(collisionNormal) > 0.1) {
          state = NinjaState.parado;
          isOnGround = true;
        }
        // position -= collisionNormal.scaled(separationDistance -2.4) ;
        position += collisionNormal.scaled(separationDistance);
      }
    }

    if (other is DinoInimigo) {
      hit();
    }

    if (other is Estrela) {
      other.removeFromParent();
      game.starsCollected++;
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

    // add(
    //   OpacityEffect.fadeOut(
    //     EffectController(
    //       alternate: true,
    //       duration: 0.2,
    //       repeatCount: 5,
    //     ),
    //   )..onComplete = () {
    //     hitByEnemy = false;
    //   },
    // );

    // add(
    //   OpacityEffect.fadeOut(
    //     EffectController(
    //       alternate: true,
    //       duration: 0.2,
    //       repeatCount: 5,
    //     ),
    //   )..onComplete = () {
    //     hitByEnemy = false;
    //   },
    // );
  }
}
