import 'package:flash_chat/constants.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton({
    this.title,
    this.color,
    this.minWidth,
    @required this.onPressed,
  });
  final Color color;
  final String title;
  final Function onPressed;
  double minWidth = 200.0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 10.0,
        color: color,
        borderRadius: BorderRadius.circular(3.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: minWidth,
          height: 60.0,
          hoverColor: kSecondaryColor,
          child: Text(
            title,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w300,
              color: Colors.white70,
            ),
          ),
        ),
      ),
    );
  }
}
