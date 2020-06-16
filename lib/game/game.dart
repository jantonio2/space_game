import 'dart:math';
import 'dart:ui';
import 'package:flame/components/component.dart';
import 'package:flutter/material.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:ordered_set/ordered_set.dart';
import 'package:spacegame/Score/ui/score_after_game.dart';

import 'hand.dart';
import 'alien.dart';
import 'game_background.dart';


class Game extends BaseGame {
  bool checkOnce = true;
  double creationTimer;
  BuildContext context;

  List<Alien> AlienList = <Alien>[];
  List<Hand> handList = <Hand>[];
  Size dimenstions;
  //GlobalKey key;

  Game(this.dimenstions){

    print("entra al juego");
  }

  @override
  void render(Canvas canvas) {
    print('puntos: ${points}');
    super.render(canvas);

    String text = points.toString();
    TextPainter p = Flame.util
        .text(text, color: Colors.white, fontSize: 48.0, fontFamily: 'Halo');
    String over = "Tu score final: "+points.toString();
    TextPainter overGame = Flame.util
        .text(over, color: Colors.white, fontSize: 20.0, fontFamily: 'Halo');
    finish
        ? overGame.paint(canvas, Offset(dimenstions.width / 3, dimenstions.height / 2))
        : p.paint(canvas,
        new Offset(dimenstions.width - p.width - 10, dimenstions.height - p.height - 10));
    //p.paint(canvas, Offset(size.width - p.width - 10, size.height - p.height - 10));
    /*if(points>200 || !finish){
      //overGame.paint(canvas, Offset(size.width / 5, size.height / 2));
      ScoreAfterGame();
    }*/
  }

  @override
  void update(double t) {
    print(creationTimer);
    if(creationTimer==null){
      print("si imprime");
      creationTimer=0;
    }
    creationTimer += t;
    if(!finish){
      if (creationTimer >= 4) {
        creationTimer = 0.0;
        /*for (int i = 1; i <= ALIEN_SIZE / 7; i++) {
        for (int j = 0; j < i; ++j) {
          alien = new Alien(dimenstions, i, j);
          dragonList.add(alien);
          add(alien);
        }
      }*/
        print('Dimensiones: ${dimenstions}');
        int l = 5+Random().nextInt(20-5);
        alien = new Alien(dimenstions, 0, l,context);
        AlienList.add(alien);
        add(alien);
      }
    }
    super.update(t);
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
}

