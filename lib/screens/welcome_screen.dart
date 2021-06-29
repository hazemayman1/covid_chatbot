import 'package:flash_chat/constants.dart';
import 'package:flash_chat/screens/analysis_screen.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/screens/scan_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = "welcome_screen";
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    animation = ColorTween(begin: Color(0x323031), end: kPrimaryColor)
        .animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
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
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                      child: Image.asset('images/image.png'),
                      height: 60.0,
                      padding: EdgeInsets.all(5.0),
                      margin: const EdgeInsets.only(
                        right: 5.0,
                      )),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'DiCorona..?',
                      textStyle: const TextStyle(
                        fontSize: 45.0,
                        fontWeight: FontWeight.w300,
                        color: kSecondaryColor,
                      ),
                      speed: const Duration(milliseconds: 200),
                    ),
                  ],
                  totalRepeatCount: 1,
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            // RoundedButton(
            //   title: 'Log in',
            //   color: Colors.green,
            //   onPressed: () {
            //     Navigator.pushNamed(context, LoginScreen.id);
            //   },
            // ),
            // RoundedButton(
            //   title: 'Register',
            //   color: Colors.blueAccent,
            //   onPressed: () {
            //     Navigator.pushNamed(context, RegistrationScreen.id);
            //   },
            // ),
            RoundedButton(
              title: 'chest image scan'.toUpperCase(),
              color: kPrimaryColor,
              onPressed: () {
                //currently just navigates to login screen
                //to be implemented lated
                Navigator.pushNamed(context, ScanScreen.id);
              },
            ),
            RoundedButton(
              title: 'chat with our bot'.toUpperCase(),
              color: kPrimaryColor,
              onPressed: () {
                Navigator.pushNamed(context, ChatScreen.id);
              },
            ),
            RoundedButton(
              title: 'lab results analysis'.toUpperCase(),
              color: kPrimaryColor,
              onPressed: () {
                //currently just navigates to registration screen
                //to be implemented lated
                Navigator.pushNamed(context, AnalysisScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
