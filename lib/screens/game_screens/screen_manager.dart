import 'dart:async';
import 'dart:ui';

import 'package:flame/game/game.dart';
import 'package:flame/gestures.dart';

import 'package:flame/util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';

import '../base_widget.dart';
import 'main_screen.dart';
import 'screen_state.dart';

ScreenManager screenManager = ScreenManager();

class ScreenManager extends Game with TapDetector {
  Function _fn;
  Size size = Size(0, 0);
  ScreenState _screenState;
  BaseWidget _mainScreen;
  BaseWidget _playScreen;

  ScreenManager() {
    _fn = _init;
    _screenState = ScreenState.kMainScreen;
  }

  @override
  void resize(Size size) {
    this.size = size;
    _mainScreen.resize(size);
  }

  @override
  void render(Canvas canvas) {
    _getActiveScreen()?.render(canvas);
  }

  @override
  void update(double t) {
    _fn();
  }

  void _init() async {
    _fn = _update;
    _mainScreen = MainScreen();

    Util flameUtil = Util();
    await flameUtil.fullScreen();
    await flameUtil.setOrientation(DeviceOrientation.landscapeLeft);
  }

  void _update() {
    _getActiveScreen()?.update();
  }

  void onTapDown(TapDownDetails details) {
    _getActiveScreen()?.onTapDown(details, () {});
  }

  BaseWidget _getActiveScreen() {
    switch (_screenState) {
      case ScreenState.kMainScreen:
        return _mainScreen;
        break;
      case ScreenState.kPlayScreen:
        return _playScreen;

      default:
        return _mainScreen;
    }
  }

  void switchScreen(ScreenState newScreen) {
    switch (newScreen) {
      case ScreenState.kMainScreen:
        _mainScreen = MainScreen();
        _mainScreen.resize(size);
        break;
      case ScreenState.kPlayScreen:
        // _playScreen = PlayScreen();
        // _playScreen.resize(size);
        break;
    }
    Timer(
      Duration(milliseconds: 100),
      () {
        _screenState = newScreen;
      },
    );
  }
}
