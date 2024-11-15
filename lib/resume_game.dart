import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/parallax.dart';
import 'package:josh_frank_resume/hiring_manager.dart';

class ResumeGame extends FlameGame {
  ResumeGame(World world) : super(world: world);

  final _imageNames = [
    ParallaxImageData('parallax/bg.png'),
    ParallaxImageData('parallax/mountain-far.png'),
    ParallaxImageData('parallax/mountains.png'),
    ParallaxImageData('parallax/trees.png'),
    ParallaxImageData('parallax/foreground-trees.png'),
  ];

  @override
  Future<void> onLoad() async {
    final parallax = await loadParallaxComponent(
      _imageNames,
      baseVelocity: Vector2(5, 0),
      velocityMultiplierDelta: Vector2(1.8, 1.0),
      filterQuality: FilterQuality.none,
    );
    add(parallax);
    await images.loadAll([
      'adventurer_tilesheet.png',
    ]);
    camera.viewfinder.anchor = Anchor.topLeft;

    final hiringManager = HiringManager(
      position: Vector2(canvasSize.x * .25, canvasSize.y * .75),
    );
    world.add(hiringManager);
  }
}
