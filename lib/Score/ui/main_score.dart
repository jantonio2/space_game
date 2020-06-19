import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flare_dart/actor.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:spacegame/Score/ui/scores_data.dart';
import 'package:spacegame/User/bloc/bloc_user.dart';

class ScoreMain extends StatelessWidget{



  @override
  Widget build(BuildContext context) {
    //int l = 5+Random().nextInt(10-5);
    //print(l);
    // TODO: implement build
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
       children: <Widget>[
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

/**/