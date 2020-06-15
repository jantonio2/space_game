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

  List<Alien> AlienList = <Alien>[];
  List<Hand> bulletList = <Hand>[];
  Size dimenstions;

  Game(this.dimenstions);

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    String text = points.toString();
    TextPainter p = Flame.util
        .text(text, color: Colors.white, fontSize: 48.0, fontFamily: 'Halo');
    String over = "Tu score final: "+points.toString();
    TextPainter overGame = Flame.util
        .text(over, color: Colors.white, fontSize: 48.0, fontFamily: 'Halo');
    /*gameOver
        ? overGame.paint(canvas, Offset(size.width / 5, size.height / 2))
        : p.paint(canvas,
        new Offset(size.width - p.width - 10, size.height - p.height - 10));*/
    p.paint(canvas, Offset(size.width - p.width - 10, size.height - p.height - 10));
    /*if(points>200){
      //overGame.paint(canvas, Offset(size.width / 5, size.height / 2));
      ScoreAfterGame();
    }*/
  }

  double creationTimer = 0.0;
  @override
  void update(double t) {
    creationTimer += t;
    if (creationTimer >= 4) {
      creationTimer = 0.0;

      /*for (int i = 1; i <= ALIEN_SIZE / 7; i++) {
        for (int j = 0; j < i; ++j) {
          alien = new Alien(dimenstions, i, j);
          dragonList.add(alien);
          add(alien);
        }
      }*/
      int l = 5+Random().nextInt(20-5);
      alien = new Alien(dimenstions, 0, l);
      AlienList.add(alien);
      add(alien);
    }
    super.update(t);
  }

  void tapInput(Offset position) {
    touchPositionDx = position.dx;
    touchPositionDy = position.dy;
    bulletStartStop = true;
    bulletList.add(bullet);
    bullet = new Hand(AlienList, bulletList);
    add(bullet);
  }

  void dragInput(Offset position) {
    touchPositionDx = position.dx;
    touchPositionDy = position.dy;
    bulletStartStop = true;
  }

  void onUp() {
    bulletStartStop = false;
  }
}

