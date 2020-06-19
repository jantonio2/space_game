import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:spacegame/User/ui/user_background.dart';
import 'package:spacegame/User/ui/user_header.dart';

class UserMain extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        FlareActor(
          'assets/space.flr',
          animation: "idle",
          fit: BoxFit.cover,
        ),
        Container(
          color: Colors.black38,
        ),
        //UserBackground(),
        ListView(
          children: <Widget>[
            UserHeader(),

          ],
        ),
      ],
    );
  }

}