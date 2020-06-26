import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:spacegame/Score/model/score.dart';
import 'package:spacegame/User/bloc/bloc_user.dart';
import 'package:spacegame/game/main_game.dart';
import 'package:spacegame/game/ui/game_background.dart';
import 'package:spacegame/widgets/button_purple.dart';


class ScoreAfterGame extends StatelessWidget{
  int puntos;
  String nivel;
  ScoreAfterGame(this.puntos,this.nivel);
  @override
  Widget build(BuildContext context) {
    //Inicializo mi bloc
    UserBloc userBloc = BlocProvider.of<UserBloc>(context);
    // TODO: implement build
    finish = false;
    return Stack(
      children: <Widget>[
        //Widget que permite utilizar archivos flr como fondo animado
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
                    //Mando al bloc para registrar los datos
                    userBloc.updateScore(Score(level: nivel, points: puntos)).whenComplete((){
                      //Cambio de pantalla
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