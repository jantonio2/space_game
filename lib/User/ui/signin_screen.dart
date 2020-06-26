import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spacegame/User/bloc/bloc_user.dart';
import 'package:spacegame/User/model/user.dart';
import 'package:spacegame/game/ui/gradient_back.dart';
import 'package:spacegame/widgets/button_signin.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

import '../../space_menu.dart';


//Pantalla Signin
class SignInScreen extends StatefulWidget{

  @override
  State createState() {
    return _SignInScreen();
  }
}

class _SignInScreen extends State<SignInScreen>{

  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //Inicializando el bloc
    userBloc = BlocProvider.of(context);
    return _handleCurrentSession();
  }

  Widget _handleCurrentSession(){
    //Obteniendo datos del bloc
    return StreamBuilder(
      //Indicando el stream del builder que usaremos
      stream: userBloc.authStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        //Comprobando si el snapshot contiene datos
        if(!snapshot.hasData || snapshot.hasError){
          //Iniciando sesión
          return signInGoogleUI();
        }else{
          return SpaceMenu();
        }
      },
    );
  }

  Widget signInGoogleUI() {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          GradientBack(null),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Bienvenido a SpaceGame',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width*0.107,
                  fontFamily: 'Metal',
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
              ),
              ButtonSignIn(text: "Login con Gmail",
                  onPressed: (){
                    userBloc.signOut();
                    userBloc.signIn().then((FirebaseUser user) {
                      userBloc.updateUserData(User(
                        uid: user.uid,
                        name: user.displayName,
                        email: user.email,
                        photoURL: user.photoUrl
                      ));
                    });

                  },
                width: 300.0,
                height: 50.0,
              )
            ],
          )
        ],
      ),
    );
  }

}