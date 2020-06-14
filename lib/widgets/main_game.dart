import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spacegame/widgets/card_level.dart';

class GameMain extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image:DecorationImage(
            image: AssetImage("assets/img/Fondo1.jpg"),
            fit: BoxFit.cover
          )
        ),
        child: Center(
          child: Stack(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                    top: 120.0
                ),
                //height: 300,
                child: ListView(
                  padding: EdgeInsets.all(25.0),
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    CardLevel("","Nivel 1"),
                    CardLevel("","Nivel 2"),
                    CardLevel("","Nivel 3"),
                    CardLevel("","Nivel 4"),
                    CardLevel("","Nivel 5"),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: 40.0,
                    left: 20.0
                ),
                child: Text(
                  'SpaceGame',
                  style: TextStyle(
                      fontFamily: "Metal",
                      fontSize: 80.0,
                      fontWeight: FontWeight.w900,
                      color: Colors.white
                  ),
                  //textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}
