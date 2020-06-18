import 'package:flutter/material.dart';
import 'package:spacegame/Score/model/score.dart';

class User{
  final String uid;
  final String name;
  final String email;
  final String photoURL;
  final List<Score> myScores;

  User({
    Key key,
    @required this.uid,
    @required this.name,
    @required this.email,
    @required this.photoURL,
    this.myScores
  });
}