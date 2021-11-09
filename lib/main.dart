import 'package:chat_app2/FrontEnd/AuthUi/login_page.dart';
import 'package:chat_app2/FrontEnd/AuthUi/signup_page.dart';
import 'package:chat_app2/FrontEnd/MainScreen/main_screen.dart';
import 'package:chat_app2/FrontEnd/NewUserEntry/new_user_entry.dart';
import 'package:chat_app2/FrontEnd/SplashScreen/splash_screen.dart';
import 'package:chat_app2/FrontEnd/home_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Chat App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
      ),
      // home: SignUpPage(),
      // home: LoginPage(),
      // home: HomePage(),
      // home: SplashScreen(),
      home: MainScreen(),
      // home: TakePrimaryUserData(),
    );
  }
}
