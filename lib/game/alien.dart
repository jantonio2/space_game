import 'dart:ui';

import 'package:flame/components/component.dart';

import 'game_background.dart';

class Alien extends SpriteComponent {
  Size dimenstions;
  int postion;
  int ypostion;
  bool explode = false;
  double maxY;

  Alien(this.dimenstions, this.postion, this.ypostion)
      : super.square(ALIEN_SIZE, 'extraterrestre4.png');

  @override
  void update(double t) {
    //y += gameOver ? 0 : (t * ALIENSPEED);
    x += t * ALIENSPEED;
  }

  @override
  bool destroy() {
    /*if (explode) {
      return true;
    }
    if (y == null || maxY == null) {
      return false;
    }
    bool destroy = y >= maxY + ALIEN_SIZE / 2;
    if (destroy) {
      gameOver = true;

      print("Game over");
      return true;
    }
    return destroy;*/
    return false;
  }

  @override
  void resize(Size size) {
    this.x = 0;
    this.y = ALIEN_SIZE * ypostion/2;
    this.maxY = size.height;
  }
}
