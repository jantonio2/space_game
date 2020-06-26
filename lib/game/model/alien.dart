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
  double maxX;
  String pathImg;
  double speed;
  int aux = 0;
  int mult = 1;


  //El codigo de abajo es el constructor del alien
  Alien(this.dimenstions, this.postion, this.ypostion,this.context,this.speed,this.pathImg)
      : super.square(ALIEN_SIZE, pathImg);

  //La función de abajo actualiza la posición del alien alrededor del lienzo
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

  //La función de abajo destruye al alien si se retorna true
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

  //La función de abajo dibuja al alien en su posición inicial
  @override
  void resize(Size size) {
    this.x = 0;
    this.y = ALIEN_SIZE * ypostion/2;
    //this.maxY = size.height;
    this.maxX = size.width;
  }
}
