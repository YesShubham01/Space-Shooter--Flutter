import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:space_shooter/Pages/game.dart';

class Bullet extends SpriteAnimationComponent with HasGameRef<MyGame> {
  Bullet({super.position})
      : super(
          size: Vector2(25, 50),
          anchor: Anchor.center,
        );

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    animation = await game.loadSpriteAnimation(
      'bullet.png',
      SpriteAnimationData.sequenced(
          amount: 4, stepTime: .2, textureSize: Vector2(8, 16)),
    );

    // adding hit-box
    /*
    There are three types of collisions in Flame:
      active -> collides with other Hitboxes of type active or passive
      passive -> collides with other Hitboxes of type active
      inactive -> will not collide with any other Hitboxes
    */
    add(
      RectangleHitbox(
        collisionType: CollisionType.passive,
      ),
    );
  }

  @override
  void update(double dt) {
    super.update(dt);

    position.y += dt * (-500);

    if (position.y < -height) {
      removeFromParent();
    }
  }
}
