import 'package:chat_app2/Global_Uses/enum_signup.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FacebookAuthentication {
  final FacebookAuth _facebookLogin = FacebookAuth.instance;

  Future<FbSignInResults> facebookLogIn() async {
    try {
      if (await _facebookLogin.accessToken == null) {
        final LoginResult _fbLogInResult = await _facebookLogin.login();

        if (_fbLogInResult.status == LoginStatus.success) {
          final OAuthCredential _oAuthCredential =
              FacebookAuthProvider.credential(
                  _fbLogInResult.accessToken!.token);

          if (FirebaseAuth.instance.currentUser != null) {
            FirebaseAuth.instance.signOut();
          }

          final UserCredential fbUser = await FirebaseAuth.instance
              .signInWithCredential(_oAuthCredential);

          print(
              'Fb Log In Info: ${fbUser.user}    ${fbUser.additionalUserInfo}');

          return FbSignInResults.SignInCompleted;
        }
        return FbSignInResults.UnexpectedError;
      } else {
        print('Already Fb Logged In');
        await logOut();
        return FbSignInResults.AlreadySignedIn;
      }
    } catch (e) {
      print('Facebook Log In Error: ${e.toString()}');
      return FbSignInResults.UnexpectedError;
    }
  }

  Future<bool> logOut() async {
    try {
      print('Facebook Log Out');
      if (await _facebookLogin.accessToken != null) {
        await _facebookLogin.logOut();
        await FirebaseAuth.instance.signOut();
        return true;
      }
      return false;
    } catch (e) {
      print('Facebook Log out Error: ${e.toString()}');
      return false;
    }
  }
}
