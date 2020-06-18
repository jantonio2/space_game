import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthAPI {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<FirebaseUser> signIn() async{
    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication gSA = await googleSignInAccount.authentication;

    FirebaseUser user = (await _auth.signInWithCredential(
        GoogleAuthProvider.getCredential(idToken: gSA.idToken, accessToken: gSA.accessToken))) as FirebaseUser;
    /*final FirebaseAuth _auth=FirebaseAuth.instance;
    final GoogleSignIn googleSignIn= new GoogleSignIn();
    GoogleSignInAccount acount=await googleSignIn.signIn();
    GoogleSignInAuthentication Gauth=await acount.authentication.catchError((e){print("Cancelado");});
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: Gauth.accessToken,
      idToken: Gauth.idToken,
    );
    AuthResult user =await _auth.signInWithCredential(credential);*/

    return user;
  }

  signOut() async{
    await _auth.signOut().then((onValue) => print("Sesión cerrada"));
    googleSignIn.signOut();
    print('Sesiones cerradas');
  }
}