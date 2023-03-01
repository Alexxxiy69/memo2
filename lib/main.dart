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
  int card2 = 0;
  var cardColor = [Colors.blue, Colors.blue, Colors.blue, Colors.blue];
  int opened = 0;
  int iOld = 0;

  void pressing(i) {
    int card1;
    card1 = rand[i];
    if (opened == 2) {
      setState(() {
        show = [false, false, false, false];
      });
      opened = 0;
    }
    setState(() {
      show[i] = !show[i];
    });
    if(opened == 1) {
      setState(() {
        if(card1 == card2) {
          cardColor[i] = Colors.grey;
          cardColor[iOld] = Colors.grey;
          final show[i] = true;
          final show[iOld] = true;
        }
      });
    }
    opened++;
    card2 = card1;
    iOld = i;
  }

  void rando() {
    int returned;
    for (int i = 0; i < 4; i++) {
      int ik = Random().nextInt(2) + 1;
      returned = howMuch(rand, ik);
      if (returned < 2) {
        rand[i] = ik;
      } else{
        i--;
      }
    }
  }

  Widget cards(i) {
    if (rand[0] == 0) {
      rando();
    }
    return Padding(
      padding: EdgeInsets.all(10),
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: cardColor[i],
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
