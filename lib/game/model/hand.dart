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
  //Constructor de la clase
  Hand(this.AlienList, this.bulletList, this.context)
      : super.square(HAND_SIZE, 'mano.png');
  Alien alien;
  GameBloc gameBloc;

  //Actualizo la posicion de la mano en el lienzo
  @override
  void update(double t) {
    //El movimiento continua hasta que el juego finalice
    y -= finish ? 0 : t * HANDSPEED;
    //Recibo la lista de los aliens
    if (AlienList.isNotEmpty)
      AlienList.forEach((alien) {
        //Reviso si la mano colisiono con el alien
        bool remove = this.toRect().contains(alien.toRect().bottomCenter) ||
            this.toRect().contains(alien.toRect().bottomLeft) ||
            this.toRect().contains(alien.toRect().bottomRight);
        //Si colisiono retorno un true y remuevo a los dos, añado el valor del alien a los puntos
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
          alien.explode = true;
          hand.explode = true;
          AlienList.remove(alien);
          //Añado la animación de la explosion
          game.add(new Explosion(alien));
        }
      });
  }

  //La función de abajo destruye a la mano si se retorna true
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

  //La funcion de abajo dibuja a la mano en el lugar donde se haya tocado
  @override
  void resize(Size size) {
    this.x = touchPositionDx;
    this.y = touchPositionDy;
    this.maxY = size.height;
  }
}
