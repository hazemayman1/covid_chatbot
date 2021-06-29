import 'package:flash_chat/components/rounded_button.dart';
import 'package:flash_chat/constants.dart';
import 'package:flutter/material.dart';

class AnalysisScreen extends StatefulWidget {
  static const String id = "analysis_screen";

  @override
  _AnalysisScreenState createState() => _AnalysisScreenState();
}

class _AnalysisScreenState extends State<AnalysisScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  var AGE,
      AST,
      ALT,
      LDH = 140,
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

  // bool isNumericUsing_tryParse(String string) {
  //   // Null or empty string is not a number
  //   if (string == null || string.isEmpty) {
  //     return false;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.close), onPressed: () {}),
        ],
        title: Text('Җ Lab Results Analysis'),
        backgroundColor: kPrimaryColor,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  // age done
                  keyboardType: TextInputType.number,
                  cursorColor: kPrimaryColor,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: kSecondaryColor,
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
                    filled: true,
                    fillColor: kSecondaryColor,
                    hintText: 'AST [0 - 50 Normal Rate]',
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
                    filled: true,
                    fillColor: kSecondaryColor,
                    hintText: 'ALT [0-50 Normal Rate]',
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
                    filled: true,
                    fillColor: kSecondaryColor,
                    hintText: 'LDH [140-280 Normal Range]',
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
                    filled: true,
                    fillColor: kSecondaryColor,
                    hintText: 'WBC [4.5-11 Normal Rate]',
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
                    filled: true,
                    fillColor: kSecondaryColor,
                    hintText: 'RBC [4.5-6.2 Normal Rate]',
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
                    filled: true,
                    fillColor: kSecondaryColor,
                    hintText: 'Haemoglobin [13-17 Normal Rate]',
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
                    filled: true,
                    fillColor: kSecondaryColor,
                    hintText: 'Hematocrit [40-50 Normal Rate]',
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
                    filled: true,
                    fillColor: kSecondaryColor,
                    hintText: 'MCV [78-96 Normal Rate]',
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
                    filled: true,
                    fillColor: kSecondaryColor,
                    hintText: 'MCH [26-32 Normal Rate]',
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
                    filled: true,
                    fillColor: kSecondaryColor,
                    hintText: 'MCHC [31-36 Normal Rate]',
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
                    filled: true,
                    fillColor: kSecondaryColor,
                    hintText: 'Platelets Count [150-450 Normal Rate]',
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
                    filled: true,
                    fillColor: kSecondaryColor,
                    hintText: 'Neutrophils NE (ANC) [45-74 Normal Range]',
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
                    filled: true,
                    fillColor: kSecondaryColor,
                    hintText: 'Lymphocytes LY [18-45 Normal Rate]',
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
                    filled: true,
                    fillColor: kSecondaryColor,
                    hintText: 'Monocytes [Normal Rate 1-10]',
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
                    filled: true,
                    fillColor: kSecondaryColor,
                    hintText: 'Eosinophils [0-6 Normal Rate]',
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
                    filled: true,
                    fillColor: kSecondaryColor,
                    hintText: 'Basophils [0-1 Normal Range]',
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
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: kSecondaryColor,
                    hintText: 'Suspicious (0 or 1 or 2)',
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
                Text(
                  "Suspicious:\n0 -> No symptoms or exposure to COVID\n1 -> Symptoms OR exposure to COVID\n2 -> Symptoms AND Exposure to COVID",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 10,
                  ),
                ),
                RoundedButton(
                    title: "check",
                    color: kPrimaryColor,
                    onPressed: () {
                      if (!_formKey.currentState.validate()) {
                        print("hena han2olo recheck");
                      } else {
                        print("hena hanb3at lel backend");
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
