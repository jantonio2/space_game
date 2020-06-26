import 'dart:async';
import 'dart:math';
import 'dart:ui';
import 'package:flame/components/component.dart';
import 'package:flutter/material.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:ordered_set/ordered_set.dart';
import 'package:spacegame/Score/ui/score_after_game.dart';
import 'package:spacegame/game/bloc/bloc_game.dart';
//import 'package:flame/time.dart';
//import 'package:flame/components/timer_component.dart';

import 'model/hand.dart';
import 'model/alien.dart';
import 'ui/game_background.dart';



//La clase principal de todo el juego
class Game extends BaseGame {

  bool paused = false;

  bool checkOnce = true;
  bool checkTimer = true;
  BuildContext context;

  int counte=12;
  Timer time;

  int point = 0;

  List<Alien> AlienList = <Alien>[];
  List<Hand> handList = <Hand>[];
  Size dimenstions;
  //GlobalKey key;
  String level;
  double i;
  double speed = 120.0;
  GameBloc gameBloc;

  Game(this.dimenstions,this.level){
    //Inicializo los puntos
    points = 0;
    //Segun el nivel que es aplico la velocidad y el tiempo
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
    //Ininicio el temporizador
    startTime();
  }

  //La funcion de abajo dibuja los elemento en el lienzo
  @override
  void render(Canvas canvas) {
    //Dibuja hasta que el juego finaliza
    if(!finish){

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

  //Añade cada cierto tiempo un objeto al lienzo
  double creationTimer = 0.0;
  @override
  void update(double t) {
    //Si el juego esta pausado deja de añádir y detiene los movimientos
    if(!paused){
      creationTimer += t*2;
      //Si el juego finaliza deja de añadir
      if(!finish){
        if (creationTimer >= i) {
          creationTimer = 0.0;
          //Obteniendo un numero randomico de posicion inicial
          int l = 5+Random().nextInt(15-5);
          //Añadiendo para el nivel 1
          if(level == 'Nivel 1'){
            alien = new Alien(dimenstions, 0, l,context,speed,'extraterrestre4.png');
          }
          //Añadiendo para el nivel 2
          if(level == 'Nivel 2'){
            if(l == 9 || l == 13){
              alien = new Alien(dimenstions, 0, l,context,speed,'alienrojo.png');
            }else{
              alien = new Alien(dimenstions, 0, l,context,speed,'extraterrestre4.png');
            }
          }
          //Añadiendo para el nivel 3
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
          //Añadiendo para el nivel 4
          if(level == 'Nivel 4'){
            if(l == 5 || l == 10){
              alien = new Alien(dimenstions, 0, l,context,speed,'aliensky.png');
            }else{
              if(l == 9 || l == 14){
                alien = new Alien(dimenstions, 0, l,context,speed,'alienpurple.png');
              }else{
                if(l==11 || l==6){
                  alien = new Alien(dimenstions, 0, l,context,speed,'alienrojo.png');
                }else{
                  alien = new Alien(dimenstions, 0, l,context,speed,'extraterrestre4.png');
                }
              }
            }
          }
          //Añadiendo para el nivel 5
          if(level == 'Nivel 5'){
            if(l == 8){
              alien = new Alien(dimenstions, 0, l,context,speed,'alieneye.png');
            }else{
              if(l == 6 || l == 12){
                alien = new Alien(dimenstions, 0, l,context,speed,'aliensky.png');
              }else{
                if(l == 5 || l == 14){
                  alien = new Alien(dimenstions, 0, l,context,speed,'alienpurple.png');
                }else{
                  if(l==11 || l==6){
                    alien = new Alien(dimenstions, 0, l,context,speed,'alienrojo.png');
                  }else{
                    alien = new Alien(dimenstions, 0, l,context,speed,'extraterrestre4.png');
                  }
                }
              }
            }
          }
          //Añadiendo al lienzo
          AlienList.add(alien);
          add(alien);
        }
        super.update(t);
      }
    }else{
      startTime();
    }
  }

  //La funcion de abajo reconoce el lugar donde se pulso
  void tapInput(Offset position) {
    //La condicion limita la pantalla para añadir la mano
    if(position.dy>=MediaQuery.of(context).size.height*0.625){
      //Si el juego finaliza no detecta el encvia el touch
      if(!finish ){
        touchPositionDx = position.dx;
        touchPositionDy = position.dy;
        handStartStop = true;
        handList.add(hand);
        hand = new Hand(AlienList, handList, context);
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

  //Funcion del temporizaor
  void startTime() {
    if (time != null) {
      time.cancel();
    }
    //Los cambios suceden cada segundo
    time = Timer.periodic(Duration(seconds: 1), (timer) {
      print('Tiempo: ${counte}');
      if (counte > 0 || checkTimer== false) {
        counte--;
        checkTimer = true;
      } else {
        time.cancel();
        finish = true;
        //Si el tiempo acaba se envia a la ventana despues del juego
        Navigator.push(context,
            MaterialPageRoute(builder: (context)=>ScoreAfterGame(points,level))
        );
      }
    });
  }

  //Funcion que detiene el temporizador
  void stopTime(){
    checkTimer = false;
  }

}

