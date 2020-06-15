import 'package:firebase_auth/firebase_auth.dart';
import 'package:spacegame/User/repository/firebaseauthapi.dart';

class AuthRepository{
  final _firebaseAuthAPI = FirebaseAuthAPI();

  Future<FirebaseUser> signInFirebase() => _firebaseAuthAPI.signIn();

  signOut() => _firebaseAuthAPI.signOut();
}