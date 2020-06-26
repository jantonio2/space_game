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
    //Inicializo el bloc
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
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width*0.45,
                margin: EdgeInsets.only(
                  bottom: 15.0
                ),
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
                margin: EdgeInsets.only(
                    bottom: 15.0
                ),
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
                margin: EdgeInsets.only(
                    bottom: 15.0
                ),
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
          //El widget que me permitira traer datos de mi bloc
          StreamBuilder(
            //como stream le digo que llame de la clsase userbloc al stream scorestrema
            stream: userbloc.scoresStream,
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
              //En el switch veo cualquiera de los 4 datos de mi snapshot
              switch(snapshot.connectionState){
                case ConnectionState.waiting:
                  return CircularProgressIndicator();
                case ConnectionState.done:
                  return CircularProgressIndicator();
                case ConnectionState.active:
                  return Container(
                    height: MediaQuery.of(context).size.height*0.5,
                    //Construyo un Listview.builder para hacer la table de rankig
                    child: ListView.builder(
                      //La cantidad de items sera la cantidad de documentos
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index){
                        return Row(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width*0.45,
                              child: Text(
                                //Obtengo un dato del snapshot
                                snapshot.data.documents[index].data['user'].toString(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontFamily: 'Metal'
                                ),
                              ),
                            ),
                            /*Text(
                              'Juan',
                              style: TextStyle(
                                  color: Colors.white
                              ),
                            ),*/
                            Container(
                              width: MediaQuery.of(context).size.width*0.3,
                              child: Text(
                                //Obtengo un dato del snapshot
                                snapshot.data.documents[index].data['level'].toString(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontFamily: 'Metal'
                                ),
                              ),
                            ),
                           Container(
                             width: MediaQuery.of(context).size.width*0.25,
                             child:  Text(
                               //Obtengo un dato del snapshot
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
      )
    );
  }

}
