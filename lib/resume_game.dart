import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/parallax.dart';
import 'package:flame_riverpod/flame_riverpod.dart';

class ResumeGame extends FlameGame with RiverpodGameMixin {
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
    // final parallax = await loadParallaxComponent(
    //   _imageNames,
    //   baseVelocity: Vector2(5, 0),
    //   velocityMultiplierDelta: Vector2(1.8, 1.0),
    //   filterQuality: FilterQuality.none,
    // );
    // add(parallax);
  }
}
