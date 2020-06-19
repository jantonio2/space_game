import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:spacegame/User/bloc/bloc_user.dart';

class ScoresData extends StatelessWidget{

  UserBloc userbloc;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    userbloc = BlocProvider.of<UserBloc>(context);
    return Container(
      margin: EdgeInsets.only(
        top: 30.0
      ),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
              top: 10.0,
              bottom: 10.0
            ),
            child: Text(
              'TABLA DE PUNTUACIONES',
              style: TextStyle(
                color: Colors.white,
                fontSize: 50.0,
                fontFamily: 'Metal'
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Row(
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width*0.45,
                child: Text(
                  'Nombre',
                  style: TextStyle(
                      fontFamily: 'Metal',
                      fontSize: 35.0,

                      color: Colors.white,
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width*0.3,
                child: Text(
                  'Nivel',
                  style: TextStyle(
                      fontFamily: 'Metal',
                      fontSize: 35.0,
                      color: Colors.white
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width*0.25,
                child: Text(
                  'Puntos',
                  style: TextStyle(
                      fontFamily: 'Metal',
                      fontSize: 35.0,
                      color: Colors.white
                  ),
                ),
              )
            ],
          ),
          StreamBuilder(
            stream: userbloc.scoresStream,
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
              switch(snapshot.connectionState){
                case ConnectionState.waiting:
                  return CircularProgressIndicator();
                case ConnectionState.done:
                  return CircularProgressIndicator();
                case ConnectionState.active:
                  return Container(
                    height: MediaQuery.of(context).size.height*0.5,
                    child: ListView.builder(
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index){
                        //tring nom = ref(snapshot.data.documents[index].data['userOwner']);
                        //print(nom);
                        return Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            StreamBuilder(
                              stream: Firestore.instance.collection('users').document(snapshot.data.documents[index].data['userOwner'].documentID).snapshots(),
                              builder: (context,AsyncSnapshot<DocumentSnapshot>snapshot2){
                                if(snapshot.hasData){
                                  print(snapshot2.data);
                                  return Text(
                                    snapshot2.data.data["name"],
                                    style: TextStyle(
                                        color: Colors.white
                                    ),
                                  );
                                }
                                else{
                                  return Text("Cargando");
                                }
                              },
                            ),
                            /*Text(
                              'Juan',
                              style: TextStyle(
                                  color: Colors.white
                              ),
                            ),*/
                            Text(
                              snapshot.data.documents[index].data['level'].toString(),
                              style: TextStyle(
                                  color: Colors.white
                              ),
                            ),
                            Text(
                              snapshot.data.documents[index].data['points'].toString(),
                              style: TextStyle(
                                  color: Colors.white
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
              /*if(snapshot.hasData){
                return Container(
                  height: MediaQuery.of(context).size.height*0.7,
                  child: ListView.builder(
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, index){
                      //tring nom = ref(snapshot.data.documents[index].data['userOwner']);
                      //print(nom);
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          StreamBuilder(
                            stream: Firestore.instance.collection('users').document(snapshot.data.documents[index].data['userOwner'].documentID).snapshots(),
                            builder: (context,AsyncSnapshot<DocumentSnapshot>snapshot2){
                              if(snapshot.hasData){
                                print(snapshot2.data);
                                return Text(
                                  snapshot2.data.data["name"],
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                );
                              }
                              else{
                                return Text("Cargando");
                              }
                            },
                          ),
                          /*Text(
                              'Juan',
                              style: TextStyle(
                                  color: Colors.white
                              ),
                            ),*/
                          Text(
                            snapshot.data.documents[index].data['level'].toString(),
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                          Text(
                            snapshot.data.documents[index].data['points'].toString(),
                            style: TextStyle(
                                color: Colors.white
                            ),
                          )
                        ],
                      );
                    },
                  ),
                );
              }else{
                return Container(
                  child: Text(
                    'No DATA',
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                );
              }*/
            },
          ),
        ],
      )
    );
  }

}

/*return Container(
                    height: MediaQuery.of(context).size.height*0.7,
                    child: ListView.builder(
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index){
                        return Text(snapshot.data.documents[index].data['points']);
                      },
                    ),
                  );*/
/*return Container(
                    height: MediaQuery.of(context).size.height*0.7,
                    child: ListView.builder(
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index){
                        //tring nom = ref(snapshot.data.documents[index].data['userOwner']);
                        //print(nom);
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            StreamBuilder(
                              stream: Firestore.instance.collection('users').document(snapshot.data.documents[index].data['userOwner'].documentID).snapshots(),
                              builder: (context,AsyncSnapshot<DocumentSnapshot>snapshot2){
                                if(snapshot.hasData){
                                  print(snapshot2.data);
                                  return Text(
                                    snapshot2.data.data["name"],
                                    style: TextStyle(
                                        color: Colors.white
                                    ),
                                  );
                                }
                                else{
                                  return Text("Cargando");
                                }
                              },
                            ),
                            /*Text(
                              'Juan',
                              style: TextStyle(
                                  color: Colors.white
                              ),
                            ),*/
                            Text(
                              snapshot.data.documents[index].data['level'].toString(),
                              style: TextStyle(
                                  color: Colors.white
                              ),
                            ),
                            Text(
                              snapshot.data.documents[index].data['points'].toString(),
                              style: TextStyle(
                                  color: Colors.white
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  );*/