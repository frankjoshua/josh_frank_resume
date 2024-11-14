import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:josh_frank_resume/resume_game.dart';

import 'resume_world.dart';

void main() {
  final world = ResumeWorld();
  final game = ResumeGame(world);
  runApp(GameWidget(game: game));
}
