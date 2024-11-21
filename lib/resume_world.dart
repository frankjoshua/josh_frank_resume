import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:josh_frank_resume/hiring_manager.dart';
import 'package:josh_frank_resume/resume_game.dart';
import 'package:josh_frank_resume/resume_text_spawner.dart';

class ResumeWorld extends World
    with HasGameReference<ResumeGame>, TapCallbacks, HasCollisionDetection {
  HiringManager? hiringManager;

  @override
  Future<void> onLoad() async {
    await game.images.loadAll([
      'adventurer_tilesheet.png',
    ]);

    game.camera.viewfinder.anchor = Anchor.topLeft;

    hiringManager = HiringManager(
      position: Vector2(game.canvasSize.x * .25, game.canvasSize.y * .5),
    );
    add(hiringManager!);
    add(ResumeTextSpawner());
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

  void action() {
    hiringManager?.jump();
  }
}
