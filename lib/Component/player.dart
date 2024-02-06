import 'dart:async';
import 'package:flame/components.dart';
import 'package:flutter_game/Pages/game.dart';

class Player extends SpriteComponent with HasGameRef<MyGame> {
  Player()
      : super(
          size: Vector2(150, 150), // a vector2 is like a tuple of python.
          anchor: Anchor.center,
        );

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    sprite = await gameRef.loadSprite('player-sprite.jpg');
    position = gameRef.size / 2;
  }

  void move(Vector2 delta) {
    position.add(delta);
  }
}
