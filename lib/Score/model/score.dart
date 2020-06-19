
import 'package:flutter/material.dart';
import 'package:spacegame/User/model/user.dart';

class Score{
  String id;
  String level;
  int points;
  //User userOwner;

  Score({
    Key key,
    @required this.level,
    @required this.points,
    //@required this.userOwner
  });
}