import 'package:chat_app2/BackEnd/Firebase/Auth/google_auth.dart';
import 'package:chat_app2/BackEnd/Firebase/Auth/signup_auth.dart';
import 'package:chat_app2/FrontEnd/AuthUi/signup_page.dart';
import 'package:chat_app2/FrontEnd/home_page.dart';
import 'package:chat_app2/Global_Uses/enum_signup.dart';
import 'package:chat_app2/Global_Uses/reg_exp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loading_overlay/loading_overlay.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _loginKey = GlobalKey<FormState>();

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  final EmailAndPasswordAuth emailAndPasswordAuth = EmailAndPasswordAuth();

  bool _isLoading = false;

  final GoogleAuth googleAuth = GoogleAuth();

  bool _isPassObscure = true;
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
        obscureText: hintText == "Password" ? _isPassObscure : false,
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
          suffixIcon: hintText == "Password"
              ? IconButton(
                  icon: Icon(
                    _isPassObscure ? Icons.visibility : Icons.visibility_off,
                    color: Colors.deepPurple,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPassObscure = !_isPassObscure;
                    });
                  },
                )
              : const SizedBox.shrink(),
        ),
      ),
    );
  }

  Widget _loginButton() {
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
          "Login",
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        onPressed: () async {
          if (_loginKey.currentState!.validate()) {
            print("Validated");
            SystemChannels.textInput.invokeMethod('TextInput.hide');

            if (mounted) {
              setState(() {
                _isLoading = true;
              });
            }

            String msg = '';
            final EmailSignInResults emailSignInResults =
                await emailAndPasswordAuth.signInWithEmailAndPassword(
                    email: email.text, password: password.text);
            if (emailSignInResults == EmailSignInResults.SignInCompleted) {
              msg = "Login Successful";
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => HomePage()),
                  (route) => false);
            } else if (emailSignInResults ==
                EmailSignInResults.EmailNotVerified) {
              msg =
                  "Email is not verified.\nPlease verify your email and then login";
            } else if (emailSignInResults ==
                EmailSignInResults.EmailOrPasswordInvalid) {
              msg = "Email or Password is not valid";
            } else {
              msg = "Login is not completed";
            }

            if (msg != '') {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(msg)));
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

  Widget _socialMediaIntegrationButton() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () async {
              print("Google Pressed");

              if (mounted) {
                setState(() {
                  _isLoading = true;
                });
              }

              String msg = '';
              final GoogleSignInResults googleSignInResults =
                  await googleAuth.signInWithGoogle();

              if (googleSignInResults == GoogleSignInResults.SignInCompleted) {
                msg = 'Login Successful';
              } else if (googleSignInResults ==
                  GoogleSignInResults.AlreadySignedIn) {
                msg = 'Already Google Signed In';
              } else if (googleSignInResults ==
                  GoogleSignInResults.SignInNotCompleted) {
                msg = 'Sign In not completed';
              } else {
                msg = 'Unexpected Error';
              }

              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(msg)));

              if (googleSignInResults == GoogleSignInResults.SignInCompleted) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => HomePage()),
                    (route) => false);
              }

              if (mounted) {
                setState(() {
                  _isLoading = false;
                });
              }
            },
            child: Image.asset(
              "assets/images/google.png",
              width: 50.0,
            ),
          ),
          const SizedBox(
            width: 30.0,
          ),
          GestureDetector(
            onTap: () {
              print("Facebook Pressed");
            },
            child: Image.asset(
              "assets/images/fbook.png",
              width: 50.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _switchToSignUp() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have an account?",
          style: TextStyle(fontSize: 16.0, color: Colors.black),
        ),
        ElevatedButton(
          style:
              ElevatedButton.styleFrom(primary: Colors.white, elevation: 0.0),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => SignUpPage()));
          },
          child: const Text(
            "Sign Up",
            style: TextStyle(color: Colors.deepPurple, fontSize: 16.0),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: LoadingOverlay(
          isLoading: _isLoading,
          color: Colors.black,
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Container(
              child: ListView(
                shrinkWrap: true,
                children: [
                  const SizedBox(
                    height: 50.0,
                  ),
                  const Center(
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: Column(
                      children: [
                        Form(
                          key: _loginKey,
                          child: Column(
                            children: [
                              _commonTextFormField(
                                  hintText: "Email",
                                  icon: Icons.email,
                                  validator: (inputVal) {
                                    if (inputVal!.isEmpty) {
                                      return 'Email can not be empty';
                                    } else if (!emailRegex
                                        .hasMatch(inputVal.toString())) {
                                      return "Email format is not matching";
                                    }
                                    return null;
                                  },
                                  textEditingController: email),
                              _commonTextFormField(
                                  hintText: "Password",
                                  icon: Icons.lock,
                                  validator: (String? inputVal) {
                                    if (inputVal!.isEmpty) {
                                      return "Password can not be empty";
                                    } else if (inputVal.length < 6) {
                                      return "Password must be at least 6 characters";
                                    }
                                    return null;
                                  },
                                  textEditingController: password),
                              _loginButton(),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 40.0,
                        ),
                        const Center(
                          child: Text(
                            "Or, Continue with",
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                        _socialMediaIntegrationButton(),
                        const SizedBox(
                          height: 30.0,
                        ),
                        _switchToSignUp(),
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
