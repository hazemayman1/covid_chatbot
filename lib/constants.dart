import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF333A32);
const kSecondaryColor = Color(0xFFA2A2A2);

const kSendButtonTextStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w500,
  fontSize: 18.0,
);

const kInputDecoration = InputDecoration(
  filled: true,
  fillColor: kSecondaryColor,
  hintText: 'Enter your age',
);

const kMessageTextFieldDecoration = InputDecoration(
  fillColor: kSecondaryColor,
  filled: true,
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
  hintStyle: TextStyle(
    color: Colors.white,
  ),
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: kSecondaryColor, width: 1.0),
  ),
);

const kTextFieldDecoration = InputDecoration(
  fillColor: kSecondaryColor,
  filled: true,
  hintText: '',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);
