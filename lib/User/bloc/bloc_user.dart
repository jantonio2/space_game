import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:spacegame/Score/model/score.dart';
import 'package:spacegame/User/model/user.dart';
import 'package:spacegame/User/repository/auth_repository.dart';
import 'package:spacegame/User/repository/cloud_firestore_api.dart';
import 'package:spacegame/User/repository/cloud_firestore_repository.dart';

class UserBloc implements Bloc{

  final _auth_repository = AuthRepository();

  //Flujo de datos - Streams
  //Stream - Firebase
  //StreamController
  Stream<FirebaseUser> streamFirebase = FirebaseAuth.instance.onAuthStateChanged;
  Stream<FirebaseUser> get authStatus => streamFirebase;

  //Casos de uso
  //1. SignIn a Google
  Future<FirebaseUser> signIn(){
    return _auth_repository.signInFirebase();
  }

  //2. Registrar usuario en base de datos
  final _cloudFirestoreRepository = CloudFirestoreRepository();
  void updateUserData(User user) => _cloudFirestoreRepository.updateUserDataFirestore(user);
  Future<void> updateScore(Score score) => _cloudFirestoreRepository.updateScore(score);
  Stream<QuerySnapshot> scoresListStrean = Firestore.instance.collection(CloudFirestoreAPI().SCORES).orderBy("points",descending: true).snapshots();
  Stream<QuerySnapshot> get scoresStream => scoresListStrean;

  Stream<QuerySnapshot> myScoresListSream(String uid) =>
      Firestore.instance.collection(CloudFirestoreAPI().SCORES)
          .where("userOwner", isEqualTo: Firestore.instance.document("${CloudFirestoreAPI().USERS}/${uid}"))
          .orderBy("points",descending: true)
          .snapshots();

  Stream<QuerySnapshot> userPoint(v) => Firestore.instance.collection(CloudFirestoreAPI().USERS).where("uid", isEqualTo: Firestore.instance.document("${v}")).snapshots();

  signOut() {
    _auth_repository.signOut();
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }

}