import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/events.dart';
import 'package:josh_frank_resume/resume_game.dart';

class TextEnemy extends PositionComponent
    with HasGameReference<ResumeGame>, TapCallbacks {
  TextEnemy({
    required super.position,
  }) : super(size: Vector2(200, 20), anchor: Anchor.center, priority: 1);

  @override
  void onLoad() {
    add(RectangleHitbox());
    add(TextComponent(text: 'Joshua Frank', position: Vector2(0, 0)));
  }

  @override
  void onTapDown(TapDownEvent event) {
    add(MoveEffect.by(
      Vector2(30, 30),
      EffectController(duration: 1.0),
    ));
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.x -= 200 * dt;
  }
}
