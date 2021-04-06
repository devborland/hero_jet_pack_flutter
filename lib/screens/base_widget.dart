import 'dart:ui';

import 'package:flutter/gestures.dart';

abstract class BaseWidget {
  void resize(Size size);

  void render(Canvas canvas);

  void update();

  void onTapDown(TapDownDetails details, Function fn);
}
