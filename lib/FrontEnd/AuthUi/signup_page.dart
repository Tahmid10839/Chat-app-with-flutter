import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _signUpKey = GlobalKey<FormState>();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode confirmPasswordFocusNode = FocusNode();

  bool _isPassObscure = true;
  bool _isConObscure = true;

  Widget _commonTextFormField(
      {required String hintText,
      required IconData icon,
      required FocusNode focusNode}) {
    return Container(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 30.0),
      child: TextFormField(
        focusNode: focusNode,
        obscureText: hintText == "Password"
            ? _isPassObscure
            : hintText == "Confirm Password"
                ? _isConObscure
                : false,
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
              : hintText == "Confirm Password"
                  ? IconButton(
                      icon: Icon(
                        _isConObscure ? Icons.visibility : Icons.visibility_off,
                        color: Colors.deepPurple,
                      ),
                      onPressed: () {
                        setState(() {
                          _isConObscure = !_isConObscure;
                        });
                      },
                    )
                  : const SizedBox.shrink(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: ListView(
            shrinkWrap: true,
            children: [
              const SizedBox(
                height: 50.0,
              ),
              const Center(
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(top: 40.0),
                child: Form(
                  key: _signUpKey,
                  child: ListView(
                    children: [
                      _commonTextFormField(
                          hintText: "Email",
                          icon: Icons.email,
                          focusNode: emailFocusNode),
                      _commonTextFormField(
                          hintText: "Password",
                          icon: Icons.lock,
                          focusNode: passwordFocusNode),
                      _commonTextFormField(
                          hintText: "Confirm Password",
                          icon: Icons.lock,
                          focusNode: confirmPasswordFocusNode),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
