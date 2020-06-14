import 'package:flutter/material.dart';

class GameMain extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/img/Fondo1.jpg"),
              fit: BoxFit.cover
            )
          ),
        )
      ],
    );
  }

}