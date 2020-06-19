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

  bool paused = false;

  bool checkOnce = true;
  bool checkTimer = true;
  BuildContext context;

  int counte=12;
  Timer time;

  List<Alien> AlienList = <Alien>[];
  List<Hand> handList = <Hand>[];
  Size dimenstions;
  //GlobalKey key;
  String level;
  double i;
  double speed = 120.0;

  Game(this.dimenstions,this.level){
    //paused = false;
    points = 0;
    //print("entra al juego");
    //print(level);
    switch(level){
      case 'Nivel 1':
        i=0.5;
        counte=30;
        speed = 120.0;
        break;
      case 'Nivel 2':
        i=1;
        counte=25;
        speed = 150.0;
        break;
      case 'Nivel 3':
        i=2;
        counte=20;
        speed = 180.0;
        break;
      case 'Nivel 4':
        i=3;
        counte=15;
        speed = 200.0;
        break;
      case 'Nivel 5':
        i=4;
        counte=10;
        speed = 250.0;
        break;
    }
    startTime();
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
      //print('puntos: ${points}');
      super.render(canvas);

      String text = points.toString();
      String c;
      if(counte<10){
        c = '0'+counte.toString();
      }else{
        c = counte.toString();
      }

      TextPainter co = Flame.util
          .text(c, color: Colors.white, fontSize: 30.0, fontFamily: 'Metal');
      TextPainter p = Flame.util
          .text(text, color: Colors.white, fontSize: 30.0, fontFamily: 'Metal');

      TextPainter lev = Flame.util
          .text(level, color: Colors.white, fontSize: 30.0, fontFamily: 'Metal');

      co.paint(canvas, Offset(dimenstions.width - co.width - 10, co.height + 40));
      p.paint(canvas, Offset(dimenstions.width/2, co.height + 40));
      lev.paint(canvas, Offset(0, co.height + 40));
    }
  }

  double creationTimer = 0.0;
  @override
  void update(double t) {
    if(!paused){
      creationTimer += t*2;
      if(!finish){
        if (creationTimer >= i) {
          creationTimer = 0.0;
          int l = 5+Random().nextInt(15-5);
          if(level == 'Nivel 2'){
            if(l == 9 || l == 13){
              alien = new Alien(dimenstions, 0, l,context,speed,'alienrojo.png');
            }else{
              alien = new Alien(dimenstions, 0, l,context,speed,'extraterrestre4.png');
            }
          }
          if(level == 'Nivel 3'){
            if(l == 11 || l == 7){
              alien = new Alien(dimenstions, 0, l,context,speed,'alienpurple.png');
            }else{
              if(l==8 || l==6){
                alien = new Alien(dimenstions, 0, l,context,speed,'alienrojo.png');
              }else{
                alien = new Alien(dimenstions, 0, l,context,speed,'extraterrestre4.png');
              }
            }
          }
          if(level == 'Nivel 1' || level == 'Nivel 4' || level == 'Nivel 5'){
            alien = new Alien(dimenstions, 0, l,context,speed,'extraterrestre4.png');
          }
          AlienList.add(alien);
          add(alien);
        }
        super.update(t);
      }
    }else{
      startTime();
    }
  }

  void tapInput(Offset position) {
    if(position.dy>=500){
      if(!finish ){
        touchPositionDx = position.dx;
        print('X: ${position.dx}');
        touchPositionDy = position.dy;
        print('Y: ${position.dy}');
        handStartStop = true;
        handList.add(hand);
        hand = new Hand(AlienList, handList);
        add(hand);
      }
    }else{
      print('Fuera');
    }
  }

  void dragInput(Offset position) {
    if(position.dy>=500){
      touchPositionDx = position.dx;
      touchPositionDy = position.dy;
      handStartStop = true;
    }
  }

  void onUp(vdata) {
    handStartStop = false;
  }

  void startTime() {
    //_counter = 12;
    if (time != null) {
      time.cancel();
    }
    time = Timer.periodic(Duration(seconds: 1), (timer) {
      print('${counte}');
      if (counte > 0 || checkTimer== false) {
        counte--;
        checkTimer = true;
      } else {
        time.cancel();
        finish = true;
        print('Entra ${finish}');
        Navigator.push(context,
            MaterialPageRoute(builder: (context)=>ScoreAfterGame(points,level))
        );
      }
    });
  }

  void stopTime(){
    checkTimer = false;
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

