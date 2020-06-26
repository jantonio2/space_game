import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flare_dart/actor.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:spacegame/Score/ui/scores_data.dart';
import 'package:spacegame/User/bloc/bloc_user.dart';

//Clase que muestra la pantalla del scoremain
class ScoreMain extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    String x = MediaQuery.of(context).size.width.toString();
    // TODO: implement build
    print(x);
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
       children: <Widget>[
         //Widget que permite utilizar archivos flr como fondo animado
         FlareActor(
           'assets/space.flr',
           animation: "idle",
           fit: BoxFit.cover,
         ),
         ScoresData(),
       ],
      )
    );
  }
}

