import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spacegame/User/model/user.dart';

class CloudFirestoreAPI {

  final String USERS = "users";
  final String SCORE = "scores";

  final Firestore _db = Firestore.instance;

  void updateUserData(User user) async{
    DocumentReference ref = _db.collection(USERS).document(user.uid);
    return ref.setData({
      'uid': user.uid,
      'name': user.name,
      'email': user.email,
      'photoURL': user.photoURL,
      'myScores': user.myScores,
      'lastSignIn': DateTime.now()
    }, merge: true);
  }

}