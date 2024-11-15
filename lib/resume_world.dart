import 'dart:async';

import 'package:flame/components.dart';

class ResumeWorld extends World {
  @override
  Future<void> onLoad() async {
    add(
      TextComponent(text: 'Joshua Frank', position: Vector2(10, 35)),
    );
    add(
      TextComponent(text: 'Resume of', position: Vector2(10, 10)),
    );
  }
}
