import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spacegame/Score/model/score.dart';
import 'package:spacegame/User/model/user.dart';

class CloudFirestoreAPI {

  final String USERS = "users";
  final String SCORES = "scores";

  final Firestore _db = Firestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void updateUserData(User user) async{
    DocumentReference ref = _db.collection(USERS).document(user.uid);
    return await ref.setData({
      'uid': user.uid,
      'name': user.name,
      'email': user.email,
      'photoURL': user.photoURL,
      'lastSignIn': DateTime.now()
    }, merge: true);
  }

  Future<void> updateScore(Score score) async{
    CollectionReference refScores = _db.collection(SCORES);

    await _auth.currentUser().then((FirebaseUser user){
      refScores.add(
        {
          'level' : score.level,
          'points' : score.points,
          'userOwner' : _db.document("${USERS}/${user.uid}")  //reference
        }
      ).then((DocumentReference dr){
        dr.get().then((DocumentSnapshot snapshot){
          DocumentReference refUsers = _db.collection(USERS).document(user.uid);
          refUsers.updateData({
            'myScores' : FieldValue.arrayUnion([_db.document("${SCORES}/${snapshot.documentID}")])

          });
        });
      });
    });
  }

}