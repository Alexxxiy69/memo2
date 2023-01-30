import 'package:flutter/material.dart';
import 'dart:math';
import 'extension.dart';

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
  List<bool> show = [false, false, false, false];
  List<int> rand = [0, 0, 0, 0];

  void pressing(i) {
    setState(() {
      show[i] = !show[i];
    });
  }

  void rando() {
    for(int i = 0; i < 3; i++) {
      int ik = Random().nextInt(1) + 2;
      if(rand.howMuch(ik)  < 2) {
        rand[i] = ik;
      }
    }
  }

  Widget cards(i) {
    rando();

    return Padding(
      padding: EdgeInsets.all(10),
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            textStyle: TextStyle(fontSize: 40)),
        onPressed: () => pressing(i),
        child: show[i] ? Text(rand[i].toString()) : Text('0'),
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
            cards(3),
          ],
        ),
      ],
    ));
  }
}