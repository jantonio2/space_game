import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

//Clase para realizar autentificación con google
class FirebaseAuthAPI {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  //Funcion para Iniciar Sesión
  Future<FirebaseUser> signIn() async{
    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication gSA = await googleSignInAccount.authentication;
    FirebaseUser user = await _auth.signInWithCredential(
        GoogleAuthProvider.getCredential(idToken: gSA.idToken, accessToken: gSA.accessToken));
    return user;
  }

  //Función para Cerrar Sesión
  signOut() async{
    await _auth.signOut().then((onValue) => print("Sesión cerrada"));
    googleSignIn.signOut();
    print('Sesiones cerradas');
  }
}