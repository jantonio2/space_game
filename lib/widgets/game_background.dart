import 'package:flame/flame.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:spacegame/widgets/game.dart';

import 'bullet.dart';
import 'dragon.dart';


bool gameOver = false;
const DRAGONSPEED = 120.0;
const BULLETSPEED = 60.0;
const DRAGON_SIZE = 40.0;
const BULLET_SIZE = 20.0;

var points = 0;
Dragon dragon;
Bullet bullet;

var game;

bool bulletStartStop = false;

double touchPositionDx = 0.0;
double touchPositionDy = 0.0;

GameBackground() async {
  Flame.audio.disableLog();
  Flame.images.loadAll(['fire.png', 'dragon.png', 'gun.png', 'bullet.png']);

  var dimensions = await Flame.util.initialDimensions();

  game = new Game(dimensions);
  runApp(MaterialApp(
      home: Scaffold(
          body: Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("assets/images/background.jpg"),
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

  // Adds onUP feature to fire bullets
  Flame.util.addGestureRecognizer(new TapGestureRecognizer()
    ..onTapUp = (TapUpDetails evt) => game.onUp(evt.globalPosition));
}

class GameWrapper extends StatelessWidget {
  final Game game;
  GameWrapper(this.game);

  @override
  Widget build(BuildContext context) {
    return game.widget;
  }
}
