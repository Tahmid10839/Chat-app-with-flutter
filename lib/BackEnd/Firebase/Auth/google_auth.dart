import 'package:chat_app2/Global_Uses/enum_signup.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GoogleAuth {
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<GoogleSignInResults> signInWithGoogle() async {
    try {
      if (await googleSignIn.isSignedIn()) {
        print("Already Google Signed in");
        return GoogleSignInResults.AlreadySignedIn;
      } else {
        final GoogleSignInAccount? _googleSignInAccount =
            await googleSignIn.signIn();
        if (_googleSignInAccount == null) {
          print("Google Sign In not completed");
          return GoogleSignInResults.SignInNotCompleted;
        } else {
          final GoogleSignInAuthentication _googleSignInAuth =
              await _googleSignInAccount.authentication;

          final OAuthCredential _oAuthCredential =
              GoogleAuthProvider.credential(
                  accessToken: _googleSignInAuth.accessToken,
                  idToken: _googleSignInAuth.idToken);

          final UserCredential userCredential = await FirebaseAuth.instance
              .signInWithCredential(_oAuthCredential);

          if (userCredential.user!.email != null) {
            print("Google Sign In Completed");
            return GoogleSignInResults.SignInCompleted;
          } else {
            print("Google Sign In problem");
            return GoogleSignInResults.UnexpectedError;
          }
        }
      }
    } catch (e) {
      print("Error in Google Sign In ${e.toString()}");
      return GoogleSignInResults.UnexpectedError;
    }
  }

  Future<bool> logOut() async {
    try {
      print("Google Log out");

      await googleSignIn.disconnect();
      await googleSignIn.signOut();
      await FirebaseAuth.instance.signOut();
      return true;
    } catch (e) {
      print("Error in Google log out ${e.toString()}");
      return false;
    }
  }
}
