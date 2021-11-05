import 'package:chat_app2/BackEnd/Firebase/Auth/signup_auth.dart';
import 'package:chat_app2/FrontEnd/AuthUi/login_page.dart';
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

  void checkSignedIn() {
    if (FirebaseAuth.instance.currentUser != null) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage()));
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (_) => LoginPage()));
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
