import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/events.dart';
import 'package:josh_frank_resume/resume_game.dart';

class TextEnemy extends PositionComponent
    with HasGameReference<ResumeGame>, TapCallbacks {
  TextEnemy({
    required super.position,
    required this.text,
  }) : super(size: Vector2(200, 20), anchor: Anchor.center, priority: 1);

  final String text;

  @override
  void onLoad() {
    add(RectangleHitbox());
    add(TextComponent(text: text, position: Vector2(0, 0)));
    final moveAcross = MoveEffect.by(
        Vector2(-game.canvasSize.x, 0), EffectController(duration: 2.0));
    final moveDown = MoveEffect.to(
        Vector2(game.canvasSize.x / 2, game.canvasSize.y),
        EffectController(duration: 2.0));
    final moveEffect = SequenceEffect([moveAcross, moveDown]);

    add(moveEffect);
  }

  @override
  void onTapDown(TapDownEvent event) {
    add(MoveEffect.by(
      Vector2(30, 30),
      EffectController(duration: 1.0),
    ));
  }
}
