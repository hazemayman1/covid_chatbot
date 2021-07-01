import 'dart:convert';

import 'package:flash_chat/components/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

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
        title: Text(
          'Җ Chest Scanner',
          style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.w400),
        ),
        backgroundColor: kSecondaryColor,
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

                // http.MultipartRequest request = http.MultipartRequest('POST', Uri.parse(url));

                //   request.files.add(
                //     await http.MultipartFile.fromPath(
                //       'images',
                //       File('kitten1.jpg').path,
                //       contentType: MediaType('application', 'jpeg'),
                //     ),
                //   );
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.width * 0.8,
                child: Center(
                  child: uploaded,
                ),
              ),
            ),
            Center(
              child: RoundedButton(
                minWidth: MediaQuery.of(context).size.width * 0.8,
                color: kSecondaryColor,
                onPressed: () async {
                  var request =
                      new http.MultipartRequest("POST", Uri.parse('$url/scan'));
                  request.files.add(await http.MultipartFile.fromPath(
                    'images',
                    _imageFile.path,
                    contentType: new MediaType('application', 'jpeg'),
                  ));

                  var streamedResponse = await request.send();
                  var response =
                      await http.Response.fromStream(streamedResponse);
                  var result = json.decode(response.body)["result"];

                  setState(() {
                    result == 0
                        ? classification =
                            "Your results show that you probably don't have covid"
                        : classification =
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
