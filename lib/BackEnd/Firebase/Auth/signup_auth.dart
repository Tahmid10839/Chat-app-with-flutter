import 'package:chat_app2/Global_Uses/enum_signup.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EmailAndPasswordAuth {
  Future<EmailSignUpResults> signUpAuth(
      {required String email, required String password}) async {
    try {
      final UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if (userCredential.user!.email != null) {
        await userCredential.user!.sendEmailVerification();
        return EmailSignUpResults.SignUpCompleted;
      } else {
        return EmailSignUpResults.SignUpNotCompleted;
      }
    } catch (e) {
      print("Error in Email and Password ${e.toString()}");
      return EmailSignUpResults.EmailAlreadyPresent;
    }
  }

  Future<EmailSignInResults> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (userCredential.user!.emailVerified) {
        return EmailSignInResults.SignInCompleted;
      } else {
        final bool logOutResponse = await logOut();
        if (logOutResponse) {
          return EmailSignInResults.EmailNotVerified;
        } else {
          return EmailSignInResults.UnexpectedError;
        }
      }
    } catch (e) {
      print("Error in Sign In with Email and Password ${e.toString()}");
      return EmailSignInResults.EmailOrPasswordInvalid;
    }
  }

  Future<bool> logOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      return true;
    } catch (e) {
      return false;
    }
  }
}
