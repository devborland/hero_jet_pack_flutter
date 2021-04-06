import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/gestures.dart';

import '../base_widget.dart';

class Background extends BaseWidget {
  SpriteComponent _bgSprite;
  Background(String src) {
    _bgSprite = SpriteComponent.fromSprite(0, 0, Sprite(src));
  }

  @override
  void render(Canvas canvas) {
    _bgSprite.render(canvas);
  }

  @override
  void resize(Size size) {
    _bgSprite.width = size.width;
    _bgSprite.height = size.height;
  }

  @override
  void update() {}

  @override
  void onTapDown(TapDownDetails details, Function fn) {}
}
