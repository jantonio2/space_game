import 'package:firebase_auth/firebase_auth.dart';
import 'package:spacegame/User/repository/firebaseauthapi.dart';

class AuthRepository{
  final _firebaseAuthAPI = FirebaseAuthAPI();

  //Función que por la API incia la sesión
  Future<FirebaseUser> signInFirebase() => _firebaseAuthAPI.signIn();

  //Función que por la API cierra la sesión
  signOut() => _firebaseAuthAPI.signOut();
}