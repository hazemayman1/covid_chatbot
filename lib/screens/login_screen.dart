import 'package:flash_chat/constants.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/components/rounded_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';

import 'chat_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String id = "login_screen";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email;
  String password;
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: ProgressHUD(
        child: Builder(
          builder: (context) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(
                    height: 80,
                  ),
                  Hero(
                    tag: 'logo',
                    child: Container(
                      height: 200.0,
                      child: Image.asset('images/image.png'),
                    ),
                  ),
                  SizedBox(
                    height: 48.0,
                  ),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      email = value;
                      //Do something with the user input.
                    },
                    decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Enter your email'),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  TextField(
                    obscureText: true,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      password = value;
                      //Do something with the user input.
                    },
                    decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Enter your password'),
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  RoundedButton(
                    onPressed: () async {
                      final progress = ProgressHUD.of(context);
                      progress?.showWithText('Logging in...');

                      try {
                        final userCredential = await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: email, password: password);
                        if (userCredential != null) {
                          progress?.dismiss();
                          Navigator.pushNamed(context, ChatScreen.id);
                        }
                      } on FirebaseAuthException catch (e) {
                        progress?.dismiss();
                        if (e.code == 'user-not-found') {
                          print('No user found for that email.');
                        } else if (e.code == 'wrong-password') {
                          print('Wrong password provided for that user.');
                        }
                      }
                    },
                    title: 'Log In',
                    color: Colors.black,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
