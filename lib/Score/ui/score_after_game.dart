import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:spacegame/Score/model/score.dart';
import 'package:spacegame/User/bloc/bloc_user.dart';
import 'package:spacegame/game/main_game.dart';
import 'package:spacegame/game/game_background.dart';
import 'package:spacegame/widgets/button_purple.dart';


class ScoreAfterGame extends StatelessWidget{
  int puntos;
  String nivel;
  ScoreAfterGame(this.puntos,this.nivel);
  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = BlocProvider.of<UserBloc>(context);
    // TODO: implement build
    finish = false;
    return Stack(
      children: <Widget>[
        FlareActor(
          'assets/space.flr',
          animation: "idle",
          fit: BoxFit.cover,
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                  bottom: 15.0
                ),
                child: Text(
                  'PUNTUACIÓN: ${points}',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Metal',
                    fontSize: 35.0
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    bottom: 15.0
                ),
                child: Text(
                  nivel,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Metal',
                      fontSize: 35.0
                  ),
                ),
              ),
              Container(
                width: 150.0,
                child: ButtonPurple(
                  buttonText: 'CONTINUAR',
                  onPressed: (){
                    userBloc.updateScore(Score(level: nivel, points: puntos)).whenComplete((){
                      print("TERMINO");
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => GameMain()),ModalRoute.withName("/")
                      );
                    });
                  },
                ),
              )
            ],
          ),
        )
      ],
    );
  }

}

/*Container(
              width: 150.0,
              child: ButtonPurple(
                buttonText: 'CONTINUAR',
                onPressed: (){
                  userBloc.updateScore(Score(level: nivel, points: puntos)).whenComplete((){
                    print("TERMINO");
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => GameMain()),ModalRoute.withName("/")
                    );
                  });
                },
              ),
            )*/


/*InkWell(
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
            )*/