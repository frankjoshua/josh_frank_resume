import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/events.dart';
import 'package:flutter/widgets.dart';
import 'package:josh_frank_resume/resume_game.dart';

class HiringManager extends SpriteAnimationComponent
    with HasGameReference<ResumeGame>, TapCallbacks, CollisionCallbacks {
  HiringManager({
    required super.position,
  }) : super(size: Vector2(80 * 1.5, 110 * 1.5), anchor: Anchor.center);

  bool isJumping = false;

  @override
  void onLoad() {
    animation = runningAnimation();
    add(RectangleHitbox());
  }

  @override
  void onTapDown(TapDownEvent event) {
    jump();
  }

  @override
  void update(double dt) {
    super.update(dt);
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    jump();
  }

  void jump() {
    if (!isJumping) {
      isJumping = true;
      animation = jumpingAnimation();
      final jumpUpEffect = MoveByEffect(Vector2(0, -120),
          EffectController(duration: 0.25, curve: Curves.easeOutSine),
          onComplete: () {});

      final fallDownEffect = MoveByEffect(
          Vector2(0, 120),
          EffectController(
            duration: 0.75,
            curve: Curves.easeInSine,
          ), onComplete: () {
        isJumping = false;
        animation = runningAnimation();
      });

      // Chain the effects in a sequence
      final jumpSequence = SequenceEffect([
        jumpUpEffect,
        fallDownEffect,
      ]);

      // Add the sequence effect to the component
      add(jumpSequence);
    }
  }

  SpriteAnimation runningAnimation() {
    return SpriteAnimation.fromFrameData(
      game.images.fromCache('adventurer_tilesheet.png'),
      SpriteAnimationData(
        List.generate(
          2,
          (index) => SpriteAnimationFrameData(
            srcPosition: Vector2(index * 80, 110),
            srcSize: Vector2(80, 110),
            stepTime: 0.25,
          ),
        ),
      ),
    );
  }

  SpriteAnimation jumpingAnimation() {
    return SpriteAnimation.fromFrameData(
      game.images.fromCache('adventurer_tilesheet.png'),
      SpriteAnimationData(
        List.generate(
          2,
          (index) => SpriteAnimationFrameData(
            srcPosition: Vector2(index * 80, 0),
            srcSize: Vector2(80, 110),
            stepTime: 0.25,
          ),
        ),
      ),
    );
  }
}
