import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:spacegame/User/ui/user_background.dart';
import 'package:spacegame/User/ui/user_header.dart';

//Constructor de la pantalla de los usuarios
class UserMain extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        //Widget que me permite usar archivos flr como fondos animados
        FlareActor(
          'assets/space.flr',
          animation: "idle",
          fit: BoxFit.cover,
        ),
        Container(
          color: Colors.black38,
        ),
        ListView(
          children: <Widget>[
            UserHeader(),
          ],
        ),
      ],
    );
  }

}