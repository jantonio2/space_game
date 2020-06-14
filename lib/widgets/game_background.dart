import 'package:flame/flame.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:spacegame/widgets/game.dart';


bool gameOver = false;
const DRAGONSPEED = 120.0;
const BULLETSPEED = 60.0;
const DRAGON_SIZE = 40.0;
const BULLET_SIZE = 20.0;

var points = 0;
//Dragon dragon;
//Bullet bullet;
var game;

bool bulletStartStop = false;

double touchPositionDx = 0.0;
double touchPositionDy = 0.0;

GameBackground() async{
  Flame.audio.disableLog();
  Flame.images.loadAll(['fire.png', 'dragon.png', 'gun.png', 'bullet.png']);
  var dimensions = await Flame.util.initialDimensions();
  game = Game(dimensions);
  return MaterialApp(
    home: Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/Fondo1.jpg'),
            fit: BoxFit.cover
          )
        ),
        child: GameWrapper(game),
      ),
    ),
  );
}

class GameWrapper extends StatelessWidget {
  final Game game;
  GameWrapper(this.game);

  @override
  Widget build(BuildContext context) {
    return game.widget;
  }
}

/*class GameBackground extends StatelessWidget{
  //Flame.images.loadAll(['fire.png', 'dragon.png', 'gun.png', 'bullet.png']);
  var dimensions = Flame.util.initialDimensions();
  var game = Game();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/img/Fondo1.jpg'),
                  fit: BoxFit.cover
              )
          ),
          child: GameWrapper(game),
        ),
      ),
    );;
  }

}
class GameWrapper extends StatelessWidget {
  final Game game;
  GameWrapper(this.game);

  @override
  Widget build(BuildContext context) {
    return game.widget;
  }
}*/
