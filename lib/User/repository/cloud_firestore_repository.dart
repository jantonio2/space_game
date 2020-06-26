import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spacegame/Score/model/score.dart';
import 'package:spacegame/User/model/user.dart';
import 'package:spacegame/User/repository/cloud_firestore_api.dart';

class CloudFirestoreRepository{
  final _cloudFirestoreAPI = CloudFirestoreAPI();
  //Funcion que por la API actualiza los datos del usuario
  void updateUserDataFirestore(User user) => _cloudFirestoreAPI.updateUserData(user);
  //Funcion que por la API actualiza los datos del puntaje
  Future<void> updateScore(Score score) => _cloudFirestoreAPI.updateScore(score);

}