import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart';
import 'dart:convert';

final _firestore = FirebaseFirestore.instance;
User LoggedInUser;

class ChatScreen extends StatefulWidget {
  static const String id = "chat_screen";
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance;
  String messageText;
  final messageTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  Future<String> handleMessage(String question) async {
    question = question.replaceAll(' ', '_');
    Response response = await get('http://10.0.2.2:5000/$question');
    String answer = jsonDecode(response.body)['result'];
    return answer;
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        LoggedInUser = user;
        print(LoggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                // Implement logout functionality
                _auth.signOut();
                // Navigator.pop(context);
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: kPrimaryColor,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessageStream(),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messageTextController,
                      onChanged: (value) {
                        //Do something with the user input.
                        messageText = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      messageTextController.clear();
                      //Implement send functionality.
                      _firestore.collection('messages').add({
                        'sender': 'me#${LoggedInUser.email}',
                        'text': messageText,
                        'timestamp': FieldValue.serverTimestamp(),
                      });
                      String answer = await handleMessage(messageText);
                      //Implement send functionality.
                      await Future.delayed(Duration(seconds: 1));
                      _firestore.collection('messages').add({
                        'sender': 'bot#${LoggedInUser.email}',
                        'text': answer,
                        'timestamp': FieldValue.serverTimestamp(),
                      });
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: kPrimaryColor,
    );
  }
}

class MessageStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _firestore
            .collection('messages')
            // .where('sender', whereIn: [
            //   'me#${LoggedInUser.email}',
            //   'bot#${LoggedInUser.email}'
            // ])
            .orderBy('timestamp')
            .snapshots(),
        // ignore: missing_return
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final messages = snapshot.data.docs.reversed;
            List<MessageBubble> messageWidgets = [];
            for (var message in messages) {
              final messageText = message.get('text');
              final sender = message.get('sender');
              // final currentUser = LoggedInUser.email;
              final messageBubble = MessageBubble(
                sender: sender,
                messageText: messageText,
                isSender: sender == 'me#${LoggedInUser.email}' ? true : false,
              );
              messageWidgets.add(messageBubble);
            }
            // ignore: missing_return
            return Expanded(
              child: ListView(
                reverse: true,
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                children: messageWidgets,
              ),
            );
          }
        });
  }
}

class MessageBubble extends StatelessWidget {
  MessageBubble({this.sender, this.messageText, this.isSender});
  final String sender;
  final String messageText;
  final bool isSender;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Material(
            color: !isSender ? kSecondaryColor : Colors.white,
            elevation: 5.0,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
              bottomLeft: isSender ? Radius.circular(10.0) : Radius.zero,
              bottomRight: isSender ? Radius.zero : Radius.circular(10.0),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Text(
                messageText,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
