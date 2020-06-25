import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spacegame/Score/ui/score_after_game.dart';

import '../ui/game_background.dart';
import 'dart:math';

GameBackground gameBackground;

class Alien extends SpriteComponent {
  Size dimenstions;
  BuildContext context;
  int postion;
  int ypostion;
  bool explode = false;
  //double maxY;
  double maxX;
  String pathImg;
  //GlobalKey<ScaffoldState> context;
  double speed;
  int aux = 0;
  int mult = 1;

  Alien(this.dimenstions, this.postion, this.ypostion,this.context,this.speed,this.pathImg)
      : super.square(ALIEN_SIZE, pathImg);

  @override
  void update(double t) {
    if(aux%40==0){
      mult *= -1;
    }
    aux++;
    y += finish ? 0 : mult*sin(ALIENSPEED)*pi;

    x += finish ? 0 : (t * speed);
    //x += t * ALIENSPEED;
  }

  @override
  bool destroy() {
    if (explode) {
      return true;
    }
    if (x == null || maxX == null) {
      return false;
    }
    bool destroy = x >= maxX + ALIEN_SIZE / 2;
    return false;

  }

  @override
  void resize(Size size) {
    this.x = 0;
    this.y = ALIEN_SIZE * ypostion/2;
    //this.maxY = size.height;
    this.maxX = size.width;
  }
}
