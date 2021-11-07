import 'package:chat_app2/BackEnd/Firebase/Auth/signup_auth.dart';
import 'package:chat_app2/BackEnd/Firebase/CloudFirestoreDatabase/new_user_data.dart';
import 'package:chat_app2/FrontEnd/AuthUi/login_page.dart';
import 'package:chat_app2/FrontEnd/MainScreen/main_screen.dart';
import 'package:chat_app2/FrontEnd/NewUserEntry/new_user_entry.dart';
import 'package:chat_app2/FrontEnd/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      checkSignedIn();
    });
  }

  void checkSignedIn() async {
    // if (FirebaseAuth.instance.currentUser != null) {
    //   Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage()));
    // } else {
    //   Navigator.push(context, MaterialPageRoute(builder: (_) => LoginPage()));
    // }
    if (FirebaseAuth.instance.currentUser == null) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => LoginPage()));
    } else {
      final CloudFirestoreDataManagement cloudFirestoreDataManagement =
          CloudFirestoreDataManagement();
      final bool response =
          await cloudFirestoreDataManagement.userRecordPresentOrNot(
              email: FirebaseAuth.instance.currentUser!.email.toString());
      // ScaffoldMessenger.of(context)
      //     .showSnackBar(const SnackBar(content: Text("Login Successful")));
      response
          // ? Navigator.push(
          //     context, MaterialPageRoute(builder: (_) => MainScreen()))
          // : Navigator.push(context,
          //     MaterialPageRoute(builder: (_) => TakePrimaryUserData()));
          ? Navigator.pushAndRemoveUntil(context,
              MaterialPageRoute(builder: (_) => MainScreen()), (route) => false)
          : Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => TakePrimaryUserData()),
              (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  "assets/images/splash.png",
                  width: 300,
                  height: 300,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Welcome to Chat App",
                  style: TextStyle(fontSize: 20.0, color: Colors.black),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: 30,
                  height: 30,
                  child: const CircularProgressIndicator(
                    color: Colors.deepPurple,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
