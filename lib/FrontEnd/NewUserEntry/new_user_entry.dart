import 'package:chat_app2/BackEnd/Firebase/CloudFirestoreDatabase/new_user_data.dart';
import 'package:chat_app2/FrontEnd/MainScreen/main_screen.dart';
import 'package:chat_app2/FrontEnd/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';

class TakePrimaryUserData extends StatefulWidget {
  @override
  _TakePrimaryUserDataState createState() => _TakePrimaryUserDataState();
}

class _TakePrimaryUserDataState extends State<TakePrimaryUserData> {
  final GlobalKey<FormState> _saveKey = GlobalKey<FormState>();

  bool _isLoading = false;

  final TextEditingController userName = TextEditingController();
  final TextEditingController about = TextEditingController();

  final CloudFirestoreDataManagement cloudFirestoreDataManagement =
      CloudFirestoreDataManagement();

  Widget _upperHeading() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: Text(
          "Set Up Your Account",
          style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _commonTextFormField(
      {required String hintText,
      required IconData icon,
      String? Function(String?)? validator,
      required TextEditingController textEditingController}) {
    return Container(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 30.0),
      child: TextFormField(
        validator: validator,
        controller: textEditingController,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.deepPurple,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.deepPurple,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          prefixIcon: Icon(
            icon,
            color: Colors.deepPurple,
          ),
          hintText: hintText,
          labelText: hintText,
          labelStyle: const TextStyle(color: Colors.black54),
        ),
      ),
    );
  }

  Widget _saveUserInfoButton() {
    return Padding(
      padding: const EdgeInsets.only(
          left: 20.0, right: 20.0, bottom: 30.0, top: 20.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(MediaQuery.of(context).size.width - 40, 60),
          elevation: 8.0,
          primary: Colors.deepPurple,
          // padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: const Text(
          "Save",
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        onPressed: () async {
          if (_saveKey.currentState!.validate()) {
            print("Validated");

            if (mounted) {
              setState(() {
                _isLoading = true;
              });
            }

            final bool response = await cloudFirestoreDataManagement
                .checkUserIsAlreadyPresentedOrNot(userName: userName.text);

            if (!response) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("User name is already presented")));
            } else {
              final bool userEntryResponse =
                  await cloudFirestoreDataManagement.registerNewUser(
                      userName: userName.text,
                      aboutMe: about.text,
                      userEmail:
                          FirebaseAuth.instance.currentUser!.email.toString());

              if (userEntryResponse) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("User Data entried successfully")));
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => MainScreen()),
                    (route) => false);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("User Data not successfully entried")));
              }
            }
          } else {
            print("Not Validated");
          }

          if (mounted) {
            setState(() {
              _isLoading = false;
            });
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: LoadingOverlay(
          isLoading: _isLoading,
          color: Colors.black54,
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Container(
              child: ListView(
                shrinkWrap: true,
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  _upperHeading(),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Column(
                      children: [
                        Form(
                          key: _saveKey,
                          child: Column(
                            children: [
                              _commonTextFormField(
                                  hintText: "User Name",
                                  icon: Icons.person,
                                  validator: (inputVal) {
                                    final RegExp _messageRegex =
                                        RegExp(r'[a-zA-Z0-9]');

                                    if (inputVal!.isEmpty) {
                                      return 'Username can not be empty';
                                    } else if (inputVal.length < 4) {
                                      return 'Username must be at least 4 characters';
                                    } else if (inputVal.contains(' ') ||
                                        inputVal.contains('@')) {
                                      return "Space and '@' not allowed... Use '_' instead of space or '@'";
                                    } else if (inputVal.contains('__')) {
                                      return "'__' not allowed... Use '_' instead of '__'";
                                    } else if (!_messageRegex
                                        .hasMatch(inputVal)) {
                                      return 'Sorry! Only Emoji not supported';
                                    } else if (inputVal.contains('(') ||
                                        inputVal.contains(')') ||
                                        inputVal.contains('*') ||
                                        inputVal.contains('~') ||
                                        inputVal.contains('!') ||
                                        inputVal.contains("&")) {
                                      return "Special characters not supported...Use '_' instead";
                                    }
                                    return null;
                                  },
                                  textEditingController: userName),
                              _commonTextFormField(
                                  hintText: "About Me",
                                  icon: Icons.account_box,
                                  validator: (inputVal) {
                                    if (inputVal!.isEmpty) {
                                      return 'About Section can not be empty';
                                    } else if (inputVal.length < 4) {
                                      return 'About Section must be at least 4 characters';
                                    }
                                    return null;
                                  },
                                  textEditingController: about),
                              _saveUserInfoButton(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
