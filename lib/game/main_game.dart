import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'card_level.dart';
//import 'package:spacegame/widgets/card_level.dart';

class GameMain extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    List<String> img = ['assets/img/extraterrestre4.png','assets/img/alienverde2.png','assets/img/alienver3.png','assets/img/alienverde2.png'];
    List<String> img2 = ['assets/img/alienrojo.png','assets/img/alienrojo1.png','assets/img/alienrojo2.png','assets/img/alienrojo1.png'];
    List<String> img3 = ['assets/img/alienpurple.png','assets/img/alienpurple1.png','assets/img/alienpurple2.png','assets/img/alienpurple1.png'];

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
                    CardLevel(img,"Nivel 1"),
                    CardLevel(img2,"Nivel 2"),
                    CardLevel(img3,"Nivel 3"),
                    CardLevel(img2,"Nivel 4"),
                    CardLevel(img,"Nivel 5"),
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
