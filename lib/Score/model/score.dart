
import 'package:flutter/material.dart';
import 'package:spacegame/User/model/user.dart';

//La clase modelo del score
class Score{
  String id;
  String level;
  int points;

  Score({
    Key key,
    @required this.level,
    @required this.points,
  });
}