import 'dart:ui';
import 'package:flame/components/component.dart';
import 'package:flutter/material.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:ordered_set/ordered_set.dart';

import 'extraterrestre.dart';


Extraterrestre extraterrestre;
class Game extends BaseGame{

  Size dimensions;
  Game(this.dimensions);
  @override
  void render(Canvas canvas) {
    //super.render(canvas);
    String text = "Score: 0";
    TextPainter textPainter =
    Flame.util.text(text, color: Colors.white, fontSize: 48.0);
    textPainter.paint(canvas, Offset(size.width / 5, size.height/2));
  }

  double creationTimer = 0.0;
  @override
  void update(double t) {
    /*creationTimer += t;
    if(creationTimer >= 4){
      creationTimer = 0.0;
      extraterrestre = Extraterrestre(dimensions);
      add(extraterrestre);
    }
    super.update(t);*/
  }

}

