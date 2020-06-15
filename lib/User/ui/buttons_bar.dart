import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:spacegame/User/bloc/bloc_user.dart';
import 'circle_button.dart';

class ButtonsBar extends StatelessWidget {

  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 0.0,
            vertical: 10.0
        ),
        child: Row(
          children: <Widget>[
            //CircleButton(true, Icons.turned_in_not, 20.0, Color.fromRGBO(255, 255, 255, 1)),
            //CircleButton(true, Icons.card_travel, 20.0, Color.fromRGBO(255, 255, 255, 0.6)),
            CircleButton(false, Icons.exit_to_app, 40.0, Color.fromRGBO(255, 255, 255, 1),
                () =>{
                  userBloc.signOut()
                }),
            //CircleButton(true, Icons.mail_outline, 20.0, Color.fromRGBO(255, 255, 255, 0.6)),
            //CircleButton(true, Icons.person, 20.0, Color.fromRGBO(255, 255, 255, 0.6))
          ],
        )
    );
  }

}