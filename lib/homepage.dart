import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_demo/player.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static double circleY = 0;
  double initialPos = circleY;
  double height = 0;
  double time = 0;
  double gravity = -0.49; //gravity strength
  double velocity = 3; //jump strength

  void jump() {
    Timer.periodic(Duration(milliseconds: 500), (timer) {

      height = gravity * time * time + velocity * time;

      
      setState(() {
        circleY = initialPos - height;
      });

      print(circleY);

      time += 0.1;
    });
  }



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: jump,
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 4,
              child: Container(
                color: Colors.blue,
                child: Center(
                  child: Stack(
                    children: [
                      Player(
                        circleY: circleY,
                      )
      
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.brown,
              ),
            ),
          ],
        ),
      ),
    );
  }
}