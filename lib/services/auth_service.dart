import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {

  //google sign in
  signInWithGoogle() async {
    //begin interactive sign in process
    final GoogleSignInAccount? _user = await GoogleSignIn().signIn();

    //obtain auth details from request
    final GoogleSignInAuthentication _userAuth = await _user!.authentication;

    //create a new credidential for user
    final credential = GoogleAuthProvider.credential(
      accessToken: _userAuth.accessToken,
      idToken: _userAuth.idToken,
    );

    //sign in with new credidential
    return await FirebaseAuth.instance.signInWithCredential((credential));
  }
              
}