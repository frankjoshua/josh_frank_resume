import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:josh_frank_resume/hiring_manager.dart';
import 'package:josh_frank_resume/resume_game.dart';
import 'package:josh_frank_resume/text_enemy.dart';

class ResumeWorld extends World
    with HasGameReference<ResumeGame>, TapCallbacks, HasCollisionDetection {
  HiringManager? hiringManager;
  double lastSpawn = 0;

  @override
  Future<void> onLoad() async {
    // add(
    //   TextComponent(text: 'Joshua Frank', position: Vector2(10, 35)),
    // );
    // add(
    //   TextComponent(text: 'Resume of', position: Vector2(10, 10)),
    // );
    await game.images.loadAll([
      'adventurer_tilesheet.png',
    ]);

    game.camera.viewfinder.anchor = Anchor.topLeft;

    hiringManager = HiringManager(
      position: Vector2(game.canvasSize.x * .25, game.canvasSize.y * .5),
    );
    add(hiringManager!);
  }

  @override
  void onTapDown(TapDownEvent event) {
    super.onTapDown(event);
    action();
  }

  // @override
  // KeyEventResult onKeyEvent(
  //     KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
  //   if (event is KeyDownEvent) {
  //     action();
  //   }
  //   return super.onKeyEvent(event, keysPressed);
  // }

  @override
  void update(double dt) {
    super.update(dt);
    lastSpawn += dt;
    if (lastSpawn > 3) {
      lastSpawn = 0;
      add(TextEnemy(
          position: Vector2(game.canvasSize.x, game.canvasSize.y * .5)));
    }
  }

  void action() {
    hiringManager?.jump();
  }
}
