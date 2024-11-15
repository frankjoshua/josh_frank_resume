import 'package:flame/components.dart';
import 'package:josh_frank_resume/resume_game.dart';

class HiringManager extends SpriteAnimationComponent
    with HasGameReference<ResumeGame> {
  HiringManager({
    required super.position,
  }) : super(size: Vector2(80 * 1.5, 110 * 1.5), anchor: Anchor.center);

  @override
  void onLoad() {
    animation = runningAnimation();
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
