import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flutter/cupertino.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:spacegame/game/bloc/bloc_game.dart';

import 'alien.dart';
import '../explosion.dart';
import '../ui/game_background.dart';


class Hand extends SpriteComponent {
  bool explode = false;
  double maxY;
  List<Alien> AlienList = <Alien>[];
  List<Hand> bulletList = <Hand>[];
  BuildContext context;
  Hand(this.AlienList, this.bulletList, this.context)
      : super.square(HAND_SIZE, 'mano.png');
  Alien alien;
  GameBloc gameBloc;

  @override
  void update(double t) {
    //gameBloc = BlocProvider.of<GameBloc>(context);
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
          if(alien.pathImg == 'alieneye.png'){
            points +=300;
          }
          //gameBloc.sumaPunto(alien.pathImg);
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
