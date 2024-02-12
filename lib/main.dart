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

class _DiceAppState extends State<DiceApp> {
  List<String> diceImages=[
    "images/dice1.png","images/dice2.png","images/dice3.png","images/dice4.png","images/dice5.png","images/dice6.png"
  ];
  String leftDice="images/dice1.png";
  String rightDice="images/dice2.png";

  void rollDice(){
    setState(() {
      leftDice=diceImages[Random().nextInt(diceImages.length)];
      rightDice=diceImages[Random().nextInt(diceImages.length)];

    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:GestureDetector(
        onTap: rollDice,
        child: Scaffold(
          backgroundColor: Colors.red,
        
        body: Column(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Dice App"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  leftDice,
                    height:100,
                    width: 100,
                ),
        
                 Image.asset(
                  rightDice,
                    height:100,
                    width: 100,
                ),
              ],
        
              
        
            ),
            Text("lets ROll")
          ],
        
        ),
        
        
        ),
      )
    );
  }
}
