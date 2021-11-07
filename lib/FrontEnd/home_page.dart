import 'package:chat_app2/BackEnd/Firebase/Auth/fb_auth.dart';
import 'package:chat_app2/BackEnd/Firebase/Auth/google_auth.dart';
import 'package:chat_app2/BackEnd/Firebase/Auth/signup_auth.dart';
import 'package:chat_app2/FrontEnd/AuthUi/login_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final EmailAndPasswordAuth emailAndPasswordAuth = EmailAndPasswordAuth();
  final GoogleAuth googleAuth = GoogleAuth();
  final FacebookAuthentication facebookAuthentication =
      FacebookAuthentication();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: ElevatedButton(
            child: Text("Log out"),
            onPressed: () async {
              final bool googleResponse = await googleAuth.logOut();
              if (!googleResponse) {
                final bool fbResponse = await facebookAuthentication.logOut();
                if (!fbResponse) {
                  await emailAndPasswordAuth.logOut();
                }
              }
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => LoginPage()),
                  (route) => false);
            },
          ),
        ),
      ),
    );
  }
}
