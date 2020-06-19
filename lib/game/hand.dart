import 'dart:ui';

import 'package:flame/components/component.dart';

import 'alien.dart';
import 'explosion.dart';
import 'game_background.dart';


class Hand extends SpriteComponent {
  bool explode = false;
  double maxY;
  List<Alien> AlienList = <Alien>[];
  List<Hand> bulletList = <Hand>[];
  Hand(this.AlienList, this.bulletList)
      : super.square(HAND_SIZE, 'mano.png');
  Alien alien;

  @override
  void update(double t) {
    y -= finish ? 0 : t * HANDSPEED;
    //y -= t * HANDSPEED;
    if (AlienList.isNotEmpty)
      AlienList.forEach((alien) {
        bool remove = this.toRect().contains(alien.toRect().bottomCenter) ||
            this.toRect().contains(alien.toRect().bottomLeft) ||
            this.toRect().contains(alien.toRect().bottomRight);
        //||this.toRect().contains(Offset(alien.x,alien.y))
        if (remove) {
          if(alien.pathImg == 'extraterrestre4.png'){
            points += 100;
          }
          if(alien.pathImg == 'alienrojo.png'){
            points +=150;
          }
          if(alien.pathImg == 'alienpurple.png'){
            points +=200;
          }
          if(alien.pathImg == 'aliensky.png'){
            points +=250;
          }
          alien.explode = true;
          hand.explode = true;
          AlienList.remove(alien);
          game.add(new Explosion(alien));
        }
      });
  }

  @override
  bool destroy() {
    if (explode) {
      return true;
    }
    if (y == null || maxY == null) {
      return false;
    }
    bool destroy = y >= maxY;

    return destroy;
  }

  @override
  void resize(Size size) {
    this.x = touchPositionDx;
    this.y = touchPositionDy;
    this.maxY = size.height;
  }
}
