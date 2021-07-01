import 'package:flash_chat/components/rounded_button.dart';
import 'package:flash_chat/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AnalysisScreen extends StatefulWidget {
  static const String id = "analysis_screen";

  @override
  _AnalysisScreenState createState() => _AnalysisScreenState();
}

class _AnalysisScreenState extends State<AnalysisScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String classification;

  var AGE,
      AST,
      ALT,
      LDH,
      WBC,
      RBC,
      HMG,
      HMTC,
      MCV,
      MCH,
      MCHC,
      PLTS,
      NE,
      LY,
      MO,
      EO,
      BA,
      SUS;

  Future<dynamic> handleRequest(age, ast, alt, ldh, wbc, rbc, hmg, hmtc, mcv,
      mch, mchc, plts, ne, ly, mo, eo, ba, sus) async {
    Response response = await http.get(
        '$url/labresults?age=$age&ast=$ast&alt=$alt&ldh=$ldh' +
            '&wbc=$wbc&rbc=$rbc&hmg=$hmg&hmtc=$hmtc&mcv=$mcv&mch=$mch&mchc=$mchc' +
            '&plts=$plts&ne=$ne&ly=$ly&mo=$mo&eo=$eo&ba=$ba&sus=$sus');
    return json.decode(response.body);
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Suspicious guideline'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text(
                  "Suspicious:\n0 -> No symptoms or exposure to COVID\n1 -> Symptoms OR exposure to COVID\n2 -> Symptoms AND Exposure to COVID",
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        leading: null,
        // actions: <Widget>[
        //   IconButton(
        //     icon: Icon(Icons.close),
        //     onPressed: () {},
        //     color: kPrimaryColor,
        //   ),
        // ],
        title: Text(
          'Җ Lab Results Analysis',
          style: TextStyle(
            color: kPrimaryColor,
            fontWeight: FontWeight.w400,
          ),
        ),
        backgroundColor: kSecondaryColor,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(10),
              // width: MediaQuery.of(context).size.width * 0.8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    // age done
                    keyboardType: TextInputType.number,
                    cursorColor: kPrimaryColor,

                    decoration: const InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        // width: 0.0 produces a thin "hairline" border
                        borderSide: const BorderSide(
                            color: kSecondaryColor, width: 0.0),
                      ),
                      border: const OutlineInputBorder(),
                      labelStyle: TextStyle(color: kSecondaryColor),
                      filled: true,
                      fillColor: kPrimaryColor,
                      hintText: 'Enter your age',
                    ),
                    validator: (String value) {
                      if (value == null ||
                          value.isEmpty ||
                          num.tryParse(value) == null) {
                        return 'Please recheck your input';
                      }
                      setState(() {
                        AGE = num.parse(value).round().toInt();
                      });
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    // ast done
                    keyboardType: TextInputType.number,
                    cursorColor: kPrimaryColor,
                    decoration: const InputDecoration(
                      labelText: "AST ",
                      enabledBorder: const OutlineInputBorder(
                        // width: 0.0 produces a thin "hairline" border
                        borderSide: const BorderSide(
                            color: kSecondaryColor, width: 0.0),
                      ),
                      border: const OutlineInputBorder(),
                      labelStyle: TextStyle(color: kSecondaryColor),
                      filled: true,
                      fillColor: kPrimaryColor,
                      hintText: '[0 - 50 Normal Rate]',
                    ),
                    validator: (String value) {
                      if (value == null ||
                          value.isEmpty ||
                          num.tryParse(value) == null) {
                        return 'Please recheck your input';
                      }
                      setState(() {
                        AST = num.parse(value).round().toInt();
                      });
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    // alt lesa
                    keyboardType: TextInputType.number,
                    cursorColor: kPrimaryColor,
                    decoration: const InputDecoration(
                      labelText: "ALT ",
                      enabledBorder: const OutlineInputBorder(
                        // width: 0.0 produces a thin "hairline" border
                        borderSide: const BorderSide(
                            color: kSecondaryColor, width: 0.0),
                      ),
                      border: const OutlineInputBorder(),
                      labelStyle: TextStyle(color: kSecondaryColor),
                      filled: true,
                      fillColor: kPrimaryColor,
                      hintText: '[0-50 Normal Rate]',
                    ),
                    validator: (String value) {
                      if (value == null ||
                          value.isEmpty ||
                          num.tryParse(value) == null) {
                        return 'Please recheck your input';
                      }
                      setState(() {
                        ALT = num.parse(value).round().toInt();
                      });
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    // ldh lesa
                    keyboardType: TextInputType.number,
                    cursorColor: kPrimaryColor,
                    decoration: const InputDecoration(
                      labelText: "LDH ",
                      enabledBorder: const OutlineInputBorder(
                        // width: 0.0 produces a thin "hairline" border
                        borderSide: const BorderSide(
                            color: kSecondaryColor, width: 0.0),
                      ),
                      border: const OutlineInputBorder(),
                      labelStyle: TextStyle(color: kSecondaryColor),
                      filled: true,
                      fillColor: kPrimaryColor,
                      hintText: '[140-280 Normal Range]',
                    ),
                    validator: (String value) {
                      if (value == null ||
                          value.isEmpty ||
                          num.tryParse(value) == null) {
                        return 'Please recheck your input';
                      }
                      setState(() {
                        LDH = num.parse(value).round().toInt();
                      });
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    // wbc lesa
                    keyboardType: TextInputType.number,
                    cursorColor: kPrimaryColor,
                    decoration: const InputDecoration(
                      labelText: "WBC ",
                      enabledBorder: const OutlineInputBorder(
                        // width: 0.0 produces a thin "hairline" border
                        borderSide: const BorderSide(
                            color: kSecondaryColor, width: 0.0),
                      ),
                      border: const OutlineInputBorder(),
                      labelStyle: TextStyle(color: kSecondaryColor),
                      filled: true,
                      fillColor: kPrimaryColor,
                      hintText: '[4.5-11 Normal Rate]',
                    ),
                    validator: (String value) {
                      if (value == null ||
                          value.isEmpty ||
                          num.tryParse(value) == null) {
                        return 'Please recheck your input';
                      }
                      setState(() {
                        WBC = num.parse(value);
                      });
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    // rbc lesa
                    keyboardType: TextInputType.number,
                    cursorColor: kPrimaryColor,
                    decoration: const InputDecoration(
                      labelText: "RBC ",
                      enabledBorder: const OutlineInputBorder(
                        // width: 0.0 produces a thin "hairline" border
                        borderSide: const BorderSide(
                            color: kSecondaryColor, width: 0.0),
                      ),
                      border: const OutlineInputBorder(),
                      labelStyle: TextStyle(color: kSecondaryColor),
                      filled: true,
                      fillColor: kPrimaryColor,
                      hintText: '[4.5-6.2 Normal Rate]',
                    ),
                    validator: (String value) {
                      if (value == null ||
                          value.isEmpty ||
                          num.tryParse(value) == null) {
                        return 'Please recheck your input';
                      }
                      setState(() {
                        RBC = num.parse(value);
                      });
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    // hmg lesa
                    keyboardType: TextInputType.number,
                    cursorColor: kPrimaryColor,
                    decoration: const InputDecoration(
                      labelText: "Haemoglobin ",
                      enabledBorder: const OutlineInputBorder(
                        // width: 0.0 produces a thin "hairline" border
                        borderSide: const BorderSide(
                            color: kSecondaryColor, width: 0.0),
                      ),
                      border: const OutlineInputBorder(),
                      labelStyle: TextStyle(color: kSecondaryColor),
                      filled: true,
                      fillColor: kPrimaryColor,
                      hintText: '[13-17 Normal Rate]',
                    ),
                    validator: (String value) {
                      if (value == null ||
                          value.isEmpty ||
                          num.tryParse(value) == null) {
                        return 'Please recheck your input';
                      }
                      setState(() {
                        HMG = num.parse(value);
                      });
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    // hmct lesa
                    keyboardType: TextInputType.number,
                    cursorColor: kPrimaryColor,
                    decoration: const InputDecoration(
                      labelText: "Hematocrit ",
                      enabledBorder: const OutlineInputBorder(
                        // width: 0.0 produces a thin "hairline" border
                        borderSide: const BorderSide(
                            color: kSecondaryColor, width: 0.0),
                      ),
                      border: const OutlineInputBorder(),
                      labelStyle: TextStyle(color: kSecondaryColor),
                      filled: true,
                      fillColor: kPrimaryColor,
                      hintText: '[40-50 Normal Rate]',
                    ),
                    validator: (String value) {
                      if (value == null ||
                          value.isEmpty ||
                          num.tryParse(value) == null) {
                        return 'Please recheck your input';
                      }
                      setState(() {
                        HMTC = num.parse(value);
                      });
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    // mcv lesa
                    keyboardType: TextInputType.number,
                    cursorColor: kPrimaryColor,
                    decoration: const InputDecoration(
                      labelText: "MCV ",
                      enabledBorder: const OutlineInputBorder(
                        // width: 0.0 produces a thin "hairline" border
                        borderSide: const BorderSide(
                            color: kSecondaryColor, width: 0.0),
                      ),
                      border: const OutlineInputBorder(),
                      labelStyle: TextStyle(color: kSecondaryColor),
                      filled: true,
                      fillColor: kPrimaryColor,
                      hintText: '[78-96 Normal Rate]',
                    ),
                    validator: (String value) {
                      if (value == null ||
                          value.isEmpty ||
                          num.tryParse(value) == null) {
                        return 'Please recheck your input';
                      }
                      setState(() {
                        MCV = num.parse(value);
                      });
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    // mch lesa
                    keyboardType: TextInputType.number,
                    cursorColor: kPrimaryColor,
                    decoration: const InputDecoration(
                      labelText: "MCH ",
                      enabledBorder: const OutlineInputBorder(
                        // width: 0.0 produces a thin "hairline" border
                        borderSide: const BorderSide(
                            color: kSecondaryColor, width: 0.0),
                      ),
                      border: const OutlineInputBorder(),
                      labelStyle: TextStyle(color: kSecondaryColor),
                      filled: true,
                      fillColor: kPrimaryColor,
                      hintText: '[26-32 Normal Rate]',
                    ),
                    validator: (String value) {
                      if (value == null ||
                          value.isEmpty ||
                          num.tryParse(value) == null) {
                        return 'Please recheck your input';
                      }
                      setState(() {
                        MCH = num.parse(value);
                      });
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    // mchc lesa
                    keyboardType: TextInputType.number,
                    cursorColor: kPrimaryColor,
                    decoration: const InputDecoration(
                      labelText: "MCHC",
                      enabledBorder: const OutlineInputBorder(
                        // width: 0.0 produces a thin "hairline" border
                        borderSide: const BorderSide(
                            color: kSecondaryColor, width: 0.0),
                      ),
                      border: const OutlineInputBorder(),
                      labelStyle: TextStyle(color: kSecondaryColor),
                      filled: true,
                      fillColor: kPrimaryColor,
                      hintText: '[31-36 Normal Rate]',
                    ),
                    validator: (String value) {
                      if (value == null ||
                          value.isEmpty ||
                          num.tryParse(value) == null) {
                        return 'Please recheck your input';
                      }
                      setState(() {
                        MCHC = num.parse(value);
                      });
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    // pltls lesa
                    keyboardType: TextInputType.number,
                    cursorColor: kPrimaryColor,
                    decoration: const InputDecoration(
                      labelText: "Platelets Count",
                      enabledBorder: const OutlineInputBorder(
                        // width: 0.0 produces a thin "hairline" border
                        borderSide: const BorderSide(
                            color: kSecondaryColor, width: 0.0),
                      ),
                      border: const OutlineInputBorder(),
                      labelStyle: TextStyle(color: kSecondaryColor),
                      filled: true,
                      fillColor: kPrimaryColor,
                      hintText: '[150-450 Normal Rate]',
                    ),
                    validator: (String value) {
                      if (value == null ||
                          value.isEmpty ||
                          num.tryParse(value) == null) {
                        return 'Please recheck your input';
                      }
                      setState(() {
                        PLTS = num.parse(value).round().toInt();
                      });
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    // ne lesa
                    keyboardType: TextInputType.number,
                    cursorColor: kPrimaryColor,
                    decoration: const InputDecoration(
                      labelText: "Neutrophils NE (ANC) ",
                      enabledBorder: const OutlineInputBorder(
                        // width: 0.0 produces a thin "hairline" border
                        borderSide: const BorderSide(
                            color: kSecondaryColor, width: 0.0),
                      ),
                      border: const OutlineInputBorder(),
                      labelStyle: TextStyle(color: kSecondaryColor),
                      filled: true,
                      fillColor: kPrimaryColor,
                      hintText: '[45-74 Normal Range]',
                    ),
                    validator: (String value) {
                      if (value == null ||
                          value.isEmpty ||
                          num.tryParse(value) == null) {
                        return 'Please recheck your input';
                      }
                      setState(() {
                        NE = num.parse(value);
                      });
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    // ly lesa
                    keyboardType: TextInputType.number,
                    cursorColor: kPrimaryColor,
                    decoration: const InputDecoration(
                      labelText: "Lymphocytes LY ",
                      enabledBorder: const OutlineInputBorder(
                        // width: 0.0 produces a thin "hairline" border
                        borderSide: const BorderSide(
                            color: kSecondaryColor, width: 0.0),
                      ),
                      border: const OutlineInputBorder(),
                      labelStyle: TextStyle(color: kSecondaryColor),
                      filled: true,
                      fillColor: kPrimaryColor,
                      hintText: '[18-45 Normal Rate]',
                    ),
                    validator: (String value) {
                      if (value == null ||
                          value.isEmpty ||
                          num.tryParse(value) == null) {
                        return 'Please recheck your input';
                      }
                      setState(() {
                        LY = num.parse(value);
                      });
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    // mo lesa
                    keyboardType: TextInputType.number,
                    cursorColor: kPrimaryColor,
                    decoration: const InputDecoration(
                      labelText: "Monocytes ",
                      enabledBorder: const OutlineInputBorder(
                        // width: 0.0 produces a thin "hairline" border
                        borderSide: const BorderSide(
                            color: kSecondaryColor, width: 0.0),
                      ),
                      border: const OutlineInputBorder(),
                      labelStyle: TextStyle(color: kSecondaryColor),
                      filled: true,
                      fillColor: kPrimaryColor,
                      hintText: '[Normal Rate 1-10]',
                    ),
                    validator: (String value) {
                      if (value == null ||
                          value.isEmpty ||
                          num.tryParse(value) == null) {
                        return 'Please recheck your input';
                      }
                      setState(() {
                        MO = num.parse(value);
                      });
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    // eo lesa
                    keyboardType: TextInputType.number,
                    cursorColor: kPrimaryColor,
                    decoration: const InputDecoration(
                      labelText: "Eosinophils ",
                      enabledBorder: const OutlineInputBorder(
                        // width: 0.0 produces a thin "hairline" border
                        borderSide: const BorderSide(
                            color: kSecondaryColor, width: 0.0),
                      ),
                      border: const OutlineInputBorder(),
                      labelStyle: TextStyle(color: kSecondaryColor),
                      filled: true,
                      fillColor: kPrimaryColor,
                      hintText: '[0-6 Normal Rate]',
                    ),
                    validator: (String value) {
                      if (value == null ||
                          value.isEmpty ||
                          num.tryParse(value) == null) {
                        return 'Please recheck your input';
                      }
                      setState(() {
                        EO = num.parse(value);
                      });
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    // ba lesa
                    keyboardType: TextInputType.number,
                    cursorColor: kPrimaryColor,
                    decoration: const InputDecoration(
                      labelText: "Basophils ",
                      enabledBorder: const OutlineInputBorder(
                        // width: 0.0 produces a thin "hairline" border
                        borderSide: const BorderSide(
                            color: kSecondaryColor, width: 0.0),
                      ),
                      border: const OutlineInputBorder(),
                      labelStyle: TextStyle(color: kSecondaryColor),
                      filled: true,
                      fillColor: kPrimaryColor,
                      hintText: '[0-1 Normal Range]',
                    ),
                    validator: (String value) {
                      if (value == null ||
                          value.isEmpty ||
                          num.tryParse(value) == null) {
                        return 'Please recheck your input';
                      }
                      setState(() {
                        BA = num.parse(value).round().toInt();
                      });
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    // sus lesa (0 0.5 1 choice only)
                    keyboardType: TextInputType.number,
                    cursorColor: kPrimaryColor,
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        // width: 0.0 produces a thin "hairline" border
                        borderSide: const BorderSide(
                            color: kSecondaryColor, width: 0.0),
                      ),
                      border: const OutlineInputBorder(),
                      labelStyle: TextStyle(color: kSecondaryColor),
                      hintStyle: TextStyle(
                        color: kSecondaryColor,
                      ),
                      filled: true,
                      fillColor: kPrimaryColor,
                      hintText: 'Suspicious (0 or 1 or 2)',
                      suffixIcon: IconButton(
                        icon: Icon(Icons.info_outline),
                        color: kSecondaryColor,
                        onPressed: () {
                          _showMyDialog();
                        },
                      ),
                    ),

                    validator: (String value) {
                      if (value == null ||
                          value.isEmpty ||
                          num.tryParse(value) == null) {
                        return 'Please recheck your input';
                      }
                      setState(() {
                        SUS = num.parse(value) / 2;
                        if (SUS != 0 || SUS != 0.5 || SUS != 1) {
                          return 'Please recheck your input';
                        }
                      });
                      return null;
                    },
                  ),
                  Row(
                    children: [],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RoundedButton(
                      minWidth: MediaQuery.of(context).size.width,
                      title: "Analyze My tests".toUpperCase(),
                      color: kSecondaryColor,
                      onPressed: () async {
                        if (!_formKey.currentState.validate()) {
                          print("hena han2olo recheck");
                        } else {
                          var respone = await handleRequest(
                              AGE,
                              AST,
                              ALT,
                              LDH,
                              WBC,
                              RBC,
                              HMG,
                              HMTC,
                              MCV,
                              MCH,
                              MCHC,
                              PLTS,
                              NE,
                              LY,
                              MO,
                              EO,
                              BA,
                              SUS);
                          if (respone['result'] == 0) {
                            this.setState(() {
                              classification = "You dont have covid";
                            });
                          } else if (respone['result'] == 1) {
                            this.setState(() {
                              classification = "You have covid";
                            });
                          }
                        }
                      }),
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
          ),
        ),
      ),
    );
  }
}
