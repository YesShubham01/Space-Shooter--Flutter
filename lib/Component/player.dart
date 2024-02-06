import 'dart:async';
import 'package:flame/components.dart';

import 'package:space_shooter/Component/bullet.dart';
import 'package:space_shooter/Pages/game.dart';

class Player extends SpriteAnimationComponent with HasGameRef<MyGame> {
  Player()
      : super(
          size: Vector2(100, 150), // a vector2 is like a tuple of python.
          anchor: Anchor.center,
        );

  late final SpawnComponent _bulletSpawner;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    _bulletSpawner = SpawnComponent(
      factory: (index) {
        return Bullet(position: position + Vector2(0, (-height / 2)));
      },
      period: .2,
      selfPositioning: true,
      autoStart: false,
    );
    game.add(_bulletSpawner);

    animation = await game.loadSpriteAnimation(
        'player.png',
        SpriteAnimationData.sequenced(
            amount: 4, stepTime: .2, textureSize: Vector2(32, 48)));

    position = gameRef.size / 2;
  }

  void move(Vector2 delta) {
    position.add(delta);
  }

  void startShooting() {
    _bulletSpawner.timer.start();
  }

  void stopShooting() {
    _bulletSpawner.timer.stop();
  }
}
