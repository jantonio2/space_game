import 'dart:io';

import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:spacegame/User/bloc/bloc_user.dart';
import 'package:spacegame/game/game.dart';
import 'circle_button.dart';

class ButtonsBar extends StatelessWidget {

  UserBloc userBloc;
  Game game;

  @override
  Widget build(BuildContext context) {
    //Inicializo el bloc
    userBloc = BlocProvider.of(context);
    return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 0.0,
            vertical: 10.0
        ),
        child: Row(
          children: <Widget>[
            CircleButton(false, Icons.exit_to_app, 40.0, Color.fromRGBO(255, 255, 255, 1),
                () =>{
                  //Por el bloc cierro la sesión
                  userBloc.signOut(),
                }),
          ],
        )
    );
  }

}