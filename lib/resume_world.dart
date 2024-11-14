import 'dart:async';

import 'package:flame/components.dart';

class ResumeWorld extends World {
  @override
  Future<void> onLoad() async {
    add(
      TextComponent(
        text: 'Joshua Frank',
      ),
    );
    add(
      TextComponent(text: 'Resume', position: Vector2(0, -25)),
    );
  }
}
