import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:spacegame/User/bloc/bloc_user.dart';
import 'package:spacegame/User/model/user.dart';
import 'package:spacegame/User/ui/buttons_bar.dart';
import 'package:spacegame/User/ui/user_info.dart';


class UserHeader extends StatelessWidget {

  UserBloc userBloc;
  User user;

  @override
  Widget build(BuildContext context) {

    userBloc = BlocProvider.of<UserBloc>(context);

    return StreamBuilder(
      stream: userBloc.streamFirebase,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        switch(snapshot.connectionState){
          case ConnectionState.waiting:
            return CircularProgressIndicator();
          case ConnectionState.none:
            return CircularProgressIndicator();
          case ConnectionState.active:
            return showProfileData(snapshot, context);
          case ConnectionState.done:
            return showProfileData(snapshot, context);
        }
      },
    );

    /*final title = Text(
      'Perfil',
      style: TextStyle(
          fontFamily: 'Metal',
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 50.0
      ),
    );

    return Container(
      margin: EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          top: 70.0
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              title
            ],
          ),
          UserInfo('assets/images/extraterrestre1.png', 'Anahí Salgado','anahi@platzi.com'),
          Container(
            margin: EdgeInsets.only(
              top: 15.0
            ),
          ),
          ButtonsBar()
        ],
      ),
    );*/
  }

  Widget showProfileData(AsyncSnapshot snapshot, BuildContext context){
    if(!snapshot.hasData || snapshot.hasError){
      print("No logeado");
      return Container(
        margin: EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            top: 20.0
        ),
        child: Column(
          children: <Widget>[
            CircularProgressIndicator(),
            Text(
              'No se puede cargar la informacion'
            )
          ],
        ),
      );
    }else{
      final title = Text(
        'Perfil',
        style: TextStyle(
            fontFamily: 'Metal',
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 50.0
        ),
      );
      print("Logeado");
      print(snapshot.data);
      user = User(name: snapshot.data.displayName, email: snapshot.data.email, photoURL: snapshot.data.photoUrl);
      String id = snapshot.data.uid;
      return Container(
        margin: EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            top: 20.0
        ),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                title
              ],
            ),
            UserInfo(user),

            ButtonsBar(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width*0.4,
                  margin: EdgeInsets.only(
                    bottom: 15.0,
                  ),
                  child: Text(
                    'Nivel',
                    style: TextStyle(
                        fontFamily: 'Metal',
                        fontSize: 35.0,
                        color: Colors.white
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width*0.4,
                  margin: EdgeInsets.only(
                    bottom: 15.0,
                  ),
                  child: Text(
                    'Puntos',
                    style: TextStyle(
                        fontFamily: 'Metal',
                        fontSize: 35.0,
                        color: Colors.white
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
            StreamBuilder(
              stream: userBloc.myScoresListSream(id),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
                switch(snapshot.connectionState){
                  case ConnectionState.waiting:
                    return CircularProgressIndicator();
                  case ConnectionState.done:
                    return CircularProgressIndicator();
                  case ConnectionState.active:
                    return Container(
                      height: MediaQuery.of(context).size.height*0.4,
                      child: ListView.builder(
                        itemCount: snapshot.data.documents.length,
                        itemBuilder: (context, index){
                          //tring nom = ref(snapshot.data.documents[index].data['userOwner']);
                          //print(nom);
                          return Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              /*Text(
                              'Juan',
                              style: TextStyle(
                                  color: Colors.white
                              ),
                            ),*/
                              Container(
                                width: MediaQuery.of(context).size.width*0.4,
                                child: Text(
                                  snapshot.data.documents[index].data['level'].toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontFamily: 'Metal'
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width*0.4,
                                child:  Text(
                                  snapshot.data.documents[index].data['points'].toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontFamily: 'Metal'
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              )
                            ],
                          );
                        },
                      ),
                    );
                  case ConnectionState.none:
                    return Container(
                      child: Text(
                        'No DATA',
                        style: TextStyle(
                            color: Colors.white
                        ),
                      ),
                    );
                }
              },
            ),
          ],
        ),
      );
    }
  }

}