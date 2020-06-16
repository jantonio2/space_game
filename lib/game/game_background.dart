import 'package:flame/flame.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


import 'hand.dart';
import 'alien.dart';
import 'game.dart';

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

class GameBackground extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _GameBackground();
  }

}

class _GameBackground extends State<GameBackground>{

  bool cargado=false;
  cargar() async {
    Flame.audio.disableLog();
    await Flame.images.loadAll(['fire.png', 'dragon.png', 'gun.png', 'bullet.png', 'extraterrestre1.png', 'extraterrestre2.png']);
    dimensions = await Flame.util.initialDimensions();
    game = new Game(dimensions);
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

  void initState(){
    cargar();
  }
  @override
  Widget build(BuildContext context) {
    //construir();
    //print('dimensiones');
    //print(dimensions);
    // TODO: implement build
    return Container(
      decoration: new BoxDecoration(
        image: new DecorationImage(
          image: new AssetImage("assets/images/Fondo1.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: cargado?game.widget:Container(),
    );
  }

}


/*
GameBackground() async {
  Flame.audio.disableLog();
  Flame.images.loadAll(['fire.png', 'dragon.png', 'gun.png', 'bullet.png', 'extraterrestre1.png', 'extraterrestre2.png']);
  var dimensions = await Flame.util.initialDimensions();
  game = new Game(dimensions);
  //game.key=key;
  runApp(MaterialApp(
      home: Scaffold(
          body: Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("assets/images/Fondo1.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: GameWrapper(game),
          ))));
  HorizontalDragGestureRecognizer horizontalDragGestureRecognizer =
  new HorizontalDragGestureRecognizer();

  Flame.util.addGestureRecognizer(horizontalDragGestureRecognizer
    ..onUpdate = (startDetails) => game.dragInput(startDetails.globalPosition));

  Flame.util.addGestureRecognizer(new TapGestureRecognizer()
    ..onTapDown = (TapDownDetails evt) => game.tapInput(evt.globalPosition));

  Flame.util.addGestureRecognizer(new TapGestureRecognizer()
    ..onTapUp = (TapUpDetails evt) => game.onUp(evt.globalPosition));
}

*/
class GameWrapper extends StatelessWidget {
  final Game game;
  GameWrapper(this.game);

  @override
  Widget build(BuildContext context) {
    return game.widget;
  }
}
