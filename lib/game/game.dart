import 'dart:async';
import 'dart:math';
import 'dart:ui';
import 'package:flame/components/component.dart';
import 'package:flutter/material.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:ordered_set/ordered_set.dart';
import 'package:spacegame/Score/ui/score_after_game.dart';
//import 'package:flame/time.dart';
//import 'package:flame/components/timer_component.dart';

import 'hand.dart';
import 'alien.dart';
import 'game_background.dart';


class Game extends BaseGame {

  bool checkOnce = true;
  BuildContext context;

  int _counter=10;
  Timer _timer;

  List<Alien> AlienList = <Alien>[];
  List<Hand> handList = <Hand>[];
  Size dimenstions;
  //GlobalKey key;

  Game(this.dimenstions){
    points = 0;
    print("entra al juego");
    _startTimer();
    /*add(
        TimerComponent(
            Timer(1, repeat: true, callback: () {
              print("10 seconds elapsed");
            })
              ..start()
        )
    );*/
  }

  @override
  void render(Canvas canvas) {
    //fin(finish);
    if(!finish){
      print('puntos: ${points}');
      super.render(canvas);

      String text = points.toString();
      String c = _counter.toString();
      TextPainter co = Flame.util
          .text(c, color: Colors.white, fontSize: 30.0, fontFamily: 'Metal');
      TextPainter p = Flame.util
          .text(text, color: Colors.white, fontSize: 30.0, fontFamily: 'Metal');
      String over = "Tu score final: "+points.toString();
      TextPainter overGame = Flame.util
          .text(over, color: Colors.white, fontSize: 20.0, fontFamily: 'Halo');
      print('dimensiones: ${dimenstions.height}');

      finish
          ? overGame.paint(canvas, Offset(dimenstions.width / 3, dimenstions.height / 2))
          : co.paint(canvas, Offset(dimenstions.width - co.width - 10, co.height + 40));
      //p.paint(canvas, Offset(size.width - p.width - 10, size.height - p.height - 10));
      /*if(points>200 || !finish){
      //overGame.paint(canvas, Offset(size.width / 5, size.height / 2));
      ScoreAfterGame();
    }*/
    }
  }

  double creationTimer = 0.0;
  @override
  void update(double t) {
    creationTimer += t*2;
    if(!finish){
      if (creationTimer >= 4) {
        creationTimer = 0.0;
        int l = 5+Random().nextInt(15-5);
        alien = new Alien(dimenstions, 0, l,context);
        AlienList.add(alien);
        add(alien);
      }
      super.update(t);
    }
  }

  void tapInput(Offset position) {
    if(!finish){
      touchPositionDx = position.dx;
      touchPositionDy = position.dy;
      handStartStop = true;
      handList.add(hand);
      hand = new Hand(AlienList, handList);
      add(hand);
    }
  }

  void dragInput(Offset position) {
    touchPositionDx = position.dx;
    touchPositionDy = position.dy;
    handStartStop = true;
  }

  void onUp(vdata) {
    handStartStop = false;
  }

  void _startTimer() {
    _counter = 10;
    if (_timer != null) {
      _timer.cancel();
    }
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        if (_counter > 0) {
          _counter--;
        } else {
          _timer.cancel();
        }
    });
  }

  /*void fin(bool f){
    if(f){
    /*else{
      Navigator.push(context,
          MaterialPageRoute(builder: (context)=>ScoreAfterGame(points))
      );
    }*/
      Navigator.push(context,
          MaterialPageRoute(builder: (context)=>ScoreAfterGame(points))
      );
    }
  }*/
}

