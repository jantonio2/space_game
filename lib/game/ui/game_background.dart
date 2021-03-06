import 'dart:async';

import 'package:flame/flame.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:spacegame/space_menu.dart';


import '../model/hand.dart';
import '../model/alien.dart';
import '../game.dart';
import '../main_game.dart';

bool finish = false;
const ALIENSPEED = 120.0;
const HANDSPEED = 100.0;
const ALIEN_SIZE = 50.0;
const HAND_SIZE = 40.0;

Game game;
var dimensions;

var points = 0;
Alien alien;
Hand hand;




bool handStartStop = false;

double touchPositionDx = 0.0;
double touchPositionDy = 0.0;

//La clase principal que contendra el juego
class GameBackground extends StatefulWidget{

  String level;

  GameBackground(this.level);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _GameBackground(level);
  }

}

class _GameBackground extends State<GameBackground>{

  bool cargado=false;
  String level;
  _GameBackground(this.level);

  //De forma asincrona la siguiente funcion carga los recursos y el juego
  cargar() async {
    Flame.audio.disableLog();
    await Flame.images.loadAll(['extraterrestre1.png', 'extraterrestre2.png']);
    dimensions = await Flame.util.initialDimensions();
    game = new Game(dimensions, level);
    //game.key=key;
    HorizontalDragGestureRecognizer horizontalDragGestureRecognizer =
    new HorizontalDragGestureRecognizer();

    Flame.util.addGestureRecognizer(horizontalDragGestureRecognizer
      ..onUpdate = (startDetails) => game.dragInput(startDetails.globalPosition));

    Flame.util.addGestureRecognizer(new TapGestureRecognizer()
      ..onTapDown = (TapDownDetails evt) => game.tapInput(evt.globalPosition));

    Flame.util.addGestureRecognizer(new TapGestureRecognizer()
      ..onTapUp = (TapUpDetails evt) => game.onUp(evt.globalPosition));
    setState(() {
      cargado=true;
    });
    game.context=context;
  }
  //En el initState llamo a la funcion asincrona
  void initState(){
    cargar();
  }
  //Si el juego finaliza esta ventana se cierra
  @override
  void dispose() {
    if(!finish){
      super.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Container(
      child: Stack(
          children: <Widget>[
            //El Widget de abajo me permite poner un archivo .flr el cual es animado
            FlareActor(
              'assets/space.flr',
              animation: "idle",
              fit: BoxFit.cover,
            ),
            //Si se cargaron los recursos el juego inicia
            cargado?game.widget:Container(),
            //Añado un botón de pausa
            Container(
              margin: EdgeInsets.only(
                top: 20.0,
                left: 20.0
              ),
              width: 50.0,
              height: 50.0,
              child: RawMaterialButton(
                onPressed: (){
                  game.paused = true;
                  game.startTime();
                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context){
                        return AlertDialog(
                          title: Text(
                              'PAUSA',
                            style: TextStyle(
                              fontFamily: 'Metal',
                              color: Colors.white
                            ),
                          ),
                          backgroundColor: Colors.black12,
                          content: Container(
                            height: 100,
                            child: Column(
                              children: <Widget>[
                                FlatButton(
                                  onPressed: (){
                                    game.paused = false;
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                      'Continuar',
                                    style: TextStyle(
                                        fontFamily: 'Metal',
                                        color: Colors.white
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          )
                        );
                      }
                  );
                },
                child: Icon(
                  Icons.pause_circle_filled,
                  color: Colors.white,
                  size: 50.0,
                ),
              ),
            )
          ],
      ),
    );
  }

}

//Funcion que llama a mi juego
class GameWrapper extends StatelessWidget {
  final Game game;
  GameWrapper(this.game);

  @override
  Widget build(BuildContext context) {
    return game.widget;
  }
}
