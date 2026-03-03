import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/constants.dart';
import 'package:flutter_demo/player.dart';

class FlutterDemo extends FlameGame {
  // Gravity constant - 600 pixels per second squared (adjust as needed)
  static const double gravity = 600;
  
  FlutterDemo() 
      : super(
        camera: CameraComponent.withFixedResolution(
          width: gameWidth, 
          height: gameHeight, 
        ),
      );

  @override
  FutureOr<void> onLoad() {
    // Add players at different positions to test
    world.add(Player(
      position: Vector2(0, 0), // Fixed position for testing
      radius: 50.0,
    ));

    return super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);
    
    // Apply gravity to all Player components in the world
    for (final component in world.children) {
      if (component is Player) {
        // Apply gravity by increasing y-position over time
        component.position.y += gravity * dt;
      }
    }
  }

  @override
  Color backgroundColor() {
    return Colors.green;
  }
}
