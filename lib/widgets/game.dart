import 'package:flutter/material.dart';

class Game extends StatelessWidget{

  String level;
  Game(this.level);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.greenAccent,
      child: Text(
        level,
        textAlign: TextAlign.center,
      ),
    );
  }

}