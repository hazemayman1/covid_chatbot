import 'package:flash_chat/components/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ScanScreen extends StatefulWidget {
  static const String id = "scan_screen";
  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  PickedFile _imageFile;
  ImagePicker _picker = ImagePicker();
  Image uploaded;
  String classification;

  @override
  void initState() {
    super.initState();
    uploaded = Image.asset("images/placeholder.png");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.close), onPressed: () {}),
        ],
        title: Text('Җ Chest Scanner'),
        backgroundColor: kPrimaryColor,
      ),
      body: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Note: These results give you an approximate estimation, always seek the advice of your doctor!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.redAccent[700],
                ),
              ),
            ),
            GestureDetector(
              onTap: () async {
                _imageFile =
                    await _picker.getImage(source: ImageSource.gallery);
                setState(() {
                  uploaded = Image.file(File(_imageFile.path));
                });
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Center(
                  child: uploaded,
                ),
              ),
            ),
            Center(
              child: RoundedButton(
                minWidth: MediaQuery.of(context).size.width * 0.8,
                color: Colors.grey[700],
                onPressed: () async {
                  setState(() {
                    classification =
                        "Your results show that you probably have covid";
                  });
                },
                title: 'Upload',
              ),
            ),
            Text(
              classification != null ? "$classification" : "",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
