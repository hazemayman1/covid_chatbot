import 'package:flash_chat/constants.dart';
import 'package:flash_chat/screens/analysis_screen.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/screens/scan_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/components/rounded_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = "welcome_screen";
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  final _auth = FirebaseAuth.instance;
  User LoggedInUser;

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        LoggedInUser = user;
      } else if (user == null) {
        String email = "general@test.com";
        String password = "123456789";
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<void> initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    animation = ColorTween(begin: Color(0x323031), end: kPrimaryColor)
        .animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
    getCurrentUser();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo2.png'),
                    height: MediaQuery.of(context).size.width * 0.8,
                    padding: EdgeInsets.all(5.0),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                RoundedButton(
                  title: 'chest image scan'.toUpperCase(),
                  color: kSecondaryColor,
                  onPressed: () {
                    //currently just navigates to login screen
                    //to be implemented lated
                    Navigator.pushNamed(context, ScanScreen.id);
                  },
                ),
                RoundedButton(
                  title: 'chat with our bot'.toUpperCase(),
                  color: kSecondaryColor,
                  onPressed: () {
                    Navigator.pushNamed(context, ChatScreen.id);
                  },
                ),
                RoundedButton(
                  title: 'lab results analysis'.toUpperCase(),
                  color: kSecondaryColor,
                  onPressed: () {
                    //currently just navigates to registration screen
                    //to be implemented lated
                    Navigator.pushNamed(context, AnalysisScreen.id);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
