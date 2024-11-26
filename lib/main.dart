import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:josh_frank_resume/resume_game.dart';
import 'package:josh_frank_resume/views/resume_container.dart';

import 'resume_world.dart';

void main() {
  final world = ResumeWorld();
  final game = ResumeGame(world);
  runApp(ProviderScope(
    child: MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.black),
        ),
      ),
      builder: (context, child) => (Column(
        children: [
          Expanded(flex: 1, child: GameWidget(game: game)),
          const Expanded(flex: 2, child: ResumeContainer()),
        ],
      )),
    ),
  ));
}
