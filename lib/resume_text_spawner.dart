import 'dart:async';

import 'package:flame/components.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:josh_frank_resume/constants.dart';
import 'package:josh_frank_resume/providers/resume_text_provider.dart';
import 'package:josh_frank_resume/resume_game.dart';
import 'package:josh_frank_resume/text_enemy.dart';

class ResumeTextSpawner extends Component with HasGameReference<ResumeGame> {
  double lastSpawn = 0;
  int position = 0;
  List<String> words = [];

  @override
  Future<void> onLoad() async {
    words = AppConstants.RESUME_TEXT.split(" ");
  }

  @override
  void update(double dt) {
    super.update(dt);
    lastSpawn += dt;
    if (lastSpawn > 0.05) {
      lastSpawn = 0;
      final word = words[position % words.length];
      position++;
      add(TextEnemy(
          text: word,
          position: Vector2(game.canvasSize.x, game.canvasSize.y * .5)));

      // Update the resumeTextProvider
      final context = game.buildContext;
      if (context != null) {
        final container = ProviderScope.containerOf(context);
        // Update the provider's state
        final currentResumeText = container.read(resumeTextProvider);
        container.read(resumeTextProvider.notifier).state =
            "$currentResumeText $word";
      }
    }
  }
}
