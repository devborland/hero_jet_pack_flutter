import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:hero_jet_pack_flutter/screens/game_screens/screen_state.dart';

import 'screen_manager.dart';
import '../utils/background.dart';
import '../utils/controller.dart';

import '../base_widget.dart';

class MainScreen extends BaseWidget {
  Background _background;
  BaseWidget _logo;
  BaseWidget _startButton;

  MainScreen() {
    _background = Background('menu/background.png');
    _startButton = Controller(0.4, 0.5, 0.2, 0.3, 'menu/start_btn.png');
    _logo = Controller(0.3, 0.15, 0.4, 0.5, 'menu/logo.png');
  }

  @override
  void render(Canvas canvas) {
    _background?.render(canvas);
    _startButton?.render(canvas);
    _logo?.render(canvas);
  }

  @override
  void resize(Size size) {
    _background?.resize(size);
    _startButton?.resize(size);
    _logo?.resize(size);
  }

  @override
  void update() {
    _background?.update();
    _startButton?.update();
    _logo?.update();
  }

  @override
  void onTapDown(TapDownDetails details, Function fn) {
    _startButton.onTapDown(details, () {
      screenManager.switchScreen(ScreenState.kPlayScreen);
    });
  }
}
