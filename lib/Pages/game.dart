import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/src/gestures/events.dart';
import 'package:flame/widgets.dart';
import 'package:flutter_game/Component/player.dart';

class MyGame extends FlameGame with PanDetector {
  late Player circle;
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    circle = Player();

    add(circle);
  }

  @override
  void onPanUpdate(DragUpdateInfo info) {
    circle.move(info.delta.global);
  }
}
