import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  List<bool> show = [false, false, false];

  void pressing(i) {
    setState(() {
      show[i] = !show[i];
    });
  }

  void cards(i) {
    Padding(
      padding: EdgeInsets.all(10),
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            textStyle: TextStyle(fontSize: 40)),
        onPressed: () => pressing(i),
        child: show[i] ? Text(i.toString()) : Text('0'),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Row(
              children: [
                cards(0),
                cards(1),
                cards(2),
              ],
            )
            ,
          ]
          ,
        )
    );
  }
}