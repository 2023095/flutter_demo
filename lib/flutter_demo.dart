import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/constants.dart';
import 'package:flutter_demo/player.dart';

class FlutterDemo extends FlameGame {
  FlutterDemo() 
      : super(
        camera: CameraComponent.withFixedResolution(
          width: gameWidth, 
          height: gameHeight, 
        ),
      );

  @override
  FutureOr<void> onLoad() {
    super.onLoad();

    world.add(Player(
      position: Vector2(0, 0), 
      radius: 50.0,
    ));

    world.add(Player(
      position: Vector2(0, 100), 
      radius: 50.0,
      color: Colors.blue,
    ));
  }

  @override
  Color backgroundColor() {
    return Colors.green;
  }
}
