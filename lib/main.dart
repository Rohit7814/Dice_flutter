import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const DiceApp());
}

class DiceApp extends StatefulWidget {
  const DiceApp({super.key});

  @override
  State<DiceApp> createState() => _DiceAppState();
}

class _DiceAppState extends State<DiceApp> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;
  late Animation<double> _revolveAnimation;

  List<String> diceImages = [
    "images/dice1.png", "images/dice2.png", "images/dice3.png", "images/dice4.png", "images/dice5.png", "images/dice6.png"
  ];
  String leftDice = "images/dice1.png";
  String rightDice = "images/dice2.png";

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _rotationAnimation = Tween<double>(begin: 0, end: 2 * pi).animate(_controller);
    _revolveAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  void rollDice() {
    _controller.reset();
    _controller.forward();

    setState(() {
      leftDice = diceImages[Random().nextInt(diceImages.length)];
      rightDice = diceImages[Random().nextInt(diceImages.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GestureDetector(
        onTap: rollDice,
        child: Scaffold(
          backgroundColor: Colors.red,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Dice App", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 70),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return Transform.rotate(
                        angle: _rotationAnimation.value,
                        child: Transform.scale(
                          scale: _revolveAnimation.value,
                          child: Image.asset(
                            leftDice,
                            height: 100,
                            width: 100,
                          ),
                        ),
                      );
                    },
                  ),
                  AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return Transform.rotate(
                        angle: -_rotationAnimation.value,
                        child: Transform.scale(
                          scale: _revolveAnimation.value,
                          child: Image.asset(
                            rightDice,
                            height: 100,
                            width: 100,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
              Text("Let's Roll", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 70),),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
