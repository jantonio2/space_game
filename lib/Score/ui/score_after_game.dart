import 'package:flutter/material.dart';
import 'package:spacegame/game/main_game.dart';
import 'package:spacegame/game/game_background.dart';


class ScoreAfterGame extends StatelessWidget{
  int puntos;

  ScoreAfterGame(this.puntos);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    finish = false;
    return Container(
      color: Colors.green,
      child: Center(
        child: Column(
          children: <Widget>[
            Text(puntos.toString()),
            InkWell(
              onTap: (){
                //var a = await GameBackground();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => GameMain()),ModalRoute.withName("/")
                );
              },
              child: Container(
                margin: EdgeInsets.only(
                    right: 20.0
                ),
                height: 50.0,
                width: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  gradient: LinearGradient(
                      colors: [
                        Color(0xFF4268D3),
                        Color(0xFF584CD1)
                      ],
                      begin: FractionalOffset(0.2,0.0),
                      end: FractionalOffset(1.0,0.6),
                      stops: [0.0,0.6],
                      tileMode: TileMode.clamp
                  ),
                ),

                child: Center(
                  child: Text(
                    'Jugar',
                    style: TextStyle(
                        fontSize: 18.0,
                        fontFamily: "Metal",
                        color: Colors.white
                    ),
                  ),
                ),

              ),
            )
          ],
        ),
      ),
    );
  }

}